package game.mainGame
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-637§.BodyDestructor;
   import §_-637§.Hammer;
   import §_-637§.§_-627§;
   import §_-637§.§_-Ft§;
   import §_-637§.§_-J14§;
   import §_-637§.§_-cW§;
   import §_-637§.§_-p1L§;
   import §_-83V§.BalloonBody;
   import §_-83V§.GameBody;
   import §_-83V§.§_-k2I§;
   import §_-8I§.CastEvent;
   import §_-K2c§.Event;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import §_-Rn§.§_-Mb§;
   import §_-Rn§.§_-W1w§;
   import §_-Rn§.§_-X1D§;
   import §_-Rn§.§_-Xx§;
   import §_-Rn§.§_-as§;
   import §_-Rn§.§_-f1U§;
   import §_-Rn§.§_-k1G§;
   import §_-Rn§.§_-lT§;
   import §_-Rn§.§_-q1m§;
   import §_-Rn§.§_-s12§;
   import §_-S1D§.§_-O1M§;
   import §_-T1r§.§_-i1L§;
   import §_-T2y§.§_-s1i§;
   import §_-Y22§.§_-C2x§;
   import §_-b1B§.§_-x29§;
   import §_-bm§.§_-r1F§;
   import §_-s2l§.ControllerHeroLocal;
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
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-21e§;
   import game.mainGame.entity.§_-314§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-v1e§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import starling.core.Starling;
   import utils.§_-32G§;
   import utils.§_-vS§;
   
   public class Cast extends §_-h2I§ implements §_-Tm§
   {
      
      public static const §_-Cl§:int = 222;
      
      public static const §_-c27§:String = "cancel";
      
      public static const §_-P1N§:String = "stop";
      
      public static const §_-cg§:String = "complete";
      
      public static const §_-q1W§:String = "drop";
      
      private static const §_-W2E§:int = 700;
      
      private static const §_-R12§:Number = 5;
      
      private static var _instance:Cast;
      
      public static const §_-u2I§:Array = [§_-W1w§,§_-q1m§,§_-Mb§,§_-s12§,§_-Xx§,§_-k1G§,§_-X1D§,§_-lT§];
      
      public static const §_-c1b§:Array = ["C","V","B","N","M",",",".","/"];
      
      private static const §_-M1Y§:Number = 10 * Game.D2R;
      
      public var §_-zY§:Number = 111;
      
      public var §_-O1Q§:Number = 111;
      
      protected var §_-81x§:Vector.<Function> = new Vector.<Function>();
      
      protected var §_-sI§:Number = 111;
      
      protected var §_-n1Q§:§_-xt§ = null;
      
      protected var object:§_-63Q§;
      
      protected var timer:Timer = new Timer(§_-W2E§,1);
      
      protected var game:SquirrelGame;
      
      protected var §_-5q§:§_-f1U§;
      
      protected var §_-w1w§:int = -1;
      
      protected var §_-82s§:Boolean = false;
      
      protected var aimCursor:§_-h2I§ = new §_-h2I§(new AimCursor());
      
      private var §_-k1q§:Number = 0;
      
      private var §_-33n§:Number = NaN;
      
      private var §_-aF§:Number = 0;
      
      private var §_-s22§:Boolean = false;
      
      private var §_-Lt§:Number = 700;
      
      private var §_-x2z§:Number = NaN;
      
      private var §_-rD§:Number = 0;
      
      protected var §_-e1§:Boolean = false;
      
      protected var §_-W6§:Boolean = false;
      
      protected var §_-U1D§:Boolean = false;
      
      protected var §_-kd§:Boolean = false;
      
      protected var §_-81n§:Boolean = false;
      
      private var §_-Us§:Point = new Point();
      
      private var §_-C12§:Point = new Point();
      
      private var §_-b1m§:Point;
      
      private var §_-LV§:Boolean = false;
      
      private var §_-l1J§:§_-r1F§;
      
      public function Cast(param1:SquirrelGame)
      {
         super();
         §_-TQ§.add("Cast.Cast");
         §_-vS§.§_-41D§(this);
         _instance = this;
         this.game = param1;
         this.timer = new Timer(§_-W2E§,1);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-23§,false,0,true);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§,false,0,true);
         Game.stage.addEventListener(MouseEvent.MOUSE_WHEEL,this.§_-828§,false,0,true);
         §_-s1i§.instance.addEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         §_-s1i§.instance.addEventListener(§_-K2c§.Event.ENTER_FRAME,this.§_-L1Y§);
         if(§_-a9§.§_-O1z§)
         {
            this.§_-l1J§ = new §_-r1F§(this);
            this.getStarlingView().addChild(this.§_-l1J§);
         }
         else
         {
            this.§_-n1Q§ = new §_-xt§();
            this.§_-n1Q§.§_-Cw§(§_-u2I§,§_-c1b§);
            this.§_-n1Q§.visible = false;
            Starling.§_-y1l§.stage.addChild(this.§_-n1Q§.getStarlingView());
            §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-V1Q§);
            this.§_-V1Q§();
         }
      }
      
      public function round(param1:Array) : void
      {
         if(this.§_-n1Q§)
         {
            this.§_-n1Q§.§_-81W§();
         }
      }
      
      public function dispose() : void
      {
         _instance = null;
         this.aimCursor.removeFromParent();
         §_-TQ§.add("Cast.dispose");
         §_-vS§.§_-324§(this);
         if(§_-a9§.§_-O1z§)
         {
            this.§_-l1J§.remove();
         }
         Mouse.show();
         this.§_-81x§ = null;
         this.castObject = null;
         this.timer = null;
         this.game = null;
         if(this.§_-n1Q§)
         {
            this.§_-n1Q§.§_-81W§();
            this.§_-n1Q§.dispose();
            this.§_-n1Q§.removeFromParent();
         }
         this.§_-VM§(false);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_WHEEL,this.§_-828§);
         §_-K1r§.removeEventListener(§_-K1r§.§_-n2V§,this.§_-V1Q§);
         §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         §_-s1i§.instance.removeEventListener(§_-K2c§.Event.ENTER_FRAME,this.§_-L1Y§);
      }
      
      public function set §_-J1L§(param1:Number) : void
      {
         if(this.§_-sI§ == param1)
         {
            return;
         }
         this.§_-sI§ = param1;
         this.§_-s2B§();
      }
      
      public function set §_-R1d§(param1:Number) : void
      {
         this.§_-33n§ = param1;
         this.§_-s2B§();
      }
      
      public function get §_-R1d§() : Number
      {
         return this.§_-33n§;
      }
      
      public function set §_-ad§(param1:Number) : void
      {
         this.§_-aF§ = param1;
         this.§_-s2B§();
      }
      
      public function get §_-ad§() : Number
      {
         return this.§_-aF§;
      }
      
      public function set §_-T2l§(param1:Boolean) : void
      {
         this.§_-s22§ = param1;
         this.§_-s2B§();
      }
      
      public function get §_-T2l§() : Boolean
      {
         return this.§_-s22§;
      }
      
      public function get radius() : Number
      {
         if(Boolean(this.castObject) && this.castObject is §_-p1L§)
         {
            return this.§_-O1Q§;
         }
         if(!isNaN(this.§_-33n§))
         {
            return this.§_-33n§;
         }
         if(this.§_-Y2e§)
         {
            return this.§_-zY§;
         }
         if(this.§_-s22§)
         {
            return 0;
         }
         return this.§_-J1L§;
      }
      
      public function get §_-J1L§() : Number
      {
         return this.§_-sI§ * (1 + this.§_-aF§);
      }
      
      public function set §_-JG§(param1:Number) : void
      {
         this.§_-Lt§ = param1;
         this.§_-42N§();
      }
      
      public function get §_-JG§() : Number
      {
         return this.timer ? this.timer.delay : 0;
      }
      
      public function set §_-k1K§(param1:Number) : void
      {
         this.§_-x2z§ = param1;
         this.§_-42N§();
      }
      
      public function get §_-k1K§() : Number
      {
         return this.§_-x2z§;
      }
      
      public function set §_-Xb§(param1:Number) : void
      {
         this.§_-rD§ = param1;
         this.§_-42N§();
      }
      
      public function get §_-Xb§() : Number
      {
         return this.§_-rD§;
      }
      
      public function set castObject(param1:§_-63Q§) : void
      {
         var _loc2_:Function = null;
         var _loc3_:Point = null;
         if(this.§_-82s§)
         {
            this.§_-PS§();
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
            for each(_loc2_ in this.§_-81x§)
            {
               _loc2_(§_-q1W§);
            }
         }
         if(this.castObject is §_-Ft§)
         {
            (this.castObject as §_-Ft§).§_-b2q§();
         }
         if(this.castObject is §_-314§)
         {
            this.§_-iV§();
         }
         if(Boolean(this.castObject) && Boolean(this.castObject is §_-C2x§) && §_-ws§(this.castObject as §_-v2j§))
         {
            (this.castObject as §_-C2x§).dispose();
         }
         this.object = param1;
         this.§_-f1V§(param1);
         if(this.§_-5q§)
         {
            this.§_-5q§.dispose();
            this.§_-5q§ = null;
            this.§_-22D§ = -1;
         }
         if(§_-a9§.§_-O1z§ && (param1 == null || this.§_-Su§(param1)))
         {
            this.§_-l1J§.§_-11i§();
         }
         else if(this.§_-n1Q§)
         {
            this.§_-n1Q§.visible = param1 != null;
            this.§_-n1Q§.§_-H1T§ = this.§_-n1Q§.visible && (param1 is §_-21e§ || param1 is BalloonBody);
         }
         if(param1)
         {
            this.§_-FZ§();
            if(§_-a9§.§_-O1z§ && param1 is §_-63Q§ && !this.§_-Su§(param1))
            {
               this.§_-l1J§.§_-Z2i§(param1,Hero.self);
            }
            if(param1 is §_-v2j§)
            {
               §_-83v§(param1 as §_-v2j§);
            }
            if(param1 is GameBody)
            {
               (param1 as GameBody).§_-123§ = §_-h2B§.§_-Q5§;
               (param1 as GameBody).playerId = Hero.§_-74§;
            }
            if(param1 is §_-J14§)
            {
               (param1 as §_-J14§).game = this.game;
            }
            if(param1 is §_-Ft§)
            {
               (param1 as §_-Ft§).cast = this;
               (param1 as §_-Ft§).§_-11O§();
            }
            Hero.self.§_-pr§();
            if(param1 is §_-314§)
            {
               if(Hero.self)
               {
                  if(Hero.self.heroView.circle)
                  {
                     Hero.self.heroView.circle.visible = false;
                  }
                  param1.position = this.§_-j2S§();
               }
               Mouse.hide();
               this.aimCursor = (this.castObject as §_-314§).aimCursor;
               this.aimCursor.§_-x2x§(this.castObject is §_-v1e§ ? "center" : "left","center");
               §_-83v§(this.aimCursor);
               this.§_-f23§(this.§_-Us§);
               if(param1 is §_-v2j§)
               {
                  §_-83v§(param1 as §_-v2j§);
               }
               this.§_-e1§ = true;
            }
            else if(!§_-a9§.§_-O1z§ || this.§_-Su§(param1))
            {
               _loc3_ = §_-a9§.§_-O1z§ ? new Point(this.§_-Us§.x,this.§_-Us§.y) : globalToLocal(new Point(Game.stage.mouseX,Game.stage.mouseY));
               param1.position = new b2Vec2(_loc3_.x / Game.§_-x2P§,_loc3_.y / Game.§_-x2P§);
               this.§_-W6§ = true;
               this.§_-81n§ = true;
            }
            this.§_-kd§ = !§_-a9§.§_-O1z§ || this.§_-Su§(param1);
         }
         else
         {
            if(Hero.self)
            {
               Hero.self.§_-71x§();
            }
            this.§_-iV§();
            this.§_-e1§ = false;
            this.§_-W6§ = false;
            this.§_-kd§ = false;
            this.§_-81n§ = false;
         }
         this.§_-U1D§ = false;
         if(!(param1 is §_-314§) && (!§_-a9§.§_-O1z§ || this.§_-Su§(param1)))
         {
            this.§_-p2y§(this.§_-Us§);
         }
      }
      
      public function §_-K1G§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage);
         if(!_loc2_)
         {
            return;
         }
         if(this.§_-82s§)
         {
            if(_loc2_.§_-Q2S§ == §_-sj§.§_-i23§)
            {
               this.§_-Vj§(_loc2_);
            }
            else if(_loc2_.§_-Q2S§ == §_-sj§.§_-L23§)
            {
               this.§_-g7§();
            }
            return;
         }
         this.§_-Vj§(_loc2_);
         if(_loc2_.§_-Q2S§ != §_-sj§.§_-ML§ || !this.§_-kd§)
         {
            return;
         }
         if(this.castObject is §_-U1N§)
         {
            (this.castObject as §_-U1N§).§_-v1D§(_loc2_);
         }
         if(this.castObject is §_-314§)
         {
            this.§_-f23§(this.§_-Us§);
         }
         this.§_-qB§();
      }
      
      public function get castObject() : §_-63Q§
      {
         return this.object;
      }
      
      public function §_-52I§(param1:CastEvent) : void
      {
         var _loc3_:§_-bM§ = null;
         var _loc2_:Class = param1.§_-Q1q§ is Class ? param1.§_-Q1q§ : §_-03s§.§_-F1T§(param1.§_-Q1q§) as Class;
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
            if(this.castObject is §_-v1e§ && Hero.self is §_-i1L§)
            {
               return;
            }
            this.§_-m2C§();
            return;
         }
         if(Hero.self is §_-i1L§)
         {
            _loc3_ = Hero.self.§_-l2U§.§_-43X§(_loc2_,§_-bM§.§_-t2G§);
            if(!_loc3_ || _loc3_.count <= 0)
            {
               return;
            }
         }
         this.castObject = new _loc2_();
      }
      
      public function update(param1:Number = 0) : void
      {
         this.§_-s2B§();
         if(!this.castObject)
         {
            return;
         }
         if(Boolean(Hero.self) && !Hero.§_-6g§)
         {
            if(this.§_-82s§)
            {
               this.§_-PS§();
            }
            this.§_-m2C§();
            Hero.self.§_-71x§();
            return;
         }
         if(!Hero.self && §_-ws§(this.aimCursor))
         {
            this.§_-iV§();
         }
         this.§_-11e§();
         if(Boolean(this.§_-5q§) && !this.§_-82s§)
         {
            this.§_-5q§.update(param1);
         }
         if(this.castObject is §_-Tm§ && (!this.§_-82s§ || this.castObject is §_-p1L§))
         {
            (this.castObject as §_-Tm§).update(param1);
         }
         if(this.castObject is §_-314§)
         {
            this.§_-f23§(this.§_-Us§);
         }
         if(Boolean(this.timer) && Boolean(this.timer.running) && !this.§_-W1U§())
         {
            this.§_-PS§();
         }
         this.§_-r2F§();
         if(§_-a9§.§_-O1z§)
         {
            this.§_-l1J§.§_-A18§();
         }
      }
      
      public function listen(param1:Function) : void
      {
         var _loc2_:int = this.§_-81x§.indexOf(param1);
         if(_loc2_ != -1)
         {
            return;
         }
         this.§_-81x§.push(param1);
      }
      
      public function forget(param1:Function) : void
      {
         var _loc2_:int = this.§_-81x§.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         this.§_-81x§.splice(_loc2_,1);
      }
      
      public function §_-qB§() : Boolean
      {
         if(!Game.toggle)
         {
            var _loc1_:§_-as§ = null;
            var _loc2_:GameBody = null;
            var _loc3_:Point = null;
            var _loc4_:Point = null;
            var _loc5_:Number = NaN;
            if(this.§_-82s§ || !this.§_-W1U§() || !this.castObject)
            {
               return false;
            }
            if(Boolean(this.castObject is §_-314§) && Boolean(this.game) && !this.game.§_-W2H§())
            {
               return false;
            }
            if(this.castObject is BodyDestructor && !(this.castObject as BodyDestructor).§_-S1c§)
            {
               return false;
            }
            if(this.castObject is Hammer && !(this.castObject as Hammer).§_-S1c§)
            {
               return false;
            }
            if(this.castObject is §_-p1L§)
            {
               _loc1_ = (this.castObject as §_-p1L§).§_-H1B§;
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
                  _loc3_ = Hero.self.§_-i1q§();
                  _loc4_ = Hero.self.globalToLocal(_loc1_.localToGlobal(new Point(0,0))).add(new Point(Hero.self.x,Hero.self.y));
                  _loc5_ = _loc3_.add(new Point(0,0)).subtract(_loc4_).length;
                  if(_loc5_ >= 0)
                  {
                     return false;
                  }
               }
            }
            this.§_-VM§(true);
            this.§_-kd§ = false;
            §_-O1M§.§_-SK§();
            if(this.castObject is §_-J14§)
            {
               (this.castObject as §_-J14§).§_-qB§();
            }
            if(this.§_-5q§ is §_-J14§)
            {
               (this.§_-5q§ as §_-J14§).§_-qB§();
            }
            if(!(this.castObject is §_-314§))
            {
               this.§_-W6§ = false;
               this.§_-81n§ = false;
            }
            if(this.castObject is §_-p1L§)
            {
               Hero.self.§_-O2s§(0);
               (this.castObject as §_-p1L§).§_-u1B§ = Hero.self;
               return true;
            }
            ControllerHeroLocal.§_-b2A§();
            this.timer.reset();
            Hero.self.§_-O2s§(this.§_-JG§);
            if(this.castObject is §_-627§)
            {
               this.§_-U1D§ = true;
               if(this.castObject is §_-v2j§ && Boolean((this.castObject as §_-v2j§).parentStarling))
               {
                  (this.castObject as §_-v2j§).parentStarling.removeChildStarling(this.castObject as §_-v2j§);
               }
               return true;
            }
            if(this.§_-JG§ == 0)
            {
               setTimeout(this.§_-23§,0,null);
               return true;
            }
            this.§_-j2u§();
            this.timer.start();
            if(this.§_-LV§)
            {
               this.§_-23§();
            }
            return true;
         }
         _loc1_ = null;
         _loc2_ = null;
         _loc3_ = null;
         _loc4_ = null;
         _loc5_ = NaN;
         if(this.§_-82s§ || !this.§_-W1U§() || !this.castObject)
         {
            return false;
         }
         if(Boolean(this.castObject is §_-314§) && Boolean(this.game) && !this.game.§_-W2H§())
         {
            return false;
         }
         if(this.castObject is BodyDestructor && !(this.castObject as BodyDestructor).§_-S1c§)
         {
            return false;
         }
         if(this.castObject is Hammer && !(this.castObject as Hammer).§_-S1c§)
         {
            return false;
         }
         if(this.castObject is §_-p1L§)
         {
            _loc1_ = (this.castObject as §_-p1L§).§_-H1B§;
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
               _loc3_ = Hero.self.§_-i1q§();
               _loc4_ = Hero.self.globalToLocal(_loc1_.localToGlobal(new Point(0,0))).add(new Point(Hero.self.x,Hero.self.y));
               _loc5_ = _loc3_.add(new Point(this.radius,this.radius)).subtract(_loc4_).length;
               if(_loc5_ >= this.radius)
               {
                  return false;
               }
            }
         }
         this.§_-VM§(true);
         this.§_-kd§ = false;
         §_-O1M§.§_-SK§();
         if(this.castObject is §_-J14§)
         {
            (this.castObject as §_-J14§).§_-qB§();
         }
         if(this.§_-5q§ is §_-J14§)
         {
            (this.§_-5q§ as §_-J14§).§_-qB§();
         }
         if(!(this.castObject is §_-314§))
         {
            this.§_-W6§ = false;
            this.§_-81n§ = false;
         }
         if(this.castObject is §_-p1L§)
         {
            Hero.self.§_-O2s§(0);
            (this.castObject as §_-p1L§).§_-u1B§ = Hero.self;
            return true;
         }
         ControllerHeroLocal.§_-b2A§();
         this.timer.reset();
         Hero.self.§_-O2s§(this.§_-JG§);
         if(this.castObject is §_-627§)
         {
            this.§_-U1D§ = true;
            if(this.castObject is §_-v2j§ && Boolean((this.castObject as §_-v2j§).parentStarling))
            {
               (this.castObject as §_-v2j§).parentStarling.removeChildStarling(this.castObject as §_-v2j§);
            }
            return true;
         }
         if(this.§_-JG§ == 0)
         {
            setTimeout(this.§_-23§,0,null);
            return true;
         }
         this.§_-j2u§();
         this.timer.start();
         if(this.§_-LV§)
         {
            this.§_-23§();
         }
         return true;
      }
      
      public function §_-PS§() : void
      {
         var _loc1_:Function = null;
         if(!this.§_-82s§)
         {
            return;
         }
         this.§_-VM§(false);
         for each(_loc1_ in this.§_-81x§)
         {
            _loc1_(§_-P1N§);
         }
         if(this.castObject is §_-J14§)
         {
            (this.castObject as §_-J14§).§_-PS§();
         }
         if(this.§_-5q§ is §_-J14§)
         {
            (this.§_-5q§ as §_-J14§).§_-PS§();
         }
         if(this.castObject is §_-314§)
         {
            this.§_-e1§ = true;
         }
         else if(!§_-a9§.§_-O1z§ || this.§_-Su§(this.castObject))
         {
            this.§_-W6§ = true;
            this.§_-81n§ = true;
         }
         if(!§_-a9§.§_-O1z§ || this.§_-Su§(this.castObject))
         {
            this.§_-kd§ = true;
         }
         if(Hero.self)
         {
            Hero.self.§_-Yn§(false);
         }
         if(this.timer)
         {
            this.timer.stop();
         }
      }
      
      public function §_-m2C§(param1:String = "drop") : void
      {
         var _loc2_:Function = null;
         if(Boolean(this.timer) && this.timer.running)
         {
            return;
         }
         if(this.castObject)
         {
            for each(_loc2_ in this.§_-81x§)
            {
               _loc2_(param1);
            }
            if(this.castObject is §_-Ft§)
            {
               (this.castObject as §_-Ft§).§_-b2q§();
            }
            if(this.castObject is §_-C2x§)
            {
               (this.castObject as §_-C2x§).dispose();
            }
            if(§_-ws§(this.castObject as §_-v2j§))
            {
               removeChildStarling(this.castObject as §_-v2j§);
            }
            this.castObject = null;
            if(§_-a9§.§_-O1z§)
            {
               this.§_-l1J§.§_-11i§();
            }
         }
         this.§_-iV§();
         if(this.§_-5q§)
         {
            if(this.§_-5q§ is §_-C2x§)
            {
               (this.§_-5q§ as §_-C2x§).dispose();
            }
            if(§_-ws§(this.§_-5q§ as §_-v2j§))
            {
               removeChildStarling(this.§_-5q§ as §_-v2j§);
            }
            this.§_-w1w§ = -1;
            this.§_-5q§ = null;
         }
      }
      
      public function §_-T9§(param1:Class) : void
      {
         if(this.castObject is BalloonBody && param1 == §_-W1w§)
         {
            (this.castObject as BalloonBody).§_-Xy§ = !(this.castObject as BalloonBody).§_-Xy§;
            return;
         }
         if(!this.§_-p1b§(param1))
         {
            return;
         }
         if(!this.castObject || !(this.castObject is §_-21e§))
         {
            return;
         }
         var _loc2_:Boolean = getQualifiedClassName(this.§_-5q§) != getQualifiedClassName(param1);
         if(_loc2_)
         {
            if(this.§_-5q§ != null)
            {
               this.§_-5q§.dispose();
            }
            this.§_-5q§ = new param1();
            this.§_-5q§.world = this.game.world;
            this.§_-22D§ = this.§_-22D§;
            if(this.§_-22D§ == -1)
            {
               this.§_-22D§ = 0;
            }
         }
         else
         {
            ++this.§_-22D§;
         }
         if(Boolean(this.§_-5q§) && Boolean(this.castObject))
         {
            this.§_-5q§.body = this.castObject as GameBody;
         }
      }
      
      public function §_-FZ§() : void
      {
         var _loc1_:Array = this.§_-x1L§;
         if(§_-a9§.§_-O1z§)
         {
            this.§_-l1J§.§_-11§ = this.castObject is GameBody;
            this.§_-l1J§.§_-o1h§ = this.§_-l1J§.§_-11§ && (this.castObject as GameBody).ghost;
            this.§_-l1J§.§_-x1L§(_loc1_[0]);
         }
         else if(this.§_-n1Q§)
         {
            this.§_-n1Q§.§_-11§ = this.castObject is GameBody;
            this.§_-n1Q§.§_-o1h§ = this.§_-n1Q§.§_-11§ && (this.castObject as GameBody).ghost;
            this.§_-n1Q§.§_-Cw§(_loc1_[0],_loc1_[1]);
         }
      }
      
      public function §_-Z1g§() : void
      {
         if(!this.castObject || !(this.castObject is GameBody))
         {
            return;
         }
         (this.castObject as GameBody).ghost = !(this.castObject as GameBody).ghost;
         this.§_-FZ§();
      }
      
      protected function §_-j2S§() : b2Vec2
      {
         return Hero.self ? Hero.self.position.Copy() : null;
      }
      
      protected function §_-p2y§(param1:Point) : void
      {
         if(!this.castObject)
         {
            return;
         }
         var _loc2_:b2Vec2 = new b2Vec2(param1.x / Game.§_-x2P§,param1.y / Game.§_-x2P§);
         this.§_-11e§();
         this.castObject.position = _loc2_;
         this.§_-r2F§();
      }
      
      protected function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(this.§_-82s§)
         {
            return;
         }
         var _loc2_:int = int(param1.keyCode);
         switch(_loc2_)
         {
            case Keyboard.ESCAPE:
            case Keyboard.DELETE:
               this.§_-m2C§(§_-c27§);
               break;
            case Keyboard.Q:
            case Keyboard.E:
               if(!this.castObject)
               {
                  break;
               }
               this.castObject.angle += §_-M1Y§ * ((_loc2_ == Keyboard.Q ? -1 : 0) + (_loc2_ == Keyboard.E ? 1 : 0));
               break;
            case Keyboard.Z:
               this.§_-Z1g§();
               break;
            case Keyboard.C:
               this.§_-T9§(§_-W1w§);
               break;
            case Keyboard.V:
               this.§_-T9§(§_-q1m§);
               break;
            case Keyboard.B:
               this.§_-T9§(§_-Mb§);
               break;
            case Keyboard.N:
               this.§_-T9§(§_-s12§);
               break;
            case Keyboard.M:
               this.§_-T9§(§_-Xx§);
               break;
            case Keyboard.COMMA:
               this.§_-T9§(§_-k1G§);
               break;
            case Keyboard.PERIOD:
               this.§_-T9§(§_-X1D§);
               break;
            case Keyboard.SLASH:
               this.§_-T9§(§_-lT§);
         }
      }
      
      protected function get §_-22D§() : int
      {
         return this.§_-w1w§;
      }
      
      protected function set §_-22D§(param1:int) : void
      {
         if(!this.castObject)
         {
            return;
         }
         this.§_-w1w§ = param1;
         if(this.castObject is §_-21e§ && this.§_-w1w§ >= (this.castObject as §_-21e§).pinPositions.length)
         {
            this.§_-w1w§ = -1;
            this.§_-5q§.dispose();
            this.§_-5q§ = null;
         }
         if(Boolean(this.§_-5q§) && this.§_-w1w§ > -1)
         {
            this.§_-5q§.position = (this.castObject as §_-21e§).pinPositions[this.§_-w1w§];
         }
      }
      
      protected function §_-828§(param1:MouseEvent) : void
      {
         if(!this.§_-81n§ || !this.castObject)
         {
            return;
         }
         this.castObject.angle += param1.delta * 2 * Game.D2R;
      }
      
      protected function §_-23§(param1:TimerEvent = null) : void
      {
         var _loc2_:Function = null;
         this.§_-VM§(false);
         for each(_loc2_ in this.§_-81x§)
         {
            _loc2_(§_-cg§);
         }
         if(this.castObject is §_-J14§)
         {
            (this.castObject as §_-J14§).§_-23§();
         }
         if(this.§_-5q§ is §_-J14§)
         {
            (this.§_-5q§ as §_-J14§).§_-23§();
         }
         if(this.castObject is §_-Ft§)
         {
            (this.castObject as §_-Ft§).§_-b2q§();
         }
         if(!this.castObject)
         {
            return;
         }
         GameSounds.§_-1g§(this.castObject);
         if(§_-a9§.§_-O1z§)
         {
            this.§_-l1J§.§_-11i§();
         }
         this.§_-Hw§();
         this.§_-5q§ = null;
         this.castObject = null;
         this.§_-w1w§ = -1;
         Hero.self.§_-Yn§(true);
      }
      
      protected function §_-D1j§(param1:flash.events.Event = null) : void
      {
         if(!this.§_-82s§)
         {
            return;
         }
         this.§_-VM§(false);
         if(this.castObject is §_-Ft§)
         {
            (this.castObject as §_-Ft§).§_-b2q§();
         }
         this.§_-U1D§ = false;
         if(!this.castObject)
         {
            return;
         }
         GameSounds.§_-1g§(this.castObject);
         this.castObject = null;
         Hero.self.§_-Yn§(true);
      }
      
      protected function §_-Hw§() : void
      {
         removeChildStarling(this.castObject as §_-v2j§,false);
         this.game.map.add(this.castObject);
         this.castObject.build(this.game.world);
         if(this.§_-5q§)
         {
            this.game.map.add(this.§_-5q§);
            this.§_-5q§.build(this.game.world);
         }
      }
      
      protected function §_-W1U§() : Boolean
      {
         if(!Game.toggle)
         {
            var _loc5_:§_-cW§ = null;
            if(!Hero.self)
            {
               return false;
            }
            if(this.castObject is §_-314§)
            {
               return true;
            }
            if(0 == 0)
            {
               return true;
            }
            if(!Hero.self.§_-i1q§())
            {
               return false;
            }
            var _loc1_:Point = Hero.self.§_-i1q§();
            if(!this.castObject || !this.castObject.position)
            {
               return false;
            }
            var _loc2_:Point = new Point(this.castObject.position.x * Game.§_-x2P§,this.castObject.position.y * Game.§_-x2P§);
            var _loc3_:Number = _loc1_.add(new Point(0,0)).subtract(_loc2_).length;
            if(_loc3_ < 0)
            {
               return true;
            }
            var _loc4_:Array = this.game.map.get(§_-cW§,true);
            if(_loc4_.length == 0 || this.castObject is §_-k2I§)
            {
               return false;
            }
            for each(_loc5_ in _loc4_)
            {
               if(!(!(_loc5_ as §_-v2j§).parentStarling || _loc5_.playerId != Hero.§_-74§ || !_loc5_.§_-W1U§(localToGlobal(_loc2_))))
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
         if(this.castObject is §_-314§)
         {
            return true;
         }
         if(this.radius == 0)
         {
            return true;
         }
         if(!Hero.self.§_-i1q§())
         {
            return false;
         }
         _loc1_ = Hero.self.§_-i1q§();
         if(!this.castObject || !this.castObject.position)
         {
            return false;
         }
         _loc2_ = new Point(this.castObject.position.x * Game.§_-x2P§,this.castObject.position.y * Game.§_-x2P§);
         _loc3_ = _loc1_.add(new Point(this.radius,this.radius)).subtract(_loc2_).length;
         if(_loc3_ < this.radius)
         {
            return true;
         }
         _loc4_ = this.game.map.get(§_-cW§,true);
         if(_loc4_.length == 0 || this.castObject is §_-k2I§)
         {
            return false;
         }
         for each(_loc5_ in _loc4_)
         {
            if(!(!(_loc5_ as §_-v2j§).parentStarling || _loc5_.playerId != Hero.§_-74§ || !_loc5_.§_-W1U§(localToGlobal(_loc2_))))
            {
               return true;
            }
         }
         return false;
      }
      
      protected function §_-CL§() : void
      {
         var _loc1_:§_-63Q§ = (this.castObject as §_-627§).clone();
         this.game.map.add(_loc1_);
         _loc1_.build(this.game.world);
      }
      
      protected function §_-j2u§() : void
      {
         GameSounds.play("shaman_spell");
      }
      
      private function §_-f23§(param1:Point) : void
      {
         if(!param1 || !this.castObject || this.§_-82s§ || !Hero.self || !(this.castObject is §_-314§))
         {
            return;
         }
         var _loc2_:Point = globalToLocal(new Point(param1.x,param1.y));
         var _loc3_:b2Vec2 = new b2Vec2(_loc2_.x / Game.§_-x2P§,_loc2_.y / Game.§_-x2P§);
         var _loc4_:Number = Math.atan2(_loc3_.y - Hero.self.position.y,_loc3_.x - Hero.self.position.x);
         this.castObject.angle = _loc4_;
         this.castObject.position = this.§_-j2S§();
         (this.castObject as §_-314§).§_-l1o§(_loc2_);
         (this.castObject as GameBody).linearVelocity = new b2Vec2(Math.cos(_loc4_) * (this.castObject as §_-314§).maxVelocity,Math.sin(_loc4_) * (this.castObject as §_-314§).maxVelocity);
         this.§_-11e§();
         var _loc5_:Boolean = Boolean(this.game) && this.game.§_-W2H§();
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
      
      private function get §_-x1L§() : Array
      {
         var _loc3_:Class = null;
         var _loc1_:Array = [[],[]];
         if(this.castObject is BalloonBody)
         {
            return [[§_-u2I§[0]],[§_-c1b§[0]]];
         }
         var _loc2_:int = 0;
         for each(_loc3_ in §_-u2I§)
         {
            if(this.§_-p1b§(_loc3_))
            {
               _loc1_[0].push(§_-u2I§[_loc2_]);
               _loc1_[1].push(§_-c1b§[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function §_-p1b§(param1:Class) : Boolean
      {
         if(§_-32G§.§_-Yw§(param1,"ISaveInvert"))
         {
            return this.game.map.§_-u1T§.indexOf(§_-03s§.§_-X21§(param1)) == -1;
         }
         return this.game.map.§_-u1T§.indexOf(§_-03s§.§_-X21§(param1)) != -1;
      }
      
      private function §_-r2F§() : void
      {
         if(!Game.toggle)
         {
            if(!(this.castObject is §_-p1L§) || !this.§_-82s§ || !Hero.self)
            {
               return;
            }
            var _loc1_:Point = new Point(this.§_-Us§.x,this.§_-Us§.y);
            var _loc2_:b2Vec2 = new b2Vec2(_loc1_.x / Game.§_-x2P§,_loc1_.y / Game.§_-x2P§);
            var _loc3_:b2Vec2 = b2Math.SubtractVV(Hero.self.position,_loc2_);
            var _loc4_:Number = 0 / Game.§_-x2P§;
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
         if(!(this.castObject is §_-p1L§) || !this.§_-82s§ || !Hero.self)
         {
            return;
         }
         _loc1_ = new Point(this.§_-Us§.x,this.§_-Us§.y);
         _loc2_ = new b2Vec2(_loc1_.x / Game.§_-x2P§,_loc1_.y / Game.§_-x2P§);
         _loc3_ = b2Math.SubtractVV(Hero.self.position,_loc2_);
         _loc4_ = this.radius / Game.§_-x2P§;
         if(_loc3_.Length() > _loc4_ && _loc4_ > 0)
         {
            _loc3_.Normalize();
            _loc3_.Multiply(-_loc4_);
            _loc3_.Add(Hero.self.position);
            _loc2_ = _loc3_;
         }
         this.castObject.position = _loc2_;
      }
      
      private function §_-11e§() : void
      {
         if(!(this.castObject is §_-v2j§))
         {
            return;
         }
         var _loc1_:Boolean = this.castObject is GameBody && GameBody(this.castObject).ghost;
         (this.castObject as §_-v2j§).alpha = _loc1_ || !this.§_-W1U§() ? 0.5 : 1;
      }
      
      private function get §_-Y2e§() : Boolean
      {
         return Boolean(Hero.self) && Hero.self.heroView.running && Hero.self.§_-o15§;
      }
      
      private function §_-s2B§() : void
      {
         if(!Game.toggle)
         {
            var _loc1_:Number = 0;
            if(_loc1_ == this.§_-k1q§)
            {
               return;
            }
            this.§_-k1q§ = _loc1_;
            if(!Hero.self || !Hero.self.heroView.circle)
            {
               return;
            }
            Hero.self.heroView.circle.visible = (this.castObject != null || !Hero.self.§_-Qk§) && this.§_-k1q§ != 0;
            if(this.§_-k1q§ == 0)
            {
               return;
            }
            Hero.self.§_-Z2j§(this.§_-k1q§ * 2);
            return;
         }
         _loc1_ = this.radius;
         if(_loc1_ == this.§_-k1q§)
         {
            return;
         }
         this.§_-k1q§ = _loc1_;
         if(!Hero.self || !Hero.self.heroView.circle)
         {
            return;
         }
         Hero.self.heroView.circle.visible = (this.castObject != null || !Hero.self.§_-Qk§) && this.§_-k1q§ != 0;
         if(this.§_-k1q§ == 0)
         {
            return;
         }
         Hero.self.§_-Z2j§(this.§_-k1q§ * 2);
      }
      
      private function §_-42N§() : void
      {
         var _loc1_:Number = !isNaN(this.§_-x2z§) ? this.§_-x2z§ : this.§_-Lt§ * (1 - this.§_-rD§);
         this.§_-LV§ = _loc1_ == 0;
         if(!this.timer)
         {
            return;
         }
         this.timer.reset();
         this.timer.delay = _loc1_;
      }
      
      private function §_-iV§() : void
      {
         if(!§_-ws§(this.aimCursor))
         {
            return;
         }
         removeChildStarling(this.aimCursor,false);
         Mouse.show();
      }
      
      private function §_-f1V§(param1:§_-63Q§) : void
      {
         var _loc2_:Class = §_-03s§.§_-F1T§(§_-03s§.§_-X21§(param1));
         if(!_loc2_)
         {
            §_-O1M§.§_-D2P§();
            return;
         }
         §_-O1M§.§_-91M§(_loc2_);
      }
      
      private function §_-Su§(param1:§_-63Q§) : Boolean
      {
         return param1 is §_-314§ || param1 is §_-627§ || param1 is §_-p1L§ || param1 is Hammer;
      }
      
      private function §_-Vj§(param1:§_-e2m§) : void
      {
         this.§_-C12§.setTo(Game.stage.mouseX,Game.stage.mouseY);
         this.§_-Us§ = this.castObject is §_-314§ ? param1.§_-l29§(§_-s1i§.instance) : globalToLocal(this.§_-C12§);
         this.§_-b1m§ = this.castObject is §_-627§ ? §_-s1i§.instance.globalToLocal(this.§_-C12§) : this.§_-Us§;
      }
      
      private function §_-VM§(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.§_-82s§)
            {
               return;
            }
            this.§_-82s§ = true;
            Game.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-e2T§,false,0,true);
            Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-e2T§,false,0,true);
            return;
         }
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-e2T§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-e2T§);
         this.§_-82s§ = false;
      }
      
      private function §_-g7§() : void
      {
         if(this.castObject is §_-627§)
         {
            this.§_-D1j§(null);
         }
         else
         {
            this.§_-PS§();
         }
      }
      
      private function §_-e2T§(param1:MouseEvent) : void
      {
         if(!this.§_-82s§ || param1.type == MouseEvent.MOUSE_MOVE && param1.buttonDown)
         {
            return;
         }
         this.§_-g7§();
      }
      
      private function §_-K1x§(param1:Point) : void
      {
         if(!param1 || !(this.castObject is §_-627§))
         {
            return;
         }
         var _loc2_:Point = globalToLocal(param1);
         var _loc3_:b2Vec2 = new b2Vec2(_loc2_.x / Game.§_-x2P§,_loc2_.y / Game.§_-x2P§);
         this.castObject.position = _loc3_;
         if(!this.§_-W1U§() || !(this.castObject as §_-627§).§_-W1U§())
         {
            return;
         }
         this.§_-CL§();
      }
      
      private function §_-L1Y§(param1:§_-K2c§.Event) : void
      {
         if(!Game.toggle)
         {
            if(this.castObject is §_-x29§)
            {
               if(this.§_-U1D§)
               {
                  if(this.§_-b1m§ != null)
                  {
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     this.§_-K1x§(this.§_-b1m§);
                     return;
                  }
               }
            }
         }
         if(this.§_-b1m§ == null)
         {
            return;
         }
         if(this.§_-W6§)
         {
            this.§_-p2y§(this.§_-Us§);
         }
         if(this.§_-e1§)
         {
            this.§_-f23§(this.§_-Us§);
         }
         if(this.§_-U1D§)
         {
            this.§_-K1x§(this.§_-b1m§);
         }
         this.§_-b1m§ = null;
      }
      
      private function §_-V1Q§(param1:flash.events.Event = null) : void
      {
         if(!this.§_-n1Q§)
         {
            return;
         }
         this.§_-n1Q§.x = (Game.starling.stage.stageWidth - §_-a9§.§_-9o§) * 0.5 + §_-R12§;
         this.§_-n1Q§.y = Game.starling.stage.stageHeight - 120;
      }
   }
}

