package §_-J1i§
{
   import §_-S1n§.§_-kr§;
   import §_-l2u§.§_-53A§;
   import §_-l2u§.§_-71a§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Timer;
   import utils.§_-33I§;
   import utils.§_-y1l§;
   
   public class §_-91y§ extends Sprite
   {
      
      private static var _instance:§_-91y§;
      
      public var §_-73n§:§_-i5§;
      
      public var §_-31f§:§_-i5§;
      
      public var §_-f26§:§_-K2G§ = null;
      
      public var §_-y1a§:ButtonNextMap = null;
      
      public var §_-k2b§:ButtonPrevMap = null;
      
      public var §_-wE§:ButtonDeleteMap = null;
      
      public var §_-e2r§:ButtonEditorLoad = null;
      
      public var §_-93C§:ButtonEditorSave = null;
      
      public var §_-H5§:ButtonEditorSave = null;
      
      public var §_-tK§:ButtonEditorSend = null;
      
      public var §_-43O§:ButtonTestMap = null;
      
      public var §_-73Y§:ButtonEditorEdit = null;
      
      public var §_-G1Y§:ButtonRedo = null;
      
      public var §_-ZX§:ButtonUndo = null;
      
      public var §_-N2A§:ButtonHand = null;
      
      public var §_-11v§:ButtonRulers = null;
      
      public var §_-gw§:ButtonEditorScaleDown = null;
      
      public var §_-Cf§:ButtonEditorScaleUp = null;
      
      public var §_-81l§:ButtonCameraOn = null;
      
      public var §_-gf§:ButtonRulers = null;
      
      public var §_-B2Z§:ButtonMapTestSettings = null;
      
      public var §_-a1d§:ButtonMapInfo = null;
      
      public var §_-73G§:ButtonObjectsInspector = null;
      
      public var connectionClosed:Boolean = false;
      
      public var §_-wA§:Boolean = false;
      
      private var seconds:int;
      
      private var minutes:int;
      
      private var §_-go§:Sprite;
      
      private var §_-72z§:§_-i5§;
      
      private var §_-Oq§:Boolean = false;
      
      private var §_-8j§:Boolean = false;
      
      private var §_-RR§:Boolean = false;
      
      private var §_-p18§:TextFormat = new TextFormat(§_-i5§.§_-c10§,10,16777215);
      
      private var §_-62B§:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,16763955,true);
      
      private var §_-q1a§:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,16777215,true);
      
      private var timer:Timer = new Timer(1000);
      
      private var state:DisplayObject = null;
      
      private var §_-93f§:§_-kr§;
      
      private var §_-F2u§:int = 0;
      
      private var §_-kC§:Boolean = false;
      
      private var §_-s1j§:§_-53A§ = null;
      
      private var §_-ox§:Boolean = false;
      
      public function §_-91y§()
      {
         _instance = this;
         super();
         this.visible = false;
         addChild(new ImageHeaderEditor());
         this.§_-f26§ = new §_-K2G§(gls("Выход"));
         this.§_-f26§.scaleX = this.§_-f26§.scaleY = 0.65;
         this.§_-f26§.x = 839;
         this.§_-f26§.y = 4;
         addChild(this.§_-f26§);
         this.§_-81l§ = new ButtonCameraOn();
         this.§_-81l§.x = 723;
         this.§_-81l§.y = 1;
         new §_-kr§(this.§_-81l§,gls("Список записей"));
         this.§_-y1a§ = new ButtonNextMap();
         this.§_-y1a§.x = 570;
         this.§_-y1a§.y = 1;
         addChild(this.§_-y1a§);
         new §_-kr§(this.§_-y1a§,gls("Следующая карта"));
         this.§_-y1a§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§);
         this.§_-k2b§ = new ButtonPrevMap();
         this.§_-k2b§.x = 544;
         this.§_-k2b§.y = 1;
         addChild(this.§_-k2b§);
         new §_-kr§(this.§_-k2b§,gls("Предыдущая карта"));
         this.§_-k2b§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§);
         this.§_-wE§ = new ButtonDeleteMap();
         this.§_-wE§.x = 504;
         this.§_-wE§.y = 1;
         addChild(this.§_-wE§);
         new §_-kr§(this.§_-wE§,gls("Удалить"));
         this.§_-e2r§ = new ButtonEditorLoad();
         this.§_-e2r§.x = 476;
         this.§_-e2r§.y = 1;
         addChild(this.§_-e2r§);
         new §_-kr§(this.§_-e2r§,gls("Загрузить сохраненную карту"));
         this.§_-H5§ = new ButtonEditorSave();
         this.§_-H5§.x = 476;
         this.§_-H5§.y = 1;
         addChild(this.§_-H5§);
         new §_-kr§(this.§_-H5§,gls("Одобрить"));
         this.§_-93C§ = new ButtonEditorSave();
         this.§_-93C§.x = 449;
         this.§_-93C§.y = 1;
         addChild(this.§_-93C§);
         new §_-kr§(this.§_-93C§,gls("Сохранить как черновик"));
         this.§_-tK§ = new ButtonEditorSend();
         this.§_-tK§.x = 422;
         this.§_-tK§.y = 1;
         addChild(this.§_-tK§);
         new §_-kr§(this.§_-tK§,§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§) ? gls("Сохранить") : gls("Отправить на проверку"));
         this.§_-43O§ = new ButtonTestMap();
         this.§_-43O§.x = 394;
         this.§_-43O§.y = 1;
         addChild(this.§_-43O§);
         new §_-kr§(this.§_-43O§,gls("Тестировать"));
         this.§_-73Y§ = new ButtonEditorEdit();
         this.§_-73Y§.x = 394;
         this.§_-73Y§.y = 1;
         this.§_-73Y§.visible = false;
         addChild(this.§_-73Y§);
         new §_-kr§(this.§_-73Y§,gls("Редактировать"));
         this.§_-G1Y§ = new ButtonRedo();
         this.§_-G1Y§.x = 253;
         this.§_-G1Y§.y = 1;
         addChild(this.§_-G1Y§);
         new §_-kr§(this.§_-G1Y§,gls("Шаг вперед"));
         this.§_-ZX§ = new ButtonUndo();
         this.§_-ZX§.x = 227;
         this.§_-ZX§.y = 1;
         addChild(this.§_-ZX§);
         new §_-kr§(this.§_-ZX§,gls("Шаг назад"));
         this.§_-11v§ = new ButtonRulers();
         this.§_-11v§.x = 178;
         this.§_-11v§.y = 1;
         addChild(this.§_-11v§);
         new §_-kr§(this.§_-11v§,gls("Линейки"));
         this.§_-Cf§ = new ButtonEditorScaleUp();
         this.§_-Cf§.x = 149;
         this.§_-Cf§.y = 1;
         addChild(this.§_-Cf§);
         new §_-kr§(this.§_-Cf§,gls("Увеличить масштаб"));
         this.§_-gw§ = new ButtonEditorScaleDown();
         this.§_-gw§.x = 123;
         this.§_-gw§.y = 1;
         addChild(this.§_-gw§);
         new §_-kr§(this.§_-gw§,gls("Уменьшить масштаб"));
         this.§_-N2A§ = new ButtonHand();
         this.§_-N2A§.x = 94;
         this.§_-N2A§.y = 1;
         this.§_-N2A§.addEventListener(MouseEvent.CLICK,this.§_-p20§);
         addChild(this.§_-N2A§);
         this.§_-93f§ = new §_-kr§(this.§_-N2A§,gls("Включить\\выключить"));
         this.§_-73G§ = new ButtonObjectsInspector();
         this.§_-73G§.x = 63;
         this.§_-73G§.y = 1;
         addChild(this.§_-73G§);
         this.§_-73G§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§);
         new §_-kr§(this.§_-73G§,gls("Инспектор объектов"));
         this.§_-B2Z§ = new ButtonMapTestSettings();
         this.§_-B2Z§.x = 34;
         this.§_-B2Z§.y = 1;
         addChild(this.§_-B2Z§);
         new §_-kr§(this.§_-B2Z§,gls("Настройки тестирования"));
         this.§_-a1d§ = new ButtonMapInfo();
         this.§_-a1d§.x = 5;
         this.§_-a1d§.y = 1;
         addChild(this.§_-a1d§);
         new §_-kr§(this.§_-a1d§,gls("Инфо о карте"));
         this.§_-go§ = new ImageClock();
         this.§_-go§.x = 308;
         this.§_-go§.y = 6;
         addChild(this.§_-go§);
         this.§_-go§.visible = false;
         this.§_-72z§ = new §_-i5§("",323,5,this.§_-q1a§);
         addChild(this.§_-72z§);
         this.§_-73n§ = new §_-i5§("№:",303,8,this.§_-p18§);
         this.§_-31f§ = new §_-i5§("",318,5,this.§_-62B§);
         this.§_-31f§.addEventListener(MouseEvent.CLICK,Game.§_-036§);
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            addChild(this.§_-73n§);
            addChild(this.§_-31f§);
         }
         this.timer.addEventListener(TimerEvent.TIMER,this.§_-41i§,false,0,true);
      }
      
      public static function get instance() : §_-91y§
      {
         return _instance;
      }
      
      public static function show() : void
      {
         §_-22v§();
         _instance.visible = true;
         _instance.§_-Wy§();
      }
      
      public static function hide() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.visible = false;
         _instance.§_-Wy§();
      }
      
      public static function §_-22v§() : void
      {
         if(!_instance || !Game.starling || !Game.starling.stage)
         {
            return;
         }
         _instance.x = (Game.starling.stage.stageWidth - _instance.width) * 0.5;
         _instance.y = 0;
      }
      
      public function block() : void
      {
         if(this.§_-ox§)
         {
            return;
         }
         this.§_-ox§ = true;
         this.filters = §_-y1l§.§_-Tk§;
         this.mouseChildren = this.mouseEnabled = false;
      }
      
      public function §_-Wy§() : void
      {
         if(!this.§_-ox§)
         {
            return;
         }
         this.§_-ox§ = false;
         this.filters = [];
         this.mouseChildren = this.mouseEnabled = true;
      }
      
      public function set §_-w5§(param1:§_-53A§) : void
      {
         this.§_-s1j§ = param1;
      }
      
      public function get §_-8§() : Boolean
      {
         return this.§_-kC§;
      }
      
      public function §_-43X§(param1:MouseEvent = null) : void
      {
         this.§_-rd§();
         this.§_-73Y§.visible = true;
         this.§_-43O§.visible = false;
         this.§_-Oq§ = this.§_-ZX§.enabled;
         this.§_-8j§ = this.§_-G1Y§.enabled;
         this.§_-50§();
         this.§_-73n§.visible = false;
         this.§_-31f§.visible = false;
      }
      
      public function §_-a1m§(param1:int, param2:int) : void
      {
         this.minutes = param1;
         this.seconds = param2;
         this.timer.start();
      }
      
      public function §_-B3o§() : void
      {
         this.timer.stop();
      }
      
      public function §_-50§() : void
      {
         this.§_-V1v§([this.§_-y1a§,this.§_-k2b§,this.§_-wE§,this.§_-e2r§,this.§_-93C§,this.§_-tK§,this.§_-G1Y§,this.§_-ZX§,this.§_-N2A§,this.§_-gw§,this.§_-Cf§,this.§_-11v§,this.§_-B2Z§,this.§_-a1d§,this.§_-73G§,this.§_-H5§],false);
      }
      
      public function §_-z12§(param1:Boolean = false) : void
      {
         this.§_-kC§ = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§);
         this.§_-kC§ = !param1 && this.§_-kC§ && this.§_-F2u§ == §_-at§.§_-lg§;
         this.§_-93C§.visible = !this.§_-kC§;
         this.§_-tK§.visible = !this.§_-kC§;
         this.§_-e2r§.visible = !this.§_-kC§;
         this.§_-H5§.visible = this.§_-kC§;
         if(this.§_-kC§)
         {
            this.§_-43O§.x = 449;
            this.§_-73Y§.x = 449;
         }
         else
         {
            this.§_-43O§.x = 394;
            this.§_-73Y§.x = 394;
         }
      }
      
      public function §_-ED§() : void
      {
         this.§_-V1v§([this.§_-y1a§,this.§_-k2b§,this.§_-e2r§,this.§_-93C§,this.§_-tK§,this.§_-H5§,this.§_-N2A§,this.§_-gw§,this.§_-Cf§,this.§_-11v§,this.§_-B2Z§,this.§_-a1d§,this.§_-73G§],true);
         var _loc1_:Boolean = !this.§_-wA§ || §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§) || §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-Dk§) && (this.§_-F2u§ == §_-at§.§_-lg§ || this.§_-F2u§ == §_-at§.§_-22E§);
         this.setEnabled(this.§_-wE§,_loc1_);
         if(this.§_-8j§)
         {
            this.setEnabled(this.§_-G1Y§,true);
         }
         if(this.§_-Oq§)
         {
            this.setEnabled(this.§_-ZX§,true);
         }
         if(this.connectionClosed)
         {
            this.§_-m2H§();
         }
      }
      
      public function §_-61A§(param1:MouseEvent = null) : void
      {
         this.§_-rd§();
         this.§_-73Y§.visible = false;
         this.§_-43O§.visible = true;
         this.§_-ED§();
         this.§_-z12§();
         this.§_-go§.visible = false;
         this.§_-72z§.text = "";
         this.§_-73n§.visible = true;
         this.§_-31f§.visible = true;
         this.timer.stop();
         if(this.connectionClosed)
         {
            this.§_-m2H§();
         }
      }
      
      public function §_-O1A§() : void
      {
         this.§_-wE§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§);
         this.visible = true;
         this.§_-z12§(true);
      }
      
      public function §_-p20§(param1:MouseEvent = null) : void
      {
         if(!this.§_-s1j§)
         {
            return;
         }
         if(!this.§_-s1j§.§_-B3S§.§_-Gl§)
         {
            this.§_-s1j§.§_-B3S§.§_-Gl§ = true;
            Mouse.cursor = MouseCursor.HAND;
            this.state = this.§_-N2A§.upState;
            this.§_-N2A§.upState = this.§_-N2A§.downState;
         }
         else
         {
            this.§_-rd§();
         }
      }
      
      public function §_-rd§() : void
      {
         if(!this.§_-s1j§ || !this.§_-s1j§.§_-B3S§.§_-Gl§)
         {
            return;
         }
         this.§_-s1j§.§_-B3S§.§_-Gl§ = false;
         Mouse.cursor = MouseCursor.AUTO;
         if(this.state)
         {
            this.§_-N2A§.upState = this.state;
         }
      }
      
      public function §_-S1Y§(param1:int) : void
      {
         this.§_-F2u§ = param1;
         this.§_-ED§();
         this.§_-z12§();
         this.visible = true;
      }
      
      public function §_-m2H§() : void
      {
         this.§_-V1v§([this.§_-tK§,this.§_-H5§,this.§_-y1a§,this.§_-k2b§,this.§_-wE§,this.§_-f26§],false);
      }
      
      public function §_-9j§(param1:Number) : void
      {
         this.setEnabled(this.§_-Cf§,param1 + §_-71a§.§_-I1k§ <= §_-71a§.§_-A3E§);
         this.setEnabled(this.§_-gw§,param1 - §_-71a§.§_-I1k§ >= §_-71a§.§_-P11§);
      }
      
      public function §_-d11§(param1:Boolean, param2:Boolean) : void
      {
         this.setEnabled(this.§_-ZX§,param1);
         this.setEnabled(this.§_-G1Y§,param2);
      }
      
      private function §_-41i§(param1:TimerEvent) : void
      {
         var _loc2_:String = "";
         this.§_-go§.visible = true;
         if(this.seconds == 0)
         {
            --this.minutes;
            this.seconds = 60;
         }
         --this.seconds;
         if(this.seconds < 10)
         {
            _loc2_ = "0";
         }
         this.§_-72z§.text = " " + this.minutes + ":" + _loc2_ + this.seconds;
         if(this.minutes == 0 && this.seconds == 0)
         {
            this.timer.stop();
         }
      }
      
      private function §_-V1v§(param1:Array, param2:Boolean) : void
      {
         var _loc3_:SimpleButton = null;
         for each(_loc3_ in param1)
         {
            this.setEnabled(_loc3_,param2);
         }
      }
      
      private function setEnabled(param1:SimpleButton, param2:Boolean) : void
      {
         param1.enabled = param2;
         param1.mouseEnabled = param2;
         param1.filters = param2 ? [] : §_-y1l§.§_-Tk§;
      }
   }
}

