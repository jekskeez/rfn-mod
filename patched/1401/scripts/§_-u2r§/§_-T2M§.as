package §_-u2r§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-637§.§_-Ft§;
   import §_-83V§.GameBody;
   import §_-Ov§.§_-a29§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import §_-m1z§.§_-529§;
   import §_-m1z§.§_-Mk§;
   import flash.events.Event;
   import flash.geom.Point;
   import game.mainGame.Cast;
   import game.mainGame.entity.§_-314§;
   import game.mainGame.entity.§_-B2Q§;
   import game.mainGame.entity.§_-Q2k§;
   import sounds.GameSounds;
   import starling.core.Starling;
   import starling.textures.§_-a1g§;
   
   public class §_-T2M§ extends GameBody implements §_-Q2k§, §_-Ft§, §_-314§, §_-22J§, §_-B2Q§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = 1;
      
      private static const §_-92I§:int = 100;
      
      private static const §_-N1Y§:int = 0;
      
      private static const §_-V1E§:int = 1;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(9 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,10,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,true,b2Body.b2_dynamicBody);
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 10000;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-Mf§:Cast = null;
      
      private var §_-52w§:§_-h2I§ = null;
      
      private var view:§_-h2I§;
      
      private var §_-h2V§:§_-d2d§;
      
      private var §_-CG§:§_-93d§;
      
      private var §_-A38§:§_-f1G§;
      
      private var §_-L2A§:int = 0;
      
      private var §_-02k§:Number;
      
      public function §_-T2M§()
      {
         super();
         this.view = new §_-h2I§(new SmokeBombImg());
         this.view.§_-x2x§();
         §_-83v§(this.view);
         this.§_-h2V§ = new §_-d2d§(new SmokeBombExplode());
         this.§_-h2V§.loop = false;
         this.§_-h2V§.gotoAndStop(1);
         this.§_-h2V§.visible = false;
         §_-83v§(this.§_-h2V§);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(this.velocity,0)));
         this.§_-CG§ = §_-93d§.instance;
      }
      
      override public function dispose() : void
      {
         var _loc1_:§_-529§ = null;
         this.§_-Mf§ = null;
         if(this.§_-52w§)
         {
            this.§_-52w§ = null;
         }
         this.view.removeFromParent();
         this.§_-h2V§.stop();
         this.§_-h2V§.removeFromParent(true);
         if(this.§_-A38§)
         {
            _loc1_ = new §_-529§(this.§_-A38§.view,2,§_-Mk§.§_-Y16§);
            _loc1_.§_-42i§("alpha",0);
            _loc1_.onComplete = this.§_-ms§;
            Starling.§_-A3B§.add(_loc1_);
         }
         super.dispose();
      }
      
      private function §_-ms§() : void
      {
         if(this.§_-A38§)
         {
            this.§_-A38§.stop();
            this.§_-CG§.§_-ms§(this.§_-A38§);
            this.§_-A38§ = null;
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         this.body.SetBullet(this.body.GetLinearVelocity().Length() > 100);
         if(!this.aging || this.§_-01O§)
         {
            return;
         }
         this.§_-C2o§ -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-b16§();
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.lifeTime,this.velocity,this.§_-L2A§]);
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.lifeTime = param1[1][0];
         this.velocity = param1[1][1];
         this.§_-L2A§ = param1[1][2];
         this.playerId = param1[2][0];
      }
      
      public function get aging() : Boolean
      {
         return this.§_-O1u§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-O1u§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-C2o§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-C2o§ = param1;
      }
      
      public function set cast(param1:Cast) : void
      {
         this.§_-Mf§ = param1;
      }
      
      public function §_-11O§() : void
      {
         this.§_-Mf§.§_-k1K§ = 0;
      }
      
      public function §_-b2q§() : void
      {
         if(!this.§_-Mf§)
         {
            return;
         }
         this.§_-Mf§.§_-k1K§ = NaN;
      }
      
      public function get maxVelocity() : Number
      {
         return this.velocity;
      }
      
      public function get aimCursor() : §_-h2I§
      {
         if(this.§_-52w§ == null)
         {
            this.§_-52w§ = new §_-h2I§(new PoiseArrow());
         }
         return this.§_-52w§;
      }
      
      public function §_-l1o§(param1:Point) : void
      {
         var _loc2_:b2Vec2 = new b2Vec2(param1.x / Game.§_-x2P§,param1.y / Game.§_-x2P§);
         var _loc3_:Number = Math.atan2(_loc2_.y - this.position.y,_loc2_.x - this.position.x);
         param1 = param1.subtract(new Point(this.x,this.y));
         this.§_-52w§.x = this.x;
         this.§_-52w§.y = this.y;
         this.§_-52w§.rotation = 0;
         this.§_-52w§.scaleX = 1;
         this.velocity = Math.min(int(param1.length),§_-92I§);
         this.§_-52w§.scaleX = this.velocity / this.§_-52w§.width;
         this.§_-52w§.rotation = _loc3_ * Game.R2D;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         if(this.fixed || this.§_-01O§)
         {
            return;
         }
         this.fixed = true;
         this.view.visible = false;
         this.§_-h2V§.visible = true;
         this.§_-h2V§.addEventListener(Event.COMPLETE,this.§_-a1U§);
         this.§_-h2V§.play();
      }
      
      private function §_-a1U§(param1:Event) : void
      {
         var e:Event = param1;
         this.§_-h2V§.removeEventListener(Event.COMPLETE,this.§_-a1U§);
         this.§_-h2V§.visible = false;
         if(this.§_-A38§)
         {
            this.§_-CG§.§_-ms§(this.§_-A38§);
         }
         GameSounds.play("smoke");
         this.§_-A38§ = this.§_-CG§.§_-23j§(this.§_-J2x§(this.§_-L2A§),{"sortFunction":this.§_-A1q§});
         this.§_-A38§.view.smoothing = §_-a1g§.§_-C2m§;
         this.§_-A38§.view.§_-M2F§ = this.x;
         this.§_-A38§.view.§_-Cg§ = this.y - 25;
         this.§_-A38§.view.§_-IA§ = 550;
         this.§_-A38§.view.§_-jW§ = 550;
         this.§_-A38§.start();
         try
         {
            this.§_-H2D§.map.§_-P2y§.§_-83v§(this.§_-A38§.view);
         }
         catch(e:Error)
         {
            §_-TQ§.add("Error" + e.getStackTrace());
         }
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         param1.SetEnabled(false);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function get velocity() : Number
      {
         return this.§_-02k§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-02k§ = param1;
      }
      
      public function §_-m2a§(param1:String) : void
      {
         switch(param1)
         {
            case §_-93d§.§_-Jk§:
               this.§_-L2A§ = §_-V1E§;
               break;
            default:
               this.§_-L2A§ = §_-N1Y§;
         }
      }
      
      public function §_-J2x§(param1:int) : String
      {
         switch(param1)
         {
            case §_-V1E§:
               return §_-93d§.§_-Jk§;
            default:
               return §_-93d§.§_-D1I§;
         }
      }
      
      private function §_-A1q§(param1:§_-a29§, param2:§_-a29§) : Number
      {
         if(param1.active && param2.active)
         {
            if(param1.currentTime < param2.currentTime)
            {
               return 1;
            }
            if(param1.currentTime > param2.currentTime)
            {
               return -1;
            }
         }
         else
         {
            if(param1.active && !param2.active)
            {
               return -1;
            }
            if(!param1.active && param2.active)
            {
               return 1;
            }
         }
         return 0;
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}

