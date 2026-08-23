package §_-g16§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import §_-cm§.§_-V1t§;
   import §_-j4§.§_-Pn§;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-f1§;
   import starling.filters.BlurFilter;
   
   public class §_-PP§ extends GameBody implements §_-Pn§, §_-71b§, §_-f1§
   {
      
      private const §_-U1y§:BlurFilter = BlurFilter.§_-J23§(14335,1,1,0.5);
      
      private const §_-g1M§:BlurFilter = BlurFilter.§_-J23§(16726579,1,1,0.5);
      
      protected var §_-837§:Boolean = true;
      
      protected var §_-Q26§:Number = 3000;
      
      protected var §_-C1L§:Boolean = false;
      
      protected var §_-Ud§:Number = -1;
      
      protected var §_-32K§:§_-aS§ = null;
      
      protected var view:§_-aS§ = null;
      
      public function §_-PP§()
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
         var _loc6_:Number = 25 / Game.§_-12A§;
         this.body.SetPosition(new b2Vec2(_loc4_ + Math.cos(_loc2_) * _loc6_,_loc5_ + Math.sin(_loc2_) * _loc6_));
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(200,0)));
         if(this.§_-21H§.squirrels.get(this.playerId))
         {
            switch(this.§_-21H§.squirrels.get(this.playerId).heroView.team)
            {
               case Hero.§_-i1Y§:
                  this.view.getStarlingView().filter = this.§_-U1y§;
                  break;
               case Hero.§_-l1B§:
                  this.view.getStarlingView().filter = this.§_-g1M§;
            }
         }
         this.§_-Ud§ = getTimer();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.view = null;
         this.§_-32K§ = null;
         removeFromParent();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body)
         {
            this.body.SetBullet(this.body.GetLinearVelocity().Length() > 100);
            if(!this.aging || this.§_-C1L§)
            {
               return;
            }
            this.§_-Q26§ -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.§_-th§();
            }
         }
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
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
      
      public function get aimCursor() : §_-aS§
      {
         return this.§_-32K§ = this.§_-32K§ || new §_-aS§(new AimCursor());
      }
      
      public function §_-a2l§(param1:Point) : void
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
         return this.§_-837§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-837§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-Q26§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-Q26§ = param1;
      }
      
      protected function §_-cB§(param1:b2Contact) : Hero
      {
         return param1.GetFixtureA().GetBody().GetUserData() as Hero || param1.GetFixtureB().GetBody().GetUserData() as Hero;
      }
      
      protected function §_-h16§(param1:Hero) : Boolean
      {
         var _loc2_:Hero = this.§_-21H§.squirrels.get(this.playerId) as Hero;
         if(Boolean(_loc2_) && Boolean(_loc2_.team == param1.team) && this.playerId != param1.id)
         {
            return true;
         }
         if(this.playerId == param1.id && getTimer() - this.§_-Ud§ <= §_-V1t§.§_-hw§)
         {
            return true;
         }
         return false;
      }
      
      protected function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         this.death();
      }
      
      protected function death() : void
      {
         if(!this.body)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}

