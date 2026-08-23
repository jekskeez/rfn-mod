package game.mainGame
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-61C§.§_-a2p§;
   import §_-8Q§.BalloonBody;
   import §_-8Q§.GameBody;
   import §_-8Q§.§_-B1l§;
   import §_-F5§.BodyDestructor;
   import §_-F5§.Hammer;
   import §_-F5§.§_-63c§;
   import §_-F5§.§_-Q1r§;
   import §_-F5§.§_-QT§;
   import §_-F5§.§_-Y1d§;
   import §_-F5§.§_-k2D§;
   import §_-G2y§.ControllerHeroLocal;
   import §_-I2Y§.§_-l2r§;
   import §_-M16§.§_-02Z§;
   import §_-M16§.§_-910§;
   import §_-M16§.§_-M1u§;
   import §_-M16§.§_-P2i§;
   import §_-M16§.§_-X1G§;
   import §_-M16§.§_-Z26§;
   import §_-M16§.§_-bf§;
   import §_-M16§.§_-l15§;
   import §_-M16§.§_-l1g§;
   import §_-M16§.§_-o27§;
   import §_-Q2§.§_-23N§;
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import §_-X2V§.CastEvent;
   import §_-c2C§.§_-817§;
   import §_-cm§.§_-V1t§;
   import §_-f1T§.Event;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import §_-w2b§.§_-03b§;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.ui.Mouse;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-e2t§;
   import game.mainGame.entity.§_-f1§;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-sn§;
   import game.mainGame.entity.§_-xn§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import starling.core.Starling;
   import utils.§_-d1t§;
   import utils.§_-v2E§;
   
   public class Cast extends §_-aS§ implements §_-F1c§
   {
      
      public static const §_-LB§:int = 222;
      
      public static const §_-83U§:String = "cancel";
      
      public static const §_-W2K§:String = "stop";
      
      public static const §_-Ar§:String = "complete";
      
      public static const §_-y2s§:String = "drop";
      
      private static const §_-u10§:int = 700;
      
      private static const §_-hq§:Number = 5;
      
      private static var _instance:Cast;
      
      public static const §_-t2E§:Array = [§_-910§,§_-l15§,§_-P2i§,§_-bf§,§_-02Z§,§_-M1u§,§_-Z26§,§_-o27§];
      
      public static const §_-H14§:Array = ["C","V","B","N","M",",",".","/"];
      
      private static const §_-V1g§:Number = 10 * Game.D2R;
      
      public var §_-B3c§:Number = 111;
      
      public var §_-01c§:Number = 111;
      
      protected var §_-H2A§:Vector.<Function> = new Vector.<Function>();
      
      protected var §_-sp§:Number = 111;
      
      protected var §_-kH§:§_-R13§ = null;
      
      protected var object:§_-xn§;
      
      protected var timer:Timer = new Timer(§_-u10§,1);
      
      protected var game:SquirrelGame;
      
      protected var §_-03t§:§_-X1G§;
      
      protected var §_-o2U§:int = -1;
      
      protected var §_-Q25§:Boolean = false;
      
      protected var aimCursor:§_-aS§ = new §_-aS§(new AimCursor());
      
      private var §_-ES§:Number = 0;
      
      private var §_-H27§:Number = NaN;
      
      private var §_-M1j§:Number = 0;
      
      private var §_-92j§:Boolean = false;
      
      private var §_-D2W§:Number = 700;
      
      private var §_-k1P§:Number = NaN;
      
      private var §_-O2H§:Number = 0;
      
      protected var §_-O1F§:Boolean = false;
      
      protected var §_-52Z§:Boolean = false;
      
      protected var §_-Kj§:Boolean = false;
      
      protected var §_-uO§:Boolean = false;
      
      protected var §_-f1Q§:Boolean = false;
      
      private var §_-5b§:Point = new Point();
      
      private var §_-j1I§:Point = new Point();
      
      private var §_-L2U§:Point;
      
      private var §_-z1n§:Boolean = false;
      
      private var §_-cU§:§_-03b§;
      
      public function Cast(param1:SquirrelGame)
      {
         super();
         §_-p2U§.add("Cast.Cast");
         §_-d1t§.§_-B12§(this);
         _instance = this;
         this.game = param1;
         this.timer = new Timer(§_-u10§,1);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-Va§,false,0,true);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§,false,0,true);
         Game.stage.addEventListener(MouseEvent.MOUSE_WHEEL,this.§_-g1W§,false,0,true);
         §_-817§.instance.addEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         §_-817§.instance.addEventListener(§_-f1T§.Event.ENTER_FRAME,this.§_-A1X§);
         if(§_-Zy§.§_-e2k§)
         {
            this.§_-cU§ = new §_-03b§(this);
            this.getStarlingView().addChild(this.§_-cU§);
         }
         else
         {
            this.§_-kH§ = new §_-R13§();
            this.§_-kH§.§_-N1g§(§_-t2E§,§_-H14§);
            this.§_-kH§.visible = false;
            Starling.§_-n1s§.stage.addChild(this.§_-kH§.getStarlingView());
            §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-22v§);
            this.§_-22v§();
         }
      }
      
      public function round(param1:Array) : void
      {
         if(this.§_-kH§)
         {
            this.§_-kH§.§_-J20§();
         }
      }
      
      public function dispose() : void
      {
         _instance = null;
         this.aimCursor.removeFromParent();
         §_-p2U§.add("Cast.dispose");
         §_-d1t§.§_-xx§(this);
         if(§_-Zy§.§_-e2k§)
         {
            this.§_-cU§.remove();
         }
         Mouse.show();
         this.§_-H2A§ = null;
         this.castObject = null;
         this.timer = null;
         this.game = null;
         if(this.§_-kH§)
         {
            this.§_-kH§.§_-J20§();
            this.§_-kH§.dispose();
            this.§_-kH§.removeFromParent();
         }
         this.§_-KM§(false);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_WHEEL,this.§_-g1W§);
         §_-73Q§.removeEventListener(§_-73Q§.§_-J1D§,this.§_-22v§);
         §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         §_-817§.instance.removeEventListener(§_-f1T§.Event.ENTER_FRAME,this.§_-A1X§);
      }
      
      public function set §_-L1R§(param1:Number) : void
      {
         if(this.§_-sp§ == param1)
         {
            return;
         }
         this.§_-sp§ = param1;
         this.§_-m6§();
      }
      
      public function set §_-B3f§(param1:Number) : void
      {
         this.§_-H27§ = param1;
         this.§_-m6§();
      }
      
      public function get §_-B3f§() : Number
      {
         return this.§_-H27§;
      }
      
      public function set §_-Q1h§(param1:Number) : void
      {
         this.§_-M1j§ = param1;
         this.§_-m6§();
      }
      
      public function get §_-Q1h§() : Number
      {
         return this.§_-M1j§;
      }
      
      public function set §_-Q1I§(param1:Boolean) : void
      {
         this.§_-92j§ = param1;
         this.§_-m6§();
      }
      
      public function get §_-Q1I§() : Boolean
      {
         return this.§_-92j§;
      }
      
      public function get radius() : Number
      {
         if(Boolean(this.castObject) && this.castObject is §_-63c§)
         {
            return this.§_-01c§;
         }
         if(!isNaN(this.§_-H27§))
         {
            return this.§_-H27§;
         }
         if(this.§_-F2O§)
         {
            return this.§_-B3c§;
         }
         if(this.§_-92j§)
         {
            return 0;
         }
         return this.§_-L1R§;
      }
      
      public function get §_-L1R§() : Number
      {
         return this.§_-sp§ * (1 + this.§_-M1j§);
      }
      
      public function set §_-G2O§(param1:Number) : void
      {
         this.§_-D2W§ = param1;
         this.§_-f1E§();
      }
      
      public function get §_-G2O§() : Number
      {
         return this.timer ? this.timer.delay : 0;
      }
      
      public function set §_-g1h§(param1:Number) : void
      {
         this.§_-k1P§ = param1;
         this.§_-f1E§();
      }
      
      public function get §_-g1h§() : Number
      {
         return this.§_-k1P§;
      }
      
      public function set §_-C2I§(param1:Number) : void
      {
         this.§_-O2H§ = param1;
         this.§_-f1E§();
      }
      
      public function get §_-C2I§() : Number
      {
         return this.§_-O2H§;
      }
      
      public function set castObject(param1:§_-xn§) : void
      {
         var _loc2_:Function = null;
         var _loc3_:Point = null;
         if(this.§_-Q25§)
         {
            this.§_-t2Q§();
         }
         if(this.castObject == param1)
         {
            return;
         }
         if(!Hero.self && Boolean(param1))
         {
            return;
         }
         if(this.castObject)
         {
            for each(_loc2_ in this.§_-H2A§)
            {
               _loc2_(§_-y2s§);
            }
         }
         if(this.castObject is §_-Y1d§)
         {
            (this.castObject as §_-Y1d§).§_-23C§();
         }
         if(this.castObject is §_-sn§)
         {
            this.§_-G3§();
         }
         if(Boolean(this.castObject) && Boolean(this.castObject is §_-l2r§) && §_-U2E§(this.castObject as §_-51g§))
         {
            (this.castObject as §_-l2r§).dispose();
         }
         this.object = param1;
         this.§_-f1s§(param1);
         if(this.§_-03t§)
         {
            this.§_-03t§.dispose();
            this.§_-03t§ = null;
            this.§_-Wt§ = -1;
         }
         if(§_-Zy§.§_-e2k§ && (param1 == null || this.§_-S17§(param1)))
         {
            this.§_-cU§.§_-8t§();
         }
         else if(this.§_-kH§)
         {
            this.§_-kH§.visible = param1 != null;
            this.§_-kH§.§_-a2Z§ = this.§_-kH§.visible && (param1 is §_-e2t§ || param1 is BalloonBody);
         }
         if(param1)
         {
            this.§_-i1f§();
            if(§_-Zy§.§_-e2k§ && param1 is §_-xn§ && !this.§_-S17§(param1))
            {
               this.§_-cU§.§_-j2j§(param1,Hero.self);
            }
            if(param1 is §_-51g§)
            {
               §_-J2J§(param1 as §_-51g§);
            }
            if(param1 is GameBody)
            {
               (param1 as GameBody).§_-t2F§ = §_-u1O§.§_-eu§;
               (param1 as GameBody).playerId = Hero.§_-M1O§;
            }
            if(param1 is §_-Q1r§)
            {
               (param1 as §_-Q1r§).game = this.game;
            }
            if(param1 is §_-Y1d§)
            {
               (param1 as §_-Y1d§).cast = this;
               (param1 as §_-Y1d§).§_-52N§();
            }
            Hero.self.§_-S13§();
            if(param1 is §_-sn§)
            {
               if(Hero.self)
               {
                  if(Hero.self.heroView.circle)
                  {
                     Hero.self.heroView.circle.visible = false;
                  }
                  param1.position = this.§_-Mx§();
               }
               Mouse.hide();
               this.aimCursor = (this.castObject as §_-sn§).aimCursor;
               this.aimCursor.§_-i18§(this.castObject is §_-f1§ ? "center" : "left","center");
               §_-J2J§(this.aimCursor);
               this.§_-Nc§(this.§_-5b§);
               if(param1 is §_-51g§)
               {
                  §_-J2J§(param1 as §_-51g§);
               }
               this.§_-O1F§ = true;
            }
            else if(!§_-Zy§.§_-e2k§ || this.§_-S17§(param1))
            {
               _loc3_ = §_-Zy§.§_-e2k§ ? new Point(this.§_-5b§.x,this.§_-5b§.y) : globalToLocal(new Point(Game.stage.mouseX,Game.stage.mouseY));
               param1.position = new b2Vec2(_loc3_.x / Game.§_-12A§,_loc3_.y / Game.§_-12A§);
               this.§_-52Z§ = true;
               this.§_-f1Q§ = true;
            }
            this.§_-uO§ = !§_-Zy§.§_-e2k§ || this.§_-S17§(param1);
         }
         else
         {
            if(Hero.self)
            {
               Hero.self.§_-NI§();
            }
            this.§_-G3§();
            this.§_-O1F§ = false;
            this.§_-52Z§ = false;
            this.§_-uO§ = false;
            this.§_-f1Q§ = false;
         }
         this.§_-Kj§ = false;
         if(!(param1 is §_-sn§) && (!§_-Zy§.§_-e2k§ || this.§_-S17§(param1)))
         {
            this.§_-63A§(this.§_-5b§);
         }
      }
      
      public function §_-w1m§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage);
         if(!_loc2_)
         {
            return;
         }
         if(this.§_-Q25§)
         {
            if(_loc2_.§_-iR§ == §_-01Z§.§_-kg§)
            {
               this.§_-63O§(_loc2_);
            }
            else if(_loc2_.§_-iR§ == §_-01Z§.§_-1Z§)
            {
               this.§_-yv§();
            }
            return;
         }
         this.§_-63O§(_loc2_);
         if(_loc2_.§_-iR§ != §_-01Z§.§_-N1v§ || !this.§_-uO§)
         {
            return;
         }
         if(this.castObject is §_-L1Q§)
         {
            (this.castObject as §_-L1Q§).§_-n1o§(_loc2_);
         }
         if(this.castObject is §_-sn§)
         {
            this.§_-Nc§(this.§_-5b§);
         }
         this.§_-03o§();
      }
      
      public function get castObject() : §_-xn§
      {
         return this.object;
      }
      
      public function §_-ff§(param1:CastEvent) : void
      {
         var _loc3_:§_-v1N§ = null;
         var _loc2_:Class = param1.§_-P1Y§ is Class ? param1.§_-P1Y§ : §_-f1b§.§_-N1m§(param1.§_-P1Y§) as Class;
         if(!_loc2_)
         {
            return;
         }
         if(Hero.self.isDragon || Hero.self.isHare)
         {
            return;
         }
         if(this.castObject is _loc2_)
         {
            if(this.castObject is §_-f1§ && Hero.self is §_-V1t§)
            {
               return;
            }
            this.§_-A1k§();
            return;
         }
         if(Hero.self is §_-V1t§)
         {
            _loc3_ = Hero.self.§_-h1z§.§_-815§(_loc2_,§_-v1N§.§_-W29§);
            if(!_loc3_ || _loc3_.count <= 0)
            {
               return;
            }
         }
         this.castObject = new _loc2_();
      }
      
      public function update(param1:Number = 0) : void
      {
         this.§_-m6§();
         if(!this.castObject)
         {
            return;
         }
         if(Boolean(Hero.self) && !Hero.§_-Cg§)
         {
            if(this.§_-Q25§)
            {
               this.§_-t2Q§();
            }
            this.§_-A1k§();
            Hero.self.§_-NI§();
            return;
         }
         if(!Hero.self && §_-U2E§(this.aimCursor))
         {
            this.§_-G3§();
         }
         this.§_-F1h§();
         if(Boolean(this.§_-03t§) && !this.§_-Q25§)
         {
            this.§_-03t§.update(param1);
         }
         if(this.castObject is §_-F1c§ && (!this.§_-Q25§ || this.castObject is §_-63c§))
         {
            (this.castObject as §_-F1c§).update(param1);
         }
         if(this.castObject is §_-sn§)
         {
            this.§_-Nc§(this.§_-5b§);
         }
         if(Boolean(this.timer) && Boolean(this.timer.running) && !this.§_-q1G§())
         {
            this.§_-t2Q§();
         }
         this.§_-w2l§();
         if(§_-Zy§.§_-e2k§)
         {
            this.§_-cU§.§_-N§();
         }
      }
      
      public function listen(param1:Function) : void
      {
         var _loc2_:int = this.§_-H2A§.indexOf(param1);
         if(_loc2_ != -1)
         {
            return;
         }
         this.§_-H2A§.push(param1);
      }
      
      public function forget(param1:Function) : void
      {
         var _loc2_:int = this.§_-H2A§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         this.§_-H2A§.splice(_loc2_,1);
      }
      
      public function §_-03o§() : Boolean
      {
         if(!Game.toggle)
         {
            var _loc1_:§_-l1g§ = null;
            var _loc2_:GameBody = null;
            var _loc3_:Point = null;
            var _loc4_:Point = null;
            var _loc5_:Number = NaN;
            if(this.§_-Q25§ || !this.§_-q1G§() || !this.castObject)
            {
               return false;
            }
            if(Boolean(this.castObject is §_-sn§) && Boolean(this.game) && !this.game.§_-M6§())
            {
               return false;
            }
            if(this.castObject is BodyDestructor && !(this.castObject as BodyDestructor).§_-T1V§)
            {
               return false;
            }
            if(this.castObject is Hammer && !(this.castObject as Hammer).§_-T1V§)
            {
               return false;
            }
            if(this.castObject is §_-63c§)
            {
               _loc1_ = (this.castObject as §_-63c§).§_-B2e§;
               if(!_loc1_)
               {
                  return false;
               }
               _loc2_ = _loc1_.body;
               if(!_loc2_)
               {
                  return false;
               }
               if(0 != 0)
               {
                  _loc3_ = Hero.self.§_-h2j§();
                  _loc4_ = Hero.self.globalToLocal(_loc1_.localToGlobal(new Point(0,0))).add(new Point(Hero.self.x,Hero.self.y));
                  _loc5_ = _loc3_.add(new Point(0,0)).subtract(_loc4_).length;
                  if(_loc5_ >= 0)
                  {
                     return false;
                  }
               }
            }
            this.§_-KM§(true);
            this.§_-uO§ = false;
            §_-a2p§.§_-Y1F§();
            if(this.castObject is §_-Q1r§)
            {
               (this.castObject as §_-Q1r§).§_-03o§();
            }
            if(this.§_-03t§ is §_-Q1r§)
            {
               (this.§_-03t§ as §_-Q1r§).§_-03o§();
            }
            if(!(this.castObject is §_-sn§))
            {
               this.§_-52Z§ = false;
               this.§_-f1Q§ = false;
            }
            if(this.castObject is §_-63c§)
            {
               Hero.self.§_-Ed§(0);
               (this.castObject as §_-63c§).§_-P1X§ = Hero.self;
               return true;
            }
            ControllerHeroLocal.§_-11C§();
            this.timer.reset();
            Hero.self.§_-Ed§(this.§_-G2O§);
            if(this.castObject is §_-k2D§)
            {
               this.§_-Kj§ = true;
               if(this.castObject is §_-51g§ && Boolean((this.castObject as §_-51g§).parentStarling))
               {
                  (this.castObject as §_-51g§).parentStarling.removeChildStarling(this.castObject as §_-51g§);
               }
               return true;
            }
            if(this.§_-G2O§ == 0)
            {
               setTimeout(this.§_-Va§,0,null);
               return true;
            }
            this.§_-S1W§();
            this.timer.start();
            if(this.§_-z1n§)
            {
               this.§_-Va§();
            }
            return true;
         }
         _loc1_ = null;
         _loc2_ = null;
         _loc3_ = null;
         _loc4_ = null;
         _loc5_ = NaN;
         if(this.§_-Q25§ || !this.§_-q1G§() || !this.castObject)
         {
            return false;
         }
         if(Boolean(this.castObject is §_-sn§) && Boolean(this.game) && !this.game.§_-M6§())
         {
            return false;
         }
         if(this.castObject is BodyDestructor && !(this.castObject as BodyDestructor).§_-T1V§)
         {
            return false;
         }
         if(this.castObject is Hammer && !(this.castObject as Hammer).§_-T1V§)
         {
            return false;
         }
         if(this.castObject is §_-63c§)
         {
            _loc1_ = (this.castObject as §_-63c§).§_-B2e§;
            if(!_loc1_)
            {
               return false;
            }
            _loc2_ = _loc1_.body;
            if(!_loc2_)
            {
               return false;
            }
            if(this.radius != 0)
            {
               _loc3_ = Hero.self.§_-h2j§();
               _loc4_ = Hero.self.globalToLocal(_loc1_.localToGlobal(new Point(0,0))).add(new Point(Hero.self.x,Hero.self.y));
               _loc5_ = _loc3_.add(new Point(this.radius,this.radius)).subtract(_loc4_).length;
               if(_loc5_ >= this.radius)
               {
                  return false;
               }
            }
         }
         this.§_-KM§(true);
         this.§_-uO§ = false;
         §_-a2p§.§_-Y1F§();
         if(this.castObject is §_-Q1r§)
         {
            (this.castObject as §_-Q1r§).§_-03o§();
         }
         if(this.§_-03t§ is §_-Q1r§)
         {
            (this.§_-03t§ as §_-Q1r§).§_-03o§();
         }
         if(!(this.castObject is §_-sn§))
         {
            this.§_-52Z§ = false;
            this.§_-f1Q§ = false;
         }
         if(this.castObject is §_-63c§)
         {
            Hero.self.§_-Ed§(0);
            (this.castObject as §_-63c§).§_-P1X§ = Hero.self;
            return true;
         }
         ControllerHeroLocal.§_-11C§();
         this.timer.reset();
         Hero.self.§_-Ed§(this.§_-G2O§);
         if(this.castObject is §_-k2D§)
         {
            this.§_-Kj§ = true;
            if(this.castObject is §_-51g§ && Boolean((this.castObject as §_-51g§).parentStarling))
            {
               (this.castObject as §_-51g§).parentStarling.removeChildStarling(this.castObject as §_-51g§);
            }
            return true;
         }
         if(this.§_-G2O§ == 0)
         {
            setTimeout(this.§_-Va§,0,null);
            return true;
         }
         this.§_-S1W§();
         this.timer.start();
         if(this.§_-z1n§)
         {
            this.§_-Va§();
         }
         return true;
      }
      
      public function §_-t2Q§() : void
      {
         var _loc1_:Function = null;
         if(!this.§_-Q25§)
         {
            return;
         }
         this.§_-KM§(false);
         for each(_loc1_ in this.§_-H2A§)
         {
            _loc1_(§_-W2K§);
         }
         if(this.castObject is §_-Q1r§)
         {
            (this.castObject as §_-Q1r§).§_-t2Q§();
         }
         if(this.§_-03t§ is §_-Q1r§)
         {
            (this.§_-03t§ as §_-Q1r§).§_-t2Q§();
         }
         if(this.castObject is §_-sn§)
         {
            this.§_-O1F§ = true;
         }
         else if(!§_-Zy§.§_-e2k§ || this.§_-S17§(this.castObject))
         {
            this.§_-52Z§ = true;
            this.§_-f1Q§ = true;
         }
         if(!§_-Zy§.§_-e2k§ || this.§_-S17§(this.castObject))
         {
            this.§_-uO§ = true;
         }
         if(Hero.self)
         {
            Hero.self.§_-C2u§(false);
         }
         if(this.timer)
         {
            this.timer.stop();
         }
      }
      
      public function §_-A1k§(param1:String = "drop") : void
      {
         var _loc2_:Function = null;
         if(Boolean(this.timer) && this.timer.running)
         {
            return;
         }
         if(this.castObject)
         {
            for each(_loc2_ in this.§_-H2A§)
            {
               _loc2_(param1);
            }
            if(this.castObject is §_-Y1d§)
            {
               (this.castObject as §_-Y1d§).§_-23C§();
            }
            if(this.castObject is §_-l2r§)
            {
               (this.castObject as §_-l2r§).dispose();
            }
            if(§_-U2E§(this.castObject as §_-51g§))
            {
               removeChildStarling(this.castObject as §_-51g§);
            }
            this.castObject = null;
            if(§_-Zy§.§_-e2k§)
            {
               this.§_-cU§.§_-8t§();
            }
         }
         this.§_-G3§();
         if(this.§_-03t§)
         {
            if(this.§_-03t§ is §_-l2r§)
            {
               (this.§_-03t§ as §_-l2r§).dispose();
            }
            if(§_-U2E§(this.§_-03t§ as §_-51g§))
            {
               removeChildStarling(this.§_-03t§ as §_-51g§);
            }
            this.§_-o2U§ = -1;
            this.§_-03t§ = null;
         }
      }
      
      public function §_-f23§(param1:Class) : void
      {
         if(this.castObject is BalloonBody && param1 == §_-910§)
         {
            (this.castObject as BalloonBody).§_-e2y§ = !(this.castObject as BalloonBody).§_-e2y§;
            return;
         }
         if(!this.§_-S2B§(param1))
         {
            return;
         }
         if(!this.castObject || !(this.castObject is §_-e2t§))
         {
            return;
         }
         var _loc2_:Boolean = getQualifiedClassName(this.§_-03t§) != getQualifiedClassName(param1);
         if(_loc2_)
         {
            if(this.§_-03t§ != null)
            {
               this.§_-03t§.dispose();
            }
            this.§_-03t§ = new param1();
            this.§_-03t§.world = this.game.world;
            this.§_-Wt§ = this.§_-Wt§;
            if(this.§_-Wt§ == -1)
            {
               this.§_-Wt§ = 0;
            }
         }
         else
         {
            ++this.§_-Wt§;
         }
         if(Boolean(this.§_-03t§) && Boolean(this.castObject))
         {
            this.§_-03t§.body = this.castObject as GameBody;
         }
      }
      
      public function §_-i1f§() : void
      {
         var _loc1_:Array = this.§_-F1P§;
         if(§_-Zy§.§_-e2k§)
         {
            this.§_-cU§.§_-c17§ = this.castObject is GameBody;
            this.§_-cU§.§_-Z2X§ = this.§_-cU§.§_-c17§ && (this.castObject as GameBody).ghost;
            this.§_-cU§.§_-F1P§(_loc1_[0]);
         }
         else if(this.§_-kH§)
         {
            this.§_-kH§.§_-c17§ = this.castObject is GameBody;
            this.§_-kH§.§_-Z2X§ = this.§_-kH§.§_-c17§ && (this.castObject as GameBody).ghost;
            this.§_-kH§.§_-N1g§(_loc1_[0],_loc1_[1]);
         }
      }
      
      public function §_-u1t§() : void
      {
         if(!this.castObject || !(this.castObject is GameBody))
         {
            return;
         }
         (this.castObject as GameBody).ghost = !(this.castObject as GameBody).ghost;
         this.§_-i1f§();
      }
      
      protected function §_-Mx§() : b2Vec2
      {
         return Hero.self ? Hero.self.position.Copy() : null;
      }
      
      protected function §_-63A§(param1:Point) : void
      {
         if(!this.castObject)
         {
            return;
         }
         var _loc2_:b2Vec2 = new b2Vec2(param1.x / Game.§_-12A§,param1.y / Game.§_-12A§);
         this.§_-F1h§();
         this.castObject.position = _loc2_;
         this.§_-w2l§();
      }
      
      protected function §_-73S§(param1:KeyboardEvent) : void
      {
         if(this.§_-Q25§)
         {
            return;
         }
         var _loc2_:int = int(param1.keyCode);
         switch(_loc2_)
         {
            case Keyboard.ESCAPE:
            case Keyboard.DELETE:
               this.§_-A1k§(§_-83U§);
               break;
            case Keyboard.Q:
            case Keyboard.E:
               if(!this.castObject)
               {
                  break;
               }
               this.castObject.angle += §_-V1g§ * ((_loc2_ == Keyboard.Q ? -1 : 0) + (_loc2_ == Keyboard.E ? 1 : 0));
               break;
            case Keyboard.Z:
               this.§_-u1t§();
               break;
            case Keyboard.C:
               this.§_-f23§(§_-910§);
               break;
            case Keyboard.V:
               this.§_-f23§(§_-l15§);
               break;
            case Keyboard.B:
               this.§_-f23§(§_-P2i§);
               break;
            case Keyboard.N:
               this.§_-f23§(§_-bf§);
               break;
            case Keyboard.M:
               this.§_-f23§(§_-02Z§);
               break;
            case Keyboard.COMMA:
               this.§_-f23§(§_-M1u§);
               break;
            case Keyboard.PERIOD:
               this.§_-f23§(§_-Z26§);
               break;
            case Keyboard.SLASH:
               this.§_-f23§(§_-o27§);
         }
      }
      
      protected function get §_-Wt§() : int
      {
         return this.§_-o2U§;
      }
      
      protected function set §_-Wt§(param1:int) : void
      {
         if(!this.castObject)
         {
            return;
         }
         this.§_-o2U§ = param1;
         if(this.castObject is §_-e2t§ && this.§_-o2U§ >= (this.castObject as §_-e2t§).pinPositions.length)
         {
            this.§_-o2U§ = -1;
            this.§_-03t§.dispose();
            this.§_-03t§ = null;
         }
         if(Boolean(this.§_-03t§) && this.§_-o2U§ > -1)
         {
            this.§_-03t§.position = (this.castObject as §_-e2t§).pinPositions[this.§_-o2U§];
         }
      }
      
      protected function §_-g1W§(param1:MouseEvent) : void
      {
         if(!this.§_-f1Q§ || !this.castObject)
         {
            return;
         }
         this.castObject.angle += param1.delta * 2 * Game.D2R;
      }
      
      protected function §_-Va§(param1:TimerEvent = null) : void
      {
         var _loc2_:Function = null;
         this.§_-KM§(false);
         for each(_loc2_ in this.§_-H2A§)
         {
            _loc2_(§_-Ar§);
         }
         if(this.castObject is §_-Q1r§)
         {
            (this.castObject as §_-Q1r§).§_-Va§();
         }
         if(this.§_-03t§ is §_-Q1r§)
         {
            (this.§_-03t§ as §_-Q1r§).§_-Va§();
         }
         if(this.castObject is §_-Y1d§)
         {
            (this.castObject as §_-Y1d§).§_-23C§();
         }
         if(!this.castObject)
         {
            return;
         }
         GameSounds.§_-C1K§(this.castObject);
         if(§_-Zy§.§_-e2k§)
         {
            this.§_-cU§.§_-8t§();
         }
         this.§_-w2B§();
         this.§_-03t§ = null;
         this.castObject = null;
         this.§_-o2U§ = -1;
         Hero.self.§_-C2u§(true);
      }
      
      protected function §_-d1H§(param1:flash.events.Event = null) : void
      {
         if(!this.§_-Q25§)
         {
            return;
         }
         this.§_-KM§(false);
         if(this.castObject is §_-Y1d§)
         {
            (this.castObject as §_-Y1d§).§_-23C§();
         }
         this.§_-Kj§ = false;
         if(!this.castObject)
         {
            return;
         }
         GameSounds.§_-C1K§(this.castObject);
         this.castObject = null;
         Hero.self.§_-C2u§(true);
      }
      
      protected function §_-w2B§() : void
      {
         removeChildStarling(this.castObject as §_-51g§,false);
         this.game.map.add(this.castObject);
         this.castObject.build(this.game.world);
         if(this.§_-03t§)
         {
            this.game.map.add(this.§_-03t§);
            this.§_-03t§.build(this.game.world);
         }
      }
      
      protected function §_-q1G§() : Boolean
      {
         if(!Game.toggle)
         {
            var _loc5_:§_-QT§ = null;
            if(!Hero.self)
            {
               return false;
            }
            if(this.castObject is §_-sn§)
            {
               return true;
            }
            if(0 == 0)
            {
               return true;
            }
            if(!Hero.self.§_-h2j§())
            {
               return false;
            }
            var _loc1_:Point = Hero.self.§_-h2j§();
            if(!this.castObject || !this.castObject.position)
            {
               return false;
            }
            var _loc2_:Point = new Point(this.castObject.position.x * Game.§_-12A§,this.castObject.position.y * Game.§_-12A§);
            var _loc3_:Number = _loc1_.add(new Point(0,0)).subtract(_loc2_).length;
            if(_loc3_ < 0)
            {
               return true;
            }
            var _loc4_:Array = this.game.map.get(§_-QT§,true);
            if(_loc4_.length == 0 || this.castObject is §_-B1l§)
            {
               return false;
            }
            for each(_loc5_ in _loc4_)
            {
               if(!(!(_loc5_ as §_-51g§).parentStarling || _loc5_.playerId != Hero.§_-M1O§ || !_loc5_.§_-q1G§(localToGlobal(_loc2_))))
               {
                  return true;
               }
            }
            return false;
         }
         _loc5_ = null;
         if(!Hero.self)
         {
            return false;
         }
         if(this.castObject is §_-sn§)
         {
            return true;
         }
         if(this.radius == 0)
         {
            return true;
         }
         if(!Hero.self.§_-h2j§())
         {
            return false;
         }
         _loc1_ = Hero.self.§_-h2j§();
         if(!this.castObject || !this.castObject.position)
         {
            return false;
         }
         _loc2_ = new Point(this.castObject.position.x * Game.§_-12A§,this.castObject.position.y * Game.§_-12A§);
         _loc3_ = _loc1_.add(new Point(this.radius,this.radius)).subtract(_loc2_).length;
         if(_loc3_ < this.radius)
         {
            return true;
         }
         _loc4_ = this.game.map.get(§_-QT§,true);
         if(_loc4_.length == 0 || this.castObject is §_-B1l§)
         {
            return false;
         }
         for each(_loc5_ in _loc4_)
         {
            if(!(!(_loc5_ as §_-51g§).parentStarling || _loc5_.playerId != Hero.§_-M1O§ || !_loc5_.§_-q1G§(localToGlobal(_loc2_))))
            {
               return true;
            }
         }
         return false;
      }
      
      protected function §_-P0§() : void
      {
         var _loc1_:§_-xn§ = (this.castObject as §_-k2D§).clone();
         this.game.map.add(_loc1_);
         _loc1_.build(this.game.world);
      }
      
      protected function §_-S1W§() : void
      {
         GameSounds.play("shaman_spell");
      }
      
      private function §_-Nc§(param1:Point) : void
      {
         if(!param1 || !this.castObject || this.§_-Q25§ || !Hero.self || !(this.castObject is §_-sn§))
         {
            return;
         }
         var _loc2_:Point = globalToLocal(new Point(param1.x,param1.y));
         var _loc3_:b2Vec2 = new b2Vec2(_loc2_.x / Game.§_-12A§,_loc2_.y / Game.§_-12A§);
         var _loc4_:Number = Math.atan2(_loc3_.y - Hero.self.position.y,_loc3_.x - Hero.self.position.x);
         this.castObject.angle = _loc4_;
         this.castObject.position = this.§_-Mx§();
         (this.castObject as §_-sn§).§_-a2l§(_loc2_);
         (this.castObject as GameBody).linearVelocity = new b2Vec2(Math.cos(_loc4_) * (this.castObject as §_-sn§).maxVelocity,Math.sin(_loc4_) * (this.castObject as §_-sn§).maxVelocity);
         this.§_-F1h§();
         var _loc5_:Boolean = Boolean(this.game) && this.game.§_-M6§();
         if(!_loc5_ && this.aimCursor.visible)
         {
            this.aimCursor.visible = false;
            Mouse.show();
         }
         else if(_loc5_ && !this.aimCursor.visible)
         {
            this.aimCursor.visible = true;
            Mouse.hide();
         }
      }
      
      private function get §_-F1P§() : Array
      {
         var _loc3_:Class = null;
         var _loc1_:Array = [[],[]];
         if(this.castObject is BalloonBody)
         {
            return [[§_-t2E§[0]],[§_-H14§[0]]];
         }
         var _loc2_:int = 0;
         for each(_loc3_ in §_-t2E§)
         {
            if(this.§_-S2B§(_loc3_))
            {
               _loc1_[0].push(§_-t2E§[_loc2_]);
               _loc1_[1].push(§_-H14§[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function §_-S2B§(param1:Class) : Boolean
      {
         if(§_-v2E§.§_-H23§(param1,"ISaveInvert"))
         {
            return this.game.map.§_-d14§.indexOf(§_-f1b§.§_-q2W§(param1)) == -1;
         }
         return this.game.map.§_-d14§.indexOf(§_-f1b§.§_-q2W§(param1)) != -1;
      }
      
      private function §_-w2l§() : void
      {
         if(!Game.toggle)
         {
            if(!(this.castObject is §_-63c§) || !this.§_-Q25§ || !Hero.self)
            {
               return;
            }
            var _loc1_:Point = new Point(this.§_-5b§.x,this.§_-5b§.y);
            var _loc2_:b2Vec2 = new b2Vec2(_loc1_.x / Game.§_-12A§,_loc1_.y / Game.§_-12A§);
            var _loc3_:b2Vec2 = b2Math.SubtractVV(Hero.self.position,_loc2_);
            var _loc4_:Number = 0 / Game.§_-12A§;
            if(_loc3_.Length() > _loc4_ && _loc4_ > 0)
            {
               _loc3_.Normalize();
               _loc3_.Multiply(-_loc4_);
               _loc3_.Add(Hero.self.position);
               _loc2_ = _loc3_;
            }
            this.castObject.position = _loc2_;
            return;
         }
         if(!(this.castObject is §_-63c§) || !this.§_-Q25§ || !Hero.self)
         {
            return;
         }
         _loc1_ = new Point(this.§_-5b§.x,this.§_-5b§.y);
         _loc2_ = new b2Vec2(_loc1_.x / Game.§_-12A§,_loc1_.y / Game.§_-12A§);
         _loc3_ = b2Math.SubtractVV(Hero.self.position,_loc2_);
         _loc4_ = this.radius / Game.§_-12A§;
         if(_loc3_.Length() > _loc4_ && _loc4_ > 0)
         {
            _loc3_.Normalize();
            _loc3_.Multiply(-_loc4_);
            _loc3_.Add(Hero.self.position);
            _loc2_ = _loc3_;
         }
         this.castObject.position = _loc2_;
      }
      
      private function §_-F1h§() : void
      {
         if(!(this.castObject is §_-51g§))
         {
            return;
         }
         var _loc1_:Boolean = this.castObject is GameBody && GameBody(this.castObject).ghost;
         (this.castObject as §_-51g§).alpha = _loc1_ || !this.§_-q1G§() ? 0.5 : 1;
      }
      
      private function get §_-F2O§() : Boolean
      {
         return Boolean(Hero.self) && Hero.self.heroView.running && Hero.self.§_-Uz§;
      }
      
      private function §_-m6§() : void
      {
         if(!Game.toggle)
         {
            var _loc1_:Number = 0;
            if(_loc1_ == this.§_-ES§)
            {
               return;
            }
            this.§_-ES§ = _loc1_;
            if(!Hero.self || !Hero.self.heroView.circle)
            {
               return;
            }
            Hero.self.heroView.circle.visible = (this.castObject != null || !Hero.self.§_-62v§) && this.§_-ES§ != 0;
            if(this.§_-ES§ == 0)
            {
               return;
            }
            Hero.self.§_-gz§(this.§_-ES§ * 2);
            return;
         }
         _loc1_ = this.radius;
         if(_loc1_ == this.§_-ES§)
         {
            return;
         }
         this.§_-ES§ = _loc1_;
         if(!Hero.self || !Hero.self.heroView.circle)
         {
            return;
         }
         Hero.self.heroView.circle.visible = (this.castObject != null || !Hero.self.§_-62v§) && this.§_-ES§ != 0;
         if(this.§_-ES§ == 0)
         {
            return;
         }
         Hero.self.§_-gz§(this.§_-ES§ * 2);
      }
      
      private function §_-f1E§() : void
      {
         var _loc1_:Number = !isNaN(this.§_-k1P§) ? this.§_-k1P§ : this.§_-D2W§ * (1 - this.§_-O2H§);
         this.§_-z1n§ = _loc1_ == 0;
         if(!this.timer)
         {
            return;
         }
         this.timer.reset();
         this.timer.delay = _loc1_;
      }
      
      private function §_-G3§() : void
      {
         if(!§_-U2E§(this.aimCursor))
         {
            return;
         }
         removeChildStarling(this.aimCursor,false);
         Mouse.show();
      }
      
      private function §_-f1s§(param1:§_-xn§) : void
      {
         var _loc2_:Class = §_-f1b§.§_-N1m§(§_-f1b§.§_-q2W§(param1));
         if(!_loc2_)
         {
            §_-a2p§.§_-l16§();
            return;
         }
         §_-a2p§.§_-xq§(_loc2_);
      }
      
      private function §_-S17§(param1:§_-xn§) : Boolean
      {
         return param1 is §_-sn§ || param1 is §_-k2D§ || param1 is §_-63c§ || param1 is Hammer;
      }
      
      private function §_-63O§(param1:§_-J1a§) : void
      {
         this.§_-j1I§.setTo(Game.stage.mouseX,Game.stage.mouseY);
         this.§_-5b§ = this.castObject is §_-sn§ ? param1.§_-13l§(§_-817§.instance) : globalToLocal(this.§_-j1I§);
         this.§_-L2U§ = this.castObject is §_-k2D§ ? §_-817§.instance.globalToLocal(this.§_-j1I§) : this.§_-5b§;
      }
      
      private function §_-KM§(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.§_-Q25§)
            {
               return;
            }
            this.§_-Q25§ = true;
            Game.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-W1b§,false,0,true);
            Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-W1b§,false,0,true);
            return;
         }
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-W1b§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-W1b§);
         this.§_-Q25§ = false;
      }
      
      private function §_-yv§() : void
      {
         if(this.castObject is §_-k2D§)
         {
            this.§_-d1H§(null);
         }
         else
         {
            this.§_-t2Q§();
         }
      }
      
      private function §_-W1b§(param1:MouseEvent) : void
      {
         if(!this.§_-Q25§ || param1.type == MouseEvent.MOUSE_MOVE && param1.buttonDown)
         {
            return;
         }
         this.§_-yv§();
      }
      
      private function §_-AU§(param1:Point) : void
      {
         if(!param1 || !(this.castObject is §_-k2D§))
         {
            return;
         }
         var _loc2_:Point = globalToLocal(param1);
         var _loc3_:b2Vec2 = new b2Vec2(_loc2_.x / Game.§_-12A§,_loc2_.y / Game.§_-12A§);
         this.castObject.position = _loc3_;
         if(!this.§_-q1G§() || !(this.castObject as §_-k2D§).§_-q1G§())
         {
            return;
         }
         this.§_-P0§();
      }
      
      private function §_-A1X§(param1:§_-f1T§.Event) : void
      {
         if(!Game.toggle)
         {
            if(this.castObject is §_-23N§)
            {
               if(this.§_-Kj§)
               {
                  if(this.§_-L2U§ != null)
                  {
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     this.§_-AU§(this.§_-L2U§);
                     return;
                  }
               }
            }
         }
         if(this.§_-L2U§ == null)
         {
            return;
         }
         if(this.§_-52Z§)
         {
            this.§_-63A§(this.§_-5b§);
         }
         if(this.§_-O1F§)
         {
            this.§_-Nc§(this.§_-5b§);
         }
         if(this.§_-Kj§)
         {
            this.§_-AU§(this.§_-L2U§);
         }
         this.§_-L2U§ = null;
      }
      
      private function §_-22v§(param1:flash.events.Event = null) : void
      {
         if(!this.§_-kH§)
         {
            return;
         }
         this.§_-kH§.x = (Game.starling.stage.stageWidth - §_-Zy§.§_-21V§) * 0.5 + §_-hq§;
         this.§_-kH§.y = Game.starling.stage.stageHeight - 120;
      }
   }
}

