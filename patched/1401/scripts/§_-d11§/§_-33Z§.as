package §_-d11§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import §_-T1r§.§_-i1L§;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import game.mainGame.entity.§_-Q2k§;
   import game.mainGame.entity.§_-v1e§;
   import starling.filters.BlurFilter;
   
   public class §_-33Z§ extends GameBody implements §_-22J§, §_-Q2k§, §_-v1e§
   {
      
      private const §_-L1K§:BlurFilter = BlurFilter.§_-q2e§(14335,1,1,0.5);
      
      private const §_-SY§:BlurFilter = BlurFilter.§_-q2e§(16726579,1,1,0.5);
      
      protected var §_-O1u§:Boolean = true;
      
      protected var §_-C2o§:Number = 3000;
      
      protected var §_-01O§:Boolean = false;
      
      protected var §_-h2k§:Number = -1;
      
      protected var §_-52w§:§_-h2I§ = null;
      
      protected var view:§_-h2I§ = null;
      
      public function §_-33Z§()
      {
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         var _loc2_:Number = Number(this.body.GetAngle());
         var _loc3_:b2Vec2 = this.body.GetPosition();
         var _loc4_:Number = Number(_loc3_.x);
         var _loc5_:Number = Number(_loc3_.y);
         var _loc6_:Number = 25 / Game.§_-x2P§;
         this.body.SetPosition(new b2Vec2(_loc4_ + Math.cos(_loc2_) * _loc6_,_loc5_ + Math.sin(_loc2_) * _loc6_));
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(200,0)));
         if(this.§_-H2D§.squirrels.get(this.playerId))
         {
            switch(this.§_-H2D§.squirrels.get(this.playerId).heroView.team)
            {
               case Hero.§_-114§:
                  this.view.getStarlingView().filter = this.§_-L1K§;
                  break;
               case Hero.§_-17§:
                  this.view.getStarlingView().filter = this.§_-SY§;
            }
         }
         this.§_-h2k§ = getTimer();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.view = null;
         this.§_-52w§ = null;
         removeFromParent();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body)
         {
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
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         if("1" in param1)
         {
            this.aging = Boolean(param1[1][0]);
            this.lifeTime = param1[1][1];
         }
      }
      
      override public function get ghost() : Boolean
      {
         return false;
      }
      
      override public function set ghost(param1:Boolean) : void
      {
         super.ghost = false;
      }
      
      public function get aimCursor() : §_-h2I§
      {
         return this.§_-52w§ = this.§_-52w§ || new §_-h2I§(new AimCursor());
      }
      
      public function §_-l1o§(param1:Point) : void
      {
         this.aimCursor.x = param1.x;
         this.aimCursor.y = param1.y;
      }
      
      public function get maxVelocity() : Number
      {
         return 0;
      }
      
      public function get reloadTime() : Number
      {
         return 0;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
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
      
      protected function §_-m2N§(param1:b2Contact) : Hero
      {
         return param1.GetFixtureA().GetBody().GetUserData() as Hero || param1.GetFixtureB().GetBody().GetUserData() as Hero;
      }
      
      protected function §_-wN§(param1:Hero) : Boolean
      {
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(this.playerId) as Hero;
         if(Boolean(_loc2_) && Boolean(_loc2_.team == param1.team) && this.playerId != param1.id)
         {
            return true;
         }
         if(this.playerId == param1.id && getTimer() - this.§_-h2k§ <= §_-i1L§.§_-W2B§)
         {
            return true;
         }
         return false;
      }
      
      protected function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         this.death();
      }
      
      protected function death() : void
      {
         if(!this.body)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}

