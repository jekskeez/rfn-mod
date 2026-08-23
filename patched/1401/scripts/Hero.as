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
   import §_-33r§.§_-23P§;
   import §_-33r§.§_-J2Z§;
   import §_-33r§.§_-b2w§;
   import §_-33r§.§_-hu§;
   import §_-33r§.§_-i8§;
   import §_-33r§.§_-q1d§;
   import §_-33r§.§_-q2D§;
   import §_-42B§.TweenMax;
   import §_-43w§.§_-H1I§;
   import §_-51g§.§_-22J§;
   import §_-51g§.§_-h12§;
   import §_-83V§.GameBody;
   import §_-83V§.§_-12R§;
   import §_-83V§.§_-K1U§;
   import §_-83V§.§_-P2o§;
   import §_-83V§.§_-r14§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-A2x§.§_-Ar§;
   import §_-B1O§.§_-B3Y§;
   import §_-D2k§.§_-A2q§;
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-g2W§;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import §_-S1D§.§_-O1M§;
   import §_-S2§.§_-a1T§;
   import §_-T1r§.§_-03i§;
   import §_-T1r§.§_-b1U§;
   import §_-T1r§.§_-i1L§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-P1Y§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-m1z§.§_-529§;
   import §_-p1g§.§_-534§;
   import §_-p1g§.§_-y2r§;
   import §_-s2l§.§_-11k§;
   import §_-s2l§.§_-z2c§;
   import §_-u2r§.§_-mo§;
   import §_-vK§.§_-on§;
   import §_-vK§.§_-qC§;
   import chat.§_-A1n§;
   import com.api.Player;
   import events.§_-Wh§;
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
   import game.mainGame.§_-1s§;
   import game.mainGame.§_-23Q§;
   import game.mainGame.§_-L2k§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.§_-V§;
   import game.mainGame.§_-jP§;
   import game.mainGame.§_-w2F§;
   import game.mainGame.entity.§_-314§;
   import game.mainGame.entity.§_-FD§;
   import game.mainGame.entity.§_-YY§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import starling.core.Starling;
   import utils.§_-vS§;
   import views.§_-s4§;
   
   public class Hero extends §_-h2I§ implements §_-11k§, §_-Tm§, §_-22J§, §_-jP§
   {
      
      public static const §_-V1L§:String = "Hero.scale";
      
      public static const §_-tl§:String = "Hero.remove";
      
      public static const §_-Uq§:String = "Hero.die";
      
      public static const §_-g1O§:String = "Hero.breakJoint";
      
      public static const §_-n2S§:String = "Hero.breakGum";
      
      public static const §_-d2S§:String = "Hero.breakRope";
      
      public static const §_-mh§:String = "Hero.doubleJump";
      
      public static const §_-aj§:String = "Hero.deadlyContact";
      
      public static const §_-Y1J§:String = "Hero.teleport";
      
      public static const §_-H2j§:String = "Hero.up";
      
      public static const EVENT_UP_END:String = "Hero.EVENT_UP_END";
      
      public static const §_-C2K§:String = "Hero.perkQuest";
      
      public static const §_-1d§:int = -1;
      
      public static const §_-T1p§:int = 0;
      
      public static const §_-w11§:int = 1;
      
      public static const §_-ZP§:int = 2;
      
      public static const §_-53A§:int = 3;
      
      public static const §_-Mn§:int = 4;
      
      public static const §_-z2a§:int = 5;
      
      public static const §_-01j§:String = "stand";
      
      public static const §_-jq§:String = "run";
      
      public static const §_-t17§:String = "jump";
      
      public static const §_-331§:String = "cast";
      
      public static const §_-53V§:String = "laugh";
      
      public static const §_-F10§:String = "cry";
      
      public static const §_-ef§:String = "kiss";
      
      public static const §_-y2b§:String = "angry";
      
      public static const §_-RM§:String = "cast3";
      
      public static const §_-F1P§:int = 0;
      
      public static const §_-72H§:int = 1;
      
      public static const §_-M2Q§:int = 2;
      
      public static const §_-JL§:int = 0;
      
      public static const §_-17§:int = 1;
      
      public static const §_-114§:int = 2;
      
      public static const §_-O18§:int = 3;
      
      public static const §_-VP§:int = 0;
      
      public static const §_-517§:int = 1;
      
      public static const §_-K1Q§:int = 0;
      
      public static const §_-G1g§:int = 1;
      
      public static const §_-f1r§:int = 2;
      
      public static const §_-m1g§:int = 3;
      
      public static const §_-tM§:int = 4;
      
      public static const §_-wo§:int = 5;
      
      public static const §_-98§:int = 1;
      
      public static const §_-o3§:int = 2;
      
      public static const §_-Dd§:int = 0;
      
      public static const §_-X2n§:int = 1;
      
      public static const §_-22I§:int = 2;
      
      public static const §_-W2x§:int = 3;
      
      public static const §_-T1s§:int = 4;
      
      public static const §_-S1O§:int = 5;
      
      public static const §_-i22§:int = 6;
      
      public static const §_-y1c§:int = 7;
      
      public static const §_-YH§:Number = 22.65;
      
      public static const §_-j1e§:int = 30;
      
      public static const §_-v22§:Number = 0.1;
      
      private static const §_-r2V§:int = 80;
      
      private static const §_-c1c§:int = 6;
      
      private static const §_-CW§:Number = 0.7;
      
      private static const §_-82X§:int = 15;
      
      private static const §_-D2t§:int = 15;
      
      private static const §_-K2D§:Number = 1.3;
      
      private static const §_-q17§:int = 5000;
      
      private static const §_-gW§:int = 10;
      
      public static const §_-E1k§:Object = {
         (§_-T1p§.toString()):§_-01j§,
         (§_-w11§.toString()):§_-jq§,
         (§_-ZP§.toString()):§_-t17§,
         (§_-53A§.toString()):§_-331§
      };
      
      private static const §_-l18§:Array = [§_-93d§.§_-k2f§,null,§_-93d§.§_-92R§];
      
      private static const §_-03g§:int = §_-hF§.§_-R2P§ | §_-hF§.§_-61o§ | §_-hF§.§_-31q§ | §_-hF§.§_-329§ | §_-hF§.§_-AA§ | §_-hF§.§_-sK§ | §_-hF§.§_-Ng§ | §_-hF§.§_-81Z§;
      
      private static var §_-W2i§:Hero = null;
      
      private static var §_-f1L§:Dictionary = new Dictionary();
      
      public var body:b2Body;
      
      public var §_-b1Y§:b2Fixture = null;
      
      public var §_-Fn§:b2Fixture;
      
      public var §_-I1R§:int = -1;
      
      public var §_-L1A§:int = -1;
      
      public var frags:uint = 0;
      
      public var heroView:§_-01R§ = null;
      
      public var up:Boolean = false;
      
      public var left:Boolean = false;
      
      public var right:Boolean = false;
      
      public var §_-j§:Array = [];
      
      public var player:Player = null;
      
      public var perkController:§_-a1T§ = null;
      
      public var behaviourController:§_-J2Z§ = null;
      
      public var inHollow:Boolean = false;
      
      public var isDead:Boolean = false;
      
      public var §_-89§:Boolean = false;
      
      public var onRemove:Boolean = false;
      
      public var §_-Wt§:Boolean = false;
      
      public var armadillo:Boolean = false;
      
      public var §_-Y2t§:Boolean = false;
      
      public var §_-S1W§:Boolean = false;
      
      public var acornShare:Boolean = false;
      
      public var §_-bC§:Boolean = false;
      
      public var §_-11a§:Boolean = false;
      
      public var swim:Boolean = false;
      
      public var §_-o1T§:Boolean = false;
      
      public var hover:Boolean = false;
      
      public var ghost:Boolean = false;
      
      public var climbing:Boolean = false;
      
      public var §_-SR§:Boolean = false;
      
      public var §_-la§:Boolean = false;
      
      public var §_-e1X§:Boolean = false;
      
      public var §_-Y6§:Boolean = false;
      
      public var §_-zZ§:Boolean = false;
      
      public var §_-13g§:Boolean = false;
      
      public var §_-Qk§:Boolean = true;
      
      public var viewChanged:Boolean = false;
      
      public var §_-o15§:Boolean = false;
      
      public var useGravity:Boolean = true;
      
      public var §_-l2U§:§_-23Q§ = new §_-23Q§();
      
      public var §_-xv§:int = 16777215;
      
      public var §_-U2L§:Number = 1;
      
      public var questFactor:Number = 1;
      
      public var followId:int = 0;
      
      protected var §_-B3r§:int = 30;
      
      protected var §_-mf§:int = 5;
      
      protected var §_-711§:Number = 15;
      
      protected var §_-g2y§:int = 18;
      
      protected var §_-93R§:int = 0;
      
      protected var §_-N20§:int = 0;
      
      protected var §_-z1P§:Number = 1;
      
      protected var §_-h1t§:Number = 1;
      
      protected var §_-7G§:int = 4;
      
      protected var §_-43F§:Number = 0;
      
      protected var §_-j6§:Number = 1;
      
      protected var §_-r1E§:Number = 0.1;
      
      protected var §_-Tq§:Number = 1;
      
      protected var §_-X1f§:int = 0;
      
      protected var §_-x1t§:Boolean = false;
      
      protected var §_-l1w§:Boolean = false;
      
      protected var §_-PA§:Boolean = false;
      
      protected var §_-7U§:Boolean = false;
      
      protected var §_-53J§:Boolean = true;
      
      protected var §_-Ig§:TweenMax = null;
      
      protected var §_-aq§:int = 0;
      
      protected var §_-k1l§:int = 0;
      
      protected var §_-K2B§:b2BodyDef = null;
      
      protected var §_-01y§:int = 0;
      
      protected var controller:§_-z2c§ = null;
      
      protected var §_-Y2G§:Timer = new Timer(1000,1);
      
      protected var §_-Z2Q§:Timer = new Timer(§_-gW§);
      
      protected var §_-q2o§:int = 0;
      
      protected var §_-JG§:int = 0;
      
      protected var §_-U2I§:Boolean = false;
      
      protected var §_-t1f§:Boolean = false;
      
      protected var §_-T1i§:Boolean = false;
      
      protected var §_-S1q§:Boolean = false;
      
      protected var §_-13w§:Boolean = false;
      
      protected var §_-ZH§:TweenMax = null;
      
      protected var §_-n2t§:DisplayObject = null;
      
      protected var §_-T1X§:§_-s4§;
      
      protected var §_-58§:Boolean = false;
      
      protected var §_-tg§:Boolean = false;
      
      protected var §_-W2Q§:Boolean = false;
      
      protected var §_-32k§:Boolean = false;
      
      protected var §_-M2§:Boolean = false;
      
      protected var §_-p1w§:Boolean = false;
      
      protected var §_-81t§:Clan = null;
      
      protected var §_-9e§:b2Vec2 = null;
      
      protected var §_-X2f§:b2Vec2 = null;
      
      protected var extGravity:b2Vec2 = new b2Vec2();
      
      protected var §_-A25§:§_-h12§ = null;
      
      protected var world:b2World = null;
      
      protected var §_-12l§:Timer = new Timer(Hero.§_-q17§,1);
      
      protected var icon:§_-h2I§ = null;
      
      protected var §_-Z2q§:int = -1;
      
      protected var §_-P2M§:int = -1;
      
      protected var §_-Z3§:int = 0;
      
      private var §_-4A§:int = 0;
      
      private var §_-O1y§:Boolean = false;
      
      private var §_-A2h§:Boolean = false;
      
      private var §_-Q2t§:Boolean = false;
      
      private var §_-G15§:Boolean = false;
      
      private var §_-sD§:Boolean = false;
      
      private var §_-fW§:Object = {};
      
      private var §_-712§:§_-f1G§ = null;
      
      private var §_-B1v§:b2Joint = null;
      
      private var §_-J1M§:Array = [];
      
      public function Hero(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super();
         §_-TQ§.add("new Hero:" + param1);
         §_-vS§.§_-41D§(this);
         this.§_-4A§ = param1;
         this.world = param2;
         if(this.id > 0)
         {
            this.player = Game.getPlayer(this.id);
            this.player.addEventListener(Hero.§_-03g§,this.§_-rF§);
            Game.request(this.id,Hero.§_-03g§,true);
         }
         if(this.isSelf)
         {
            self = this;
            this.§_-T1X§ = new §_-s4§();
         }
         this.heroView = new this.viewClass(this.id);
         this.heroView.y = §_-YH§;
         addChild(this.heroView);
         §_-83v§(this.heroView);
         this.game.addChild(this.heroView.circle);
         this.game.§_-83v§(this.heroView.circle);
         this.heroView.circle.visible = false;
         this.§_-H2L§(param3,param4);
         this.position = new b2Vec2(param3,param4);
         this.perkController = new §_-a1T§(this);
         this.behaviourController = new §_-J2Z§(this);
         this.hide();
         this.reset();
         this.§_-Y2G§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-TW§);
         this.§_-Z2Q§.addEventListener(TimerEvent.TIMER,this.§_-T2S§);
         this.§_-12l§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-4p§);
         this.mouseEnabled = true;
         this.mouseChildren = true;
         this.touchable = false;
         this.§_-89§ = true;
      }
      
      public static function get §_-w1Z§() : Array
      {
         return [Hero.§_-tl§,Hero.§_-Uq§,SquirrelEvent.§_-f2m§,SquirrelEvent.§_-n1x§,SquirrelEvent.HIDE,SquirrelEvent.§_-z1B§,SquirrelEvent.§_-f13§];
      }
      
      public static function get self() : Hero
      {
         return §_-W2i§;
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
            while(_loc2_ < §_-w1Z§.length)
            {
               §_-W2i§.removeEventListener(§_-w1Z§[_loc2_],§_-I17§);
               _loc2_++;
            }
         }
         §_-W2i§ = param1;
         if(self)
         {
            _loc2_ = 0;
            while(_loc2_ < §_-w1Z§.length)
            {
               §_-W2i§.addEventListener(§_-w1Z§[_loc2_],§_-I17§);
               _loc2_++;
            }
         }
      }
      
      public static function get §_-6g§() : Boolean
      {
         return self != null && !self.inHollow && !self.isDead;
      }
      
      public static function get §_-74§() : int
      {
         return §_-W2i§ != null ? §_-W2i§.id : Game.selfId;
      }
      
      public static function §_-xd§(param1:Array, param2:Function) : void
      {
         var _loc3_:String = null;
         for each(_loc3_ in param1)
         {
            §_-f1L§[param2] = _loc3_;
         }
      }
      
      public static function forget(param1:Function) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in §_-f1L§)
         {
            if(_loc2_ as Function == param1)
            {
               delete §_-f1L§[_loc2_];
            }
         }
      }
      
      private static function §_-I17§(param1:Event) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in §_-f1L§)
         {
            if(_loc2_ == null)
            {
               delete §_-f1L§[_loc2_];
            }
            else if(§_-f1L§[_loc2_] == param1.type)
            {
               (_loc2_ as Function).apply(null);
            }
         }
      }
      
      override public function set x(param1:Number) : void
      {
         var _loc2_:§_-f1G§ = null;
         super.x = param1;
         for each(_loc2_ in this.§_-fW§)
         {
            _loc2_.view.§_-M2F§ = param1;
            _loc2_.view.§_-P26§ = (_loc2_.§_-Y1m§ == 0 ? (this.heroView.direction ? Math.PI : 0) : 0) + this.body.GetAngle() + _loc2_.§_-Y1m§;
         }
      }
      
      override public function set y(param1:Number) : void
      {
         var _loc2_:§_-f1G§ = null;
         super.y = param1;
         for each(_loc2_ in this.§_-fW§)
         {
            _loc2_.view.§_-Cg§ = param1;
            _loc2_.view.§_-P26§ = (_loc2_.§_-Y1m§ == 0 ? (this.heroView.direction ? Math.PI : 0) : 0) + this.body.GetAngle() + _loc2_.§_-Y1m§;
         }
      }
      
      public function get viewClass() : Class
      {
         return §_-01R§;
      }
      
      public function get isSelf() : Boolean
      {
         if(this == Hero.self)
         {
            return true;
         }
         if(this.id > 0 && this.id == Hero.§_-74§)
         {
            return true;
         }
         return this.id < 0 && this.game is §_-A32§;
      }
      
      public function get §_-w1K§() : Boolean
      {
         return this.isSelf || this.id < 0 && this.game is §_-A2q§;
      }
      
      public function get §_-E1I§() : Boolean
      {
         return this.id == §_-92z§.§_-32S§;
      }
      
      public function get §_-k2W§() : Boolean
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
         var _loc2_:§_-f1G§ = null;
         this.body.SetAngle(param1);
         for each(_loc2_ in this.§_-fW§)
         {
            _loc2_.view.§_-P26§ = (_loc2_.§_-Y1m§ == 0 ? (this.heroView.direction ? Math.PI : 0) : 0) + this.body.GetAngle() + _loc2_.§_-Y1m§;
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
      
      public function get §_-s1l§() : b2Vec2
      {
         return this.body.GetTransform().R.col1;
      }
      
      public function get §_-x2h§() : b2Vec2
      {
         return this.body.GetTransform().R.col2;
      }
      
      public function get onFloor() : Boolean
      {
         return this.§_-A25§.onFloor;
      }
      
      public function §_-n2Y§(param1:b2Vec2) : b2Vec2
      {
         return this.body.GetLocalVector(param1);
      }
      
      public function §_-53N§(param1:b2Vec2) : void
      {
         this.body.ApplyImpulse(param1,this.body.GetWorldCenter());
      }
      
      public function §_-N1W§(param1:b2DistanceJointDef, param2:b2Vec2, param3:Boolean = true) : void
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
      
      public function §_-oQ§(param1:b2DistanceJointDef, param2:Boolean = true) : void
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
      
      public function §_-K18§(param1:b2RevoluteJointDef, param2:Boolean = true) : void
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
         var _loc2_:int = this.§_-J1M§.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.§_-J1M§.splice(_loc2_,1);
         }
         this.§_-J1M§.push(param1);
         if(this.§_-B1v§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-B1v§);
            this.§_-B1v§ = null;
         }
         this.body.SetFixedRotation(false);
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.Initialize(this.body.GetWorld().GetGroundBody(),this.body,this.body.GetPosition());
         _loc3_.enableLimit = true;
         _loc3_.lowerAngle = 0;
         _loc3_.upperAngle = 0;
         this.§_-B1v§ = this.body.GetWorld().CreateJoint(_loc3_);
         this.hover = true;
      }
      
      public function unlockBody(param1:Object) : void
      {
         var _loc2_:int = this.§_-J1M§.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         this.§_-J1M§.splice(_loc2_,1);
         if(this.§_-J1M§.length > 0)
         {
            return;
         }
         if(!this.§_-B1v§)
         {
            return;
         }
         this.body.GetWorld().DestroyJoint(this.§_-B1v§);
         this.body.SetFixedRotation(true);
         this.hover = false;
         this.§_-Y6§ = true;
         this.§_-B1v§ = null;
      }
      
      public function §_-p1Q§(param1:b2Vec2) : void
      {
         this.extGravity.Add(param1);
      }
      
      public function get §_-C3a§() : Boolean
      {
         return this.§_-sD§;
      }
      
      public function §_-hv§(param1:Number) : Boolean
      {
         return this.x > this.game.map.size.x + param1;
      }
      
      public function reset() : void
      {
         this.perkController.§_-S2A§();
         if(this.body)
         {
            this.body.renewTransform();
         }
         this.§_-712§ = null;
         this.§_-pS§();
         this.behaviourController.reset();
         this.heroView.§_-L2y§();
         this.heroView.§_-ZX§();
         this.heroView.§_-426§ = false;
         this.heroView.shaman = false;
         this.heroView.running = false;
         this.heroView.§_-k2P§ = false;
         this.heroView.dead = false;
         this.heroView.direction = false;
         this.heroView.isHare = false;
         this.heroView.isDragon = false;
         this.heroView.scale = 1;
         this.heroView.circle.visible = false;
         this.heroView.update();
         this.body.SetLinearVelocity(new b2Vec2(0,0));
         this.runSpeed = 15;
         this.§_-93a§ = 15;
         this.isHare = false;
         this.isDragon = false;
         this.§_-89§ = false;
         this.left = false;
         this.right = false;
         this.hover = false;
         this.inHollow = false;
         this.shaman = false;
         this.dead = false;
         this.§_-EO§ = false;
         this.§_-h1n§ = false;
         this.§_-t25§(false);
         this.§_-la§ = false;
         this.§_-SR§ = false;
         this.ghost = false;
         this.§_-Y2t§ = false;
         this.§_-S1W§ = false;
         this.team = Hero.§_-JL§;
         this.§_-13w§ = false;
         this.§_-I1R§ = -1;
         this.§_-L1A§ = -1;
         this.frags = 0;
         this.questFactor = 1;
         this.§_-A16§();
         this.§_-A25§.reset();
         this.§_-l2U§.reset();
         if(this.controller != null)
         {
            this.controller.active = true;
         }
         if(this.§_-81t§)
         {
            §_-e2W§.request(this.player["clan_id"],§_-Oy§.§_-g2n§ | §_-Oy§.STATE | §_-Oy§.§_-TZ§,true);
            this.§_-81t§.addEventListener(§_-Oy§.§_-g2n§ | §_-Oy§.STATE | §_-Oy§.§_-TZ§,this.onClanLoaded);
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-f2m§,this));
         if(this.viewChanged && this.player["worn"] != null)
         {
            this.heroView.setClothing(this.player["worn_packages"],this.player["worn_accessories"]);
            this.viewChanged = false;
         }
         this.§_-GI§();
         this.§_-6m§(null);
         this.heroView.§_-f2b§(this.§_-E1I§);
      }
      
      public function sendLocation(param1:int = 0) : void
      {
         if(this.isDead || this.inHollow || !this.§_-HQ§)
         {
            return;
         }
         §_-TQ§.add("Hero.sendLocation:" + param1);
         Connection.§_-Li§(§_-h2B§.§_-325§,param1,this.position.x,this.position.y,this.velocity.x,this.velocity.y);
      }
      
      public function get playerName() : String
      {
         return this.player["name"];
      }
      
      public function remove() : void
      {
         this.onRemove = true;
         this.§_-712§ = null;
         this.§_-pS§();
         §_-TQ§.add("Hero remove:" + this.id);
         §_-vS§.§_-324§(this);
         this.§_-HQ§ = false;
         dispatchEvent(new Event(Hero.§_-tl§));
         dispatchEvent(new Event(Hero.§_-g1O§));
         dispatchEvent(new Event(Hero.§_-n2S§));
         dispatchEvent(new Event(Hero.§_-d2S§));
         §_-w2F§.§_-41c§(this.body);
         this.world.DestroyBody(this.body);
         this.body.SetUserData(null);
         this.§_-b1Y§.SetUserData(null);
         this.§_-Fn§.SetUserData(null);
         this.§_-GI§();
         if(this.§_-81t§)
         {
            this.§_-81t§.removeEventListener(this.onClanLoaded);
         }
         this.§_-l2U§.dispose();
         this.perkController.dispose();
         this.§_-A25§ = null;
         this.world = null;
         this.body = null;
         this.§_-Fn§ = null;
         this.icon = null;
         this.§_-Z2q§ = -1;
         this.§_-P2M§ = -1;
         if(Boolean(this.§_-T1X§) && Boolean(this.§_-T1X§.parent))
         {
            this.§_-T1X§.dispose();
            this.§_-T1X§.parent.removeChild(this.§_-T1X§);
         }
         this.§_-T1X§ = null;
         if(this.heroView.circle.parentStarling)
         {
            this.heroView.circle.parentStarling.removeChildStarling(this.heroView.circle,false);
         }
         if(Boolean(this.heroView.§_-s7§) && Boolean(this.heroView.§_-s7§.parent))
         {
            this.heroView.§_-s7§.parent.removeChild(this.heroView.§_-s7§);
         }
         this.heroView.remove();
         this.§_-Y2G§.stop();
         this.§_-Z2Q§.stop();
         this.§_-12l§.stop();
         this.§_-Y2G§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-TW§);
         this.§_-Z2Q§.removeEventListener(TimerEvent.TIMER,this.§_-T2S§);
         this.§_-12l§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-4p§);
         if(this.player)
         {
            this.player.removeEventListener(this.§_-rF§);
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
      
      public function §_-O2s§(param1:int = 2000) : void
      {
         if(this.game.paused)
         {
            return;
         }
         if(!(this.heroView.running && this.§_-o15§))
         {
            this.§_-A15§ = true;
         }
         if(this.id != Game.selfId && this.id > 0 || param1 == 0)
         {
            return;
         }
         this.heroView.§_-C26§ = 0;
         this.§_-q2o§ = getTimer();
         this.§_-JG§ = param1;
         this.§_-Z2Q§.reset();
         this.§_-Z2Q§.start();
      }
      
      public function §_-Yn§(param1:Boolean) : void
      {
         this.§_-A15§ = false;
         if(this.id != Game.selfId && this.id > 0)
         {
            return;
         }
         this.heroView.§_-C26§ = 0;
         if(param1 && this.controller != null)
         {
            this.controller.active = false;
         }
         this.§_-Z2Q§.stop();
      }
      
      public function get isStopped() : Boolean
      {
         return this.§_-01y§ > 0;
      }
      
      public function set isStopped(param1:Boolean) : void
      {
         this.§_-01y§ = Math.max(0,this.§_-01y§ + (param1 ? 1 : -1));
         if(this.controller)
         {
            this.controller.§_-i1y§ = this.isStopped;
         }
         if(!this.isStopped)
         {
            return;
         }
         this.left = false;
         this.right = false;
         this.up = false;
      }
      
      public function get §_-515§() : Vector.<§_-qC§>
      {
         return this.perkController.§_-515§;
      }
      
      public function §_-i1q§() : Point
      {
         return this.globalToLocal(this.game.localToGlobal(new Point(this.heroView.circle.x,this.heroView.circle.y))).add(new Point(this.x,this.y));
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
      }
      
      public function get shaman() : Boolean
      {
         return this.§_-O1y§;
      }
      
      public function set shaman(param1:Boolean) : void
      {
         var _loc2_:§_-qC§ = null;
         var _loc3_:String = null;
         if(this.shaman == param1)
         {
            return;
         }
         this.§_-O1y§ = param1;
         if(this.isDragon)
         {
            this.isDragon = false;
         }
         if(this.isHare)
         {
            this.isHare = false;
         }
         this.§_-712§ = null;
         this.§_-pS§();
         §_-TQ§.add("Shaman ",this.id,param1);
         this.heroView.shaman = param1;
         this.§_-52o§();
         if(param1)
         {
            _loc3_ = §_-l18§[this.heroView.§_-8F§];
            if(_loc3_)
            {
               this.§_-712§ = this.applyEffect(_loc3_,1,true);
               this.§_-712§.view.alpha = 0;
               this.§_-712§.view.visible = false;
               this.§_-712§.start();
            }
         }
         for each(_loc2_ in this.§_-515§)
         {
            _loc2_.reset();
         }
         this.§_-A15§ = false;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-S2i§,this));
         dispatchEvent(new Event(Hero.§_-d2S§));
         this.§_-GI§();
         if(this.game is §_-Ar§)
         {
            §_-Q2v§.§_-S2y§(§_-Q2v§.§_-S2i§);
         }
      }
      
      public function §_-Ci§(param1:int) : void
      {
         if(param1 >= Hero.§_-wo§ && !this.isHare)
         {
            this.§_-U2J§(param1);
            return;
         }
         if((this.heroView.emotion ? this.heroView.§_-026§ : -1) == param1)
         {
            this.heroView.§_-L2y§();
         }
         else
         {
            this.heroView.§_-Ci§(param1);
            dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-G1f§,this));
         }
      }
      
      public function get game() : SquirrelGame
      {
         return this.world == null ? null : this.world.userData;
      }
      
      public function show() : void
      {
         if(this.inHollow && this.id == Game.selfId || this.isDead || !this.§_-k2W§)
         {
            return;
         }
         this.§_-A2h§ = true;
         this.heroView.circle.visible = false;
         this.heroView.visible = true;
         this.heroView.update();
         if(this.heroView.§_-s7§)
         {
            this.heroView.§_-s7§.visible = true;
         }
         this.body.SetActive(true);
         if(Boolean(this.§_-T1X§) && Boolean(this.game) && !this.game.map.contains(this.§_-T1X§))
         {
            this.game.addChild(this.§_-T1X§);
         }
         if(this.§_-T1X§)
         {
            this.§_-T1X§.visible = true;
         }
         this.§_-A18§();
      }
      
      public function §_-Dh§() : void
      {
         this.heroView.visible = false;
         if(this.heroView.§_-s7§)
         {
            this.heroView.§_-s7§.visible = false;
         }
         this.body.SetActive(false);
         if(this.§_-T1X§)
         {
            this.§_-T1X§.visible = false;
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
         if(this.heroView.§_-s7§)
         {
            this.heroView.§_-s7§.visible = false;
         }
         this.heroView.circle.visible = false;
         this.heroView.§_-L2y§();
         this.isDead = true;
         this.body.SetActive(false);
         this.left = false;
         this.right = false;
         this.up = false;
         if(this.§_-T1X§)
         {
            this.§_-T1X§.visible = false;
         }
         this.update();
         if(param1)
         {
            this.§_-A2h§ = false;
         }
         if(this.heroView.§_-Wk§)
         {
            (this.heroView.§_-Wk§ as §_-31F§).setState(§_-T1p§);
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
                     §_-92z§.sendMessage(Game.selfId,"[AUTO] Дупло подтверждено. Жду новый раунд.",§_-A1n§.§_-N1c§);
                  }
               }
            }
         }
         dispatchEvent(new Event(Hero.§_-g1O§));
         dispatchEvent(new Event(Hero.§_-n2S§));
         dispatchEvent(new Event(Hero.§_-d2S§));
         dispatchEvent(new HollowEvent(this,param1));
         this.inHollow = true;
         this.§_-GI§();
         this.hide();
         if(Boolean(this.§_-81t§) && this.id == Game.selfId)
         {
            §_-e2W§.request(this.§_-81t§.id,§_-Oy§.§_-819§,true);
         }
      }
      
      public function set dead(param1:Boolean) : void
      {
         if(param1 && this.§_-L1A§ == §_-Dd§ && (this.immortal || this.behaviourController.getState(§_-hu§) != null) && this.isSelf)
         {
            if(!this.shaman)
            {
               this.teleport(§_-98§);
            }
            else
            {
               if(!this.game || !this.game.map)
               {
                  return;
               }
               switch(this.team)
               {
                  case §_-JL§:
                  case §_-114§:
                     this.teleportTo(this.game.map.§_-p2U§.pop());
                     break;
                  case §_-17§:
                     this.teleportTo((this.game.map as §_-y2r§).redShamansPosition.pop());
                     break;
                  case §_-O18§:
                     this.teleportTo((this.game.map as §_-H1I§).§_-gc§.pop());
               }
            }
            if(this.§_-HQ§ && this.isSelf)
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
            this.§_-L1A§ = -1;
            this.§_-Y2G§.stop();
            return;
         }
         if(!this.§_-13w§)
         {
            this.§_-I1R§ = -1;
         }
         this.§_-13w§ = false;
         if(!(this is §_-534§) || !this.shaman)
         {
            this.§_-Y2G§.reset();
            this.§_-Y2G§.start();
         }
         this.left = false;
         this.right = false;
         this.up = false;
         this.§_-h1n§ = false;
         this.§_-t25§(false);
         this.hover = false;
         this.ghost = false;
         this.§_-A16§();
         this.§_-6m§(null);
         this.§_-GI§();
         this.§_-l2U§.reset();
         this.§_-4p§();
         dispatchEvent(new Event(Hero.§_-g1O§));
         dispatchEvent(new Event(Hero.§_-n2S§));
         dispatchEvent(new Event(Hero.§_-d2S§));
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-z1B§,this));
      }
      
      public function getPosition() : Point
      {
         var _loc1_:b2Vec2 = this.body.GetPosition();
         return new Point(_loc1_.x * Game.§_-x2P§,_loc1_.y * Game.§_-x2P§);
      }
      
      public function §_-4j§(param1:int) : void
      {
         this.heroView.§_-426§ = param1 == §_-517§;
         if(!this.heroView.§_-426§)
         {
            return;
         }
         if(this.§_-w3§ && param1 == §_-517§)
         {
            this.§_-312§();
         }
         else
         {
            this.§_-GI§();
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-62z§,this));
      }
      
      public function get §_-426§() : Boolean
      {
         return this.heroView.§_-426§;
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
                        this.§_-L1A§ = Hero.§_-i22§;
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
                        this.§_-L1A§ = Hero.§_-i22§;
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
                     §_-92z§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 22 секунды.",§_-A1n§.§_-N1c§);
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
                  §_-92z§.sendMessage(Game.selfId,"[AUTO] Пост-раундовый КД завершён.",§_-A1n§.§_-N1c§);
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
                        §_-92z§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 10 секунд.",§_-A1n§.§_-N1c§);
                     }
                  }
                  else if(Game.state == 7)
                  {
                     if(this.inHollow)
                     {
                        Game.state = 11;
                        Game.time = getTimer();
                        Game.target = null;
                        §_-92z§.sendMessage(Game.selfId,"[AUTO] Дупло подтверждено. Жду новый раунд.",§_-A1n§.§_-N1c§);
                     }
                  }
                  else if(Game.state == 8)
                  {
                     if(this.inHollow)
                     {
                        Game.state = 11;
                        Game.time = getTimer();
                        Game.target = null;
                        §_-92z§.sendMessage(Game.selfId,"[AUTO] Дупло подтверждено. Жду новый раунд.",§_-A1n§.§_-N1c§);
                     }
                  }
                  else if(!Hero.self.§_-426§)
                  {
                     if(Game.state == 2)
                     {
                        var _loc2_:§_-P2o§ = this.game.map.get(§_-P2o§)[0] as §_-P2o§;
                        if(_loc2_ != null)
                        {
                           Game.target = _loc2_;
                           §_-92z§.sendMessage(Game.selfId,"[AUTO] Точка подбора найдена. Телепорт.",§_-A1n§.§_-N1c§);
                           Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"pocketTeleport":[Hero.self.id,Game.target.position.x,Game.target.position.y]}));
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
                              Game.target.§_-92T§(new DetectHeroEvent(Hero.self,false));
                              §_-92z§.sendMessage(Game.selfId,"[AUTO] Штатный подбор ореха вызван.",§_-A1n§.§_-N1c§);
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
                        if(Hero.self.§_-426§)
                        {
                           Game.state = 5;
                           Game.time = getTimer();
                           Game.target = null;
                           §_-92z§.sendMessage(Game.selfId,"[AUTO] Сервер подтвердил орех.",§_-A1n§.§_-N1c§);
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
                  §_-92z§.sendMessage(Game.selfId,"Автосбор выключен.",§_-A1n§.§_-N1c§);
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
         this.perkController.§_-P1k§(param1);
         this.behaviourController.update(param1);
         if(this.controller)
         {
            this.controller.active = this.heroView.visible && !this.§_-W2Q§;
         }
         if(this.isDead)
         {
            return;
         }
         this.§_-010§(param1);
         this.behaviourController.§_-g1A§(param1);
         if(!this.isSelf)
         {
            return;
         }
         this.§_-B1y§();
      }
      
      public function §_-010§(param1:Number = 0) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:b2Vec2 = null;
         var _loc7_:b2Vec2 = null;
         if(Boolean(this.§_-A25§) && Boolean(this.§_-A25§.onFloor) && this.§_-A25§.§_-ZG§)
         {
            this.§_-aq§ = this.§_-e2I§;
            this.§_-k1l§ = this.§_-WX§;
            this.§_-X2f§ = null;
         }
         if(this.§_-Y6§)
         {
            this.mass = this.mass;
            this.§_-Y6§ = false;
         }
         if(this.§_-13g§)
         {
            this.§_-S2R§ = this.§_-S2R§;
            this.§_-13g§ = false;
         }
         if(this.§_-zZ§)
         {
            this.§_-b1Y§.SetRestitution(this.§_-r1E§);
            this.§_-zZ§ = false;
         }
         this.body.SetAwake(true);
         if(this.heroView.§_-k2P§ && this.§_-A25§.onFloor && this.isSelf)
         {
            this.§_-m2q§();
         }
         this.heroView.§_-k2P§ = this.hover || !this.§_-A25§.onFloor && !((this.swim || this.climbing) && (this.left || this.right || this.up) || this.§_-o1T§);
         this.heroView.running = (this.left || this.right) && !(this.left && this.right) && (!this.heroView.§_-A15§ || this.heroView.§_-A15§ && this.§_-o15§) || this.up && this.swim || this.up && this.climbing;
         this.heroView.update();
         this.§_-b1Y§.SetFriction(this.heroView.running ? 0 : this.§_-j6§);
         var _loc2_:b2Vec2 = this.body.GetLinearVelocity().Copy();
         var _loc3_:Boolean = this.body.GetAngle() != 0;
         if(_loc3_)
         {
            _loc2_.MulM(this.body.GetTransform().R.GetInverse(new b2Mat22()));
         }
         if(this.up && this.§_-j§.length != 0)
         {
            for each(_loc4_ in this.§_-j§)
            {
               if(_loc2_.y > _loc4_)
               {
                  _loc2_.y = _loc4_;
               }
            }
         }
         if((this.left || this.right) && !(this.left && this.right) && !this.heroView.§_-A15§)
         {
            _loc5_ = this.behaviourController.getState(§_-q1d§) != null ? -1 : 1;
            _loc5_ *= this.questFactor;
            if(this.§_-A25§.onFloor)
            {
               _loc2_.x += (this.left ? -1 : 1) * (this.§_-93a§ * 0.5 * this.scale) * _loc5_;
               _loc2_.x = Math.abs(_loc2_.x) < this.actualSpeed ? Number(_loc2_.x) : (this.left ? -this.actualSpeed : this.actualSpeed) * _loc5_;
            }
            else if(this.up)
            {
               _loc2_.x += (this.left ? -1 : 1) * (this.§_-93a§ * 0.5 * this.scale) * _loc5_;
               _loc2_.x = Math.abs(_loc2_.x) < this.actualSpeed ? Number(_loc2_.x) : (this.left ? -this.actualSpeed : this.actualSpeed) * _loc5_ * this.§_-U2L§;
            }
            else
            {
               _loc2_.x += (this.left ? -1 : 1) * (this.§_-I2D§ * this.scale) * _loc5_;
               _loc2_.x = Math.abs(_loc2_.x) < this.actualSpeed ? Number(_loc2_.x) : (this.left ? -this.actualSpeed : this.actualSpeed) * _loc5_;
            }
            if(this.swim)
            {
               _loc2_.x *= this.§_-h1t§;
            }
            this.heroView.direction = this.left && _loc5_ > 0 || !this.left && _loc5_ < 0;
         }
         if(_loc3_)
         {
            _loc2_.MulM(this.body.GetTransform().R);
         }
         this.body.SetLinearVelocity(_loc2_);
         if((this.isHare && !(this.heroView.§_-Wk§ as §_-31F§).§_-62l§ || this.isScrat) && this.§_-426§)
         {
            if(Boolean(self && !self.§_-426§) && Boolean(!(this.isHare && self.isHare)) && !(this.isScrat && !this.acornShare))
            {
               _loc6_ = self.position.Copy();
               _loc6_.Subtract(this.position);
               if(_loc6_.Length() < 4)
               {
                  (this.game.map.get(§_-P2o§)[0] as §_-P2o§).§_-92T§(new DetectHeroEvent(self,false));
                  if(this.isScrat)
                  {
                     Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-n9§,1,this.id);
                  }
               }
            }
         }
         this.swim = false;
         this.§_-o1T§ = false;
         if(Boolean(this.§_-9e§) && (this.heroView.running || this.heroView.§_-k2P§))
         {
            _loc7_ = this.§_-9e§.Copy();
            _loc7_.Normalize();
            _loc7_.Multiply(§_-v22§);
            this.position.Add(_loc7_);
            this.body.SetPosition(this.position);
            this.§_-9e§.Subtract(_loc7_);
            if(this.§_-9e§.Length() < §_-v22§)
            {
               this.§_-9e§ = null;
            }
         }
         this.§_-A18§();
         this.extGravity.SetZero();
         this.useGravity = true;
      }
      
      public function §_-pr§() : void
      {
         if(this.game.cast.radius == 0)
         {
            return;
         }
         this.heroView.circle.visible = true;
         this.§_-9q§();
      }
      
      public function §_-Z2j§(param1:Number) : void
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
         this.heroView.circle.scaleXY(param1 / this.heroView.§_-l2z§);
         if(_loc2_)
         {
            this.heroView.circle.gotoAndStop(_loc3_);
            this.heroView.circle.visible = true;
         }
         this.§_-9q§();
      }
      
      public function §_-71x§() : void
      {
         this.heroView.circle.visible = false;
      }
      
      public function §_-I5§() : void
      {
         this.isDead = this.id == Game.selfId ? this.isDead : false;
         this.show();
      }
      
      public function §_-h2r§(param1:int = -1) : void
      {
         if(this.id != Game.selfId && this.id > 0)
         {
            return;
         }
         if(this.§_-12l§.running && this.id > 0)
         {
            return;
         }
         if(this.immortal || this.behaviourController.getState(§_-hu§) != null)
         {
            return;
         }
         if(!this.isDead)
         {
            this.§_-g2k§();
         }
         this.§_-13w§ = true;
         this.§_-I1R§ = param1;
         this.dead = true;
         this.dispatchEvent(new Event(Hero.§_-Uq§));
      }
      
      public function §_-E2§() : void
      {
         this.§_-12l§.reset();
         this.§_-12l§.start();
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
         dispatchEvent(new Event(Hero.§_-g1O§));
         dispatchEvent(new Event(Hero.§_-n2S§));
         dispatchEvent(new Event(Hero.§_-d2S§));
         this.dead = false;
         this.§_-h1n§ = false;
         this.§_-t25§(false);
         this.ghost = false;
         this.velocity = new b2Vec2();
         this.heroView.§_-L2y§();
         if(this.isSelf)
         {
            this.show();
         }
         switch(param1)
         {
            case §_-72H§:
               this.§_-E2§();
               break;
            case §_-M2Q§:
               this.§_-c2X§();
         }
         if(this.§_-HQ§ && this.isSelf)
         {
            this.sendLocation();
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-f13§,this));
      }
      
      public function jump(param1:Boolean) : void
      {
         var _loc4_:Boolean = false;
         this.up = param1;
         if(this.heroView.§_-A15§)
         {
            return;
         }
         var _loc2_:§_-i8§ = this.behaviourController.getState(§_-q2D§) as §_-q2D§;
         if(!_loc2_)
         {
            _loc2_ = this.behaviourController.getState(§_-23P§) as §_-23P§;
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
         var _loc3_:Boolean = this.§_-bC§;
         dispatchEvent(new Event(Hero.§_-g1O§));
         dispatchEvent(new Event(Hero.§_-H2j§));
         if(_loc3_ || this.behaviourController.getState(§_-b2w§) != null)
         {
            return;
         }
         if(this.§_-A25§.onFloor || this.§_-aq§ > 0 || this.§_-k1l§ > 0 || this.§_-32k§)
         {
            if(this.§_-A25§.onFloor && this.§_-A25§.§_-ZG§)
            {
               _loc4_ = true;
               this.§_-X2f§ = this.position.Copy();
            }
            else
            {
               _loc4_ = this.§_-32k§;
               if(!_loc4_ && this.§_-k1l§ > 0)
               {
                  if(Boolean(this.§_-X2f§) && !this.§_-u2Z§)
                  {
                     --this.§_-k1l§;
                     _loc4_ = true;
                  }
               }
               if(!_loc4_ && this.§_-aq§ > 0)
               {
                  if(this.id == Game.selfId)
                  {
                     GameSounds.playUnrepeatable("double_jump");
                  }
                  dispatchEvent(new Event(Hero.§_-mh§));
                  --this.§_-aq§;
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
            this.velocity.y = this.§_-A25§.onFloor ? -this.§_-n1C§ : -this.§_-n1C§ * this.§_-P1E§;
            this.velocity.MulM(this.body.GetTransform().R);
            this.body.SetLinearVelocity(this.velocity);
         }
         dispatchEvent(new Event(Hero.EVENT_UP_END));
      }
      
      public function moveLeft(param1:Boolean) : void
      {
         if(this.heroView.§_-A15§ && !this.§_-o15§ && param1)
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
         if(this.heroView.§_-A15§ && !this.§_-o15§ && param1)
         {
            return;
         }
         this.right = param1;
         if(param1)
         {
            this.heroView.direction = false;
         }
      }
      
      public function §_-312§() : void
      {
         var _loc2_:§_-P2o§ = null;
         var _loc3_:int = 0;
         if(this.isHare && !this.§_-sD§)
         {
            _loc3_ = Math.random() * §_-43Z§.§_-I2z§.length;
            GameSounds.playUnrepeatable(§_-43Z§.§_-I2z§[_loc3_],§_-31F§.§_-Y2M§);
         }
         var _loc1_:Array = this.game.map.get(§_-P2o§);
         this.§_-sD§ = true;
         for each(_loc2_ in _loc1_)
         {
            _loc2_.alpha = 0;
         }
      }
      
      public function §_-GI§() : void
      {
         var _loc1_:Hero = null;
         var _loc3_:§_-P2o§ = null;
         if(!this.§_-sD§)
         {
            return;
         }
         this.§_-sD§ = false;
         for each(_loc1_ in this.game.squirrels.players)
         {
            if(_loc1_.§_-C3a§)
            {
               return;
            }
         }
         if(!this.game.map)
         {
            return;
         }
         var _loc2_:Array = this.game.map.get(§_-P2o§);
         for each(_loc3_ in _loc2_)
         {
            _loc3_.alpha = 1;
         }
      }
      
      public function §_-T1T§(param1:§_-z2c§) : void
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
         this.controller.§_-i1y§ = this.isStopped;
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
         if(_loc4_.§_-h1n§ && !this.isHare && !this.isDead)
         {
            this.game.squirrels.§_-83Q§(this.id,_loc4_.id);
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
         if(this.behaviourController.getState(§_-b2w§) != null)
         {
            param1.SetEnabled(false);
         }
         var _loc3_:* = param1.GetFixtureA().GetBody().GetUserData();
         if(_loc3_ == this)
         {
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(_loc3_ is §_-K1U§ && !this.§_-DP§)
         {
            param1.SetEnabled(false);
         }
         else if(_loc3_ is §_-r14§ && !(_loc3_ is §_-K1U§) && this.§_-DP§)
         {
            param1.SetEnabled(false);
         }
         if(this.ghost)
         {
            param1.SetEnabled(false);
         }
         if(this.§_-12l§.running && (_loc3_ is §_-314§ || _loc3_ is §_-12R§ || _loc3_ is §_-mo§))
         {
            param1.SetEnabled(false);
         }
         if(_loc3_ is GameBody && (_loc3_ as GameBody).ghost)
         {
            param1.SetEnabled(false);
         }
         if(_loc3_ is §_-FD§ && (_loc3_ as §_-FD§).§_-d2E§(this.id))
         {
            param1.SetEnabled(false);
         }
         if(_loc3_ is §_-B3Y§)
         {
            if(this.friction <= 0)
            {
               param1.SetEnabled(false);
            }
            if(param1.IsEnabled())
            {
               (_loc3_ as §_-B3Y§).§_-y1Z§(this);
            }
         }
         if(!(_loc3_ is Hero))
         {
            return;
         }
         if(this.isHare && !(this.world.userData as SquirrelGame).§_-614§.ShouldCollide(param1.GetFixtureA(),param1.GetFixtureB()))
         {
            param1.SetEnabled(false);
            return;
         }
         var _loc4_:Hero = _loc3_ as Hero;
         if(this.isHare && _loc4_.§_-h1n§ && !this.§_-EO§)
         {
            param1.SetEnabled(false);
         }
         if(this.§_-h1n§ || _loc4_.§_-h1n§)
         {
            param1.SetEnabled(false);
         }
         if(!this.§_-i12§)
         {
            return;
         }
         if(this.§_-S1I§ || _loc4_.§_-S1I§)
         {
            param1.SetEnabled(true);
            return;
         }
         param1.SetEnabled(this.body.GetLocalVector(_loc4_.position).y - this.body.GetLocalVector(this.position).y > 3.5 * _loc4_.scale);
         if(_loc4_.§_-i12§ && this.body.GetLocalVector(this.position).y - this.body.GetLocalVector(_loc4_.position).y > 3.5 * this.scale)
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
         this.§_-A18§();
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
         this.heroView.§_-2i§(param1,param2);
         this.scale = _loc3_;
      }
      
      public function §_-72F§(param1:DisplayObject, param2:Boolean = false, param3:Boolean = true) : void
      {
         this.heroView.§_-72F§(param1,param2,param3);
      }
      
      public function addViewButton(param1:DisplayObject) : void
      {
         if(this.§_-n2t§ is §_-L2k§)
         {
            (this.§_-n2t§ as §_-L2k§).reset();
         }
         if(Boolean(this.§_-n2t§) && Boolean(this.§_-n2t§.parent))
         {
            this.§_-n2t§.parent.removeChild(this.§_-n2t§);
         }
         this.§_-n2t§ = param1;
         this.§_-n2t§.y = this.heroView.y;
         addChild(this.§_-n2t§);
      }
      
      public function §_-Aj§(param1:§_-03i§, param2:Timer = null) : void
      {
         if(!this.isSelf || !this.§_-T1X§ || !param1)
         {
            return;
         }
         this.§_-T1X§.§_-Aj§(param1,param2);
      }
      
      public function removeBuff(param1:§_-03i§, param2:Timer = null) : void
      {
         if(!this.isSelf || !this.§_-T1X§ || !param1)
         {
            return;
         }
         this.§_-T1X§.§_-73u§(param1,param2);
      }
      
      public function §_-EV§(param1:Boolean) : void
      {
         if(!this.isSelf || !this.§_-T1X§)
         {
            return;
         }
         this.§_-T1X§.visible = param1;
      }
      
      public function §_-U2J§(param1:int) : void
      {
         if(param1 == §_-K1Q§)
         {
            return;
         }
         this.heroView.§_-U2J§(param1);
      }
      
      public function get team() : int
      {
         return this.§_-Z3§;
      }
      
      public function set team(param1:int) : void
      {
         if(this.§_-Z3§ == param1)
         {
            return;
         }
         this.§_-Z3§ = param1;
         this.heroView.team = this.team;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-i11§,this));
      }
      
      public function get mass() : int
      {
         return this.§_-7G§;
      }
      
      public function set mass(param1:int) : void
      {
         this.§_-7G§ = param1;
         var _loc2_:b2MassData = new b2MassData();
         this.body.GetMassData(_loc2_);
         _loc2_.mass = param1;
         if(this.body.GetWorld().IsLocked())
         {
            this.§_-Y6§ = true;
            return;
         }
         this.body.SetMassData(_loc2_);
      }
      
      public function get §_-S2R§() : Number
      {
         return this.§_-43F§;
      }
      
      public function set §_-S2R§(param1:Number) : void
      {
         this.§_-43F§ = param1;
         var _loc2_:b2MassData = new b2MassData();
         this.body.GetMassData(_loc2_);
         _loc2_.I = param1;
         if(this.body.GetWorld().IsLocked())
         {
            this.§_-13g§ = true;
            return;
         }
         this.body.SetMassData(_loc2_);
      }
      
      public function get §_-P1E§() : Number
      {
         return this.§_-z1P§;
      }
      
      public function set §_-P1E§(param1:Number) : void
      {
         this.§_-z1P§ = param1;
      }
      
      public function get §_-e2I§() : int
      {
         return this.§_-93R§;
      }
      
      public function set §_-e2I§(param1:int) : void
      {
         this.§_-93R§ = param1;
      }
      
      public function get §_-WX§() : int
      {
         return this.§_-N20§;
      }
      
      public function set §_-WX§(param1:int) : void
      {
         this.§_-N20§ = param1;
      }
      
      public function get §_-93a§() : int
      {
         return this.§_-g2y§;
      }
      
      public function set §_-93a§(param1:int) : void
      {
         this.§_-g2y§ = param1;
      }
      
      public function get swimFactor() : Number
      {
         return this.§_-h1t§;
      }
      
      public function set swimFactor(param1:Number) : void
      {
         this.§_-h1t§ = param1;
      }
      
      public function get actualSpeed() : Number
      {
         return this.§_-711§ * (this.isHare ? §_-CW§ : (this.behaviourController.getState(§_-q1d§) != null ? §_-K2D§ : 1));
      }
      
      public function get runSpeed() : Number
      {
         return this.§_-711§;
      }
      
      public function set runSpeed(param1:Number) : void
      {
         this.§_-711§ = param1;
      }
      
      public function get §_-I2D§() : int
      {
         return this.§_-mf§;
      }
      
      public function set §_-I2D§(param1:int) : void
      {
         this.§_-mf§ = param1;
      }
      
      public function get jumpVelocity() : int
      {
         return this.§_-B3r§;
      }
      
      public function set jumpVelocity(param1:int) : void
      {
         this.§_-B3r§ = param1;
      }
      
      public function get §_-n1C§() : int
      {
         if(this.isHare)
         {
            return this.jumpVelocity + §_-82X§;
         }
         if(this.isDragon)
         {
            return this.jumpVelocity + §_-D2t§;
         }
         return this.jumpVelocity;
      }
      
      public function get friction() : Number
      {
         return this.§_-j6§;
      }
      
      public function set friction(param1:Number) : void
      {
         this.§_-j6§ = param1;
      }
      
      public function set restitution(param1:Number) : void
      {
         this.§_-r1E§ = param1;
      }
      
      public function get scale() : Number
      {
         return this.§_-Tq§;
      }
      
      public function set scale(param1:Number) : void
      {
         var _loc3_:§_-qC§ = null;
         var _loc4_:Number = NaN;
         if(this.onRemove)
         {
            return;
         }
         if(param1 == 1)
         {
            for each(_loc3_ in this.perkController.§_-515§)
            {
               if(_loc3_ is §_-on§ && _loc3_.active)
               {
                  _loc4_ = §_-on§(_loc3_).scale;
               }
            }
         }
         this.§_-Tq§ = param1;
         this.heroView.scale = _loc4_ || param1;
         var _loc2_:b2CircleShape = new b2CircleShape(2 * param1);
         this.§_-b1Y§.GetShape().Set(_loc2_);
         _loc2_ = new b2CircleShape(1.9 * param1);
         _loc2_.SetLocalPosition(new b2Vec2(0,0.2 * param1));
         this.§_-Fn§.GetShape().Set(_loc2_);
         dispatchEvent(new Event(Hero.§_-V1L§));
      }
      
      public function get §_-i12§() : Boolean
      {
         return this.§_-X1f§ > 0;
      }
      
      public function set §_-i12§(param1:Boolean) : void
      {
         this.§_-X1f§ = Math.max(0,this.§_-X1f§ + (param1 ? 1 : -1));
         var _loc2_:b2FilterData = this.§_-b1Y§.GetFilterData();
         _loc2_.categoryBits = this.§_-i12§ ? uint(_loc2_.categoryBits | §_-V§.§_-Y18§) : uint(_loc2_.categoryBits & ~§_-V§.§_-Y18§);
         _loc2_.maskBits = this.§_-i12§ ? uint(_loc2_.maskBits | §_-V§.§_-qV§) : uint(_loc2_.maskBits & ~§_-V§.§_-qV§);
         this.§_-b1Y§.SetFilterData(_loc2_);
         var _loc3_:b2FilterData = this.§_-Fn§.GetFilterData();
         _loc3_.categoryBits = this.§_-i12§ ? uint(_loc3_.categoryBits | §_-V§.§_-o1y§) : uint(_loc3_.categoryBits & ~§_-V§.§_-o1y§);
         _loc3_.maskBits = this.§_-i12§ ? uint(_loc3_.maskBits | §_-V§.§_-qV§) : uint(_loc3_.maskBits & ~§_-V§.§_-qV§);
         this.§_-Fn§.SetFilterData(_loc3_);
      }
      
      public function get §_-S1I§() : Boolean
      {
         return this.§_-7U§;
      }
      
      public function set §_-S1I§(param1:Boolean) : void
      {
         this.§_-7U§ = param1;
         this.§_-i12§ = param1;
      }
      
      public function get §_-DP§() : Boolean
      {
         return this.§_-x1t§;
      }
      
      public function set §_-DP§(param1:Boolean) : void
      {
         this.§_-x1t§ = param1;
         this.heroView.alpha = param1 ? 0.4 : 1;
         if(this.§_-Ig§ != null)
         {
            this.§_-Ig§.§_-h2r§();
         }
         this.§_-Ig§ = null;
      }
      
      public function get §_-HQ§() : Boolean
      {
         return this.§_-l1w§;
      }
      
      public function set §_-HQ§(param1:Boolean) : void
      {
         this.§_-l1w§ = param1;
      }
      
      public function set §_-129§(param1:Boolean) : void
      {
         this.§_-PA§ = param1;
         if(Boolean(this.heroView.§_-s7§) && Boolean(this.heroView.§_-s7§.parent) && !param1)
         {
            this.heroView.§_-s7§.parent.removeChild(this.heroView.§_-s7§);
         }
         if(!this.heroView.§_-s7§ && param1)
         {
            this.heroView.§_-s7§ = new WizardAura();
            this.heroView.§_-s7§.mouseEnabled = false;
         }
         if(Boolean(this.heroView.§_-s7§) && Boolean(!this.heroView.§_-s7§.parent) && param1)
         {
            this.game.addChild(this.heroView.§_-s7§);
         }
         if(param1)
         {
            this.§_-9q§();
         }
      }
      
      public function get §_-129§() : Boolean
      {
         return this.§_-PA§;
      }
      
      public function get perksAvailable() : Boolean
      {
         return this.§_-53J§;
      }
      
      public function set perksAvailable(param1:Boolean) : void
      {
         if(this.§_-53J§ == param1)
         {
            return;
         }
         this.§_-53J§ = param1;
         §_-O1M§.§_-v2A§();
      }
      
      public function teleport(param1:int, param2:b2Vec2 = null) : void
      {
         switch(param1)
         {
            case §_-98§:
               if(!this.shaman || this.isDead)
               {
                  param2 = this.game.squirrels.§_-33L§(this.id,this.team);
               }
               this.teleportTo(param2);
               if(this is §_-534§ && this.isSelf)
               {
                  setTimeout(this.sendLocation,0);
               }
               break;
            case §_-o3§:
               if(this.game.map.§_-ro§)
               {
                  this.teleportTo(this.game.map.§_-ro§);
               }
               else
               {
                  this.teleport(§_-98§);
               }
         }
      }
      
      public function teleportTo(param1:b2Vec2) : void
      {
         if(!this.§_-k2W§)
         {
            return;
         }
         if(Boolean(param1) && (isNaN(param1.x) || isNaN(param1.y)))
         {
            §_-TQ§.add("Hero.teleportTo skipped NaN",this.id,param1.x,param1.y);
            return;
         }
         dispatchEvent(new Event(Hero.§_-Y1J§));
         this.velocity = new b2Vec2();
         if(param1)
         {
            this.position = param1;
         }
         if(!this.shaman || this.isDead)
         {
            if(this is §_-i1L§ && (this.id == Game.selfId || this == Hero.self))
            {
               this.game.camera.enabled = true;
               if(this.game is §_-b1U§)
               {
                  (this.game as §_-b1U§).§_-P25§();
               }
            }
            if(this.isDead && !this.inHollow && !this.isDragon && !this.isHare && !(this is §_-534§))
            {
               this.§_-c2X§();
            }
            if(this.isHare)
            {
               this.§_-4j§(Hero.§_-VP§);
            }
            setTimeout(this.§_-C1E§,0);
            return;
         }
         this.heroView.§_-L2y§();
         this.show();
      }
      
      public function §_-s1§(param1:b2Vec2) : void
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
            if(!game || !game.squirrels || !heroView || !§_-k2W§)
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
            if(!game || !game.squirrels || !§_-k2W§)
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
      
      public function get sideIcon() : §_-h2I§
      {
         if(!this.icon)
         {
            this.icon = new §_-1s§(§_-1s§.§_-V2O§,§_-1s§.§_-9Q§);
         }
         return this.icon;
      }
      
      public function get showIcon() : Boolean
      {
         if(this.§_-S1W§ || this.§_-Y2t§)
         {
            return true;
         }
         return !this.isDead && !this.inHollow && this.heroView.visible && (this.id == Hero.§_-74§ || this.shaman || this.isHare || this.id < 0);
      }
      
      public function §_-N2u§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.§_-S1W§ || this.§_-Y2t§)
         {
            _loc1_ = §_-1s§.§_-32X§;
            _loc2_ = this.§_-Y2t§ ? §_-1s§.§_-Ce§ : §_-1s§.§_-O2Z§;
         }
         else
         {
            if(this.id == Hero.§_-74§)
            {
               _loc1_ = §_-1s§.§_-V2O§;
            }
            else if(this.isHare)
            {
               _loc1_ = this.§_-426§ ? §_-1s§.§_-I2j§ : §_-1s§.§_-32X§;
            }
            else
            {
               switch(this.team)
               {
                  case §_-17§:
                     _loc1_ = §_-1s§.§_-32X§;
                     break;
                  case §_-O18§:
                     _loc1_ = §_-1s§.§_-B2C§;
                     break;
                  default:
                     _loc1_ = §_-1s§.§_-tC§;
               }
            }
            if(this.isHare)
            {
               _loc2_ = §_-1s§.§_-R1i§;
            }
            else if(this.isDragon)
            {
               _loc2_ = §_-1s§.§_-C3E§;
            }
            else if(this.shaman)
            {
               switch(this.team)
               {
                  case §_-17§:
                     _loc2_ = §_-1s§.§_-S1Q§;
                     break;
                  case §_-O18§:
                     _loc2_ = §_-1s§.§_-WE§;
                     break;
                  default:
                     _loc2_ = §_-1s§.§_-SC§;
               }
            }
            else
            {
               _loc2_ = §_-1s§.§_-9Q§;
            }
         }
         if(_loc1_ == this.§_-Z2q§ && _loc2_ == this.§_-P2M§)
         {
            return;
         }
         var _loc3_:§_-1s§ = this.icon as §_-1s§;
         if(!_loc3_)
         {
            this.§_-Z2q§ = _loc1_;
            this.§_-P2M§ = _loc2_;
            this.icon = new §_-1s§(_loc1_,_loc2_);
            return;
         }
         if(_loc2_ != this.§_-P2M§)
         {
            this.§_-P2M§ = _loc2_;
            _loc3_.icon = _loc2_;
         }
         if(_loc1_ != this.§_-Z2q§)
         {
            this.§_-Z2q§ = _loc1_;
            _loc3_.color = _loc1_;
         }
      }
      
      public function get isHare() : Boolean
      {
         return this.§_-U2I§;
      }
      
      public function set isHare(param1:Boolean) : void
      {
         if(this.§_-U2I§ == param1)
         {
            return;
         }
         this.§_-U2I§ = param1;
         this.heroView.isHare = param1;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-E2R§,this));
         §_-TQ§.add("Hare ",this.id,param1);
         this.§_-52o§();
      }
      
      public function get isSquirrel() : Boolean
      {
         return !(this.isDragon || this.isScrat || this.isHare || this.shaman);
      }
      
      public function get isScrat() : Boolean
      {
         return this.§_-t1f§ && !this.isDragon && !this.isHare && !this.shaman;
      }
      
      public function set isScrat(param1:Boolean) : void
      {
         if(this.§_-t1f§ == param1)
         {
            return;
         }
         this.§_-t1f§ = param1;
         this.heroView.isScrat = param1;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-q1G§,this));
         §_-TQ§.add("Scrat ",this.id,param1);
      }
      
      public function get isDragon() : Boolean
      {
         return this.§_-T1i§;
      }
      
      public function set isDragon(param1:Boolean) : void
      {
         if(this.§_-T1i§ == param1)
         {
            return;
         }
         this.§_-T1i§ = param1;
         this.heroView.isDragon = param1;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-c2v§,this));
         §_-TQ§.add("Dragon ",this.id,param1);
         this.§_-52o§();
      }
      
      public function get §_-nf§() : int
      {
         if(this.shaman)
         {
            return §_-g2W§.§_-y1I§;
         }
         if(this.isHare)
         {
            return §_-g2W§.§_-p2x§;
         }
         if(this.isDragon)
         {
            return §_-g2W§.§_-A2k§;
         }
         return §_-g2W§.§_-k2t§;
      }
      
      public function get §_-EO§() : Boolean
      {
         return this.§_-S1q§;
      }
      
      public function set §_-EO§(param1:Boolean) : void
      {
         this.§_-S1q§ = param1;
         var _loc2_:b2FilterData = this.§_-b1Y§.GetFilterData();
         _loc2_.categoryBits = param1 ? uint(_loc2_.categoryBits | §_-V§.§_-j1I§) : uint(_loc2_.categoryBits & ~§_-V§.§_-j1I§);
         _loc2_.maskBits = param1 ? uint(_loc2_.maskBits | §_-V§.§_-qV§) : uint(_loc2_.maskBits & ~§_-V§.§_-qV§);
         this.§_-b1Y§.SetFilterData(_loc2_);
         var _loc3_:b2FilterData = this.§_-Fn§.GetFilterData();
         _loc3_.categoryBits = param1 ? uint(_loc3_.categoryBits | §_-V§.§_-j1I§) : uint(_loc3_.categoryBits & ~§_-V§.§_-j1I§);
         _loc3_.maskBits = param1 ? uint(_loc3_.maskBits | §_-V§.§_-qV§) : uint(_loc3_.maskBits & ~§_-V§.§_-qV§);
         this.§_-Fn§.SetFilterData(_loc3_);
      }
      
      public function get §_-h1n§() : Boolean
      {
         return this.§_-58§;
      }
      
      public function set §_-h1n§(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         this.§_-58§ = param1;
         var _loc2_:b2FilterData = this.§_-b1Y§.GetFilterData();
         _loc2_.categoryBits = param1 ? uint(_loc2_.categoryBits | §_-V§.§_-a2N§) : uint(_loc2_.categoryBits & ~§_-V§.§_-a2N§);
         _loc2_.maskBits = param1 || this.§_-EO§ ? uint(_loc2_.maskBits | §_-V§.§_-qV§) : uint(_loc2_.maskBits & ~§_-V§.§_-qV§);
         this.§_-b1Y§.SetFilterData(_loc2_);
         this.heroView.§_-h1n§ = param1;
         if(param1)
         {
            _loc3_ = §_-92z§.mode == §_-q1p§.§_-13I§ ? 10000 : 30000;
            setTimeout(this.breakGum,_loc3_);
         }
      }
      
      public function get §_-G5§() : Boolean
      {
         return this.§_-tg§;
      }
      
      public function §_-t25§(param1:Boolean, param2:String = "") : void
      {
         if(this.§_-tg§ == param1)
         {
            return;
         }
         this.§_-tg§ = param1;
         if(param1)
         {
            this.applyEffect(param2);
         }
         else
         {
            this.disableEffect(this.§_-fW§[§_-93d§.§_-MA§] ? §_-93d§.§_-MA§ : §_-93d§.§_-C2M§);
         }
      }
      
      public function applyEffect(param1:String, param2:int = 1, param3:Boolean = true) : §_-f1G§
      {
         var _loc4_:§_-f1G§ = §_-93d§.instance.§_-23j§(param1);
         if(param3)
         {
            _loc4_.start();
         }
         this.§_-fW§[param1] = _loc4_;
         this.getStarlingView().parent.addChildAt(_loc4_.view,this.getStarlingView().parent.getChildIndex(this.getStarlingView()) + param2);
         return _loc4_;
      }
      
      public function disableEffect(param1:String) : void
      {
         var _loc2_:§_-f1G§ = this.§_-fW§[param1];
         if(!_loc2_)
         {
            return;
         }
         _loc2_.stop();
         §_-93d§.instance.§_-ms§(_loc2_);
         delete this.§_-fW§[param1];
      }
      
      public function set §_-61G§(param1:Boolean) : void
      {
         if(this.§_-W2Q§ == param1)
         {
            return;
         }
         this.§_-W2Q§ = param1;
         this.isStopped = param1;
         if(param1)
         {
            setTimeout(this.heroView.§_-Ci§,0,Hero.§_-f1r§);
         }
         else if(this.heroView.§_-026§ == Hero.§_-f1r§)
         {
            this.heroView.§_-L2y§();
         }
      }
      
      public function set §_-Jo§(param1:Boolean) : void
      {
         if(this.§_-32k§ == param1)
         {
            return;
         }
         this.§_-32k§ = param1;
         this.§_-z1P§ *= param1 ? 3 : 1 / 3;
      }
      
      public function get §_-Jo§() : Boolean
      {
         return this.§_-32k§;
      }
      
      public function get immortal() : Boolean
      {
         return this.§_-M2§;
      }
      
      public function set immortal(param1:Boolean) : void
      {
         if(this.§_-M2§ == param1)
         {
            return;
         }
         this.§_-M2§ = this.heroView.immortal = param1;
      }
      
      public function get §_-j2i§() : Boolean
      {
         return this.§_-p1w§;
      }
      
      public function set §_-j2i§(param1:Boolean) : void
      {
         if(this.§_-p1w§ == param1)
         {
            return;
         }
         this.§_-p1w§ = param1;
         this.isStopped = param1;
      }
      
      public function get §_-Rc§() : Boolean
      {
         return this.§_-Q2t§;
      }
      
      public function set §_-Rc§(param1:Boolean) : void
      {
         this.§_-Q2t§ = param1;
      }
      
      public function set §_-A15§(param1:Boolean) : void
      {
         var start:Function;
         var tween:§_-529§;
         var end:Function = null;
         var value:Boolean = param1;
         if(this.§_-G15§ == value)
         {
            return;
         }
         this.heroView.§_-A15§ = this.§_-G15§ = value;
         if(!value)
         {
            return;
         }
         if(this.§_-712§ == null)
         {
            return;
         }
         this.§_-712§.view.visible = true;
         end = function():void
         {
            if(§_-712§ == null)
            {
               return;
            }
            §_-712§.view.visible = false;
         };
         start = function():void
         {
            if(§_-712§ == null)
            {
               return;
            }
            var _loc1_:§_-529§ = new §_-529§(§_-712§.view,0.3);
            _loc1_.delay = 0.3;
            _loc1_.§_-O2h§(0);
            _loc1_.onComplete = end;
            Starling.§_-A3B§.add(_loc1_);
         };
         tween = new §_-529§(this.§_-712§.view,0.3);
         tween.§_-O2h§(1);
         tween.onComplete = start;
         Starling.§_-A3B§.add(tween);
      }
      
      public function §_-6m§(param1:DisplayObject) : void
      {
         this.heroView.§_-6m§(param1);
         this.heroView.§_-l1p§ = param1 != null && !this.§_-la§;
      }
      
      public function §_-dq§(param1:b2Vec2) : void
      {
         this.§_-9e§ = param1;
      }
      
      public function set §_-S1K§(param1:Boolean) : void
      {
         this.§_-A2h§ = param1;
      }
      
      public function get §_-S1K§() : Boolean
      {
         return this.§_-A2h§;
      }
      
      public function §_-52o§() : void
      {
         this.perkController.§_-su§(this.§_-nf§);
      }
      
      protected function §_-B1y§() : void
      {
         if(!this.heroView.visible)
         {
            return;
         }
         var _loc1_:int = this.game.map.size.y - §_-a9§.§_-31m§ + §_-r2V§ * 2;
         if(this.y < -_loc1_)
         {
            if(this.§_-bC§)
            {
               this.sendLocation(Keyboard.UP);
               this.jump(true);
               this.sendLocation(Keyboard.UP * -1);
               this.jump(false);
            }
            else
            {
               this.position = new b2Vec2(this.x / Game.§_-x2P§,-_loc1_ / Game.§_-x2P§);
               this.sendLocation();
            }
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.x < -§_-r2V§ || this.x > this.game.map.size.x + §_-r2V§)
         {
            _loc2_ = this.x < 0 ? §_-r2V§ : int(-§_-r2V§);
         }
         else
         {
            if(this.y <= this.game.map.size.y)
            {
               return;
            }
            _loc3_ = -(§_-r2V§ * 2);
            if(this.x > -§_-r2V§ && this.x < 0 || this.x > this.game.map.size.x && this.x < this.game.map.size.x + §_-r2V§)
            {
               _loc2_ = this.x < 0 ? int(§_-c1c§ - this.x) : int(this.game.map.size.x - §_-c1c§ - this.x);
            }
         }
         this.x += _loc2_;
         this.y += _loc3_;
         this.§_-L1A§ = Hero.§_-Dd§;
         this.dead = true;
         this.§_-g2k§();
      }
      
      protected function §_-A18§() : void
      {
         this.x = this.body.GetPosition().x * Game.§_-x2P§;
         this.y = this.body.GetPosition().y * Game.§_-x2P§;
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
         if(_loc2_.Length() == 0 && !this.§_-SR§)
         {
            this.§_-9q§();
            return;
         }
         if(this.body.GetAngle() != Math.atan2(_loc2_.y,_loc2_.x) - Math.PI * 0.5 && !this.§_-SR§)
         {
            this.body.SetAngle(Math.atan2(_loc2_.y,_loc2_.x) - Math.PI * 0.5);
         }
         this.rotation = this.body.GetAngle() * Game.R2D;
         this.§_-9q§();
      }
      
      protected function §_-9q§() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Point = null;
         if(!this.isSelf && !(§_-71o§.active as §_-P1Y§))
         {
            return;
         }
         if(Boolean(this.game.cast) && this.heroView.circle.visible)
         {
            _loc1_ = this.game.cast.radius;
            _loc2_ = this.game.globalToLocal(this.localToGlobal(new Point(-_loc1_,this.heroView.y - _loc1_ - §_-YH§)));
            this.heroView.circle.x = _loc2_.x;
            this.heroView.circle.y = _loc2_.y;
            this.heroView.circle.rotation = this.rotation;
         }
         if(!this.§_-129§ || !this.heroView.§_-s7§.visible)
         {
            return;
         }
         _loc2_ = this.game.globalToLocal(this.localToGlobal(new Point(-176,this.heroView.y - 201)));
         this.heroView.§_-s7§.x = _loc2_.x;
         this.heroView.§_-s7§.y = _loc2_.y;
         this.heroView.§_-s7§.rotation = this.rotation;
      }
      
      protected function §_-rF§(param1:Player) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         param1.removeEventListener(this.§_-rF§);
         this.§_-4A§ = param1.id;
         if(§_-71o§.active is §_-92z§ && !§_-q1p§.§_-Vz§.teamMode)
         {
            _loc2_ = false;
            _loc3_ = 0;
            while(_loc3_ < this.player["worn_packages"].length)
            {
               _loc2_ ||= §_-g2W§.§_-91b§(this.player["worn_packages"][_loc3_]);
               _loc3_++;
            }
            _loc4_ = false;
            _loc3_ = 0;
            while(_loc3_ < this.player["worn_packages"].length)
            {
               _loc4_ ||= §_-g2W§.§_-W2e§(this.player["worn_packages"][_loc3_]);
               _loc3_++;
            }
            this.isScrat = _loc2_ || _loc4_;
         }
         this.heroView.setClothing(this.player["worn_packages"],this.player["worn_accessories"]);
         this.perkController.§_-j22§();
         this.perkController.§_-D1Z§();
         if(this.player["clan_id"] == 0)
         {
            _loc5_ = this.isSelf ? §_-13r§.§_-DX§(§_-13r§.PLAYER_TYPE) : §_-13r§.§_-K1M§(this.player["rating_score"],§_-13r§.PLAYER_TYPE);
            this.heroView.§_-l2f§(this.player.name,this.player["shaman_level"],_loc5_,this.player["vip_time"] > 0);
            return;
         }
         if(this.§_-81t§ != null)
         {
            return;
         }
         this.§_-81t§ = §_-e2W§.§_-W2X§(this.player["clan_id"]);
         this.§_-81t§.addEventListener(§_-Oy§.§_-g2n§ | §_-Oy§.§_-TZ§ | §_-Oy§.§_-Q1V§ | §_-Oy§.STATE,this.onClanLoaded);
         §_-e2W§.request(this.player["clan_id"],§_-Oy§.§_-g2n§ | §_-Oy§.§_-TZ§ | §_-Oy§.§_-Q1V§ | §_-Oy§.STATE);
      }
      
      protected function get §_-u2Z§() : Boolean
      {
         return this.body.GetLocalVector(this.§_-X2f§).y - this.body.GetLocalVector(this.position).y > 0;
      }
      
      protected function §_-m2q§() : void
      {
         if(!(this.§_-A25§.§_-v2x§ is §_-YY§))
         {
            return;
         }
         var _loc1_:String = (this.§_-A25§.§_-v2x§ as §_-YY§).landSound;
         if(_loc1_ != "")
         {
            GameSounds.playUnrepeatable(_loc1_);
         }
      }
      
      private function §_-A16§() : void
      {
         if(this.§_-B1v§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-B1v§);
            this.§_-B1v§ = null;
         }
         this.§_-J1M§.length = 0;
         this.body.SetFixedRotation(true);
         this.§_-Y6§ = true;
      }
      
      private function §_-T2S§(param1:TimerEvent) : void
      {
         if(this.id != Game.selfId && this.id > 0)
         {
            return;
         }
         this.heroView.§_-C26§ = Math.min((getTimer() - this.§_-q2o§) / this.§_-JG§ * 100,100);
      }
      
      private function onClanLoaded(param1:Clan, param2:uint) : void
      {
         var _loc3_:int = this.isSelf ? §_-13r§.§_-DX§(§_-13r§.PLAYER_TYPE) : §_-13r§.§_-K1M§(this.player["rating_score"],§_-13r§.PLAYER_TYPE);
         var _loc4_:String = param1.state == §_-S2I§.§_-Wr§ ? param1.name : "";
         this.heroView.§_-l2f§(this.player.name,this.player["shaman_level"],_loc3_,this.player["vip_time"] > 0,_loc4_);
         this.perkController.§_-d5§(param1);
         param1.removeEventListener(this.onClanLoaded);
      }
      
      private function breakGum() : void
      {
         this.§_-h1n§ = false;
      }
      
      private function §_-TW§(param1:TimerEvent) : void
      {
         this.heroView.visible = !this.isDead;
         this.body.SetActive(false);
         dispatchEvent(new §_-Wh§(§_-Wh§.§_-63w§));
      }
      
      private function §_-g2k§() : void
      {
         var _loc1_:int = 0;
         if(this.isHare)
         {
            _loc1_ = Math.random() * §_-43Z§.§_-Sp§.length;
            GameSounds.play(§_-43Z§.§_-Sp§[_loc1_]);
            return;
         }
         _loc1_ = int(Math.random() * §_-43Z§.§_-O2W§.length);
         GameSounds.play(§_-43Z§.§_-O2W§[_loc1_]);
      }
      
      private function §_-H2L§(param1:int, param2:int) : void
      {
         this.§_-K2B§ = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
         this.§_-K2B§.position.Set(this.heroView.width / (2 * Game.§_-x2P§) + param1 / Game.§_-x2P§,this.heroView.height / (2 * Game.§_-x2P§) + param2 / Game.§_-x2P§);
         this.§_-K2B§.allowSleep = true;
         this.body = this.world.CreateBody(this.§_-K2B§);
         this.§_-b1Y§ = this.body.CreateFixture(new b2FixtureDef(new b2CircleShape(2),null,0,0.1,1,§_-V§.§_-qV§,§_-V§.§_-j1I§ | §_-V§.§_-31M§ | §_-V§.§_-tL§ | §_-V§.§_-Y18§ | §_-V§.§_-o1y§ | §_-V§.§_-a2N§,0,false));
         this.§_-b1Y§.SetUserData(this);
         var _loc3_:b2CircleShape = new b2CircleShape(1.9 * this.§_-Tq§);
         _loc3_.SetLocalPosition(new b2Vec2(0,0.2 * this.§_-Tq§));
         this.§_-Fn§ = this.body.CreateFixture(new b2FixtureDef(_loc3_,null,0,0.1,1,§_-V§.§_-11o§ | §_-V§.§_-qV§,§_-V§.§_-j1I§ | §_-V§.§_-31M§,0,false));
         this.§_-A25§ = new §_-h12§(this.§_-Fn§,this);
         var _loc4_:b2MassData = new b2MassData();
         _loc4_.mass = this.mass;
         this.body.SetMassData(_loc4_);
         this.body.SetUserData(this);
         §_-w2F§.§_-aE§(this.body);
      }
      
      private function §_-pS§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-fW§)
         {
            this.disableEffect(_loc1_);
         }
      }
      
      private function respawnAnimation() : void
      {
         this.§_-ZH§ = TweenMax.to(this.heroView,0.5,{
            "alpha":0.2,
            "onComplete":function():void
            {
               §_-ZH§ = TweenMax.to(heroView,0.5,{
                  "alpha":1,
                  "onComplete":respawnAnimation
               });
            }
         });
      }
      
      private function §_-c2X§() : void
      {
         this.heroView.alpha = 0;
         var _loc1_:SquirrelRebornAnimation = new SquirrelRebornAnimation();
         _loc1_.y = 25;
         _loc1_.gotoAndPlay(0);
         _loc1_.addEventListener("SQUIRREL_ARISE",this.§_-Mg§);
         _loc1_.addEventListener(Event.CHANGE,this.§_-e1t§);
         addChild(_loc1_);
         if(this.isSelf)
         {
            GameSounds.play("respawn");
         }
      }
      
      private function §_-Mg§(param1:Event) : void
      {
         this.§_-Ig§ = TweenMax.to(this.heroView,1,{"alpha":(this.§_-DP§ ? 0.4 : 1)});
      }
      
      private function §_-e1t§(param1:Event) : void
      {
         (param1.target as MovieClip).removeEventListener("SQUIRREL_ARISE",this.§_-Mg§);
         if((param1.target as MovieClip).parent)
         {
            (param1.target as MovieClip).parent.removeChild(param1.target as MovieClip);
         }
      }
      
      private function §_-4p§(param1:TimerEvent = null) : void
      {
         this.§_-12l§.stop();
         this.heroView.alpha = this.§_-DP§ ? 0.4 : 1;
         if(this.§_-ZH§ == null)
         {
            return;
         }
         this.§_-ZH§.§_-h2r§();
         this.§_-ZH§ = null;
      }
      
      private function §_-C1E§() : void
      {
         if(!this.§_-k2W§ || this.inHollow)
         {
            return;
         }
         this.dead = false;
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-f13§,this));
         if(Boolean(this.game) && Boolean(this.game.squirrels))
         {
            this.game.squirrels.§_-U1m§();
         }
         this.heroView.§_-L2y§();
         this.show();
      }
      
      private function get §_-w3§() : Boolean
      {
         return this.isHare;
      }
   }
}

