package main

import (
	"bytes"
	"context"
	"crypto/sha256"
	"embed"
	"encoding/hex"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"log"
	"net"
	"net/http"
	"net/url"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"runtime"
	"strings"
	"sync"
	"time"
)

const (
	launcherVersion    = "0.2.0"
	launcherName       = "RaceForNuts.swf"
	originalName       = "RaceForNuts.original.swf"
	ownBackupName      = "RaceForNuts.modlauncher.backup.swf"
	gameExeName        = "RaceForNuts.exe"
	listenAddr         = "127.0.0.1:37691"
	embeddedRelease    = "1401"
	embeddedModVersion = "0.9.15"
	logFileName        = "RFNModLauncher.log"
	updateURLFileName  = "RFNModLauncher.update_url.txt"
	httpTimeout        = 20 * time.Second
)

//go:embed assets/RaceForNuts.mod.swf assets/client_release1401.swf
var embeddedAssets embed.FS

var releasePathRE = regexp.MustCompile(`^/client_release([0-9]+)\.swf$`)

type releaseUpdate struct {
	URL    string `json:"url"`
	SHA256 string `json:"sha256"`
	Size   int64  `json:"size,omitempty"`
}

type updateManifest struct {
	ModVersion string                   `json:"mod_version"`
	UpdatedAt  string                   `json:"updated_at,omitempty"`
	Releases   map[string]releaseUpdate `json:"releases"`
}

type app struct {
	dir             string
	logger          *log.Logger
	logFile         *os.File
	restoreBytes    []byte
	restoreReady    bool
	restoreOnce     sync.Once
	server          *http.Server
	requestedClient chan string

	updateURL    string
	manifest     *updateManifest
	manifestBase *url.URL
	httpClient   *http.Client
	updateMu     sync.Mutex
}

func main() {
	a, err := newApp()
	if err != nil {
		fatalPause(err)
		return
	}
	defer a.close()

	a.logger.Printf("=== RFN Mod Launcher v%s ===", launcherVersion)
	a.logger.Printf("Папка игры: %s", a.dir)
	a.logger.Printf("Встроенный резервный мод: v%s / release %s", embeddedModVersion, embeddedRelease)

	a.refreshManifest()

	if err := a.prepareLauncher(); err != nil {
		a.fail(err)
		return
	}
	defer a.restoreLauncher()

	if err := a.startServer(); err != nil {
		a.fail(err)
		return
	}
	defer a.stopServer()

	if err := a.launchGame(); err != nil {
		a.fail(err)
		return
	}

	a.logger.Printf("Готово. Лаунчер восстановлен, локальный сервер остановлен.")
}

func newApp() (*app, error) {
	exe, err := os.Executable()
	if err != nil {
		return nil, fmt.Errorf("не удалось определить путь запуска: %w", err)
	}
	dir := filepath.Dir(exe)

	if _, err := os.Stat(filepath.Join(dir, gameExeName)); err != nil {
		if wd, e := os.Getwd(); e == nil {
			if _, e2 := os.Stat(filepath.Join(wd, gameExeName)); e2 == nil {
				dir = wd
			}
		}
	}

	lf, err := os.OpenFile(filepath.Join(dir, logFileName), os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0644)
	if err != nil {
		return nil, fmt.Errorf("не удалось открыть лог: %w", err)
	}
	mw := io.MultiWriter(os.Stdout, lf)
	logger := log.New(mw, "", log.LstdFlags|log.Lmicroseconds)

	updateURL := loadUpdateURL(dir, logger)

	return &app{
		dir:             dir,
		logger:          logger,
		logFile:         lf,
		requestedClient: make(chan string, 1),
		updateURL:       updateURL,
		httpClient: &http.Client{
			Timeout: httpTimeout,
		},
	}, nil
}

func loadUpdateURL(dir string, logger *log.Logger) string {
	if v := strings.TrimSpace(os.Getenv("RFN_MOD_MANIFEST_URL")); v != "" {
		return v
	}

	path := filepath.Join(dir, updateURLFileName)
	b, err := os.ReadFile(path)
	if err != nil {
		if !errors.Is(err, os.ErrNotExist) {
			logger.Printf("Не удалось прочитать %s: %v", updateURLFileName, err)
		}
		return ""
	}

	for _, line := range strings.Split(string(b), "\n") {
		line = strings.TrimSpace(line)
		if line == "" || strings.HasPrefix(line, "#") {
			continue
		}
		return line
	}
	return ""
}

func (a *app) refreshManifest() {
	if a.updateURL == "" {
		a.logger.Printf("Автообновление мода выключено: в %s не указан URL manifest.json", updateURLFileName)
		return
	}

	u, err := url.Parse(a.updateURL)
	if err != nil || u.Scheme == "" || u.Host == "" {
		a.logger.Printf("Автообновление выключено: некорректный URL manifest: %q", a.updateURL)
		return
	}

	a.logger.Printf("Проверяю обновления мода: %s", a.updateURL)
	req, err := http.NewRequest(http.MethodGet, a.updateURL, nil)
	if err != nil {
		a.logger.Printf("Не удалось создать запрос обновления: %v", err)
		return
	}
	req.Header.Set("User-Agent", "RFNModLauncher/"+launcherVersion)
	req.Header.Set("Cache-Control", "no-cache")

	resp, err := a.httpClient.Do(req)
	if err != nil {
		a.logger.Printf("Сервер обновлений недоступен, использую локальный кэш: %v", err)
		return
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		a.logger.Printf("Сервер обновлений вернул HTTP %d, использую локальный кэш", resp.StatusCode)
		return
	}

	body, err := io.ReadAll(io.LimitReader(resp.Body, 1<<20))
	if err != nil {
		a.logger.Printf("Не удалось скачать manifest: %v", err)
		return
	}

	var manifest updateManifest
	if err := json.Unmarshal(body, &manifest); err != nil {
		a.logger.Printf("Некорректный manifest.json: %v", err)
		return
	}
	if len(manifest.Releases) == 0 {
		a.logger.Printf("Некорректный manifest.json: список releases пуст")
		return
	}

	a.manifest = &manifest
	a.manifestBase = u
	a.logger.Printf("Manifest загружен: мод v%s, поддерживаемых release: %d", manifest.ModVersion, len(manifest.Releases))
}

func (a *app) close() {
	a.restoreLauncher()
	a.stopServer()
	if a.logFile != nil {
		_ = a.logFile.Close()
	}
}

func (a *app) prepareLauncher() error {
	gameExe := filepath.Join(a.dir, gameExeName)
	if _, err := os.Stat(gameExe); err != nil {
		return fmt.Errorf("рядом с запускателем не найден %s. Положи RFNModLauncher.exe в папку игры", gameExeName)
	}

	currentPath := filepath.Join(a.dir, launcherName)
	originalPath := filepath.Join(a.dir, originalName)
	ownBackupPath := filepath.Join(a.dir, ownBackupName)

	if b, err := os.ReadFile(originalPath); err == nil && len(b) > 0 {
		a.restoreBytes = b
		a.restoreReady = true
		a.logger.Printf("Найден резервный оригинал от Presence: %s", originalName)
	} else {
		b, err := os.ReadFile(currentPath)
		if err != nil {
			return fmt.Errorf("не найден %s: %w", launcherName, err)
		}
		a.restoreBytes = b
		a.restoreReady = true

		if _, err := os.Stat(ownBackupPath); errors.Is(err, os.ErrNotExist) {
			if err := writeFileAtomic(ownBackupPath, b, 0644); err != nil {
				return fmt.Errorf("не удалось создать резервную копию лаунчера: %w", err)
			}
			a.logger.Printf("Создана резервная копия: %s", ownBackupName)
		}
	}

	modLauncher, err := embeddedAssets.ReadFile("assets/RaceForNuts.mod.swf")
	if err != nil {
		return fmt.Errorf("не удалось прочитать встроенный мод-лаунчер: %w", err)
	}
	if !bytes.Contains(modLauncher, []byte("127.0.0.1:37691/client_release")) {
		return fmt.Errorf("встроенный SWF повреждён: локальный адрес не найден")
	}
	if err := writeFileAtomic(currentPath, modLauncher, 0644); err != nil {
		return fmt.Errorf("не удалось установить временный RaceForNuts.swf: %w", err)
	}
	a.logger.Printf("Временный лаунчер установлен (порт 37691).")
	return nil
}

func (a *app) restoreLauncher() {
	a.restoreOnce.Do(func() {
		if !a.restoreReady || len(a.restoreBytes) == 0 {
			return
		}
		dst := filepath.Join(a.dir, launcherName)
		if err := writeFileAtomic(dst, a.restoreBytes, 0644); err != nil {
			a.logger.Printf("ВНИМАНИЕ: не удалось восстановить %s: %v", launcherName, err)
			return
		}
		a.logger.Printf("%s восстановлен.", launcherName)
	})
}

func (a *app) startServer() error {
	mux := http.NewServeMux()
	mux.HandleFunc("/crossdomain.xml", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "text/x-cross-domain-policy")
		_, _ = io.WriteString(w, `<?xml version="1.0"?><cross-domain-policy><allow-access-from domain="*" /></cross-domain-policy>`)
	})
	mux.HandleFunc("/", a.handleHTTP)

	ln, err := net.Listen("tcp", listenAddr)
	if err != nil {
		return fmt.Errorf("не удалось открыть %s: %w (возможно, уже запущена другая копия Mod Launcher)", listenAddr, err)
	}
	a.server = &http.Server{Handler: mux, ReadHeaderTimeout: 10 * time.Second}

	go func() {
		err := a.server.Serve(ln)
		if err != nil && !errors.Is(err, http.ErrServerClosed) {
			a.logger.Printf("Ошибка локального HTTP-сервера: %v", err)
		}
	}()
	a.logger.Printf("Локальный сервер запущен: http://%s", listenAddr)
	return nil
}

func (a *app) stopServer() {
	if a.server == nil {
		return
	}
	ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
	defer cancel()
	_ = a.server.Shutdown(ctx)
	a.server = nil
}

func (a *app) handleHTTP(w http.ResponseWriter, r *http.Request) {
	m := releasePathRE.FindStringSubmatch(r.URL.Path)
	if len(m) != 2 {
		http.NotFound(w, r)
		return
	}
	release := m[1]
	a.logger.Printf("Лаунчер запросил клиент: %s (release %s)", r.URL.Path, release)
	select {
	case a.requestedClient <- release:
	default:
	}

	data, source, err := a.clientForRelease(release)
	if err != nil {
		a.logger.Printf("Клиент release %s не отдан: %v", release, err)
		http.Error(w, err.Error(), http.StatusConflict)
		return
	}
	a.logger.Printf("Отдаю release %s: %s (%d байт)", release, source, len(data))

	w.Header().Set("Content-Type", "application/x-shockwave-flash")
	w.Header().Set("Cache-Control", "no-store, no-cache, must-revalidate")
	w.Header().Set("Pragma", "no-cache")
	w.Header().Set("Content-Length", fmt.Sprintf("%d", len(data)))
	w.WriteHeader(http.StatusOK)
	_, _ = w.Write(data)
}

func (a *app) clientForRelease(release string) ([]byte, string, error) {
	a.updateMu.Lock()
	defer a.updateMu.Unlock()

	external := filepath.Join(a.dir, "patched", "client_release"+release+".swf")

	if a.manifest != nil {
		if info, ok := a.manifest.Releases[release]; ok {
			if err := a.ensureReleaseCurrent(release, external, info); err != nil {
				if b, readErr := os.ReadFile(external); readErr == nil && len(b) > 0 {
					a.logger.Printf("ВНИМАНИЕ: обновить release %s не удалось (%v), использую локальную копию", release, err)
					return b, filepath.Join("patched", filepath.Base(external)) + " (локальный fallback)", nil
				}
				return nil, "", fmt.Errorf("не удалось получить мод для release %s: %w", release, err)
			}

			b, err := os.ReadFile(external)
			if err != nil {
				return nil, "", err
			}
			return b, fmt.Sprintf("автообновляемый мод v%s (%s)", a.manifest.ModVersion, filepath.Join("patched", filepath.Base(external))), nil
		}
		a.logger.Printf("Manifest не содержит мод для официального release %s", release)
	}

	if b, err := os.ReadFile(external); err == nil && len(b) > 0 {
		return b, filepath.Join("patched", filepath.Base(external)), nil
	}

	if release == embeddedRelease {
		b, err := embeddedAssets.ReadFile("assets/client_release1401.swf")
		if err != nil {
			return nil, "", err
		}
		return b, fmt.Sprintf("встроенный RFN QoL v%s", embeddedModVersion), nil
	}

	return nil, "", fmt.Errorf("версия клиента %s пока не поддерживается. Нужен патч на сервере обновлений или файл patched\\client_release%s.swf", release, release)
}

func (a *app) ensureReleaseCurrent(release, dst string, info releaseUpdate) error {
	expected := normalizeHash(info.SHA256)
	if expected == "" || len(expected) != 64 {
		return fmt.Errorf("manifest содержит некорректный sha256 для release %s", release)
	}

	if current, err := fileSHA256(dst); err == nil && current == expected {
		a.logger.Printf("Мод для release %s уже актуален (SHA-256 совпадает)", release)
		return nil
	}

	downloadURL, err := a.resolveDownloadURL(info.URL)
	if err != nil {
		return err
	}
	a.logger.Printf("Есть новая версия мода для release %s. Скачиваю: %s", release, downloadURL)

	req, err := http.NewRequest(http.MethodGet, downloadURL, nil)
	if err != nil {
		return err
	}
	req.Header.Set("User-Agent", "RFNModLauncher/"+launcherVersion)
	req.Header.Set("Cache-Control", "no-cache")

	resp, err := a.httpClient.Do(req)
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("сервер файла вернул HTTP %d", resp.StatusCode)
	}

	if err := os.MkdirAll(filepath.Dir(dst), 0755); err != nil {
		return err
	}
	tmp, err := os.CreateTemp(filepath.Dir(dst), filepath.Base(dst)+".download-*")
	if err != nil {
		return err
	}
	tmpName := tmp.Name()
	keep := false
	defer func() {
		_ = tmp.Close()
		if !keep {
			_ = os.Remove(tmpName)
		}
	}()

	h := sha256.New()
	written, err := io.Copy(io.MultiWriter(tmp, h), resp.Body)
	if err != nil {
		return err
	}
	if info.Size > 0 && written != info.Size {
		return fmt.Errorf("размер файла не совпал: получено %d, ожидалось %d", written, info.Size)
	}
	got := hex.EncodeToString(h.Sum(nil))
	if got != expected {
		return fmt.Errorf("SHA-256 не совпал: получено %s, ожидалось %s", got, expected)
	}
	if err := tmp.Sync(); err != nil {
		return err
	}
	if err := tmp.Close(); err != nil {
		return err
	}

	data, err := os.ReadFile(tmpName)
	if err != nil {
		return err
	}
	if err := writeFileAtomic(dst, data, 0644); err != nil {
		return err
	}
	_ = os.Remove(tmpName)
	keep = true
	a.logger.Printf("Мод release %s обновлён: %d байт, SHA-256 %s", release, written, got)
	return nil
}

func (a *app) resolveDownloadURL(raw string) (string, error) {
	raw = strings.TrimSpace(raw)
	if raw == "" {
		return "", errors.New("в manifest не указан url файла")
	}
	u, err := url.Parse(raw)
	if err != nil {
		return "", err
	}
	if u.IsAbs() {
		if u.Scheme != "http" && u.Scheme != "https" {
			return "", fmt.Errorf("неподдерживаемая схема URL: %s", u.Scheme)
		}
		return u.String(), nil
	}
	if a.manifestBase == nil {
		return "", errors.New("не удалось определить базовый URL manifest")
	}
	return a.manifestBase.ResolveReference(u).String(), nil
}

func normalizeHash(s string) string {
	s = strings.ToLower(strings.TrimSpace(s))
	s = strings.TrimPrefix(s, "sha256:")
	return strings.TrimSpace(s)
}

func fileSHA256(path string) (string, error) {
	f, err := os.Open(path)
	if err != nil {
		return "", err
	}
	defer f.Close()
	h := sha256.New()
	if _, err := io.Copy(h, f); err != nil {
		return "", err
	}
	return hex.EncodeToString(h.Sum(nil)), nil
}

func (a *app) launchGame() error {
	gamePath := filepath.Join(a.dir, gameExeName)
	cmd := exec.Command(gamePath)
	cmd.Dir = a.dir
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Stdin = os.Stdin

	a.logger.Printf("Запускаю %s...", gameExeName)
	if err := cmd.Start(); err != nil {
		return fmt.Errorf("не удалось запустить игру: %w", err)
	}
	a.logger.Printf("Игра запущена, PID %d.", cmd.Process.Pid)

	select {
	case rel := <-a.requestedClient:
		a.logger.Printf("Активный release: %s.", rel)
	case <-time.After(20 * time.Second):
		a.logger.Printf("За 20 секунд запрос client_release не замечен. Если игра не открылась — пришли %s.", logFileName)
	}

	err := cmd.Wait()
	if err != nil {
		var ee *exec.ExitError
		if errors.As(err, &ee) {
			a.logger.Printf("Игра завершилась с кодом %d.", ee.ExitCode())
		} else {
			a.logger.Printf("Ошибка ожидания игры: %v", err)
		}
	} else {
		a.logger.Printf("Игра закрыта.")
	}
	return nil
}

func (a *app) fail(err error) {
	a.logger.Printf("ОШИБКА: %v", err)
	fmt.Printf("\nОШИБКА: %v\n", err)
	fmt.Printf("Подробности: %s\n", filepath.Join(a.dir, logFileName))
	if runtime.GOOS == "windows" {
		fmt.Print("Нажми Enter, чтобы закрыть окно...")
		_, _ = fmt.Scanln()
	}
}

func fatalPause(err error) {
	fmt.Printf("RFN Mod Launcher: %v\n", err)
	fmt.Print("Нажми Enter, чтобы закрыть окно...")
	_, _ = fmt.Scanln()
}

func writeFileAtomic(path string, data []byte, perm os.FileMode) error {
	dir := filepath.Dir(path)
	if err := os.MkdirAll(dir, 0755); err != nil {
		return err
	}
	base := filepath.Base(path)
	tmp, err := os.CreateTemp(dir, base+".tmp-*")
	if err != nil {
		return err
	}
	tmpName := tmp.Name()
	defer os.Remove(tmpName)

	if _, err := tmp.Write(data); err != nil {
		_ = tmp.Close()
		return err
	}
	if err := tmp.Sync(); err != nil {
		_ = tmp.Close()
		return err
	}
	if err := tmp.Close(); err != nil {
		return err
	}
	_ = os.Chmod(tmpName, perm)

	_ = os.Remove(path)
	return os.Rename(tmpName, path)
}

func init() {
	if strings.TrimSpace(listenAddr) != listenAddr {
		panic("invalid listenAddr")
	}
}
