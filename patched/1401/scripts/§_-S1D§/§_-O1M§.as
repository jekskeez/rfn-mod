package §_-S1D§
{
   import §_-8I§.SquirrelEvent;
   import §_-92M§.§_-Qm§;
   import §_-92M§.§_-U1r§;
   import §_-A2E§.§_-e1T§;
   import §_-A2x§.§_-33A§;
   import §_-C3A§.§_-71U§;
   import §_-C3A§.§_-73K§;
   import §_-EH§.§_-Z16§;
   import §_-I10§.§_-01k§;
   import §_-I10§.§_-B3s§;
   import §_-I10§.§_-Bm§;
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-X2T§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-X1Q§.§_-O6§;
   import §_-Y29§.§_-nJ§;
   import §_-d10§.§_-02M§;
   import §_-e1G§.§_-N2L§;
   import §_-jC§.§_-y2P§;
   import §_-k1c§.§_-Q13§;
   import §_-rT§.§_-h1g§;
   import buttons.§_-Uo§;
   import com.api.PlayerEvent;
   import events.GameEvent;
   import events.§_-55§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   import game.mainGame.GameMap;
   import game.mainGame.§_-23Q§;
   import game.mainGame.§_-bM§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-T2o§;
   import tape.§_-f1P§;
   import utils.§_-DL§;
   import views.§_-l1b§;
   
   public class §_-O1M§ extends Sprite
   {
      
      private static var _instance:§_-O1M§;
      
      public static var §_-t2K§:Number = 0;
      
      public static var §_-Ir§:Number = 541;
      
      public static var §_-F2g§:int = -1;
      
      private var §_-g2M§:§_-Q13§;
      
      private var §_-7Y§:§_-Uo§ = null;
      
      private var §_-92a§:§_-Uo§ = null;
      
      private var §_-I1q§:§_-Uo§ = null;
      
      private var §_-qG§:§_-Uo§ = null;
      
      private var §_-p1n§:§_-Uo§ = null;
      
      private var §_-J2I§:ButtonQuestPerk = null;
      
      private var §_-83k§:§_-Uo§ = null;
      
      private var §_-P2K§:§_-Uo§ = null;
      
      private var buttonsArray:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      private var §_-A1Z§:§_-l1b§ = null;
      
      private var §_-A11§:§_-Qm§ = null;
      
      private var §_-9D§:§_-Qm§ = null;
      
      private var §_-VZ§:§_-Qm§ = null;
      
      private var §_-D1Q§:§_-Qm§ = null;
      
      private var §_-Jm§:§_-Qm§ = null;
      
      private var §_-na§:§_-O6§ = null;
      
      private var §_-8w§:§_-f1P§ = null;
      
      private var §_-eS§:Sprite = new Sprite();
      
      private var §_-q2c§:Dictionary = new Dictionary();
      
      private var §_-L24§:Dictionary = new Dictionary();
      
      private var §_-K2§:ImageArrowRespawn = null;
      
      private var §_-22R§:Boolean = true;
      
      private var §_-22m§:Boolean = false;
      
      private var §_-sB§:Hero = null;
      
      public function §_-O1M§()
      {
         _instance = this;
         super();
         this.visible = false;
         this.init();
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-y1k§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-Y2j§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-61y§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-W1O§]);
         §_-B3s§.addEventListener(GameEvent.ITEMS_CHANGED,this.§_-U29§);
         §_-01k§.addEventListener(GameEvent.SMILES_CHANGED,this.§_-2M§);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-V1Q§);
      }
      
      public static function show() : void
      {
         if(!_instance.§_-22m§)
         {
            _instance.§_-RG§();
         }
         _instance.§_-V1Q§();
         _instance.visible = true;
      }
      
      public static function hide() : void
      {
         _instance.visible = false;
      }
      
      public static function §_-RG§() : void
      {
         if(!_instance.§_-22m§)
         {
            _instance.§_-RG§();
         }
      }
      
      public static function set §_-22R§(param1:Boolean) : void
      {
         if(_instance.§_-22R§ == param1)
         {
            return;
         }
         _instance.§_-22R§ = param1;
         _instance.update();
      }
      
      public static function get hero() : Hero
      {
         return _instance.§_-sB§;
      }
      
      public static function set hero(param1:Hero) : void
      {
         if(hero == param1)
         {
            return;
         }
         if(hero != null)
         {
            hero.removeEventListener(SquirrelEvent.§_-z1B§,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-E2R§,_instance.update);
            hero.removeEventListener(SquirrelEvent.HIDE,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-f2m§,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-f13§,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-q1G§,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-S2i§,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-c2v§,_instance.update);
         }
         _instance.§_-sB§ = param1;
         if(hero != null)
         {
            hero.addEventListener(SquirrelEvent.§_-z1B§,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-E2R§,_instance.update);
            hero.addEventListener(SquirrelEvent.HIDE,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-f2m§,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-f13§,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-q1G§,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-S2i§,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-c2v§,_instance.update);
         }
         _instance.§_-8w§.hero = param1;
         _instance.§_-A1Z§.hero = param1;
         _instance.update();
      }
      
      public static function §_-C6§(param1:Function) : void
      {
         if(!_instance.§_-22m§)
         {
            _instance.§_-RG§();
         }
         _instance.§_-8w§.addEventListener(§_-55§.§_-31q§,param1,false,0,true);
      }
      
      public static function §_-L2u§(param1:Function) : void
      {
         _instance.§_-8w§.removeEventListener(§_-55§.§_-31q§,param1);
      }
      
      public static function §_-91M§(param1:Class) : void
      {
         _instance.§_-8w§.§_-91M§(param1);
      }
      
      public static function §_-D2P§() : void
      {
         _instance.§_-8w§.§_-D2P§();
      }
      
      public static function §_-W2q§(param1:Boolean) : void
      {
         if(_instance.§_-na§ == null)
         {
            return;
         }
         _instance.§_-na§.§_-W2q§(param1);
         (_instance.§_-Jm§ as §_-U1r§).§_-W2q§(param1);
      }
      
      public static function §_-f2q§(param1:Boolean) : void
      {
         if(_instance.§_-na§ == null)
         {
            return;
         }
         _instance.§_-na§.§_-f2q§(param1);
         (_instance.§_-Jm§ as §_-U1r§).§_-f2q§(param1);
      }
      
      public static function §_-X1N§(param1:Boolean) : void
      {
         if(_instance.§_-A11§ == null)
         {
            return;
         }
         _instance.§_-X1N§(param1);
      }
      
      public static function get §_-u2c§() : Boolean
      {
         return _instance.§_-na§.visible;
      }
      
      public static function get perksAvailable() : Boolean
      {
         return _instance.§_-qG§.mouseEnabled && _instance.§_-qG§.visible;
      }
      
      public static function §_-02n§() : void
      {
         if(_instance.§_-8w§)
         {
            _instance.§_-8w§.§_-02n§();
         }
         if(Boolean(_instance.§_-A11§) && _instance.§_-na§.visible)
         {
            _instance.§_-A11§.visible = false;
         }
         if(Boolean(_instance.§_-9D§) && _instance.§_-na§.visible)
         {
            _instance.§_-9D§.visible = false;
         }
         if(Boolean(_instance.§_-A1Z§) && _instance.§_-na§.visible)
         {
            _instance.§_-A1Z§.visible = false;
         }
      }
      
      public static function §_-SK§() : void
      {
         if(!_instance || !_instance.§_-22m§)
         {
            return;
         }
         _instance.§_-y1k§(null);
      }
      
      public static function §_-v2A§() : void
      {
         _instance.§_-na§.updateButtons();
         _instance.§_-A11§.updateButtons();
         _instance.§_-Jm§.updateButtons();
      }
      
      public static function §_-82o§(param1:§_-Uo§, param2:String, param3:int = -1) : void
      {
         var _loc4_:§_-N2L§ = null;
         if(_instance.§_-q2c§[param1])
         {
            return;
         }
         param1.y = 75;
         if(param3 != -1)
         {
            _loc4_ = new §_-N2L§(param1,100,param2,false,new Point(0,§_-Ir§),[new §_-02M§(§_-DL§.§_-W2w§(param3))]);
            _instance.§_-L24§[param1] = param3;
         }
         else
         {
            _loc4_ = new §_-N2L§(param1,100,param2,false,new Point(0,§_-Ir§));
         }
         _instance.buttonsArray.push(param1);
         _instance.§_-q2c§[param1] = _loc4_;
         _instance.§_-eS§.addChild(param1);
         _instance.§_-Y1§();
      }
      
      public static function §_-q1z§(param1:§_-Uo§) : void
      {
         if(!param1.parent)
         {
            return;
         }
         if(param1 in _instance.§_-L24§)
         {
            delete _instance.§_-L24§[param1];
         }
         if(_instance.§_-q2c§[param1] != null)
         {
            _instance.§_-q2c§[param1] = null;
            delete _instance.§_-q2c§[param1];
         }
         param1.parent.removeChild(param1);
         _instance.buttonsArray.splice(_instance.buttonsArray.indexOf(param1),1);
         _instance.§_-Y1§();
      }
      
      private function init() : void
      {
         var _loc1_:ImageFooterGame = new ImageFooterGame();
         _loc1_.y = §_-a9§.§_-31m§ - §_-3m§.§_-yL§ - _loc1_.height;
         _loc1_.cacheAsBitmap = true;
         addChild(_loc1_);
         this.§_-83k§ = new §_-Uo§(new ButtonFastMagic());
         this.§_-83k§.y = 73;
         this.§_-83k§.addEventListener(MouseEvent.CLICK,this.§_-629§);
         this.§_-eS§.addChild(this.§_-83k§);
         this.§_-q2c§[this.§_-83k§] = new §_-N2L§(this.§_-83k§,80,gls("Быстрая магия"),false,new Point(0,§_-Ir§));
         this.buttonsArray.push(this.§_-83k§);
         this.§_-p1n§ = new §_-Uo§(new ButtonSuicide());
         this.§_-p1n§.y = 73;
         this.§_-p1n§.addEventListener(MouseEvent.CLICK,this.§_-52s§);
         this.§_-eS§.addChild(this.§_-p1n§);
         this.§_-q2c§[this.§_-p1n§] = new §_-N2L§(this.§_-p1n§,70,gls("Сдаться"),false,new Point(0,§_-Ir§),[new §_-02M§("X"),new §_-02M§("Ctrl")]);
         this.buttonsArray.push(this.§_-p1n§);
         this.§_-qG§ = new §_-Uo§(new ButtonMagic());
         this.§_-qG§.y = 73;
         this.§_-qG§.addEventListener(MouseEvent.CLICK,this.§_-Y2f§);
         this.§_-eS§.addChild(this.§_-qG§);
         this.§_-q2c§[this.§_-qG§] = new §_-N2L§(this.§_-qG§,70,gls("Магия"),false,new Point(0,§_-Ir§),[new §_-02M§("Tab")]);
         this.buttonsArray.push(this.§_-qG§);
         this.§_-K2§ = new ImageArrowRespawn();
         this.§_-K2§.visible = false;
         this.§_-K2§.y = 19;
         addChild(this.§_-K2§);
         §_-73K§.instance.§_-tK§(§_-71U§.§_-m1T§,this.§_-qG§);
         this.§_-92a§ = new §_-Uo§(new ButtonClothesMagic());
         this.§_-92a§.y = 73;
         this.§_-92a§.addEventListener(MouseEvent.CLICK,this.§_-13P§);
         this.§_-eS§.addChild(this.§_-92a§);
         this.§_-q2c§[this.§_-92a§] = new §_-N2L§(this.§_-92a§,100,gls("Уникальные способности"),false,new Point(0,§_-Ir§),[new §_-02M§("T")]);
         this.buttonsArray.push(this.§_-92a§);
         this.§_-I1q§ = new §_-Uo§(new ButtonShamanMagic());
         this.§_-I1q§.y = 73;
         this.§_-I1q§.addEventListener(MouseEvent.CLICK,this.§_-zx§);
         this.§_-eS§.addChild(this.§_-I1q§);
         this.§_-q2c§[this.§_-I1q§] = new §_-N2L§(this.§_-I1q§,100,gls("Способности шамана"),false,new Point(0,§_-Ir§),[new §_-02M§("T")]);
         this.buttonsArray.push(this.§_-I1q§);
         this.§_-J2I§ = new ButtonQuestPerk();
         this.§_-J2I§.y = 75;
         this.§_-J2I§.visible = false;
         this.§_-J2I§.addEventListener(MouseEvent.CLICK,this.§_-zO§);
         this.§_-eS§.addChild(this.§_-J2I§);
         this.§_-q2c§[this.§_-J2I§] = new §_-N2L§(this.§_-J2I§,100,gls("Способность по заданию"),false,new Point(0,§_-Ir§));
         this.buttonsArray.push(this.§_-J2I§);
         this.§_-7Y§ = new §_-Uo§(new ButtonOpenSmile());
         this.§_-7Y§.y = 75;
         this.§_-7Y§.addEventListener(MouseEvent.CLICK,this.§_-a15§);
         this.§_-eS§.addChild(this.§_-7Y§);
         this.§_-q2c§[this.§_-7Y§] = new §_-N2L§(this.§_-7Y§,100,gls("Эмоции белки"),false,new Point(0,§_-Ir§));
         this.buttonsArray.push(this.§_-7Y§);
         this.§_-P2K§ = new §_-Uo§(new ButtonHareLaugh());
         this.§_-P2K§.y = 75;
         this.§_-P2K§.addEventListener(MouseEvent.CLICK,this.§_-9s§);
         this.§_-P2K§.visible = false;
         this.§_-eS§.addChild(this.§_-P2K§);
         this.§_-q2c§[this.§_-P2K§] = new §_-N2L§(this.§_-P2K§,100,gls("Cмеяться"),false,new Point(0,§_-Ir§));
         this.buttonsArray.push(this.§_-P2K§);
         addChild(this.§_-eS§);
         this.§_-A1Z§ = new §_-l1b§();
         this.§_-A1Z§.y = 20;
         this.§_-A1Z§.visible = false;
         this.§_-A1Z§.addEventListener(MouseEvent.CLICK,this.stopPropagation);
         this.§_-eS§.addChild(this.§_-A1Z§);
         this.§_-na§ = new §_-O6§();
         this.§_-na§.x = 790;
         this.§_-na§.y = 2;
         this.§_-na§.visible = false;
         this.§_-na§.addEventListener(MouseEvent.CLICK,this.stopPropagation);
         this.§_-eS§.addChild(this.§_-na§);
         this.§_-A11§ = new §_-y2P§();
         this.§_-A11§.x = 840;
         this.§_-A11§.y = 13;
         this.§_-A11§.addEventListener(MouseEvent.CLICK,this.stopPropagation);
         this.§_-eS§.addChild(this.§_-A11§);
         this.§_-9D§ = new §_-Z16§();
         this.§_-9D§.x = 700;
         this.§_-9D§.y = 10;
         this.§_-9D§.addEventListener(MouseEvent.CLICK,this.stopPropagation);
         this.§_-eS§.addChild(this.§_-9D§);
         this.§_-Jm§ = new §_-U1r§();
         this.§_-Jm§.x = 900;
         this.§_-Jm§.y = 18;
         this.§_-Jm§.visible = false;
         this.§_-Jm§.addEventListener(MouseEvent.CLICK,this.stopPropagation);
         this.§_-eS§.addChild(this.§_-Jm§);
         Game.listen(this.§_-rF§);
         this.§_-g2M§ = new §_-Q13§(gls("Сдаться"),gls("Закончить игру на этом уровне?"),true,this.§_-N8§);
         Hero.§_-xd§([Hero.§_-Uq§,Hero.§_-tl§,SquirrelEvent.§_-n1x§,SquirrelEvent.HIDE,SquirrelEvent.§_-z1B§],this.§_-t2z§);
         this.update();
      }
      
      private function §_-t2z§() : void
      {
         this.§_-na§.visible = false;
      }
      
      private function §_-RG§() : void
      {
         this.§_-8w§ = new §_-f1P§(9,1,32,0);
         this.§_-8w§.y = 71;
         addChild(this.§_-8w§);
         this.§_-VZ§ = new §_-nJ§();
         this.§_-VZ§.x = 20;
         this.§_-VZ§.y = 75;
         this.§_-eS§.addChild(this.§_-VZ§);
         this.§_-D1Q§ = new §_-h1g§();
         this.§_-D1Q§.x = 20;
         this.§_-D1Q§.y = 75;
         this.§_-eS§.addChild(this.§_-D1Q§);
         this.§_-A1Z§.§_-p2s§();
         this.update();
         this.§_-22m§ = true;
      }
      
      private function update(param1:SquirrelEvent = null) : void
      {
         this.§_-eS§.visible = false;
         if(hero == null)
         {
            this.§_-G14§();
            return;
         }
         if(!this.§_-22R§)
         {
            return;
         }
         this.§_-eS§.visible = true;
         var _loc2_:Boolean = !hero.isHare && !hero.isDragon;
         this.§_-VZ§.visible = hero.isHare;
         this.§_-D1Q§.visible = hero.isDragon;
         this.§_-Jm§.visible = false;
         this.§_-A11§.visible = false;
         this.§_-9D§.visible = false;
         this.§_-8w§.visible = _loc2_ && !hero.isDead;
         this.§_-J2I§.visible = §_-e1T§.§_-S27§;
         this.§_-qG§.visible = this.§_-na§.perksVisible;
         this.§_-92a§.visible = this.§_-A11§.perksVisible;
         this.§_-I1q§.visible = this.§_-9D§.perksVisible;
         this.§_-83k§.visible = §_-71o§.active is §_-92z§ && §_-Bm§.§_-2S§(§_-T2o§.§_-Q2R§);
         this.§_-P2K§.visible = this.§_-VZ§.visible;
         this.§_-C3Y§(!hero.isDead && §_-71o§.active is §_-92z§ && (hero.shaman || §_-01k§.smiles.length > 0 && !hero.isHare));
         this.§_-G14§();
         this.§_-Y1§();
         this.§_-V1e§ = this.respawn;
      }
      
      private function get respawn() : Boolean
      {
         var _loc1_:Boolean = !hero.isHare && !hero.isDragon;
         var _loc2_:Boolean = §_-Bm§.§_-2S§(§_-T2o§.§_-Q2R§);
         var _loc3_:Boolean = §_-33A§.§_-fA§ == 0 && §_-Br§.§_-f2k§;
         return !_loc3_ && _loc1_ && hero.isDead && !hero.inHollow && this.§_-na§.perksAvailable && _loc2_ && §_-71o§.active is §_-92z§;
      }
      
      private function set §_-V1e§(param1:Boolean) : void
      {
         this.§_-K2§.visible = param1;
         if(param1)
         {
            this.§_-K2§.play();
         }
         else
         {
            this.§_-K2§.stop();
         }
      }
      
      private function §_-Y1§() : void
      {
         var _loc1_:int = 857;
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonsArray.length)
         {
            this.buttonsArray[_loc2_].x = _loc1_;
            this.buttonsArray[_loc2_].y = 70;
            if(this.§_-q2c§[this.buttonsArray[_loc2_]] != null)
            {
               (this.§_-q2c§[this.buttonsArray[_loc2_]] as §_-N2L§).setPosition(§_-t2K§ + this.buttonsArray[_loc2_].x + this.buttonsArray[_loc2_].width * 0.5 - this.§_-q2c§[this.buttonsArray[_loc2_]].width * 0.5,this.§_-q2c§[this.buttonsArray[_loc2_]].y);
            }
            _loc1_ -= this.buttonsArray[_loc2_].visible ? 45 : 0;
            _loc2_++;
         }
         this.§_-A11§.x = Math.min(§_-a9§.§_-9o§ - 60,this.§_-92a§.x + (this.§_-92a§.width + this.§_-A11§.width) * 0.5 - 57);
         this.§_-K2§.x = this.§_-qG§.x + this.§_-K2§.width * 0.5;
         this.§_-9D§.x = this.§_-I1q§.x - 57 - this.§_-9D§.width * 0.5;
         this.§_-9D§.y = this.§_-I1q§.y - this.§_-9D§.height;
         this.§_-A1Z§.x = §_-a9§.§_-9o§ - this.§_-A1Z§.width - 60 - this.x;
      }
      
      private function §_-629§(param1:MouseEvent) : void
      {
         if(!this.§_-83k§.mouseEnabled)
         {
            return;
         }
         this.§_-Jm§.visible = !this.§_-Jm§.visible;
         param1.stopImmediatePropagation();
      }
      
      private function §_-13P§(param1:Event) : void
      {
         if(!this.§_-92a§.mouseEnabled)
         {
            return;
         }
         this.§_-A11§.visible = !this.§_-A11§.visible;
         this.§_-9D§.visible = this.§_-na§.visible = this.§_-A1Z§.visible = false;
         param1.stopImmediatePropagation();
      }
      
      private function §_-zx§(param1:Event) : void
      {
         if(!this.§_-I1q§.mouseEnabled)
         {
            return;
         }
         this.§_-9D§.visible = !this.§_-9D§.visible;
         this.§_-A11§.visible = this.§_-na§.visible = this.§_-A1Z§.visible = false;
         param1.stopImmediatePropagation();
      }
      
      private function §_-Y2f§(param1:Event) : void
      {
         if(!this.§_-qG§.mouseEnabled)
         {
            return;
         }
         var _loc2_:Boolean = !§_-a9§.§_-O1z§;
         this.§_-A11§.visible = this.§_-9D§.visible = this.§_-A1Z§.visible = false;
         this.§_-na§.§_-yr§(!this.§_-na§.visible,_loc2_);
         if(_loc2_)
         {
            this.§_-na§.§_-V1e§ = this.respawn;
         }
         this.§_-V1e§ = false;
         param1.stopImmediatePropagation();
      }
      
      private function §_-a15§(param1:MouseEvent) : void
      {
         this.§_-A1Z§.visible = !this.§_-A1Z§.visible;
         this.§_-A11§.visible = this.§_-9D§.visible = this.§_-na§.visible = false;
         param1.stopImmediatePropagation();
      }
      
      private function §_-N8§() : void
      {
         if(!hero)
         {
            return;
         }
         hero.§_-L1A§ = Hero.§_-i22§;
         hero.dead = true;
      }
      
      private function §_-52s§(param1:MouseEvent) : void
      {
         if(Boolean(hero) && Boolean(!hero.isDead) && this.§_-p1n§.mouseEnabled)
         {
            this.§_-g2M§.show();
         }
      }
      
      private function §_-zO§(param1:MouseEvent) : void
      {
         if(!hero || hero.isDead || hero.inHollow)
         {
            return;
         }
         hero.dispatchEvent(new Event(Hero.§_-C2K§));
      }
      
      private function stopPropagation(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      private function §_-C3Y§(param1:Boolean) : void
      {
         this.§_-7Y§.visible = param1;
         if((!this.§_-7Y§.visible || !this.§_-7Y§.mouseEnabled) && this.§_-A1Z§.visible)
         {
            this.§_-A1Z§.visible = false;
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[0] != §_-S2I§.§_-JF§)
         {
            §_-F2g§ = param1[0];
         }
         setTimeout(this.§_-G14§,1);
         if(§_-F2g§ == param1[0])
         {
            this.§_-X1N§(true);
         }
      }
      
      private function §_-U29§(param1:GameEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:Class = null;
         var _loc6_:§_-bM§ = null;
         if(_instance == null || _instance.§_-8w§ == null || _instance.§_-8w§.hero == null)
         {
            return;
         }
         var _loc2_:§_-23Q§ = _instance.§_-8w§.hero.§_-l2U§;
         for(_loc3_ in param1.data)
         {
            _loc4_ = int(param1.data[_loc3_]);
            _loc5_ = §_-X2T§.§_-s1f§(int(_loc3_));
            _loc6_ = _loc2_.§_-43X§(_loc5_,§_-bM§.§_-S2D§);
            if(_loc6_)
            {
               _loc6_.count = _loc4_;
            }
            else
            {
               _loc2_.add(new §_-bM§(_loc5_,§_-bM§.§_-S2D§,_loc4_));
            }
         }
         _loc2_.update();
      }
      
      private function §_-2M§(param1:GameEvent) : void
      {
         if(!this.§_-22m§)
         {
            return;
         }
         this.§_-C3Y§(!this.§_-VZ§.visible);
         this.§_-Y1§();
      }
      
      private function §_-rF§(param1:PlayerEvent) : void
      {
         if(hero == null)
         {
            return;
         }
         if(param1.player["id"] != hero.id)
         {
            return;
         }
         this.§_-C3Y§(!hero.isDead && §_-71o§.active is §_-92z§ && §_-01k§.smiles.length > 0 && !hero.isHare);
         this.§_-Y1§();
      }
      
      private function §_-G14§() : void
      {
         this.§_-92a§.mouseEnabled = this.§_-A11§.perksAvailable;
         this.§_-qG§.mouseEnabled = this.§_-na§.perksAvailable;
         this.§_-83k§.mouseEnabled = this.§_-qG§.mouseEnabled || this.§_-92a§.mouseEnabled;
         this.§_-I1q§.mouseEnabled = this.§_-9D§.perksAvailable;
         this.§_-p1n§.mouseEnabled = hero != null && §_-F2g§ == §_-S2I§.ROUND_START && !hero.isDead && !hero.inHollow;
         this.§_-7Y§.mouseEnabled = !(hero != null && (hero.isDead || hero.inHollow || §_-F2g§ != §_-S2I§.ROUND_START));
         this.§_-P2K§.mouseEnabled = hero != null && !hero.isDead && hero.isHare && §_-F2g§ == §_-S2I§.ROUND_START;
         if(!this.§_-na§.perksAvailable && this.§_-na§.visible)
         {
            this.§_-na§.visible = false;
         }
      }
      
      private function §_-X1N§(param1:Boolean) : void
      {
         (this.§_-A11§ as §_-y2P§).§_-m20§(param1);
         (this.§_-Jm§ as §_-U1r§).§_-m20§(param1);
      }
      
      private function §_-y1k§(param1:MouseEvent) : void
      {
         if(!_instance.visible)
         {
            return;
         }
         this.§_-A11§.visible = false;
         this.§_-9D§.visible = false;
         this.§_-na§.visible = false;
         this.§_-A1Z§.visible = false;
         this.§_-Jm§.visible = false;
      }
      
      private function §_-Y2j§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.X || !param1.ctrlKey)
         {
            return;
         }
         if(!_instance.visible || Game.chat.visible)
         {
            return;
         }
         this.§_-52s§(null);
      }
      
      private function §_-61y§(param1:KeyboardEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:§_-Uo§ = null;
         if(!_instance.visible || Game.chat.visible)
         {
            return;
         }
         for(_loc2_ in this.§_-L24§)
         {
            if(this.§_-L24§[_loc2_] == param1.keyCode)
            {
               _loc3_ = _loc2_ as §_-Uo§;
               if(!(!_loc3_ || !_loc3_.mouseEnabled || !_loc3_.visible))
               {
                  _loc3_.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                  return;
               }
            }
         }
      }
      
      private function §_-9s§(param1:MouseEvent) : void
      {
         if(!hero || !hero.isHare || hero.isDead)
         {
            return;
         }
         hero.§_-Ci§(Hero.§_-G1g§);
         if(§_-71o§.active is §_-92z§)
         {
            hero.sendLocation(Keyboard.F1);
         }
      }
      
      private function §_-V1Q§(param1:Event = null) : void
      {
         §_-t2K§ = (GameMap.§_-q1n§ - §_-a9§.§_-9o§) * 0.5;
         §_-Ir§ = GameMap.§_-P1Q§ - 79;
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonsArray.length)
         {
            if(this.§_-q2c§[this.buttonsArray[_loc2_]] != null)
            {
               (this.§_-q2c§[this.buttonsArray[_loc2_]] as §_-N2L§).setPosition(§_-t2K§ + this.buttonsArray[_loc2_].x + (this.buttonsArray[_loc2_].width - this.§_-q2c§[this.buttonsArray[_loc2_]].width) * 0.5,§_-Ir§);
            }
            _loc2_++;
         }
      }
   }
}

