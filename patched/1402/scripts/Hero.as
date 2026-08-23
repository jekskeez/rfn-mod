package
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.Shapes.b2MassData;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Mat22;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2JointEdge;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FilterData;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-22D§.TweenMax;
   import §_-61C§.§_-a2p§;
   import §_-81P§.§_-f1D§;
   import §_-8Q§.GameBody;
   import §_-8Q§.§_-92B§;
   import §_-8Q§.§_-A1d§;
   import §_-8Q§.§_-O2k§;
   import §_-8Q§.§_-o25§;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-Cc§.§_-21k§;
   import §_-Cc§.§_-73t§;
   import §_-Cc§.§_-B3z§;
   import §_-Cc§.§_-I2P§;
   import §_-Cc§.§_-f6§;
   import §_-Cc§.§_-hs§;
   import §_-Cc§.§_-it§;
   import §_-G2y§.§_-53o§;
   import §_-G2y§.§_-V2D§;
   import §_-I1q§.§_-N2K§;
   import §_-M1h§.§_-Vk§;
   import §_-TK§.§_-aS§;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-P2x§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-cm§.§_-Q2h§;
   import §_-cm§.§_-V1t§;
   import §_-cm§.§_-cV§;
   import §_-j2H§.§_-Y1e§;
   import §_-j4§.§_-Pn§;
   import §_-j4§.§_-f2A§;
   import §_-l2u§.§_-62b§;
   import §_-n1h§.§_-dC§;
   import §_-o10§.§_-Ta§;
   import §_-o10§.§_-p1B§;
   import §_-q1N§.§_-j11§;
   import §_-r1M§.§_-b13§;
   import §_-r1M§.§_-l2C§;
   import §_-td§.§_-vO§;
   import chat.§_-g1j§;
   import com.api.Player;
   import events.§_-Um§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-Cd§;
   import game.mainGame.§_-D1m§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.§_-jC§;
   import game.mainGame.§_-n2T§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.§_-w23§;
   import game.mainGame.entity.§_-L1q§;
   import game.mainGame.entity.§_-sn§;
   import game.mainGame.entity.§_-w1u§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import starling.core.Starling;
   import utils.§_-d1t§;
   import views.§_-83a§;
   
   public class Hero extends §_-aS§ implements §_-V2D§, §_-F1c§, §_-Pn§, §_-jC§
   {
      
      public static const §_-Dc§:String = "Hero.scale";
      
      public static const §_-K1I§:String = "Hero.remove";
      
      public static const §_-h1i§:String = "Hero.die";
      
      public static const §_-N2i§:String = "Hero.breakJoint";
      
      public static const §_-J2F§:String = "Hero.breakGum";
      
      public static const §_-V§:String = "Hero.breakRope";
      
      public static const §_-21z§:String = "Hero.doubleJump";
      
      public static const §_-G0§:String = "Hero.deadlyContact";
      
      public static const §_-y2S§:String = "Hero.teleport";
      
      public static const §_-y2y§:String = "Hero.up";
      
      public static const EVENT_UP_END:String = "Hero.EVENT_UP_END";
      
      public static const §_-e1j§:String = "Hero.perkQuest";
      
      public static const §_-72g§:int = -1;
      
      public static const §_-h1o§:int = 0;
      
      public static const §_-b1i§:int = 1;
      
      public static const §_-l19§:int = 2;
      
      public static const §_-134§:int = 3;
      
      public static const §_-mM§:int = 4;
      
      public static const §_-pq§:int = 5;
      
      public static const §_-z1s§:String = "stand";
      
      public static const §_-M2k§:String = "run";
      
      public static const §_-L22§:String = "jump";
      
      public static const §_-lL§:String = "cast";
      
      public static const §_-O2g§:String = "laugh";
      
      public static const §_-63C§:String = "cry";
      
      public static const §_-H1v§:String = "kiss";
      
      public static const §_-O1a§:String = "angry";
      
      public static const §_-S1k§:String = "cast3";
      
      public static const §_-629§:int = 0;
      
      public static const §_-C2T§:int = 1;
      
      public static const §_-z29§:int = 2;
      
      public static const §_-PM§:int = 0;
      
      public static const §_-l1B§:int = 1;
      
      public static const §_-i1Y§:int = 2;
      
      public static const §_-m28§:int = 3;
      
      public static const §_-z2T§:int = 0;
      
      public static const §_-43e§:int = 1;
      
      public static const §_-Q2c§:int = 0;
      
      public static const §_-YX§:int = 1;
      
      public static const §_-o1K§:int = 2;
      
      public static const §_-C37§:int = 3;
      
      public static const §_-A1D§:int = 4;
      
      public static const §_-113§:int = 5;
      
      public static const §_-L1F§:int = 1;
      
      public static const §_-E2Y§:int = 2;
      
      public static const §_-nk§:int = 0;
      
      public static const §_-q§:int = 1;
      
      public static const §_-v2u§:int = 2;
      
      public static const §_-e2H§:int = 3;
      
      public static const §_-P1u§:int = 4;
      
      public static const §_-gR§:int = 5;
      
      public static const §_-41§:int = 6;
      
      public static const §_-kU§:int = 7;
      
      public static const §_-a1A§:Number = 22.65;
      
      public static const §_-a1Y§:int = 30;
      
      public static const §_-GW§:Number = 0.1;
      
      private static const §_-M2P§:int = 80;
      
      private static const §_-93D§:int = 6;
      
      private static const §_-Rc§:Number = 0.7;
      
      private static const §_-03I§:int = 15;
      
      private static const §_-j2I§:int = 15;
      
      private static const §_-K1v§:Number = 1.3;
      
      private static const §_-v1w§:int = 5000;
      
      private static const §_-T1c§:int = 10;
      
      public static const §_-p2Z§:Object = {
         (§_-h1o§.toString()):§_-z1s§,
         (§_-b1i§.toString()):§_-M2k§,
         (§_-l19§.toString()):§_-L22§,
         (§_-134§.toString()):§_-lL§
      };
      
      private static const §_-a2m§:Array = [§_-w10§.§_-32§,null,§_-w10§.§_-cW§];
      
      private static const §_-A24§:int = §_-Y2E§.§_-qK§ | §_-Y2E§.§_-D20§ | §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-L1b§ | §_-Y2E§.§_-qk§ | §_-Y2E§.§_-T5§ | §_-Y2E§.§_-t1a§ | §_-Y2E§.§_-w1y§;
      
      private static var §_-q1e§:Hero = null;
      
      private static var §_-jH§:Dictionary = new Dictionary();
      
      public var body:b2Body;
      
      public var §_-s2i§:b2Fixture = null;
      
      public var §_-L1G§:b2Fixture;
      
      public var §_-43c§:int = -1;
      
      public var §_-b2d§:int = -1;
      
      public var frags:uint = 0;
      
      public var heroView:§_-c2W§ = null;
      
      public var up:Boolean = false;
      
      public var left:Boolean = false;
      
      public var right:Boolean = false;
      
      public var §_-F1u§:Array = [];
      
      public var player:Player = null;
      
      public var perkController:§_-dC§ = null;
      
      public var behaviourController:§_-21k§ = null;
      
      public var inHollow:Boolean = false;
      
      public var isDead:Boolean = false;
      
      public var §_-23m§:Boolean = false;
      
      public var onRemove:Boolean = false;
      
      public var §_-C28§:Boolean = false;
      
      public var armadillo:Boolean = false;
      
      public var §_-Rb§:Boolean = false;
      
      public var §_-N1U§:Boolean = false;
      
      public var acornShare:Boolean = false;
      
      public var §_-L2u§:Boolean = false;
      
      public var §_-xS§:Boolean = false;
      
      public var swim:Boolean = false;
      
      public var §_-I2V§:Boolean = false;
      
      public var hover:Boolean = false;
      
      public var ghost:Boolean = false;
      
      public var climbing:Boolean = false;
      
      public var §_-Kv§:Boolean = false;
      
      public var §_-Ha§:Boolean = false;
      
      public var §_-92v§:Boolean = false;
      
      public var §_-h14§:Boolean = false;
      
      public var §_-IC§:Boolean = false;
      
      public var §_-A2R§:Boolean = false;
      
      public var §_-62v§:Boolean = true;
      
      public var viewChanged:Boolean = false;
      
      public var §_-Uz§:Boolean = false;
      
      public var useGravity:Boolean = true;
      
      public var §_-h1z§:§_-Cd§ = new §_-Cd§();
      
      public var §_-11F§:int = 16777215;
      
      public var §_-Y§:Number = 1;
      
      public var questFactor:Number = 1;
      
      public var followId:int = 0;
      
      protected var §_-q1h§:int = 30;
      
      protected var §_-D13§:int = 5;
      
      protected var §_-M2y§:Number = 15;
      
      protected var §_-7M§:int = 18;
      
      protected var §_-H1V§:int = 0;
      
      protected var §_-aP§:int = 0;
      
      protected var §_-m2g§:Number = 1;
      
      protected var §_-W2Q§:Number = 1;
      
      protected var §_-kQ§:int = 4;
      
      protected var §_-2K§:Number = 0;
      
      protected var §_-O2V§:Number = 1;
      
      protected var §_-QE§:Number = 0.1;
      
      protected var §_-a12§:Number = 1;
      
      protected var §_-Oz§:int = 0;
      
      protected var §_-M1Z§:Boolean = false;
      
      protected var §_-L2c§:Boolean = false;
      
      protected var §_-02P§:Boolean = false;
      
      protected var §_-O2h§:Boolean = false;
      
      protected var §_-f1K§:Boolean = true;
      
      protected var §_-f2q§:TweenMax = null;
      
      protected var §_-n1q§:int = 0;
      
      protected var §_-21Y§:int = 0;
      
      protected var §_-G1F§:b2BodyDef = null;
      
      protected var §_-S2v§:int = 0;
      
      protected var controller:§_-53o§ = null;
      
      protected var §_-31C§:Timer = new Timer(1000,1);
      
      protected var §_-v2z§:Timer = new Timer(§_-T1c§);
      
      protected var §_-v2y§:int = 0;
      
      protected var §_-G2O§:int = 0;
      
      protected var §_-h1l§:Boolean = false;
      
      protected var §_-yp§:Boolean = false;
      
      protected var §_-72u§:Boolean = false;
      
      protected var §_-F1A§:Boolean = false;
      
      protected var §_-03u§:Boolean = false;
      
      protected var §_-i§:TweenMax = null;
      
      protected var §_-632§:DisplayObject = null;
      
      protected var §_-U1P§:§_-83a§;
      
      protected var §_-S11§:Boolean = false;
      
      protected var §_-2b§:Boolean = false;
      
      protected var §_-L1S§:Boolean = false;
      
      protected var §_-j1J§:Boolean = false;
      
      protected var §_-w1D§:Boolean = false;
      
      protected var §_-E1a§:Boolean = false;
      
      protected var §_-b19§:Clan = null;
      
      protected var §_-I2j§:b2Vec2 = null;
      
      protected var §_-G1k§:b2Vec2 = null;
      
      protected var extGravity:b2Vec2 = new b2Vec2();
      
      protected var §_-S1P§:§_-f2A§ = null;
      
      protected var world:b2World = null;
      
      protected var §_-G2P§:Timer = new Timer(Hero.§_-v1w§,1);
      
      protected var icon:§_-aS§ = null;
      
      protected var §_-23I§:int = -1;
      
      protected var §_-32Y§:int = -1;
      
      protected var §_-6n§:int = 0;
      
      private var §_-n2x§:int = 0;
      
      private var §_-C1F§:Boolean = false;
      
      private var §_-q27§:Boolean = false;
      
      private var §_-Z2g§:Boolean = false;
      
      private var §_-c2F§:Boolean = false;
      
      private var §_-l24§:Boolean = false;
      
      private var §_-02d§:Object = {};
      
      private var §_-Y1P§:§_-11u§ = null;
      
      private var §_-R25§:b2Joint = null;
      
      private var §_-ex§:Array = [];
      
      public function Hero(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super();
         §_-p2U§.add("new Hero:" + param1);
         §_-d1t§.§_-B12§(this);
         this.§_-n2x§ = param1;
         this.world = param2;
         if(this.id > 0)
         {
            this.player = Game.getPlayer(this.id);
            this.player.addEventListener(Hero.§_-A24§,this.§_-K16§);
            Game.request(this.id,Hero.§_-A24§,true);
         }
         if(this.isSelf)
         {
            self = this;
            this.§_-U1P§ = new §_-83a§();
         }
         this.heroView = new this.viewClass(this.id);
         this.heroView.y = §_-a1A§;
         addChild(this.heroView);
         §_-J2J§(this.heroView);
         this.game.addChild(this.heroView.circle);
         this.game.§_-J2J§(this.heroView.circle);
         this.heroView.circle.visible = false;
         this.§_-Lf§(param3,param4);
         this.position = new b2Vec2(param3,param4);
         this.perkController = new §_-dC§(this);
         this.behaviourController = new §_-21k§(this);
         this.hide();
         this.reset();
         this.§_-31C§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-412§);
         this.§_-v2z§.addEventListener(TimerEvent.TIMER,this.§_-d25§);
         this.§_-G2P§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-01A§);
         this.mouseEnabled = true;
         this.mouseChildren = true;
         this.touchable = false;
         this.§_-23m§ = true;
      }
      
      public static function get §_-23Q§() : Array
      {
         return [Hero.§_-K1I§,Hero.§_-h1i§,SquirrelEvent.§_-pZ§,SquirrelEvent.§_-M15§,SquirrelEvent.HIDE,SquirrelEvent.§_-E25§,SquirrelEvent.§_-R1y§];
      }
      
      public static function get self() : Hero
      {
         return §_-q1e§;
      }
      
      public static function set self(param1:Hero) : void
      {
         var _loc2_:int = 0;
         if(self == param1)
         {
            return;
         }
         if(self)
         {
            _loc2_ = 0;
            while(_loc2_ < §_-23Q§.length)
            {
               §_-q1e§.removeEventListener(§_-23Q§[_loc2_],§_-k2f§);
               _loc2_++;
            }
         }
         §_-q1e§ = param1;
         if(self)
         {
            _loc2_ = 0;
            while(_loc2_ < §_-23Q§.length)
            {
               §_-q1e§.addEventListener(§_-23Q§[_loc2_],§_-k2f§);
               _loc2_++;
            }
         }
      }
      
      public static function get §_-Cg§() : Boolean
      {
         return self != null && !self.inHollow && !self.isDead;
      }
      
      public static function get §_-M1O§() : int
      {
         return §_-q1e§ != null ? §_-q1e§.id : Game.selfId;
      }
      
      public static function §_-K2a§(param1:Array, param2:Function) : void
      {
         var _loc3_:String = null;
         for each(_loc3_ in param1)
         {
            §_-jH§[param2] = _loc3_;
         }
      }
      
      public static function forget(param1:Function) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in §_-jH§)
         {
            if(_loc2_ as Function == param1)
            {
               delete §_-jH§[_loc2_];
            }
         }
      }
      
      private static function §_-k2f§(param1:Event) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in §_-jH§)
         {
            if(_loc2_ == null)
            {
               delete §_-jH§[_loc2_];
            }
            else if(§_-jH§[_loc2_] == param1.type)
            {
               (_loc2_ as Function).apply(null);
            }
         }
      }
      
      override public function set x(param1:Number) : void
      {
         var _loc2_:§_-11u§ = null;
         super.x = param1;
         for each(_loc2_ in this.§_-02d§)
         {
            _loc2_.view.§_-L2Z§ = param1;
            _loc2_.view.§_-B1N§ = (_loc2_.§_-q22§ == 0 ? (this.heroView.direction ? Math.PI : 0) : 0) + this.body.GetAngle() + _loc2_.§_-q22§;
         }
      }
      
      override public function set y(param1:Number) : void
      {
         var _loc2_:§_-11u§ = null;
         super.y = param1;
         for each(_loc2_ in this.§_-02d§)
         {
            _loc2_.view.§_-2F§ = param1;
            _loc2_.view.§_-B1N§ = (_loc2_.§_-q22§ == 0 ? (this.heroView.direction ? Math.PI : 0) : 0) + this.body.GetAngle() + _loc2_.§_-q22§;
         }
      }
      
      public function get viewClass() : Class
      {
         return §_-c2W§;
      }
      
      public function get isSelf() : Boolean
      {
         if(this == Hero.self)
         {
            return true;
         }
         if(this.id > 0 && this.id == Hero.§_-M1O§)
         {
            return true;
         }
         return this.id < 0 && this.game is §_-62b§;
      }
      
      public function get §_-Q2z§() : Boolean
      {
         return this.isSelf || this.id < 0 && this.game is §_-Vk§;
      }
      
      public function get §_-p1I§() : Boolean
      {
         return this.id == §_-u24§.§_-j2T§;
      }
      
      public function get §_-K13§() : Boolean
      {
         return this.body != null;
      }
      
      public function get angle() : Number
      {
         if(!this.body)
         {
            return 0;
         }
         return this.body.GetAngle();
      }
      
      public function set angle(param1:Number) : void
      {
         var _loc2_:§_-11u§ = null;
         this.body.SetAngle(param1);
         for each(_loc2_ in this.§_-02d§)
         {
            _loc2_.view.§_-B1N§ = (_loc2_.§_-q22§ == 0 ? (this.heroView.direction ? Math.PI : 0) : 0) + this.body.GetAngle() + _loc2_.§_-q22§;
         }
      }
      
      public function hasJoints(param1:*) : Boolean
      {
         if(!this.body)
         {
            return false;
         }
         var _loc2_:b2JointEdge = this.body.GetJointList();
         while(_loc2_)
         {
            if(_loc2_.joint.GetUserData() == param1)
            {
               return true;
            }
            _loc2_ = _loc2_.next;
         }
         return false;
      }
      
      public function get §_-11E§() : b2Vec2
      {
         return this.body.GetTransform().R.col1;
      }
      
      public function get §_-d2u§() : b2Vec2
      {
         return this.body.GetTransform().R.col2;
      }
      
      public function get onFloor() : Boolean
      {
         return this.§_-S1P§.onFloor;
      }
      
      public function §_-A1w§(param1:b2Vec2) : b2Vec2
      {
         return this.body.GetLocalVector(param1);
      }
      
      public function §_-PT§(param1:b2Vec2) : void
      {
         this.body.ApplyImpulse(param1,this.body.GetWorldCenter());
      }
      
      public function §_-B1z§(param1:b2DistanceJointDef, param2:b2Vec2, param3:Boolean = true) : void
      {
         if(param3)
         {
            param1.localAnchorA = this.body.GetLocalPoint(param2);
         }
         else
         {
            param1.localAnchorB = this.body.GetLocalPoint(param2);
         }
      }
      
      public function §_-n2I§(param1:b2DistanceJointDef, param2:Boolean = true) : void
      {
         if(param2)
         {
            param1.bodyA = this.body;
         }
         else
         {
            param1.bodyB = this.body;
         }
      }
      
      public function §_-ZW§(param1:b2RevoluteJointDef, param2:Boolean = true) : void
      {
         if(param2)
         {
            param1.bodyA = this.body;
         }
         else
         {
            param1.bodyB = this.body;
         }
      }
      
      public function lockBody(param1:Object) : void
      {
         var _loc2_:int = this.§_-ex§.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.§_-ex§.splice(_loc2_,1);
         }
         this.§_-ex§.push(param1);
         if(this.§_-R25§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-R25§);
            this.§_-R25§ = null;
         }
         this.body.SetFixedRotation(false);
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.Initialize(this.body.GetWorld().GetGroundBody(),this.body,this.body.GetPosition());
         _loc3_.enableLimit = true;
         _loc3_.lowerAngle = 0;
         _loc3_.upperAngle = 0;
         this.§_-R25§ = this.body.GetWorld().CreateJoint(_loc3_);
         this.hover = true;
      }
      
      public function unlockBody(param1:Object) : void
      {
         var _loc2_:int = this.§_-ex§.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         this.§_-ex§.splice(_loc2_,1);
         if(this.§_-ex§.length > 0)
         {
            return;
         }
         if(!this.§_-R25§)
         {
            return;
         }
         this.body.GetWorld().DestroyJoint(this.§_-R25§);
         this.body.SetFixedRotation(true);
         this.hover = false;
         this.§_-h14§ = true;
         this.§_-R25§ = null;
      }
      
      public function §_-X1b§(param1:b2Vec2) : void
      {
         this.extGravity.Add(param1);
      }
      
      public function get §_-AS§() : Boolean
      {
         return this.§_-l24§;
      }
      
      public function §_-sF§(param1:Number) : Boolean
      {
         return this.x > this.game.map.size.x + param1;
      }
      
      public function reset() : void
      {
         this.perkController.§_-xm§();
         if(this.body)
         {
            this.body.renewTransform();
         }
         this.§_-Y1P§ = null;
         this.§_-n1g§();
         this.behaviourController.reset();
         this.heroView.§_-Ks§();
         this.heroView.§_-G14§();
         this.heroView.§_-62F§ = false;
         this.heroView.shaman = false;
         this.heroView.running = false;
         this.heroView.§_-52A§ = false;
         this.heroView.dead = false;
         this.heroView.direction = false;
         this.heroView.isHare = false;
         this.heroView.isDragon = false;
         this.heroView.scale = 1;
         this.heroView.circle.visible = false;
         this.heroView.update();
         this.body.SetLinearVelocity(new b2Vec2(0,0));
         this.runSpeed = 15;
         this.§_-c2e§ = 15;
         this.isHare = false;
         this.isDragon = false;
         this.§_-23m§ = false;
         this.left = false;
         this.right = false;
         this.hover = false;
         this.inHollow = false;
         this.shaman = false;
         this.dead = false;
         this.§_-6l§ = false;
         this.§_-s23§ = false;
         this.§_-X1O§(false);
         this.§_-Ha§ = false;
         this.§_-Kv§ = false;
         this.ghost = false;
         this.§_-Rb§ = false;
         this.§_-N1U§ = false;
         this.team = Hero.§_-PM§;
         this.§_-03u§ = false;
         this.§_-43c§ = -1;
         this.§_-b2d§ = -1;
         this.frags = 0;
         this.questFactor = 1;
         this.§_-M2I§();
         this.§_-S1P§.reset();
         this.§_-h1z§.reset();
         if(this.controller != null)
         {
            this.controller.active = true;
         }
         if(this.§_-b19§)
         {
            §_-B2U§.request(this.player["clan_id"],§_-eT§.§_-P26§ | §_-eT§.STATE | §_-eT§.§_-t1d§,true);
            this.§_-b19§.addEventListener(§_-eT§.§_-P26§ | §_-eT§.STATE | §_-eT§.§_-t1d§,this.onClanLoaded);
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-pZ§,this));
         if(this.viewChanged && this.player["worn"] != null)
         {
            this.heroView.setClothing(this.player["worn_packages"],this.player["worn_accessories"]);
            this.viewChanged = false;
         }
         this.§_-E9§();
         this.§_-X1I§(null);
         this.heroView.§_-DG§(this.§_-p1I§);
      }
      
      public function sendLocation(param1:int = 0) : void
      {
         if(this.isDead || this.inHollow || !this.§_-vs§)
         {
            return;
         }
         §_-p2U§.add("Hero.sendLocation:" + param1);
         Connection.§_-e2T§(§_-u1O§.§_-D1P§,param1,this.position.x,this.position.y,this.velocity.x,this.velocity.y);
      }
      
      public function get playerName() : String
      {
         return this.player["name"];
      }
      
      public function remove() : void
      {
         this.onRemove = true;
         this.§_-Y1P§ = null;
         this.§_-n1g§();
         §_-p2U§.add("Hero remove:" + this.id);
         §_-d1t§.§_-xx§(this);
         this.§_-vs§ = false;
         dispatchEvent(new Event(Hero.§_-K1I§));
         dispatchEvent(new Event(Hero.§_-N2i§));
         dispatchEvent(new Event(Hero.§_-J2F§));
         dispatchEvent(new Event(Hero.§_-V§));
         §_-n2T§.§_-L4§(this.body);
         this.world.DestroyBody(this.body);
         this.body.SetUserData(null);
         this.§_-s2i§.SetUserData(null);
         this.§_-L1G§.SetUserData(null);
         this.§_-E9§();
         if(this.§_-b19§)
         {
            this.§_-b19§.removeEventListener(this.onClanLoaded);
         }
         this.§_-h1z§.dispose();
         this.perkController.dispose();
         this.§_-S1P§ = null;
         this.world = null;
         this.body = null;
         this.§_-L1G§ = null;
         this.icon = null;
         this.§_-23I§ = -1;
         this.§_-32Y§ = -1;
         if(Boolean(this.§_-U1P§) && Boolean(this.§_-U1P§.parent))
         {
            this.§_-U1P§.dispose();
            this.§_-U1P§.parent.removeChild(this.§_-U1P§);
         }
         this.§_-U1P§ = null;
         if(this.heroView.circle.parentStarling)
         {
            this.heroView.circle.parentStarling.removeChildStarling(this.heroView.circle,false);
         }
         if(Boolean(this.heroView.§_-A3x§) && Boolean(this.heroView.§_-A3x§.parent))
         {
            this.heroView.§_-A3x§.parent.removeChild(this.heroView.§_-A3x§);
         }
         this.heroView.remove();
         this.§_-31C§.stop();
         this.§_-v2z§.stop();
         this.§_-G2P§.stop();
         this.§_-31C§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-412§);
         this.§_-v2z§.removeEventListener(TimerEvent.TIMER,this.§_-d25§);
         this.§_-G2P§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-01A§);
         if(this.player)
         {
            this.player.removeEventListener(this.§_-K16§);
         }
         if(this.controller == null)
         {
            return;
         }
         this.controller.active = false;
         this.controller.remove();
         this.controller = null;
         if(Game.selfId == this.id)
         {
            self = null;
         }
      }
      
      public function §_-Ed§(param1:int = 2000) : void
      {
         if(this.game.paused)
         {
            return;
         }
         if(!(this.heroView.running && this.§_-Uz§))
         {
            this.§_-dU§ = true;
         }
         if(this.id != Game.selfId && this.id > 0 || param1 == 0)
         {
            return;
         }
         this.heroView.§_-B2n§ = 0;
         this.§_-v2y§ = getTimer();
         this.§_-G2O§ = param1;
         this.§_-v2z§.reset();
         this.§_-v2z§.start();
      }
      
      public function §_-C2u§(param1:Boolean) : void
      {
         this.§_-dU§ = false;
         if(this.id != Game.selfId && this.id > 0)
         {
            return;
         }
         this.heroView.§_-B2n§ = 0;
         if(param1 && this.controller != null)
         {
            this.controller.active = false;
         }
         this.§_-v2z§.stop();
      }
      
      public function get isStopped() : Boolean
      {
         return this.§_-S2v§ > 0;
      }
      
      public function set isStopped(param1:Boolean) : void
      {
         this.§_-S2v§ = Math.max(0,this.§_-S2v§ + (param1 ? 1 : -1));
         if(this.controller)
         {
            this.controller.§_-22g§ = this.isStopped;
         }
         if(!this.isStopped)
         {
            return;
         }
         this.left = false;
         this.right = false;
         this.up = false;
      }
      
      public function get §_-ov§() : Vector.<§_-p1B§>
      {
         return this.perkController.§_-ov§;
      }
      
      public function §_-h2j§() : Point
      {
         return this.globalToLocal(this.game.localToGlobal(new Point(this.heroView.circle.x,this.heroView.circle.y))).add(new Point(this.x,this.y));
      }
      
      public function get id() : int
      {
         return this.§_-n2x§;
      }
      
      public function get shaman() : Boolean
      {
         return this.§_-C1F§;
      }
      
      public function set shaman(param1:Boolean) : void
      {
         var _loc2_:§_-p1B§ = null;
         var _loc3_:String = null;
         if(this.shaman == param1)
         {
            return;
         }
         this.§_-C1F§ = param1;
         if(this.isDragon)
         {
            this.isDragon = false;
         }
         if(this.isHare)
         {
            this.isHare = false;
         }
         this.§_-Y1P§ = null;
         this.§_-n1g§();
         §_-p2U§.add("Shaman ",this.id,param1);
         this.heroView.shaman = param1;
         this.§_-z5§();
         if(param1)
         {
            _loc3_ = §_-a2m§[this.heroView.§_-91s§];
            if(_loc3_)
            {
               this.§_-Y1P§ = this.applyEffect(_loc3_,1,true);
               this.§_-Y1P§.view.alpha = 0;
               this.§_-Y1P§.view.visible = false;
               this.§_-Y1P§.start();
            }
         }
         for each(_loc2_ in this.§_-ov§)
         {
            _loc2_.reset();
         }
         this.§_-dU§ = false;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-Z2N§,this));
         dispatchEvent(new Event(Hero.§_-V§));
         this.§_-E9§();
         if(this.game is §_-vO§)
         {
            §_-Ac§.§_-91§(§_-Ac§.§_-Z2N§);
         }
      }
      
      public function §_-73j§(param1:int) : void
      {
         if(param1 >= Hero.§_-113§ && !this.isHare)
         {
            this.§_-f2g§(param1);
            return;
         }
         if((this.heroView.emotion ? this.heroView.§_-n1e§ : -1) == param1)
         {
            this.heroView.§_-Ks§();
         }
         else
         {
            this.heroView.§_-73j§(param1);
            dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-P2y§,this));
         }
      }
      
      public function get game() : SquirrelGame
      {
         return this.world == null ? null : this.world.userData;
      }
      
      public function show() : void
      {
         if(this.inHollow && this.id == Game.selfId || this.isDead || !this.§_-K13§)
         {
            return;
         }
         this.§_-q27§ = true;
         this.heroView.circle.visible = false;
         this.heroView.visible = true;
         this.heroView.update();
         if(this.heroView.§_-A3x§)
         {
            this.heroView.§_-A3x§.visible = true;
         }
         this.body.SetActive(true);
         if(Boolean(this.§_-U1P§) && Boolean(this.game) && !this.game.map.contains(this.§_-U1P§))
         {
            this.game.addChild(this.§_-U1P§);
         }
         if(this.§_-U1P§)
         {
            this.§_-U1P§.visible = true;
         }
         this.§_-N§();
      }
      
      public function §_-A2n§() : void
      {
         this.heroView.visible = false;
         if(this.heroView.§_-A3x§)
         {
            this.heroView.§_-A3x§.visible = false;
         }
         this.body.SetActive(false);
         if(this.§_-U1P§)
         {
            this.§_-U1P§.visible = false;
         }
         this.show();
      }
      
      public function hide(param1:Boolean = false) : void
      {
         if(this.controller != null)
         {
            this.controller.active = false;
         }
         this.heroView.visible = false;
         if(this.heroView.§_-A3x§)
         {
            this.heroView.§_-A3x§.visible = false;
         }
         this.heroView.circle.visible = false;
         this.heroView.§_-Ks§();
         this.isDead = true;
         this.body.SetActive(false);
         this.left = false;
         this.right = false;
         this.up = false;
         if(this.§_-U1P§)
         {
            this.§_-U1P§.visible = false;
         }
         this.update();
         if(param1)
         {
            this.§_-q27§ = false;
         }
         if(this.heroView.§_-t2V§)
         {
            (this.heroView.§_-t2V§ as §_-23o§).setState(§_-h1o§);
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.HIDE,this));
      }
      
      public function onHollow(param1:int = 0) : void
      {
         if(this.isSelf)
         {
            if(Game.activated)
            {
               if(Game.state >= 6)
               {
                  if(Game.state <= 8)
                  {
                     Game.state = 11;
                     Game.target = null;
                     §_-u24§.sendMessage(Game.selfId,"[AUTO] Дупло подтверждено. Жду новый раунд.",§_-g1j§.§_-j1p§);
                  }
               }
            }
         }
         dispatchEvent(new Event(Hero.§_-N2i§));
         dispatchEvent(new Event(Hero.§_-J2F§));
         dispatchEvent(new Event(Hero.§_-V§));
         dispatchEvent(new HollowEvent(this,param1));
         this.inHollow = true;
         this.§_-E9§();
         this.hide();
         if(Boolean(this.§_-b19§) && this.id == Game.selfId)
         {
            §_-B2U§.request(this.§_-b19§.id,§_-eT§.§_-03H§,true);
         }
      }
      
      public function set dead(param1:Boolean) : void
      {
         if(param1 && this.§_-b2d§ == §_-nk§ && (this.immortal || this.behaviourController.getState(§_-73t§) != null) && this.isSelf)
         {
            if(!this.shaman)
            {
               this.teleport(§_-L1F§);
            }
            else
            {
               if(!this.game || !this.game.map)
               {
                  return;
               }
               switch(this.team)
               {
                  case §_-PM§:
                  case §_-i1Y§:
                     this.teleportTo(this.game.map.§_-02q§.pop());
                     break;
                  case §_-l1B§:
                     this.teleportTo((this.game.map as §_-b13§).redShamansPosition.pop());
                     break;
                  case §_-m28§:
                     this.teleportTo((this.game.map as §_-j11§).§_-yd§.pop());
               }
            }
            if(this.§_-vs§ && this.isSelf)
            {
               this.sendLocation();
            }
            return;
         }
         if(this.isDead == param1)
         {
            return;
         }
         this.isDead = param1;
         this.heroView.dead = param1;
         if(!param1)
         {
            this.§_-b2d§ = -1;
            this.§_-31C§.stop();
            return;
         }
         if(!this.§_-03u§)
         {
            this.§_-43c§ = -1;
         }
         this.§_-03u§ = false;
         if(!(this is §_-l2C§) || !this.shaman)
         {
            this.§_-31C§.reset();
            this.§_-31C§.start();
         }
         this.left = false;
         this.right = false;
         this.up = false;
         this.§_-s23§ = false;
         this.§_-X1O§(false);
         this.hover = false;
         this.ghost = false;
         this.§_-M2I§();
         this.§_-X1I§(null);
         this.§_-E9§();
         this.§_-h1z§.reset();
         this.§_-01A§();
         dispatchEvent(new Event(Hero.§_-N2i§));
         dispatchEvent(new Event(Hero.§_-J2F§));
         dispatchEvent(new Event(Hero.§_-V§));
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-E25§,this));
      }
      
      public function getPosition() : Point
      {
         var _loc1_:b2Vec2 = this.body.GetPosition();
         return new Point(_loc1_.x * Game.§_-12A§,_loc1_.y * Game.§_-12A§);
      }
      
      public function §_-I1u§(param1:int) : void
      {
         this.heroView.§_-62F§ = param1 == §_-43e§;
         if(!this.heroView.§_-62F§)
         {
            return;
         }
         if(this.§_-114§ && param1 == §_-43e§)
         {
            this.§_-L1U§();
         }
         else
         {
            this.§_-E9§();
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-Xw§,this));
      }
      
      public function get §_-62F§() : Boolean
      {
         return this.heroView.§_-62F§;
      }
      
      public function update(param1:Number = 0) : void
      {
         if(this.isSelf)
         {
            if(Game.activated)
            {
               if(!Game.toggle)
               {
                  if(Game.state == 4)
                  {
                     if(getTimer() - Game.time >= 5000)
                     {
                        Game.state = 9;
                        Game.target = null;
                        this.§_-b2d§ = Hero.§_-41§;
                        this.dead = true;
                        return;
                     }
                  }
               }
            }
         }
         if(this.isSelf)
         {
            if(Game.activated)
            {
               if(!Game.toggle)
               {
                  if(Game.state == 6)
                  {
                     if(getTimer() - Game.time >= 5000)
                     {
                        Game.state = 9;
                        Game.target = null;
                        this.§_-b2d§ = Hero.§_-41§;
                        this.dead = true;
                        return;
                     }
                  }
               }
            }
         }
         if(Game.activated)
         {
            if(Game.state == 11)
            {
               if(Hero.self != null)
               {
                  if(!Hero.self.inHollow)
                  {
                     Game.state = 12;
                     Game.time = getTimer();
                     Game.target = null;
                     §_-u24§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 22 секунды.",§_-g1j§.§_-j1p§);
                  }
               }
            }
         }
         if(Game.activated)
         {
            if(Game.state == 12)
            {
               if(getTimer() - Game.time >= 22000)
               {
                  Game.state = 2;
                  Game.time = getTimer();
                  Game.target = null;
                  §_-u24§.sendMessage(Game.selfId,"[AUTO] Пост-раундовый КД завершён.",§_-g1j§.§_-j1p§);
               }
            }
         }
         if(this.isSelf)
         {
            if(Game.activated)
            {
               if(!Game.toggle)
               {
                  if(Game.state == 11)
                  {
                     if(!this.inHollow)
                     {
                        Game.state = 1;
                        Game.time = getTimer();
                        Game.target = null;
                        §_-u24§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 10 секунд.",§_-g1j§.§_-j1p§);
                     }
                  }
                  else if(Game.state == 7)
                  {
                     if(this.inHollow)
                     {
                        Game.state = 11;
                        Game.time = getTimer();
                        Game.target = null;
                        §_-u24§.sendMessage(Game.selfId,"[AUTO] Дупло подтверждено. Жду новый раунд.",§_-g1j§.§_-j1p§);
                     }
                  }
                  else if(Game.state == 8)
                  {
                     if(this.inHollow)
                     {
                        Game.state = 11;
                        Game.time = getTimer();
                        Game.target = null;
                        §_-u24§.sendMessage(Game.selfId,"[AUTO] Дупло подтверждено. Жду новый раунд.",§_-g1j§.§_-j1p§);
                     }
                  }
                  else if(!Hero.self.§_-62F§)
                  {
                     if(Game.state == 2)
                     {
                        var _loc2_:§_-O2k§ = this.game.map.get(§_-O2k§)[0] as §_-O2k§;
                        if(_loc2_ != null)
                        {
                           Game.target = _loc2_;
                           §_-u24§.sendMessage(Game.selfId,"[AUTO] Точка подбора найдена. Телепорт.",§_-g1j§.§_-j1p§);
                           Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"pocketTeleport":[Hero.self.id,Game.target.position.x,Game.target.position.y]}));
                           Hero.self.position = Game.target.position;
                           Hero.self.velocity = new b2Vec2();
                           Hero.self.sendLocation();
                           Game.state = 3;
                           Game.time = getTimer();
                        }
                     }
                     else if(Game.state == 3)
                     {
                        if(Game.target != null)
                        {
                           Hero.self.position = Game.target.position;
                           Hero.self.velocity = new b2Vec2();
                           if(getTimer() - Game.time >= 900)
                           {
                              Hero.self.sendLocation();
                              Game.target.§_-R2p§(new DetectHeroEvent(Hero.self,false));
                              §_-u24§.sendMessage(Game.selfId,"[AUTO] Штатный подбор ореха вызван.",§_-g1j§.§_-j1p§);
                              Game.state = 4;
                              Game.time = getTimer();
                           }
                        }
                        else
                        {
                           Game.target = null;
                           Game.state = 2;
                           Game.time = getTimer();
                        }
                     }
                     else if(Game.state == 4)
                     {
                        if(getTimer() - Game.time >= 5000)
                        {
                           Game.target = null;
                           Game.state = 2;
                           Game.time = getTimer();
                        }
                     }
                  }
               }
            }
         }
         if(this.isSelf)
         {
            if(Game.activated)
            {
               if(!Game.toggle)
               {
                  if(Game.state >= 2)
                  {
                     if(Game.state <= 4)
                     {
                        if(Hero.self.§_-62F§)
                        {
                           Game.state = 5;
                           Game.time = getTimer();
                           Game.target = null;
                           §_-u24§.sendMessage(Game.selfId,"[AUTO] Сервер подтвердил орех.",§_-g1j§.§_-j1p§);
                        }
                     }
                  }
               }
            }
         }
         if(this.isSelf)
         {
            if(Game.activated)
            {
               if(Game.toggle)
               {
                  this.immortal = Game.immortal;
                  Game.activated = false;
                  Game.state = 0;
                  Game.target = null;
                  §_-u24§.sendMessage(Game.selfId,"Автосбор выключен.",§_-g1j§.§_-j1p§);
               }
               else
               {
                  this.immortal = true;
                  while(true)
                  {
                     if(Game.state == 1)
                     {
                        if(getTimer() - Game.time < 10000)
                        {
                           break;
                        }
                        Game.state = 2;
                        Game.target = null;
                     }
                     if(Game.state == 5)
                     {
                        if(getTimer() - Game.time >= 750)
                        {
                           Game.state = 6;
                           Game.target = null;
                        }
                     }
                     break;
                  }
               }
            }
         }
         this.perkController.§_-V2w§(param1);
         this.behaviourController.update(param1);
         if(this.controller)
         {
            this.controller.active = this.heroView.visible && !this.§_-L1S§;
         }
         if(this.isDead)
         {
            return;
         }
         this.§_-K7§(param1);
         this.behaviourController.§_-k20§(param1);
         if(!this.isSelf)
         {
            return;
         }
         this.§_-n22§();
      }
      
      public function §_-K7§(param1:Number = 0) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:b2Vec2 = null;
         var _loc7_:b2Vec2 = null;
         if(Boolean(this.§_-S1P§) && Boolean(this.§_-S1P§.onFloor) && this.§_-S1P§.§_-B7§)
         {
            this.§_-n1q§ = this.§_-d22§;
            this.§_-21Y§ = this.§_-A2I§;
            this.§_-G1k§ = null;
         }
         if(this.§_-h14§)
         {
            this.mass = this.mass;
            this.§_-h14§ = false;
         }
         if(this.§_-A2R§)
         {
            this.§_-S2Y§ = this.§_-S2Y§;
            this.§_-A2R§ = false;
         }
         if(this.§_-IC§)
         {
            this.§_-s2i§.SetRestitution(this.§_-QE§);
            this.§_-IC§ = false;
         }
         this.body.SetAwake(true);
         if(this.heroView.§_-52A§ && this.§_-S1P§.onFloor && this.isSelf)
         {
            this.§_-W1i§();
         }
         this.heroView.§_-52A§ = this.hover || !this.§_-S1P§.onFloor && !((this.swim || this.climbing) && (this.left || this.right || this.up) || this.§_-I2V§);
         this.heroView.running = (this.left || this.right) && !(this.left && this.right) && (!this.heroView.§_-dU§ || this.heroView.§_-dU§ && this.§_-Uz§) || this.up && this.swim || this.up && this.climbing;
         this.heroView.update();
         this.§_-s2i§.SetFriction(this.heroView.running ? 0 : this.§_-O2V§);
         var _loc2_:b2Vec2 = this.body.GetLinearVelocity().Copy();
         var _loc3_:Boolean = this.body.GetAngle() != 0;
         if(_loc3_)
         {
            _loc2_.MulM(this.body.GetTransform().R.GetInverse(new b2Mat22()));
         }
         if(this.up && this.§_-F1u§.length != 0)
         {
            for each(_loc4_ in this.§_-F1u§)
            {
               if(_loc2_.y > _loc4_)
               {
                  _loc2_.y = _loc4_;
               }
            }
         }
         if((this.left || this.right) && !(this.left && this.right) && !this.heroView.§_-dU§)
         {
            _loc5_ = this.behaviourController.getState(§_-I2P§) != null ? -1 : 1;
            _loc5_ *= this.questFactor;
            if(this.§_-S1P§.onFloor)
            {
               _loc2_.x += (this.left ? -1 : 1) * (this.§_-c2e§ * 0.5 * this.scale) * _loc5_;
               _loc2_.x = Math.abs(_loc2_.x) < this.actualSpeed ? Number(_loc2_.x) : (this.left ? -this.actualSpeed : this.actualSpeed) * _loc5_;
            }
            else if(this.up)
            {
               _loc2_.x += (this.left ? -1 : 1) * (this.§_-c2e§ * 0.5 * this.scale) * _loc5_;
               _loc2_.x = Math.abs(_loc2_.x) < this.actualSpeed ? Number(_loc2_.x) : (this.left ? -this.actualSpeed : this.actualSpeed) * _loc5_ * this.§_-Y§;
            }
            else
            {
               _loc2_.x += (this.left ? -1 : 1) * (this.§_-11m§ * this.scale) * _loc5_;
               _loc2_.x = Math.abs(_loc2_.x) < this.actualSpeed ? Number(_loc2_.x) : (this.left ? -this.actualSpeed : this.actualSpeed) * _loc5_;
            }
            if(this.swim)
            {
               _loc2_.x *= this.§_-W2Q§;
            }
            this.heroView.direction = this.left && _loc5_ > 0 || !this.left && _loc5_ < 0;
         }
         if(_loc3_)
         {
            _loc2_.MulM(this.body.GetTransform().R);
         }
         this.body.SetLinearVelocity(_loc2_);
         if((this.isHare && !(this.heroView.§_-t2V§ as §_-23o§).§_-b2J§ || this.isScrat) && this.§_-62F§)
         {
            if(Boolean(self && !self.§_-62F§) && Boolean(!(this.isHare && self.isHare)) && !(this.isScrat && !this.acornShare))
            {
               _loc6_ = self.position.Copy();
               _loc6_.Subtract(this.position);
               if(_loc6_.Length() < 4)
               {
                  (this.game.map.get(§_-O2k§)[0] as §_-O2k§).§_-R2p§(new DetectHeroEvent(self,false));
                  if(this.isScrat)
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-n2p§,1,this.id);
                  }
               }
            }
         }
         this.swim = false;
         this.§_-I2V§ = false;
         if(Boolean(this.§_-I2j§) && (this.heroView.running || this.heroView.§_-52A§))
         {
            _loc7_ = this.§_-I2j§.Copy();
            _loc7_.Normalize();
            _loc7_.Multiply(§_-GW§);
            this.position.Add(_loc7_);
            this.body.SetPosition(this.position);
            this.§_-I2j§.Subtract(_loc7_);
            if(this.§_-I2j§.Length() < §_-GW§)
            {
               this.§_-I2j§ = null;
            }
         }
         this.§_-N§();
         this.extGravity.SetZero();
         this.useGravity = true;
      }
      
      public function §_-S13§() : void
      {
         if(this.game.cast.radius == 0)
         {
            return;
         }
         this.heroView.circle.visible = true;
         this.§_-l1n§();
      }
      
      public function §_-gz§(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Boolean = this.heroView.circle.currentFrame > 1;
         if(_loc2_)
         {
            this.heroView.circle.visible = false;
            _loc3_ = this.heroView.circle.currentFrame;
            this.heroView.circle.gotoAndStop(0);
         }
         this.heroView.circle.rotation = 0;
         this.heroView.circle.scaleXY(param1 / this.heroView.§_-C15§);
         if(_loc2_)
         {
            this.heroView.circle.gotoAndStop(_loc3_);
            this.heroView.circle.visible = true;
         }
         this.§_-l1n§();
      }
      
      public function §_-NI§() : void
      {
         this.heroView.circle.visible = false;
      }
      
      public function §_-RM§() : void
      {
         this.isDead = this.id == Game.selfId ? this.isDead : false;
         this.show();
      }
      
      public function §_-kl§(param1:int = -1) : void
      {
         if(this.id != Game.selfId && this.id > 0)
         {
            return;
         }
         if(this.§_-G2P§.running && this.id > 0)
         {
            return;
         }
         if(this.immortal || this.behaviourController.getState(§_-73t§) != null)
         {
            return;
         }
         if(!this.isDead)
         {
            this.§_-62D§();
         }
         this.§_-03u§ = true;
         this.§_-43c§ = param1;
         this.dead = true;
         this.dispatchEvent(new Event(Hero.§_-h1i§));
      }
      
      public function §_-h2e§() : void
      {
         this.§_-G2P§.reset();
         this.§_-G2P§.start();
         this.respawnAnimation();
      }
      
      public function respawn(param1:int = 0) : void
      {
         if(!this.isDead)
         {
            return;
         }
         if(this.body)
         {
            this.body.renewTransform();
         }
         dispatchEvent(new Event(Hero.§_-N2i§));
         dispatchEvent(new Event(Hero.§_-J2F§));
         dispatchEvent(new Event(Hero.§_-V§));
         this.dead = false;
         this.§_-s23§ = false;
         this.§_-X1O§(false);
         this.ghost = false;
         this.velocity = new b2Vec2();
         this.heroView.§_-Ks§();
         if(this.isSelf)
         {
            this.show();
         }
         switch(param1)
         {
            case §_-C2T§:
               this.§_-h2e§();
               break;
            case §_-z29§:
               this.§_-71q§();
         }
         if(this.§_-vs§ && this.isSelf)
         {
            this.sendLocation();
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-R1y§,this));
      }
      
      public function jump(param1:Boolean) : void
      {
         var _loc4_:Boolean = false;
         this.up = param1;
         if(this.heroView.§_-dU§)
         {
            return;
         }
         var _loc2_:§_-B3z§ = this.behaviourController.getState(§_-it§) as §_-it§;
         if(!_loc2_)
         {
            _loc2_ = this.behaviourController.getState(§_-hs§) as §_-hs§;
         }
         if(_loc2_ != null)
         {
            _loc2_.active = param1;
            return;
         }
         if(!param1)
         {
            return;
         }
         var _loc3_:Boolean = this.§_-L2u§;
         dispatchEvent(new Event(Hero.§_-N2i§));
         dispatchEvent(new Event(Hero.§_-y2y§));
         if(_loc3_ || this.behaviourController.getState(§_-f6§) != null)
         {
            return;
         }
         if(this.§_-S1P§.onFloor || this.§_-n1q§ > 0 || this.§_-21Y§ > 0 || this.§_-j1J§)
         {
            if(this.§_-S1P§.onFloor && this.§_-S1P§.§_-B7§)
            {
               _loc4_ = true;
               this.§_-G1k§ = this.position.Copy();
            }
            else
            {
               _loc4_ = this.§_-j1J§;
               if(!_loc4_ && this.§_-21Y§ > 0)
               {
                  if(Boolean(this.§_-G1k§) && !this.§_-m1z§)
                  {
                     --this.§_-21Y§;
                     _loc4_ = true;
                  }
               }
               if(!_loc4_ && this.§_-n1q§ > 0)
               {
                  if(this.id == Game.selfId)
                  {
                     GameSounds.playUnrepeatable("double_jump");
                  }
                  dispatchEvent(new Event(Hero.§_-21z§));
                  --this.§_-n1q§;
                  _loc4_ = true;
               }
            }
            if(!_loc4_)
            {
               return;
            }
            if(this.id == Game.selfId)
            {
               GameSounds.play("jump1");
            }
            this.velocity.MulM(this.body.GetTransform().R.GetInverse(new b2Mat22()));
            this.velocity.y = this.§_-S1P§.onFloor ? -this.§_-pD§ : -this.§_-pD§ * this.§_-Y1I§;
            this.velocity.MulM(this.body.GetTransform().R);
            this.body.SetLinearVelocity(this.velocity);
         }
         dispatchEvent(new Event(Hero.EVENT_UP_END));
      }
      
      public function moveLeft(param1:Boolean) : void
      {
         if(this.heroView.§_-dU§ && !this.§_-Uz§ && param1)
         {
            return;
         }
         this.left = param1;
         if(param1)
         {
            this.heroView.direction = true;
         }
      }
      
      public function moveRight(param1:Boolean) : void
      {
         if(this.heroView.§_-dU§ && !this.§_-Uz§ && param1)
         {
            return;
         }
         this.right = param1;
         if(param1)
         {
            this.heroView.direction = false;
         }
      }
      
      public function §_-L1U§() : void
      {
         var _loc2_:§_-O2k§ = null;
         var _loc3_:int = 0;
         if(this.isHare && !this.§_-l24§)
         {
            _loc3_ = Math.random() * §_-RH§.§_-c21§.length;
            GameSounds.playUnrepeatable(§_-RH§.§_-c21§[_loc3_],§_-23o§.§_-Q0§);
         }
         var _loc1_:Array = this.game.map.get(§_-O2k§);
         this.§_-l24§ = true;
         for each(_loc2_ in _loc1_)
         {
            _loc2_.alpha = 0;
         }
      }
      
      public function §_-E9§() : void
      {
         var _loc1_:Hero = null;
         var _loc3_:§_-O2k§ = null;
         if(!this.§_-l24§)
         {
            return;
         }
         this.§_-l24§ = false;
         for each(_loc1_ in this.game.squirrels.players)
         {
            if(_loc1_.§_-AS§)
            {
               return;
            }
         }
         if(!this.game.map)
         {
            return;
         }
         var _loc2_:Array = this.game.map.get(§_-O2k§);
         for each(_loc3_ in _loc2_)
         {
            _loc3_.alpha = 1;
         }
      }
      
      public function §_-21b§(param1:§_-53o§) : void
      {
         if(this.controller)
         {
            this.controller.remove();
         }
         this.controller = param1;
         if(this.controller == null)
         {
            return;
         }
         this.controller.§_-22g§ = this.isStopped;
         this.controller.active = this.heroView.visible;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:* = param1.GetFixtureA().GetBody().GetUserData();
         var _loc3_:* = param1.GetFixtureB().GetBody().GetUserData();
         if(!(_loc2_ is Hero) || !(_loc3_ is Hero) || !this.isSelf)
         {
            return;
         }
         var _loc4_:Hero = _loc2_ == this ? _loc3_ : _loc2_;
         if(_loc4_.§_-s23§ && !this.isHare && !this.isDead)
         {
            this.game.squirrels.§_-01a§(this.id,_loc4_.id);
         }
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         if(this.behaviourController.getState(§_-f6§) != null)
         {
            param1.SetEnabled(false);
         }
         var _loc3_:* = param1.GetFixtureA().GetBody().GetUserData();
         if(_loc3_ == this)
         {
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(_loc3_ is §_-92B§ && !this.§_-z20§)
         {
            param1.SetEnabled(false);
         }
         else if(_loc3_ is §_-o25§ && !(_loc3_ is §_-92B§) && this.§_-z20§)
         {
            param1.SetEnabled(false);
         }
         if(this.ghost)
         {
            param1.SetEnabled(false);
         }
         if(this.§_-G2P§.running && (_loc3_ is §_-sn§ || _loc3_ is §_-A1d§ || _loc3_ is §_-N2K§))
         {
            param1.SetEnabled(false);
         }
         if(_loc3_ is GameBody && (_loc3_ as GameBody).ghost)
         {
            param1.SetEnabled(false);
         }
         if(_loc3_ is §_-L1q§ && (_loc3_ as §_-L1q§).§_-sP§(this.id))
         {
            param1.SetEnabled(false);
         }
         if(_loc3_ is §_-Y1e§)
         {
            if(this.friction <= 0)
            {
               param1.SetEnabled(false);
            }
            if(param1.IsEnabled())
            {
               (_loc3_ as §_-Y1e§).§_-eI§(this);
            }
         }
         if(!(_loc3_ is Hero))
         {
            return;
         }
         if(this.isHare && !(this.world.userData as SquirrelGame).§_-O1B§.ShouldCollide(param1.GetFixtureA(),param1.GetFixtureB()))
         {
            param1.SetEnabled(false);
            return;
         }
         var _loc4_:Hero = _loc3_ as Hero;
         if(this.isHare && _loc4_.§_-s23§ && !this.§_-6l§)
         {
            param1.SetEnabled(false);
         }
         if(this.§_-s23§ || _loc4_.§_-s23§)
         {
            param1.SetEnabled(false);
         }
         if(!this.§_-42S§)
         {
            return;
         }
         if(this.§_-M2i§ || _loc4_.§_-M2i§)
         {
            param1.SetEnabled(true);
            return;
         }
         param1.SetEnabled(this.body.GetLocalVector(_loc4_.position).y - this.body.GetLocalVector(this.position).y > 3.5 * _loc4_.scale);
         if(_loc4_.§_-42S§ && this.body.GetLocalVector(this.position).y - this.body.GetLocalVector(_loc4_.position).y > 3.5 * this.scale)
         {
            param1.SetEnabled(true);
         }
      }
      
      public function get position() : b2Vec2
      {
         if(!this.body)
         {
            return new b2Vec2();
         }
         return this.body.GetPosition();
      }
      
      public function set position(param1:b2Vec2) : void
      {
         if(!this.body)
         {
            return;
         }
         this.body.SetPosition(param1);
         this.§_-N§();
      }
      
      public function get velocity() : b2Vec2
      {
         if(!this.body)
         {
            return new b2Vec2();
         }
         return this.body.GetLinearVelocity();
      }
      
      public function set velocity(param1:b2Vec2) : void
      {
         if(!this.body)
         {
            return;
         }
         this.body.SetLinearVelocity(param1);
      }
      
      public function changeView(param1:Sprite = null, param2:Boolean = true) : void
      {
         var _loc3_:Number = this.scale;
         this.scale = 1;
         this.heroView.§_-91w§(param1,param2);
         this.scale = _loc3_;
      }
      
      public function §_-s28§(param1:DisplayObject, param2:Boolean = false, param3:Boolean = true) : void
      {
         this.heroView.§_-s28§(param1,param2,param3);
      }
      
      public function addViewButton(param1:DisplayObject) : void
      {
         if(this.§_-632§ is §_-w23§)
         {
            (this.§_-632§ as §_-w23§).reset();
         }
         if(Boolean(this.§_-632§) && Boolean(this.§_-632§.parent))
         {
            this.§_-632§.parent.removeChild(this.§_-632§);
         }
         this.§_-632§ = param1;
         this.§_-632§.y = this.heroView.y;
         addChild(this.§_-632§);
      }
      
      public function §_-W1T§(param1:§_-Q2h§, param2:Timer = null) : void
      {
         if(!this.isSelf || !this.§_-U1P§ || !param1)
         {
            return;
         }
         this.§_-U1P§.§_-W1T§(param1,param2);
      }
      
      public function removeBuff(param1:§_-Q2h§, param2:Timer = null) : void
      {
         if(!this.isSelf || !this.§_-U1P§ || !param1)
         {
            return;
         }
         this.§_-U1P§.§_-P1T§(param1,param2);
      }
      
      public function §_-J1G§(param1:Boolean) : void
      {
         if(!this.isSelf || !this.§_-U1P§)
         {
            return;
         }
         this.§_-U1P§.visible = param1;
      }
      
      public function §_-f2g§(param1:int) : void
      {
         if(param1 == §_-Q2c§)
         {
            return;
         }
         this.heroView.§_-f2g§(param1);
      }
      
      public function get team() : int
      {
         return this.§_-6n§;
      }
      
      public function set team(param1:int) : void
      {
         if(this.§_-6n§ == param1)
         {
            return;
         }
         this.§_-6n§ = param1;
         this.heroView.team = this.team;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-F2W§,this));
      }
      
      public function get mass() : int
      {
         return this.§_-kQ§;
      }
      
      public function set mass(param1:int) : void
      {
         this.§_-kQ§ = param1;
         var _loc2_:b2MassData = new b2MassData();
         this.body.GetMassData(_loc2_);
         _loc2_.mass = param1;
         if(this.body.GetWorld().IsLocked())
         {
            this.§_-h14§ = true;
            return;
         }
         this.body.SetMassData(_loc2_);
      }
      
      public function get §_-S2Y§() : Number
      {
         return this.§_-2K§;
      }
      
      public function set §_-S2Y§(param1:Number) : void
      {
         this.§_-2K§ = param1;
         var _loc2_:b2MassData = new b2MassData();
         this.body.GetMassData(_loc2_);
         _loc2_.I = param1;
         if(this.body.GetWorld().IsLocked())
         {
            this.§_-A2R§ = true;
            return;
         }
         this.body.SetMassData(_loc2_);
      }
      
      public function get §_-Y1I§() : Number
      {
         return this.§_-m2g§;
      }
      
      public function set §_-Y1I§(param1:Number) : void
      {
         this.§_-m2g§ = param1;
      }
      
      public function get §_-d22§() : int
      {
         return this.§_-H1V§;
      }
      
      public function set §_-d22§(param1:int) : void
      {
         this.§_-H1V§ = param1;
      }
      
      public function get §_-A2I§() : int
      {
         return this.§_-aP§;
      }
      
      public function set §_-A2I§(param1:int) : void
      {
         this.§_-aP§ = param1;
      }
      
      public function get §_-c2e§() : int
      {
         return this.§_-7M§;
      }
      
      public function set §_-c2e§(param1:int) : void
      {
         this.§_-7M§ = param1;
      }
      
      public function get swimFactor() : Number
      {
         return this.§_-W2Q§;
      }
      
      public function set swimFactor(param1:Number) : void
      {
         this.§_-W2Q§ = param1;
      }
      
      public function get actualSpeed() : Number
      {
         return this.§_-M2y§ * (this.isHare ? §_-Rc§ : (this.behaviourController.getState(§_-I2P§) != null ? §_-K1v§ : 1));
      }
      
      public function get runSpeed() : Number
      {
         return this.§_-M2y§;
      }
      
      public function set runSpeed(param1:Number) : void
      {
         this.§_-M2y§ = param1;
      }
      
      public function get §_-11m§() : int
      {
         return this.§_-D13§;
      }
      
      public function set §_-11m§(param1:int) : void
      {
         this.§_-D13§ = param1;
      }
      
      public function get jumpVelocity() : int
      {
         return this.§_-q1h§;
      }
      
      public function set jumpVelocity(param1:int) : void
      {
         this.§_-q1h§ = param1;
      }
      
      public function get §_-pD§() : int
      {
         if(this.isHare)
         {
            return this.jumpVelocity + §_-03I§;
         }
         if(this.isDragon)
         {
            return this.jumpVelocity + §_-j2I§;
         }
         return this.jumpVelocity;
      }
      
      public function get friction() : Number
      {
         return this.§_-O2V§;
      }
      
      public function set friction(param1:Number) : void
      {
         this.§_-O2V§ = param1;
      }
      
      public function set restitution(param1:Number) : void
      {
         this.§_-QE§ = param1;
      }
      
      public function get scale() : Number
      {
         return this.§_-a12§;
      }
      
      public function set scale(param1:Number) : void
      {
         var _loc3_:§_-p1B§ = null;
         var _loc4_:Number = NaN;
         if(this.onRemove)
         {
            return;
         }
         if(param1 == 1)
         {
            for each(_loc3_ in this.perkController.§_-ov§)
            {
               if(_loc3_ is §_-Ta§ && _loc3_.active)
               {
                  _loc4_ = §_-Ta§(_loc3_).scale;
               }
            }
         }
         this.§_-a12§ = param1;
         this.heroView.scale = _loc4_ || param1;
         var _loc2_:b2CircleShape = new b2CircleShape(2 * param1);
         this.§_-s2i§.GetShape().Set(_loc2_);
         _loc2_ = new b2CircleShape(1.9 * param1);
         _loc2_.SetLocalPosition(new b2Vec2(0,0.2 * param1));
         this.§_-L1G§.GetShape().Set(_loc2_);
         dispatchEvent(new Event(Hero.§_-Dc§));
      }
      
      public function get §_-42S§() : Boolean
      {
         return this.§_-Oz§ > 0;
      }
      
      public function set §_-42S§(param1:Boolean) : void
      {
         this.§_-Oz§ = Math.max(0,this.§_-Oz§ + (param1 ? 1 : -1));
         var _loc2_:b2FilterData = this.§_-s2i§.GetFilterData();
         _loc2_.categoryBits = this.§_-42S§ ? uint(_loc2_.categoryBits | §_-q2c§.§_-ZZ§) : uint(_loc2_.categoryBits & ~§_-q2c§.§_-ZZ§);
         _loc2_.maskBits = this.§_-42S§ ? uint(_loc2_.maskBits | §_-q2c§.§_-rT§) : uint(_loc2_.maskBits & ~§_-q2c§.§_-rT§);
         this.§_-s2i§.SetFilterData(_loc2_);
         var _loc3_:b2FilterData = this.§_-L1G§.GetFilterData();
         _loc3_.categoryBits = this.§_-42S§ ? uint(_loc3_.categoryBits | §_-q2c§.§_-o1Z§) : uint(_loc3_.categoryBits & ~§_-q2c§.§_-o1Z§);
         _loc3_.maskBits = this.§_-42S§ ? uint(_loc3_.maskBits | §_-q2c§.§_-rT§) : uint(_loc3_.maskBits & ~§_-q2c§.§_-rT§);
         this.§_-L1G§.SetFilterData(_loc3_);
      }
      
      public function get §_-M2i§() : Boolean
      {
         return this.§_-O2h§;
      }
      
      public function set §_-M2i§(param1:Boolean) : void
      {
         this.§_-O2h§ = param1;
         this.§_-42S§ = param1;
      }
      
      public function get §_-z20§() : Boolean
      {
         return this.§_-M1Z§;
      }
      
      public function set §_-z20§(param1:Boolean) : void
      {
         this.§_-M1Z§ = param1;
         this.heroView.alpha = param1 ? 0.4 : 1;
         if(this.§_-f2q§ != null)
         {
            this.§_-f2q§.§_-kl§();
         }
         this.§_-f2q§ = null;
      }
      
      public function get §_-vs§() : Boolean
      {
         return this.§_-L2c§;
      }
      
      public function set §_-vs§(param1:Boolean) : void
      {
         this.§_-L2c§ = param1;
      }
      
      public function set §_-GB§(param1:Boolean) : void
      {
         this.§_-02P§ = param1;
         if(Boolean(this.heroView.§_-A3x§) && Boolean(this.heroView.§_-A3x§.parent) && !param1)
         {
            this.heroView.§_-A3x§.parent.removeChild(this.heroView.§_-A3x§);
         }
         if(!this.heroView.§_-A3x§ && param1)
         {
            this.heroView.§_-A3x§ = new WizardAura();
            this.heroView.§_-A3x§.mouseEnabled = false;
         }
         if(Boolean(this.heroView.§_-A3x§) && Boolean(!this.heroView.§_-A3x§.parent) && param1)
         {
            this.game.addChild(this.heroView.§_-A3x§);
         }
         if(param1)
         {
            this.§_-l1n§();
         }
      }
      
      public function get §_-GB§() : Boolean
      {
         return this.§_-02P§;
      }
      
      public function get perksAvailable() : Boolean
      {
         return this.§_-f1K§;
      }
      
      public function set perksAvailable(param1:Boolean) : void
      {
         if(this.§_-f1K§ == param1)
         {
            return;
         }
         this.§_-f1K§ = param1;
         §_-a2p§.§_-419§();
      }
      
      public function teleport(param1:int, param2:b2Vec2 = null) : void
      {
         switch(param1)
         {
            case §_-L1F§:
               if(!this.shaman || this.isDead)
               {
                  param2 = this.game.squirrels.§_-u12§(this.id,this.team);
               }
               this.teleportTo(param2);
               if(this is §_-l2C§ && this.isSelf)
               {
                  setTimeout(this.sendLocation,0);
               }
               break;
            case §_-E2Y§:
               if(this.game.map.§_-K2H§)
               {
                  this.teleportTo(this.game.map.§_-K2H§);
               }
               else
               {
                  this.teleport(§_-L1F§);
               }
         }
      }
      
      public function teleportTo(param1:b2Vec2) : void
      {
         if(!this.§_-K13§)
         {
            return;
         }
         if(Boolean(param1) && (isNaN(param1.x) || isNaN(param1.y)))
         {
            §_-p2U§.add("Hero.teleportTo skipped NaN",this.id,param1.x,param1.y);
            return;
         }
         dispatchEvent(new Event(Hero.§_-y2S§));
         this.velocity = new b2Vec2();
         if(param1)
         {
            this.position = param1;
         }
         if(!this.shaman || this.isDead)
         {
            if(this is §_-V1t§ && (this.id == Game.selfId || this == Hero.self))
            {
               this.game.camera.enabled = true;
               if(this.game is §_-cV§)
               {
                  (this.game as §_-cV§).§_-2p§();
               }
            }
            if(this.isDead && !this.inHollow && !this.isDragon && !this.isHare && !(this is §_-l2C§))
            {
               this.§_-71q§();
            }
            if(this.isHare)
            {
               this.§_-I1u§(Hero.§_-z2T§);
            }
            setTimeout(this.§_-P1F§,0);
            return;
         }
         this.heroView.§_-Ks§();
         this.show();
      }
      
      public function §_-r1C§(param1:b2Vec2) : void
      {
         var animationPos:Point = null;
         var teleportIn:TeleportIn = null;
         var teleportOut:TeleportOut = null;
         var onTeleportOut:Function = null;
         var afterTeleport:Function = null;
         var onTeleportIn:Function = null;
         var position:b2Vec2 = param1;
         if(!this.game || !this.game.squirrels || !this.heroView)
         {
            return;
         }
         animationPos = this.game.squirrels.globalToLocal(this.heroView.localToGlobal(new Point()));
         teleportIn = new TeleportIn();
         teleportOut = new TeleportOut();
         teleportIn.x = animationPos.x;
         teleportIn.y = animationPos.y;
         onTeleportOut = function(param1:Event):void
         {
            teleportOut.stop();
            teleportOut.removeEventListener(Event.CHANGE,onTeleportOut);
            if(teleportOut.parent)
            {
               teleportOut.parent.removeChild(teleportOut);
            }
            isStopped = false;
         };
         afterTeleport = function():void
         {
            if(!game || !game.squirrels || !heroView || !§_-K13§)
            {
               isStopped = false;
               return;
            }
            animationPos = game.squirrels.globalToLocal(heroView.localToGlobal(new Point()));
            teleportOut.x = animationPos.x;
            teleportOut.y = animationPos.y;
            teleportOut.play();
            game.squirrels.addChild(teleportOut);
            teleportOut.addEventListener(Event.CHANGE,onTeleportOut);
         };
         onTeleportIn = function(param1:Event):void
         {
            teleportIn.stop();
            teleportIn.removeEventListener(Event.CHANGE,onTeleportIn);
            if(teleportIn.parent)
            {
               teleportIn.parent.removeChild(teleportIn);
            }
            if(isDead)
            {
               isStopped = false;
               return;
            }
            if(!game || !game.squirrels || !§_-K13§)
            {
               isStopped = false;
               return;
            }
            teleportTo(position);
            setTimeout(afterTeleport,0);
         };
         teleportIn.addEventListener(Event.CHANGE,onTeleportIn);
         teleportIn.play();
         this.game.squirrels.addChild(teleportIn);
         this.isStopped = true;
      }
      
      public function get sideIcon() : §_-aS§
      {
         if(!this.icon)
         {
            this.icon = new §_-D1m§(§_-D1m§.§_-E26§,§_-D1m§.§_-Q1O§);
         }
         return this.icon;
      }
      
      public function get showIcon() : Boolean
      {
         if(this.§_-N1U§ || this.§_-Rb§)
         {
            return true;
         }
         return !this.isDead && !this.inHollow && this.heroView.visible && (this.id == Hero.§_-M1O§ || this.shaman || this.isHare || this.id < 0);
      }
      
      public function §_-Jw§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.§_-N1U§ || this.§_-Rb§)
         {
            _loc1_ = §_-D1m§.§_-f2D§;
            _loc2_ = this.§_-Rb§ ? §_-D1m§.§_-qP§ : §_-D1m§.§_-Cb§;
         }
         else
         {
            if(this.id == Hero.§_-M1O§)
            {
               _loc1_ = §_-D1m§.§_-E26§;
            }
            else if(this.isHare)
            {
               _loc1_ = this.§_-62F§ ? §_-D1m§.§_-o1U§ : §_-D1m§.§_-f2D§;
            }
            else
            {
               switch(this.team)
               {
                  case §_-l1B§:
                     _loc1_ = §_-D1m§.§_-f2D§;
                     break;
                  case §_-m28§:
                     _loc1_ = §_-D1m§.§_-j10§;
                     break;
                  default:
                     _loc1_ = §_-D1m§.§_-kY§;
               }
            }
            if(this.isHare)
            {
               _loc2_ = §_-D1m§.§_-qf§;
            }
            else if(this.isDragon)
            {
               _loc2_ = §_-D1m§.§_-h8§;
            }
            else if(this.shaman)
            {
               switch(this.team)
               {
                  case §_-l1B§:
                     _loc2_ = §_-D1m§.§_-P1n§;
                     break;
                  case §_-m28§:
                     _loc2_ = §_-D1m§.§_-737§;
                     break;
                  default:
                     _loc2_ = §_-D1m§.§_-E1V§;
               }
            }
            else
            {
               _loc2_ = §_-D1m§.§_-Q1O§;
            }
         }
         if(_loc1_ == this.§_-23I§ && _loc2_ == this.§_-32Y§)
         {
            return;
         }
         var _loc3_:§_-D1m§ = this.icon as §_-D1m§;
         if(!_loc3_)
         {
            this.§_-23I§ = _loc1_;
            this.§_-32Y§ = _loc2_;
            this.icon = new §_-D1m§(_loc1_,_loc2_);
            return;
         }
         if(_loc2_ != this.§_-32Y§)
         {
            this.§_-32Y§ = _loc2_;
            _loc3_.icon = _loc2_;
         }
         if(_loc1_ != this.§_-23I§)
         {
            this.§_-23I§ = _loc1_;
            _loc3_.color = _loc1_;
         }
      }
      
      public function get isHare() : Boolean
      {
         return this.§_-h1l§;
      }
      
      public function set isHare(param1:Boolean) : void
      {
         if(this.§_-h1l§ == param1)
         {
            return;
         }
         this.§_-h1l§ = param1;
         this.heroView.isHare = param1;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-71l§,this));
         §_-p2U§.add("Hare ",this.id,param1);
         this.§_-z5§();
      }
      
      public function get isSquirrel() : Boolean
      {
         return !(this.isDragon || this.isScrat || this.isHare || this.shaman);
      }
      
      public function get isScrat() : Boolean
      {
         return this.§_-yp§ && !this.isDragon && !this.isHare && !this.shaman;
      }
      
      public function set isScrat(param1:Boolean) : void
      {
         if(this.§_-yp§ == param1)
         {
            return;
         }
         this.§_-yp§ = param1;
         this.heroView.isScrat = param1;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-rR§,this));
         §_-p2U§.add("Scrat ",this.id,param1);
      }
      
      public function get isDragon() : Boolean
      {
         return this.§_-72u§;
      }
      
      public function set isDragon(param1:Boolean) : void
      {
         if(this.§_-72u§ == param1)
         {
            return;
         }
         this.§_-72u§ = param1;
         this.heroView.isDragon = param1;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-Z1h§,this));
         §_-p2U§.add("Dragon ",this.id,param1);
         this.§_-z5§();
      }
      
      public function get §_-Z1H§() : int
      {
         if(this.shaman)
         {
            return §_-P2x§.§_-qQ§;
         }
         if(this.isHare)
         {
            return §_-P2x§.§_-M2M§;
         }
         if(this.isDragon)
         {
            return §_-P2x§.§_-JW§;
         }
         return §_-P2x§.§_-V1n§;
      }
      
      public function get §_-6l§() : Boolean
      {
         return this.§_-F1A§;
      }
      
      public function set §_-6l§(param1:Boolean) : void
      {
         this.§_-F1A§ = param1;
         var _loc2_:b2FilterData = this.§_-s2i§.GetFilterData();
         _loc2_.categoryBits = param1 ? uint(_loc2_.categoryBits | §_-q2c§.§_-wI§) : uint(_loc2_.categoryBits & ~§_-q2c§.§_-wI§);
         _loc2_.maskBits = param1 ? uint(_loc2_.maskBits | §_-q2c§.§_-rT§) : uint(_loc2_.maskBits & ~§_-q2c§.§_-rT§);
         this.§_-s2i§.SetFilterData(_loc2_);
         var _loc3_:b2FilterData = this.§_-L1G§.GetFilterData();
         _loc3_.categoryBits = param1 ? uint(_loc3_.categoryBits | §_-q2c§.§_-wI§) : uint(_loc3_.categoryBits & ~§_-q2c§.§_-wI§);
         _loc3_.maskBits = param1 ? uint(_loc3_.maskBits | §_-q2c§.§_-rT§) : uint(_loc3_.maskBits & ~§_-q2c§.§_-rT§);
         this.§_-L1G§.SetFilterData(_loc3_);
      }
      
      public function get §_-s23§() : Boolean
      {
         return this.§_-S11§;
      }
      
      public function set §_-s23§(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         this.§_-S11§ = param1;
         var _loc2_:b2FilterData = this.§_-s2i§.GetFilterData();
         _loc2_.categoryBits = param1 ? uint(_loc2_.categoryBits | §_-q2c§.§_-D28§) : uint(_loc2_.categoryBits & ~§_-q2c§.§_-D28§);
         _loc2_.maskBits = param1 || this.§_-6l§ ? uint(_loc2_.maskBits | §_-q2c§.§_-rT§) : uint(_loc2_.maskBits & ~§_-q2c§.§_-rT§);
         this.§_-s2i§.SetFilterData(_loc2_);
         this.heroView.§_-s23§ = param1;
         if(param1)
         {
            _loc3_ = §_-u24§.mode == §_-at§.§_-q1I§ ? 10000 : 30000;
            setTimeout(this.breakGum,_loc3_);
         }
      }
      
      public function get §_-a1w§() : Boolean
      {
         return this.§_-2b§;
      }
      
      public function §_-X1O§(param1:Boolean, param2:String = "") : void
      {
         if(this.§_-2b§ == param1)
         {
            return;
         }
         this.§_-2b§ = param1;
         if(param1)
         {
            this.applyEffect(param2);
         }
         else
         {
            this.disableEffect(this.§_-02d§[§_-w10§.§_-e2i§] ? §_-w10§.§_-e2i§ : §_-w10§.§_-h2G§);
         }
      }
      
      public function applyEffect(param1:String, param2:int = 1, param3:Boolean = true) : §_-11u§
      {
         var _loc4_:§_-11u§ = §_-w10§.instance.§_-d1y§(param1);
         if(param3)
         {
            _loc4_.start();
         }
         this.§_-02d§[param1] = _loc4_;
         this.getStarlingView().parent.addChildAt(_loc4_.view,this.getStarlingView().parent.getChildIndex(this.getStarlingView()) + param2);
         return _loc4_;
      }
      
      public function disableEffect(param1:String) : void
      {
         var _loc2_:§_-11u§ = this.§_-02d§[param1];
         if(!_loc2_)
         {
            return;
         }
         _loc2_.stop();
         §_-w10§.instance.§_-L1c§(_loc2_);
         delete this.§_-02d§[param1];
      }
      
      public function set §_-v28§(param1:Boolean) : void
      {
         if(this.§_-L1S§ == param1)
         {
            return;
         }
         this.§_-L1S§ = param1;
         this.isStopped = param1;
         if(param1)
         {
            setTimeout(this.heroView.§_-73j§,0,Hero.§_-o1K§);
         }
         else if(this.heroView.§_-n1e§ == Hero.§_-o1K§)
         {
            this.heroView.§_-Ks§();
         }
      }
      
      public function set §_-Qh§(param1:Boolean) : void
      {
         if(this.§_-j1J§ == param1)
         {
            return;
         }
         this.§_-j1J§ = param1;
         this.§_-m2g§ *= param1 ? 3 : 1 / 3;
      }
      
      public function get §_-Qh§() : Boolean
      {
         return this.§_-j1J§;
      }
      
      public function get immortal() : Boolean
      {
         return this.§_-w1D§;
      }
      
      public function set immortal(param1:Boolean) : void
      {
         if(this.§_-w1D§ == param1)
         {
            return;
         }
         this.§_-w1D§ = this.heroView.immortal = param1;
      }
      
      public function get §_-424§() : Boolean
      {
         return this.§_-E1a§;
      }
      
      public function set §_-424§(param1:Boolean) : void
      {
         if(this.§_-E1a§ == param1)
         {
            return;
         }
         this.§_-E1a§ = param1;
         this.isStopped = param1;
      }
      
      public function get §_-P2t§() : Boolean
      {
         return this.§_-Z2g§;
      }
      
      public function set §_-P2t§(param1:Boolean) : void
      {
         this.§_-Z2g§ = param1;
      }
      
      public function set §_-dU§(param1:Boolean) : void
      {
         var start:Function;
         var tween:§_-f1D§;
         var end:Function = null;
         var value:Boolean = param1;
         if(this.§_-c2F§ == value)
         {
            return;
         }
         this.heroView.§_-dU§ = this.§_-c2F§ = value;
         if(!value)
         {
            return;
         }
         if(this.§_-Y1P§ == null)
         {
            return;
         }
         this.§_-Y1P§.view.visible = true;
         end = function():void
         {
            if(§_-Y1P§ == null)
            {
               return;
            }
            §_-Y1P§.view.visible = false;
         };
         start = function():void
         {
            if(§_-Y1P§ == null)
            {
               return;
            }
            var _loc1_:§_-f1D§ = new §_-f1D§(§_-Y1P§.view,0.3);
            _loc1_.delay = 0.3;
            _loc1_.§_-qD§(0);
            _loc1_.onComplete = end;
            Starling.§_-zb§.add(_loc1_);
         };
         tween = new §_-f1D§(this.§_-Y1P§.view,0.3);
         tween.§_-qD§(1);
         tween.onComplete = start;
         Starling.§_-zb§.add(tween);
      }
      
      public function §_-X1I§(param1:DisplayObject) : void
      {
         this.heroView.§_-X1I§(param1);
         this.heroView.§_-m1p§ = param1 != null && !this.§_-Ha§;
      }
      
      public function §_-k2Y§(param1:b2Vec2) : void
      {
         this.§_-I2j§ = param1;
      }
      
      public function set §_-P12§(param1:Boolean) : void
      {
         this.§_-q27§ = param1;
      }
      
      public function get §_-P12§() : Boolean
      {
         return this.§_-q27§;
      }
      
      public function §_-z5§() : void
      {
         this.perkController.§_-N1x§(this.§_-Z1H§);
      }
      
      protected function §_-n22§() : void
      {
         if(!this.heroView.visible)
         {
            return;
         }
         var _loc1_:int = this.game.map.size.y - §_-Zy§.§_-02T§ + §_-M2P§ * 2;
         if(this.y < -_loc1_)
         {
            if(this.§_-L2u§)
            {
               this.sendLocation(Keyboard.UP);
               this.jump(true);
               this.sendLocation(Keyboard.UP * -1);
               this.jump(false);
            }
            else
            {
               this.position = new b2Vec2(this.x / Game.§_-12A§,-_loc1_ / Game.§_-12A§);
               this.sendLocation();
            }
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.x < -§_-M2P§ || this.x > this.game.map.size.x + §_-M2P§)
         {
            _loc2_ = this.x < 0 ? §_-M2P§ : int(-§_-M2P§);
         }
         else
         {
            if(this.y <= this.game.map.size.y)
            {
               return;
            }
            _loc3_ = -(§_-M2P§ * 2);
            if(this.x > -§_-M2P§ && this.x < 0 || this.x > this.game.map.size.x && this.x < this.game.map.size.x + §_-M2P§)
            {
               _loc2_ = this.x < 0 ? int(§_-93D§ - this.x) : int(this.game.map.size.x - §_-93D§ - this.x);
            }
         }
         this.x += _loc2_;
         this.y += _loc3_;
         this.§_-b2d§ = Hero.§_-nk§;
         this.dead = true;
         this.§_-62D§();
      }
      
      protected function §_-N§() : void
      {
         this.x = this.body.GetPosition().x * Game.§_-12A§;
         this.y = this.body.GetPosition().y * Game.§_-12A§;
         var _loc1_:b2Vec2 = this.game.gravity.Copy();
         if(this.useGravity)
         {
            _loc1_.Multiply(1 / 60);
         }
         else
         {
            _loc1_ = new b2Vec2();
         }
         var _loc2_:b2Vec2 = new b2Vec2(_loc1_.x + this.extGravity.x,_loc1_.y + this.extGravity.y);
         if(_loc2_.Length() == 0 && !this.§_-Kv§)
         {
            this.§_-l1n§();
            return;
         }
         if(this.body.GetAngle() != Math.atan2(_loc2_.y,_loc2_.x) - Math.PI * 0.5 && !this.§_-Kv§)
         {
            this.body.SetAngle(Math.atan2(_loc2_.y,_loc2_.x) - Math.PI * 0.5);
         }
         this.rotation = this.body.GetAngle() * Game.R2D;
         this.§_-l1n§();
      }
      
      protected function §_-l1n§() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Point = null;
         if(!this.isSelf && !(§_-t2c§.active as §_-H1k§))
         {
            return;
         }
         if(Boolean(this.game.cast) && this.heroView.circle.visible)
         {
            _loc1_ = this.game.cast.radius;
            _loc2_ = this.game.globalToLocal(this.localToGlobal(new Point(-_loc1_,this.heroView.y - _loc1_ - §_-a1A§)));
            this.heroView.circle.x = _loc2_.x;
            this.heroView.circle.y = _loc2_.y;
            this.heroView.circle.rotation = this.rotation;
         }
         if(!this.§_-GB§ || !this.heroView.§_-A3x§.visible)
         {
            return;
         }
         _loc2_ = this.game.globalToLocal(this.localToGlobal(new Point(-176,this.heroView.y - 201)));
         this.heroView.§_-A3x§.x = _loc2_.x;
         this.heroView.§_-A3x§.y = _loc2_.y;
         this.heroView.§_-A3x§.rotation = this.rotation;
      }
      
      protected function §_-K16§(param1:Player) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         param1.removeEventListener(this.§_-K16§);
         this.§_-n2x§ = param1.id;
         if(§_-t2c§.active is §_-u24§ && !§_-at§.§_-F2u§.teamMode)
         {
            _loc2_ = false;
            _loc3_ = 0;
            while(_loc3_ < this.player["worn_packages"].length)
            {
               _loc2_ ||= §_-P2x§.§_-r5§(this.player["worn_packages"][_loc3_]);
               _loc3_++;
            }
            _loc4_ = false;
            _loc3_ = 0;
            while(_loc3_ < this.player["worn_packages"].length)
            {
               _loc4_ ||= §_-P2x§.§_-e2S§(this.player["worn_packages"][_loc3_]);
               _loc3_++;
            }
            this.isScrat = _loc2_ || _loc4_;
         }
         this.heroView.setClothing(this.player["worn_packages"],this.player["worn_accessories"]);
         this.perkController.§_-m2b§();
         this.perkController.§_-qx§();
         if(this.player["clan_id"] == 0)
         {
            _loc5_ = this.isSelf ? §_-82O§.§_-a15§(§_-82O§.PLAYER_TYPE) : §_-82O§.§_-h1C§(this.player["rating_score"],§_-82O§.PLAYER_TYPE);
            this.heroView.§_-S1C§(this.player.name,this.player["shaman_level"],_loc5_,this.player["vip_time"] > 0);
            return;
         }
         if(this.§_-b19§ != null)
         {
            return;
         }
         this.§_-b19§ = §_-B2U§.§_-Q2g§(this.player["clan_id"]);
         this.§_-b19§.addEventListener(§_-eT§.§_-P26§ | §_-eT§.§_-t1d§ | §_-eT§.§_-u2P§ | §_-eT§.STATE,this.onClanLoaded);
         §_-B2U§.request(this.player["clan_id"],§_-eT§.§_-P26§ | §_-eT§.§_-t1d§ | §_-eT§.§_-u2P§ | §_-eT§.STATE);
      }
      
      protected function get §_-m1z§() : Boolean
      {
         return this.body.GetLocalVector(this.§_-G1k§).y - this.body.GetLocalVector(this.position).y > 0;
      }
      
      protected function §_-W1i§() : void
      {
         if(!(this.§_-S1P§.§_-YJ§ is §_-w1u§))
         {
            return;
         }
         var _loc1_:String = (this.§_-S1P§.§_-YJ§ as §_-w1u§).landSound;
         if(_loc1_ != "")
         {
            GameSounds.playUnrepeatable(_loc1_);
         }
      }
      
      private function §_-M2I§() : void
      {
         if(this.§_-R25§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-R25§);
            this.§_-R25§ = null;
         }
         this.§_-ex§.length = 0;
         this.body.SetFixedRotation(true);
         this.§_-h14§ = true;
      }
      
      private function §_-d25§(param1:TimerEvent) : void
      {
         if(this.id != Game.selfId && this.id > 0)
         {
            return;
         }
         this.heroView.§_-B2n§ = Math.min((getTimer() - this.§_-v2y§) / this.§_-G2O§ * 100,100);
      }
      
      private function onClanLoaded(param1:Clan, param2:uint) : void
      {
         var _loc3_:int = this.isSelf ? §_-82O§.§_-a15§(§_-82O§.PLAYER_TYPE) : §_-82O§.§_-h1C§(this.player["rating_score"],§_-82O§.PLAYER_TYPE);
         var _loc4_:String = param1.state == §_-s2l§.§_-YU§ ? param1.name : "";
         this.heroView.§_-S1C§(this.player.name,this.player["shaman_level"],_loc3_,this.player["vip_time"] > 0,_loc4_);
         this.perkController.§_-E1t§(param1);
         param1.removeEventListener(this.onClanLoaded);
      }
      
      private function breakGum() : void
      {
         this.§_-s23§ = false;
      }
      
      private function §_-412§(param1:TimerEvent) : void
      {
         this.heroView.visible = !this.isDead;
         this.body.SetActive(false);
         dispatchEvent(new §_-Um§(§_-Um§.§_-9q§));
      }
      
      private function §_-62D§() : void
      {
         var _loc1_:int = 0;
         if(this.isHare)
         {
            _loc1_ = Math.random() * §_-RH§.§_-V2c§.length;
            GameSounds.play(§_-RH§.§_-V2c§[_loc1_]);
            return;
         }
         _loc1_ = int(Math.random() * §_-RH§.§_-03Q§.length);
         GameSounds.play(§_-RH§.§_-03Q§[_loc1_]);
      }
      
      private function §_-Lf§(param1:int, param2:int) : void
      {
         this.§_-G1F§ = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
         this.§_-G1F§.position.Set(this.heroView.width / (2 * Game.§_-12A§) + param1 / Game.§_-12A§,this.heroView.height / (2 * Game.§_-12A§) + param2 / Game.§_-12A§);
         this.§_-G1F§.allowSleep = true;
         this.body = this.world.CreateBody(this.§_-G1F§);
         this.§_-s2i§ = this.body.CreateFixture(new b2FixtureDef(new b2CircleShape(2),null,0,0.1,1,§_-q2c§.§_-rT§,§_-q2c§.§_-wI§ | §_-q2c§.§_-ti§ | §_-q2c§.§_-Wp§ | §_-q2c§.§_-ZZ§ | §_-q2c§.§_-o1Z§ | §_-q2c§.§_-D28§,0,false));
         this.§_-s2i§.SetUserData(this);
         var _loc3_:b2CircleShape = new b2CircleShape(1.9 * this.§_-a12§);
         _loc3_.SetLocalPosition(new b2Vec2(0,0.2 * this.§_-a12§));
         this.§_-L1G§ = this.body.CreateFixture(new b2FixtureDef(_loc3_,null,0,0.1,1,§_-q2c§.§_-y2Y§ | §_-q2c§.§_-rT§,§_-q2c§.§_-wI§ | §_-q2c§.§_-ti§,0,false));
         this.§_-S1P§ = new §_-f2A§(this.§_-L1G§,this);
         var _loc4_:b2MassData = new b2MassData();
         _loc4_.mass = this.mass;
         this.body.SetMassData(_loc4_);
         this.body.SetUserData(this);
         §_-n2T§.§_-U2D§(this.body);
      }
      
      private function §_-n1g§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-02d§)
         {
            this.disableEffect(_loc1_);
         }
      }
      
      private function respawnAnimation() : void
      {
         this.§_-i§ = TweenMax.to(this.heroView,0.5,{
            "alpha":0.2,
            "onComplete":function():void
            {
               §_-i§ = TweenMax.to(heroView,0.5,{
                  "alpha":1,
                  "onComplete":respawnAnimation
               });
            }
         });
      }
      
      private function §_-71q§() : void
      {
         this.heroView.alpha = 0;
         var _loc1_:SquirrelRebornAnimation = new SquirrelRebornAnimation();
         _loc1_.y = 25;
         _loc1_.gotoAndPlay(0);
         _loc1_.addEventListener("SQUIRREL_ARISE",this.§_-136§);
         _loc1_.addEventListener(Event.CHANGE,this.§_-d1A§);
         addChild(_loc1_);
         if(this.isSelf)
         {
            GameSounds.play("respawn");
         }
      }
      
      private function §_-136§(param1:Event) : void
      {
         this.§_-f2q§ = TweenMax.to(this.heroView,1,{"alpha":(this.§_-z20§ ? 0.4 : 1)});
      }
      
      private function §_-d1A§(param1:Event) : void
      {
         (param1.target as MovieClip).removeEventListener("SQUIRREL_ARISE",this.§_-136§);
         if((param1.target as MovieClip).parent)
         {
            (param1.target as MovieClip).parent.removeChild(param1.target as MovieClip);
         }
      }
      
      private function §_-01A§(param1:TimerEvent = null) : void
      {
         this.§_-G2P§.stop();
         this.heroView.alpha = this.§_-z20§ ? 0.4 : 1;
         if(this.§_-i§ == null)
         {
            return;
         }
         this.§_-i§.§_-kl§();
         this.§_-i§ = null;
      }
      
      private function §_-P1F§() : void
      {
         if(!this.§_-K13§ || this.inHollow)
         {
            return;
         }
         this.dead = false;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-R1y§,this));
         if(Boolean(this.game) && Boolean(this.game.squirrels))
         {
            this.game.squirrels.§_-I26§();
         }
         this.heroView.§_-Ks§();
         this.show();
      }
      
      private function get §_-114§() : Boolean
      {
         return this.isHare;
      }
   }
}

