package §_-b1B§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2World;
   import §_-42B§.TweenMax;
   import §_-81N§.§_-626§;
   import §_-83V§.GameBody;
   import §_-B1O§.§_-J1X§;
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-B2Q§;
   import game.mainGame.entity.§_-Q2k§;
   import utils.§_-41A§;
   import utils.§_-X2Z§;
   
   public class §_-I2Y§ extends §_-J1X§ implements §_-Tm§, §_-Q2k§, §_-B2Q§
   {
      
      private var controller:§_-626§;
      
      private var world:b2World = null;
      
      private var direction:b2Vec2 = null;
      
      private var delta:b2Vec2 = null;
      
      private var §_-Y14§:Point;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 30000;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-02k§:Number = 0.3;
      
      public function §_-I2Y§()
      {
         super();
         this.force = 10000;
      }
      
      override public function build(param1:b2World) : void
      {
         this.controller = new §_-626§();
         this.controller.§_-u2z§ = this;
         this.maxVelocity = 50;
         param1.AddController(this.controller);
         this.world = param1;
         this.direction = new b2Vec2(Math.cos(this.angle),Math.sin(this.angle));
         this.delta = this.direction.Copy();
         this.delta.Multiply(this.velocity);
         this.§_-Y14§ = new Point(this.x,this.y);
      }
      
      override public function dispose() : void
      {
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0);
         }
         if(this.controller)
         {
            this.controller.GetWorld().RemoveController(this.controller);
            this.controller.§_-u2z§ = null;
         }
         this.body = null;
         this.controller = null;
         this.world = null;
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
         var _loc2_:Array = param1.pop();
         this.aging = Boolean(_loc2_[0]);
         this.lifeTime = _loc2_[1];
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
      
      public function update(param1:Number = 0) : void
      {
         if(this.aging && !this.§_-01O§)
         {
            this.§_-C2o§ -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.§_-b16§();
            }
         }
         if(Boolean(this.body) || !this.world)
         {
            return;
         }
         this.direction.Add(this.delta);
         var _loc2_:b2Vec2 = this.direction.Copy();
         _loc2_.Add(new b2Vec2(this.§_-Y14§.x / Game.§_-x2P§,this.§_-Y14§.y / Game.§_-x2P§));
         this.position = _loc2_.Copy();
         this.body = this.§_-wv§();
         if(!this.body)
         {
            return;
         }
         this.body.§_-83v§(this);
         this.position = this.body.body.GetLocalPoint(this.position);
         this.angle -= body.angle;
      }
      
      public function get velocity() : Number
      {
         return this.§_-02k§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-02k§ = param1;
      }
      
      public function §_-wv§() : GameBody
      {
         var _loc1_:Array = §_-41A§.§_-D4§(this.world,this.position,GameBody);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc1_[_loc2_] = (_loc1_[_loc2_] as b2Body).GetUserData();
            _loc2_++;
         }
         return §_-X2Z§.§_-C16§(_loc1_) as GameBody;
      }
      
      override protected function get view() : §_-v2j§
      {
         if(this.§_-l2w§)
         {
            return this.§_-l2w§;
         }
         this.§_-l2w§ = new §_-h2I§(new RuneImg());
         this.§_-l2w§.pivotX = this.§_-l2w§.width;
         this.§_-l2w§.pivotY = this.§_-l2w§.height * 0.5;
         return this.§_-l2w§;
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         TweenMax.to(this,0.1,{
            "alpha":0,
            "onComplete":this.death
         });
      }
      
      private function death() : void
      {
         if(!this.world)
         {
            return;
         }
         (this.world.userData as SquirrelGame).map.§_-Qc§(this,true);
      }
   }
}

