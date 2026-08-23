package §_-61C§
{
   import §_-HG§.§_-i1N§;
   import §_-HG§.§_-of§;
   import §_-P2Y§.§_-dn§;
   import §_-Qy§.§_-U2K§;
   import §_-S1n§.§_-K1y§;
   import §_-TN§.§_-cS§;
   import §_-X1k§.§_-EJ§;
   import §_-X1k§.§_-F1Z§;
   import §_-X1k§.§_-OG§;
   import §_-X1k§.§_-n1C§;
   import §_-X1k§.§_-r12§;
   import §_-X2V§.SquirrelEvent;
   import §_-bN§.§_-Fk§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-g2C§.§_-A2Y§;
   import §_-j1y§.§_-Y3§;
   import §_-q0§.§_-gr§;
   import §_-t1c§.§_-R1P§;
   import §_-t1c§.§_-r8§;
   import §_-td§.§_-N2w§;
   import §_-vz§.§_-r20§;
   import buttons.§_-11d§;
   import com.api.PlayerEvent;
   import events.GameEvent;
   import events.§_-Am§;
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
   import game.mainGame.§_-Cd§;
   import game.mainGame.§_-v1N§;
   import protocol.Connection;
   import protocol.§_-n2E§;
   import protocol.§_-s2l§;
   import tape.§_-KG§;
   import utils.§_-f2H§;
   import views.§_-xl§;
   
   public class §_-a2p§ extends Sprite
   {
      
      private static var _instance:§_-a2p§;
      
      public static var §_-i2z§:Number = 0;
      
      public static var §_-X1y§:Number = 541;
      
      public static var §_-j2F§:int = -1;
      
      private var §_-Pz§:§_-Fk§;
      
      private var §_-j21§:§_-11d§ = null;
      
      private var §_-m7§:§_-11d§ = null;
      
      private var §_-E1z§:§_-11d§ = null;
      
      private var §_-Z2w§:§_-11d§ = null;
      
      private var §_-W1x§:§_-11d§ = null;
      
      private var §_-RO§:ButtonQuestPerk = null;
      
      private var §_-b1r§:§_-11d§ = null;
      
      private var §_-Br§:§_-11d§ = null;
      
      private var buttonsArray:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      private var §_-m2l§:§_-xl§ = null;
      
      private var §_-81e§:§_-i1N§ = null;
      
      private var §_-hH§:§_-i1N§ = null;
      
      private var §_-r2j§:§_-i1N§ = null;
      
      private var §_-g1C§:§_-i1N§ = null;
      
      private var §_-nT§:§_-i1N§ = null;
      
      private var §_-87§:§_-dn§ = null;
      
      private var §_-Y1Y§:§_-KG§ = null;
      
      private var §_-n2V§:Sprite = new Sprite();
      
      private var §_-Q2t§:Dictionary = new Dictionary();
      
      private var §_-Z2L§:Dictionary = new Dictionary();
      
      private var §_-R18§:ImageArrowRespawn = null;
      
      private var §_-N2j§:Boolean = true;
      
      private var §_-929§:Boolean = false;
      
      private var §_-k1D§:Hero = null;
      
      public function §_-a2p§()
      {
         _instance = this;
         super();
         this.visible = false;
         this.init();
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-xU§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-c15§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-E2L§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-p1K§]);
         §_-OG§.addEventListener(GameEvent.ITEMS_CHANGED,this.§_-TX§);
         §_-EJ§.addEventListener(GameEvent.SMILES_CHANGED,this.§_-f1r§);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-22v§);
      }
      
      public static function show() : void
      {
         if(!_instance.§_-929§)
         {
            _instance.§_-Q1u§();
         }
         _instance.§_-22v§();
         _instance.visible = true;
      }
      
      public static function hide() : void
      {
         _instance.visible = false;
      }
      
      public static function §_-Q1u§() : void
      {
         if(!_instance.§_-929§)
         {
            _instance.§_-Q1u§();
         }
      }
      
      public static function set §_-N2j§(param1:Boolean) : void
      {
         if(_instance.§_-N2j§ == param1)
         {
            return;
         }
         _instance.§_-N2j§ = param1;
         _instance.update();
      }
      
      public static function get hero() : Hero
      {
         return _instance.§_-k1D§;
      }
      
      public static function set hero(param1:Hero) : void
      {
         if(hero == param1)
         {
            return;
         }
         if(hero != null)
         {
            hero.removeEventListener(SquirrelEvent.§_-E25§,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-71l§,_instance.update);
            hero.removeEventListener(SquirrelEvent.HIDE,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-pZ§,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-R1y§,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-rR§,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-Z2N§,_instance.update);
            hero.removeEventListener(SquirrelEvent.§_-Z1h§,_instance.update);
         }
         _instance.§_-k1D§ = param1;
         if(hero != null)
         {
            hero.addEventListener(SquirrelEvent.§_-E25§,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-71l§,_instance.update);
            hero.addEventListener(SquirrelEvent.HIDE,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-pZ§,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-R1y§,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-rR§,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-Z2N§,_instance.update);
            hero.addEventListener(SquirrelEvent.§_-Z1h§,_instance.update);
         }
         _instance.§_-Y1Y§.hero = param1;
         _instance.§_-m2l§.hero = param1;
         _instance.update();
      }
      
      public static function §_-f15§(param1:Function) : void
      {
         if(!_instance.§_-929§)
         {
            _instance.§_-Q1u§();
         }
         _instance.§_-Y1Y§.addEventListener(§_-Am§.§_-n2H§,param1,false,0,true);
      }
      
      public static function §_-Dg§(param1:Function) : void
      {
         _instance.§_-Y1Y§.removeEventListener(§_-Am§.§_-n2H§,param1);
      }
      
      public static function §_-xq§(param1:Class) : void
      {
         _instance.§_-Y1Y§.§_-xq§(param1);
      }
      
      public static function §_-l16§() : void
      {
         _instance.§_-Y1Y§.§_-l16§();
      }
      
      public static function §_-bG§(param1:Boolean) : void
      {
         if(_instance.§_-87§ == null)
         {
            return;
         }
         _instance.§_-87§.§_-bG§(param1);
         (_instance.§_-nT§ as §_-of§).§_-bG§(param1);
      }
      
      public static function §_-61R§(param1:Boolean) : void
      {
         if(_instance.§_-87§ == null)
         {
            return;
         }
         _instance.§_-87§.§_-61R§(param1);
         (_instance.§_-nT§ as §_-of§).§_-61R§(param1);
      }
      
      public static function §_-LJ§(param1:Boolean) : void
      {
         if(_instance.§_-81e§ == null)
         {
            return;
         }
         _instance.§_-LJ§(param1);
      }
      
      public static function get §_-P2e§() : Boolean
      {
         return _instance.§_-87§.visible;
      }
      
      public static function get perksAvailable() : Boolean
      {
         return _instance.§_-Z2w§.mouseEnabled && _instance.§_-Z2w§.visible;
      }
      
      public static function §_-r15§() : void
      {
         if(_instance.§_-Y1Y§)
         {
            _instance.§_-Y1Y§.§_-r15§();
         }
         if(Boolean(_instance.§_-81e§) && _instance.§_-87§.visible)
         {
            _instance.§_-81e§.visible = false;
         }
         if(Boolean(_instance.§_-hH§) && _instance.§_-87§.visible)
         {
            _instance.§_-hH§.visible = false;
         }
         if(Boolean(_instance.§_-m2l§) && _instance.§_-87§.visible)
         {
            _instance.§_-m2l§.visible = false;
         }
      }
      
      public static function §_-Y1F§() : void
      {
         if(!_instance || !_instance.§_-929§)
         {
            return;
         }
         _instance.§_-xU§(null);
      }
      
      public static function §_-419§() : void
      {
         _instance.§_-87§.updateButtons();
         _instance.§_-81e§.updateButtons();
         _instance.§_-nT§.updateButtons();
      }
      
      public static function §_-Hi§(param1:§_-11d§, param2:String, param3:int = -1) : void
      {
         var _loc4_:§_-K1y§ = null;
         if(_instance.§_-Q2t§[param1])
         {
            return;
         }
         param1.y = 75;
         if(param3 != -1)
         {
            _loc4_ = new §_-K1y§(param1,100,param2,false,new Point(0,§_-X1y§),[new §_-U2K§(§_-f2H§.§_-d2k§(param3))]);
            _instance.§_-Z2L§[param1] = param3;
         }
         else
         {
            _loc4_ = new §_-K1y§(param1,100,param2,false,new Point(0,§_-X1y§));
         }
         _instance.buttonsArray.push(param1);
         _instance.§_-Q2t§[param1] = _loc4_;
         _instance.§_-n2V§.addChild(param1);
         _instance.§_-Cx§();
      }
      
      public static function §_-M25§(param1:§_-11d§) : void
      {
         if(!param1.parent)
         {
            return;
         }
         if(param1 in _instance.§_-Z2L§)
         {
            delete _instance.§_-Z2L§[param1];
         }
         if(_instance.§_-Q2t§[param1] != null)
         {
            _instance.§_-Q2t§[param1] = null;
            delete _instance.§_-Q2t§[param1];
         }
         param1.parent.removeChild(param1);
         _instance.buttonsArray.splice(_instance.buttonsArray.indexOf(param1),1);
         _instance.§_-Cx§();
      }
      
      private function init() : void
      {
         var _loc1_:ImageFooterGame = new ImageFooterGame();
         _loc1_.y = §_-Zy§.§_-02T§ - §_-im§.§_-u2F§ - _loc1_.height;
         _loc1_.cacheAsBitmap = true;
         addChild(_loc1_);
         this.§_-b1r§ = new §_-11d§(new ButtonFastMagic());
         this.§_-b1r§.y = 73;
         this.§_-b1r§.addEventListener(MouseEvent.CLICK,this.§_-Y2Z§);
         this.§_-n2V§.addChild(this.§_-b1r§);
         this.§_-Q2t§[this.§_-b1r§] = new §_-K1y§(this.§_-b1r§,80,gls("Быстрая магия"),false,new Point(0,§_-X1y§));
         this.buttonsArray.push(this.§_-b1r§);
         this.§_-W1x§ = new §_-11d§(new ButtonSuicide());
         this.§_-W1x§.y = 73;
         this.§_-W1x§.addEventListener(MouseEvent.CLICK,this.§_-63h§);
         this.§_-n2V§.addChild(this.§_-W1x§);
         this.§_-Q2t§[this.§_-W1x§] = new §_-K1y§(this.§_-W1x§,70,gls("Сдаться"),false,new Point(0,§_-X1y§),[new §_-U2K§("X"),new §_-U2K§("Ctrl")]);
         this.buttonsArray.push(this.§_-W1x§);
         this.§_-Z2w§ = new §_-11d§(new ButtonMagic());
         this.§_-Z2w§.y = 73;
         this.§_-Z2w§.addEventListener(MouseEvent.CLICK,this.§_-P22§);
         this.§_-n2V§.addChild(this.§_-Z2w§);
         this.§_-Q2t§[this.§_-Z2w§] = new §_-K1y§(this.§_-Z2w§,70,gls("Магия"),false,new Point(0,§_-X1y§),[new §_-U2K§("Tab")]);
         this.buttonsArray.push(this.§_-Z2w§);
         this.§_-R18§ = new ImageArrowRespawn();
         this.§_-R18§.visible = false;
         this.§_-R18§.y = 19;
         addChild(this.§_-R18§);
         §_-r8§.instance.§_-23S§(§_-R1P§.§_-t1K§,this.§_-Z2w§);
         this.§_-m7§ = new §_-11d§(new ButtonClothesMagic());
         this.§_-m7§.y = 73;
         this.§_-m7§.addEventListener(MouseEvent.CLICK,this.§_-61p§);
         this.§_-n2V§.addChild(this.§_-m7§);
         this.§_-Q2t§[this.§_-m7§] = new §_-K1y§(this.§_-m7§,100,gls("Уникальные способности"),false,new Point(0,§_-X1y§),[new §_-U2K§("T")]);
         this.buttonsArray.push(this.§_-m7§);
         this.§_-E1z§ = new §_-11d§(new ButtonShamanMagic());
         this.§_-E1z§.y = 73;
         this.§_-E1z§.addEventListener(MouseEvent.CLICK,this.§_-51K§);
         this.§_-n2V§.addChild(this.§_-E1z§);
         this.§_-Q2t§[this.§_-E1z§] = new §_-K1y§(this.§_-E1z§,100,gls("Способности шамана"),false,new Point(0,§_-X1y§),[new §_-U2K§("T")]);
         this.buttonsArray.push(this.§_-E1z§);
         this.§_-RO§ = new ButtonQuestPerk();
         this.§_-RO§.y = 75;
         this.§_-RO§.visible = false;
         this.§_-RO§.addEventListener(MouseEvent.CLICK,this.§_-oz§);
         this.§_-n2V§.addChild(this.§_-RO§);
         this.§_-Q2t§[this.§_-RO§] = new §_-K1y§(this.§_-RO§,100,gls("Способность по заданию"),false,new Point(0,§_-X1y§));
         this.buttonsArray.push(this.§_-RO§);
         this.§_-j21§ = new §_-11d§(new ButtonOpenSmile());
         this.§_-j21§.y = 75;
         this.§_-j21§.addEventListener(MouseEvent.CLICK,this.§_-816§);
         this.§_-n2V§.addChild(this.§_-j21§);
         this.§_-Q2t§[this.§_-j21§] = new §_-K1y§(this.§_-j21§,100,gls("Эмоции белки"),false,new Point(0,§_-X1y§));
         this.buttonsArray.push(this.§_-j21§);
         this.§_-Br§ = new §_-11d§(new ButtonHareLaugh());
         this.§_-Br§.y = 75;
         this.§_-Br§.addEventListener(MouseEvent.CLICK,this.§_-i2m§);
         this.§_-Br§.visible = false;
         this.§_-n2V§.addChild(this.§_-Br§);
         this.§_-Q2t§[this.§_-Br§] = new §_-K1y§(this.§_-Br§,100,gls("Cмеяться"),false,new Point(0,§_-X1y§));
         this.buttonsArray.push(this.§_-Br§);
         addChild(this.§_-n2V§);
         this.§_-m2l§ = new §_-xl§();
         this.§_-m2l§.y = 20;
         this.§_-m2l§.visible = false;
         this.§_-m2l§.addEventListener(MouseEvent.CLICK,this.stopPropagation);
         this.§_-n2V§.addChild(this.§_-m2l§);
         this.§_-87§ = new §_-dn§();
         this.§_-87§.x = 790;
         this.§_-87§.y = 2;
         this.§_-87§.visible = false;
         this.§_-87§.addEventListener(MouseEvent.CLICK,this.stopPropagation);
         this.§_-n2V§.addChild(this.§_-87§);
         this.§_-81e§ = new §_-A2Y§();
         this.§_-81e§.x = 840;
         this.§_-81e§.y = 13;
         this.§_-81e§.addEventListener(MouseEvent.CLICK,this.stopPropagation);
         this.§_-n2V§.addChild(this.§_-81e§);
         this.§_-hH§ = new §_-Y3§();
         this.§_-hH§.x = 700;
         this.§_-hH§.y = 10;
         this.§_-hH§.addEventListener(MouseEvent.CLICK,this.stopPropagation);
         this.§_-n2V§.addChild(this.§_-hH§);
         this.§_-nT§ = new §_-of§();
         this.§_-nT§.x = 900;
         this.§_-nT§.y = 18;
         this.§_-nT§.visible = false;
         this.§_-nT§.addEventListener(MouseEvent.CLICK,this.stopPropagation);
         this.§_-n2V§.addChild(this.§_-nT§);
         Game.listen(this.§_-K16§);
         this.§_-Pz§ = new §_-Fk§(gls("Сдаться"),gls("Закончить игру на этом уровне?"),true,this.§_-U2N§);
         Hero.§_-K2a§([Hero.§_-h1i§,Hero.§_-K1I§,SquirrelEvent.§_-M15§,SquirrelEvent.HIDE,SquirrelEvent.§_-E25§],this.§_-SH§);
         this.update();
      }
      
      private function §_-SH§() : void
      {
         this.§_-87§.visible = false;
      }
      
      private function §_-Q1u§() : void
      {
         this.§_-Y1Y§ = new §_-KG§(9,1,32,0);
         this.§_-Y1Y§.y = 71;
         addChild(this.§_-Y1Y§);
         this.§_-r2j§ = new §_-cS§();
         this.§_-r2j§.x = 20;
         this.§_-r2j§.y = 75;
         this.§_-n2V§.addChild(this.§_-r2j§);
         this.§_-g1C§ = new §_-r20§();
         this.§_-g1C§.x = 20;
         this.§_-g1C§.y = 75;
         this.§_-n2V§.addChild(this.§_-g1C§);
         this.§_-m2l§.§_-B3k§();
         this.update();
         this.§_-929§ = true;
      }
      
      private function update(param1:SquirrelEvent = null) : void
      {
         this.§_-n2V§.visible = false;
         if(hero == null)
         {
            this.§_-32m§();
            return;
         }
         if(!this.§_-N2j§)
         {
            return;
         }
         this.§_-n2V§.visible = true;
         var _loc2_:Boolean = !hero.isHare && !hero.isDragon;
         this.§_-r2j§.visible = hero.isHare;
         this.§_-g1C§.visible = hero.isDragon;
         this.§_-nT§.visible = false;
         this.§_-81e§.visible = false;
         this.§_-hH§.visible = false;
         this.§_-Y1Y§.visible = _loc2_ && !hero.isDead;
         this.§_-RO§.visible = §_-gr§.§_-U2Z§;
         this.§_-Z2w§.visible = this.§_-87§.perksVisible;
         this.§_-m7§.visible = this.§_-81e§.perksVisible;
         this.§_-E1z§.visible = this.§_-hH§.perksVisible;
         this.§_-b1r§.visible = §_-t2c§.active is §_-u24§ && §_-r12§.§_-FS§(§_-n2E§.§_-y1i§);
         this.§_-Br§.visible = this.§_-r2j§.visible;
         this.§_-Ho§(!hero.isDead && §_-t2c§.active is §_-u24§ && (hero.shaman || §_-EJ§.smiles.length > 0 && !hero.isHare));
         this.§_-32m§();
         this.§_-Cx§();
         this.§_-NU§ = this.respawn;
      }
      
      private function get respawn() : Boolean
      {
         var _loc1_:Boolean = !hero.isHare && !hero.isDragon;
         var _loc2_:Boolean = §_-r12§.§_-FS§(§_-n2E§.§_-y1i§);
         var _loc3_:Boolean = §_-N2w§.§_-rl§ == 0 && §_-F1Z§.§_-O1u§;
         return !_loc3_ && _loc1_ && hero.isDead && !hero.inHollow && this.§_-87§.perksAvailable && _loc2_ && §_-t2c§.active is §_-u24§;
      }
      
      private function set §_-NU§(param1:Boolean) : void
      {
         this.§_-R18§.visible = param1;
         if(param1)
         {
            this.§_-R18§.play();
         }
         else
         {
            this.§_-R18§.stop();
         }
      }
      
      private function §_-Cx§() : void
      {
         var _loc1_:int = 857;
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonsArray.length)
         {
            this.buttonsArray[_loc2_].x = _loc1_;
            this.buttonsArray[_loc2_].y = 70;
            if(this.§_-Q2t§[this.buttonsArray[_loc2_]] != null)
            {
               (this.§_-Q2t§[this.buttonsArray[_loc2_]] as §_-K1y§).setPosition(§_-i2z§ + this.buttonsArray[_loc2_].x + this.buttonsArray[_loc2_].width * 0.5 - this.§_-Q2t§[this.buttonsArray[_loc2_]].width * 0.5,this.§_-Q2t§[this.buttonsArray[_loc2_]].y);
            }
            _loc1_ -= this.buttonsArray[_loc2_].visible ? 45 : 0;
            _loc2_++;
         }
         this.§_-81e§.x = Math.min(§_-Zy§.§_-21V§ - 60,this.§_-m7§.x + (this.§_-m7§.width + this.§_-81e§.width) * 0.5 - 57);
         this.§_-R18§.x = this.§_-Z2w§.x + this.§_-R18§.width * 0.5;
         this.§_-hH§.x = this.§_-E1z§.x - 57 - this.§_-hH§.width * 0.5;
         this.§_-hH§.y = this.§_-E1z§.y - this.§_-hH§.height;
         this.§_-m2l§.x = §_-Zy§.§_-21V§ - this.§_-m2l§.width - 60 - this.x;
      }
      
      private function §_-Y2Z§(param1:MouseEvent) : void
      {
         if(!this.§_-b1r§.mouseEnabled)
         {
            return;
         }
         this.§_-nT§.visible = !this.§_-nT§.visible;
         param1.stopImmediatePropagation();
      }
      
      private function §_-61p§(param1:Event) : void
      {
         if(!this.§_-m7§.mouseEnabled)
         {
            return;
         }
         this.§_-81e§.visible = !this.§_-81e§.visible;
         this.§_-hH§.visible = this.§_-87§.visible = this.§_-m2l§.visible = false;
         param1.stopImmediatePropagation();
      }
      
      private function §_-51K§(param1:Event) : void
      {
         if(!this.§_-E1z§.mouseEnabled)
         {
            return;
         }
         this.§_-hH§.visible = !this.§_-hH§.visible;
         this.§_-81e§.visible = this.§_-87§.visible = this.§_-m2l§.visible = false;
         param1.stopImmediatePropagation();
      }
      
      private function §_-P22§(param1:Event) : void
      {
         if(!this.§_-Z2w§.mouseEnabled)
         {
            return;
         }
         var _loc2_:Boolean = !§_-Zy§.§_-e2k§;
         this.§_-81e§.visible = this.§_-hH§.visible = this.§_-m2l§.visible = false;
         this.§_-87§.§_-t1O§(!this.§_-87§.visible,_loc2_);
         if(_loc2_)
         {
            this.§_-87§.§_-NU§ = this.respawn;
         }
         this.§_-NU§ = false;
         param1.stopImmediatePropagation();
      }
      
      private function §_-816§(param1:MouseEvent) : void
      {
         this.§_-m2l§.visible = !this.§_-m2l§.visible;
         this.§_-81e§.visible = this.§_-hH§.visible = this.§_-87§.visible = false;
         param1.stopImmediatePropagation();
      }
      
      private function §_-U2N§() : void
      {
         if(!hero)
         {
            return;
         }
         hero.§_-b2d§ = Hero.§_-41§;
         hero.dead = true;
      }
      
      private function §_-63h§(param1:MouseEvent) : void
      {
         if(Boolean(hero) && Boolean(!hero.isDead) && this.§_-W1x§.mouseEnabled)
         {
            this.§_-Pz§.show();
         }
      }
      
      private function §_-oz§(param1:MouseEvent) : void
      {
         if(!hero || hero.isDead || hero.inHollow)
         {
            return;
         }
         hero.dispatchEvent(new Event(Hero.§_-e1j§));
      }
      
      private function stopPropagation(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      private function §_-Ho§(param1:Boolean) : void
      {
         this.§_-j21§.visible = param1;
         if((!this.§_-j21§.visible || !this.§_-j21§.mouseEnabled) && this.§_-m2l§.visible)
         {
            this.§_-m2l§.visible = false;
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[0] != §_-s2l§.§_-F2f§)
         {
            §_-j2F§ = param1[0];
         }
         setTimeout(this.§_-32m§,1);
         if(§_-j2F§ == param1[0])
         {
            this.§_-LJ§(true);
         }
      }
      
      private function §_-TX§(param1:GameEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:Class = null;
         var _loc6_:§_-v1N§ = null;
         if(_instance == null || _instance.§_-Y1Y§ == null || _instance.§_-Y1Y§.hero == null)
         {
            return;
         }
         var _loc2_:§_-Cd§ = _instance.§_-Y1Y§.hero.§_-h1z§;
         for(_loc3_ in param1.data)
         {
            _loc4_ = int(param1.data[_loc3_]);
            _loc5_ = §_-n1C§.§_-71N§(int(_loc3_));
            _loc6_ = _loc2_.§_-815§(_loc5_,§_-v1N§.§_-T2l§);
            if(_loc6_)
            {
               _loc6_.count = _loc4_;
            }
            else
            {
               _loc2_.add(new §_-v1N§(_loc5_,§_-v1N§.§_-T2l§,_loc4_));
            }
         }
         _loc2_.update();
      }
      
      private function §_-f1r§(param1:GameEvent) : void
      {
         if(!this.§_-929§)
         {
            return;
         }
         this.§_-Ho§(!this.§_-r2j§.visible);
         this.§_-Cx§();
      }
      
      private function §_-K16§(param1:PlayerEvent) : void
      {
         if(hero == null)
         {
            return;
         }
         if(param1.player["id"] != hero.id)
         {
            return;
         }
         this.§_-Ho§(!hero.isDead && §_-t2c§.active is §_-u24§ && §_-EJ§.smiles.length > 0 && !hero.isHare);
         this.§_-Cx§();
      }
      
      private function §_-32m§() : void
      {
         this.§_-m7§.mouseEnabled = this.§_-81e§.perksAvailable;
         this.§_-Z2w§.mouseEnabled = this.§_-87§.perksAvailable;
         this.§_-b1r§.mouseEnabled = this.§_-Z2w§.mouseEnabled || this.§_-m7§.mouseEnabled;
         this.§_-E1z§.mouseEnabled = this.§_-hH§.perksAvailable;
         this.§_-W1x§.mouseEnabled = hero != null && §_-j2F§ == §_-s2l§.ROUND_START && !hero.isDead && !hero.inHollow;
         this.§_-j21§.mouseEnabled = !(hero != null && (hero.isDead || hero.inHollow || §_-j2F§ != §_-s2l§.ROUND_START));
         this.§_-Br§.mouseEnabled = hero != null && !hero.isDead && hero.isHare && §_-j2F§ == §_-s2l§.ROUND_START;
         if(!this.§_-87§.perksAvailable && this.§_-87§.visible)
         {
            this.§_-87§.visible = false;
         }
      }
      
      private function §_-LJ§(param1:Boolean) : void
      {
         (this.§_-81e§ as §_-A2Y§).§_-J1b§(param1);
         (this.§_-nT§ as §_-of§).§_-J1b§(param1);
      }
      
      private function §_-xU§(param1:MouseEvent) : void
      {
         if(!_instance.visible)
         {
            return;
         }
         this.§_-81e§.visible = false;
         this.§_-hH§.visible = false;
         this.§_-87§.visible = false;
         this.§_-m2l§.visible = false;
         this.§_-nT§.visible = false;
      }
      
      private function §_-c15§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.X || !param1.ctrlKey)
         {
            return;
         }
         if(!_instance.visible || Game.chat.visible)
         {
            return;
         }
         this.§_-63h§(null);
      }
      
      private function §_-E2L§(param1:KeyboardEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:§_-11d§ = null;
         if(!_instance.visible || Game.chat.visible)
         {
            return;
         }
         for(_loc2_ in this.§_-Z2L§)
         {
            if(this.§_-Z2L§[_loc2_] == param1.keyCode)
            {
               _loc3_ = _loc2_ as §_-11d§;
               if(!(!_loc3_ || !_loc3_.mouseEnabled || !_loc3_.visible))
               {
                  _loc3_.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                  return;
               }
            }
         }
      }
      
      private function §_-i2m§(param1:MouseEvent) : void
      {
         if(!hero || !hero.isHare || hero.isDead)
         {
            return;
         }
         hero.§_-73j§(Hero.§_-YX§);
         if(§_-t2c§.active is §_-u24§)
         {
            hero.sendLocation(Keyboard.F1);
         }
      }
      
      private function §_-22v§(param1:Event = null) : void
      {
         §_-i2z§ = (GameMap.§_-O19§ - §_-Zy§.§_-21V§) * 0.5;
         §_-X1y§ = GameMap.§_-Gd§ - 79;
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonsArray.length)
         {
            if(this.§_-Q2t§[this.buttonsArray[_loc2_]] != null)
            {
               (this.§_-Q2t§[this.buttonsArray[_loc2_]] as §_-K1y§).setPosition(§_-i2z§ + this.buttonsArray[_loc2_].x + (this.buttonsArray[_loc2_].width - this.§_-Q2t§[this.buttonsArray[_loc2_]].width) * 0.5,§_-X1y§);
            }
            _loc2_++;
         }
      }
   }
}

