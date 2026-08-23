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
   import §_-P2b§.§_-6L§;
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
   import protocol.Connection;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import starling.core.Starling;
   import starling.textures.§_-a1g§;
   
   public class §_-620§ extends GameBody implements §_-Q2k§, §_-Ft§, §_-314§, §_-22J§, §_-B2Q§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = 1;
      
      private static const §_-92I§:int = 100;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(9 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,10,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,true,b2Body.b2_dynamicBody);
      
      protected var §_-O1u§:Boolean = false;
      
      protected var §_-C2o§:Number = 100;
      
      protected var §_-01O§:Boolean = false;
      
      protected var §_-Mf§:Cast = null;
      
      protected var §_-52w§:§_-h2I§ = null;
      
      protected var view:§_-h2I§;
      
      protected var §_-h2V§:§_-d2d§;
      
      protected var §_-A38§:§_-f1G§;
      
      private var §_-02k§:Number;
      
      public function §_-620§()
      {
         super();
         this.view = new §_-h2I§(new WitchBombView());
         this.view.scaleXY(0.5,0.5);
         this.view.§_-x2x§();
         §_-83v§(this.view);
         this.§_-h2V§ = new §_-d2d§(new WitchBombExplodeView());
         this.§_-h2V§.scaleXY(0.5,0.5);
         this.§_-h2V§.visible = false;
         this.§_-h2V§.stop();
         this.§_-h2V§.x = -6;
         this.§_-h2V§.y = -17;
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
         if(this.§_-A38§)
         {
            §_-93d§.instance.§_-ms§(this.§_-A38§);
         }
         this.§_-A38§ = §_-93d§.instance.§_-23j§(this.effectName);
         this.§_-A38§.view.visible = false;
         this.§_-A38§.view.smoothing = §_-a1g§.§_-C2m§;
      }
      
      protected function get effectName() : String
      {
         return §_-93d§.§_-4m§;
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
            _loc1_ = new §_-529§(this.§_-A38§.view,0.2,§_-Mk§.§_-Y16§);
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
            §_-93d§.instance.§_-ms§(this.§_-A38§);
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
         _loc1_.push([this.lifeTime,this.velocity]);
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.lifeTime = param1[1][0];
         this.velocity = param1[1][1];
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
         var contact:b2Contact = param1;
         if(this.fixed || this.§_-01O§)
         {
            return;
         }
         this.fixed = true;
         this.view.visible = false;
         this.§_-h2V§.addEventListener(Event.COMPLETE,this.§_-a1U§);
         this.§_-h2V§.visible = true;
         this.§_-h2V§.loop = false;
         this.§_-h2V§.play();
         GameSounds.play("sheep_bomb");
         this.§_-A38§.view.visible = true;
         this.§_-A38§.view.§_-M2F§ = this.x;
         this.§_-A38§.view.§_-Cg§ = this.y;
         this.§_-A38§.start();
         try
         {
            this.§_-H2D§.map.§_-P2y§.§_-83v§(this.§_-A38§.view);
         }
         catch(e:Error)
         {
            §_-TQ§.add("Error" + e.getStackTrace());
         }
         this.§_-GF§();
         GameSounds.play("halloween_bomb_explode");
      }
      
      public function get velocity() : Number
      {
         return this.§_-02k§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-02k§ = param1;
      }
      
      protected function §_-GF§() : void
      {
         var hero:Hero = null;
         var pos:b2Vec2 = null;
         if(Game.selfId != this.playerId)
         {
            return;
         }
         try
         {
            for each(hero in this.§_-H2D§.squirrels.players)
            {
               if(hero.id != this.playerId)
               {
                  pos = this.position.Copy();
                  pos.Subtract(hero.position);
                  if(pos.Length() <= 8)
                  {
                     Connection.§_-Li§(§_-h2B§.§_-Q1g§,§_-6L§.§_-s2H§,hero.id,0);
                  }
               }
            }
         }
         catch(e:Error)
         {
            §_-TQ§.add("Error" + e.getStackTrace());
         }
      }
      
      protected function §_-a1U§(param1:Event) : void
      {
         this.aging = true;
         this.§_-h2V§.removeEventListener(Event.COMPLETE,this.§_-a1U§);
         this.§_-h2V§.visible = false;
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

