package §_-Q2§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2World;
   import §_-22D§.TweenMax;
   import §_-8Q§.GameBody;
   import §_-H1l§.§_-bJ§;
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import §_-j2H§.§_-L2K§;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-p0§;
   import utils.§_-11I§;
   import utils.§_-H1o§;
   
   public class §_-Az§ extends §_-L2K§ implements §_-F1c§, §_-71b§, §_-p0§
   {
      
      private var controller:§_-bJ§;
      
      private var world:b2World = null;
      
      private var direction:b2Vec2 = null;
      
      private var delta:b2Vec2 = null;
      
      private var §_-x2K§:Point;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 30000;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-J1H§:Number = 0.3;
      
      public function §_-Az§()
      {
         super();
         this.force = 10000;
      }
      
      override public function build(param1:b2World) : void
      {
         this.controller = new §_-bJ§();
         this.controller.§_-I0§ = this;
         this.maxVelocity = 50;
         param1.AddController(this.controller);
         this.world = param1;
         this.direction = new b2Vec2(Math.cos(this.angle),Math.sin(this.angle));
         this.delta = this.direction.Copy();
         this.delta.Multiply(this.velocity);
         this.§_-x2K§ = new Point(this.x,this.y);
      }
      
      override public function dispose() : void
      {
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
         if(this.controller)
         {
            this.controller.GetWorld().RemoveController(this.controller);
            this.controller.§_-I0§ = null;
         }
         this.body = null;
         this.controller = null;
         this.world = null;
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
         var _loc2_:Array = param1.pop();
         this.aging = Boolean(_loc2_[0]);
         this.lifeTime = _loc2_[1];
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
      
      public function update(param1:Number = 0) : void
      {
         if(this.aging && !this.§_-C1L§)
         {
            this.§_-Q26§ -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.§_-th§();
            }
         }
         if(Boolean(this.body) || !this.world)
         {
            return;
         }
         this.direction.Add(this.delta);
         var _loc2_:b2Vec2 = this.direction.Copy();
         _loc2_.Add(new b2Vec2(this.§_-x2K§.x / Game.§_-12A§,this.§_-x2K§.y / Game.§_-12A§));
         this.position = _loc2_.Copy();
         this.body = this.§_-m20§();
         if(!this.body)
         {
            return;
         }
         this.body.§_-J2J§(this);
         this.position = this.body.body.GetLocalPoint(this.position);
         this.angle -= body.angle;
      }
      
      public function get velocity() : Number
      {
         return this.§_-J1H§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-J1H§ = param1;
      }
      
      public function §_-m20§() : GameBody
      {
         var _loc1_:Array = §_-11I§.§_-016§(this.world,this.position,GameBody);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc1_[_loc2_] = (_loc1_[_loc2_] as b2Body).GetUserData();
            _loc2_++;
         }
         return §_-H1o§.§_-XF§(_loc1_) as GameBody;
      }
      
      override protected function get view() : §_-51g§
      {
         if(this.§_-D1S§)
         {
            return this.§_-D1S§;
         }
         this.§_-D1S§ = new §_-aS§(new RuneImg());
         this.§_-D1S§.pivotX = this.§_-D1S§.width;
         this.§_-D1S§.pivotY = this.§_-D1S§.height * 0.5;
         return this.§_-D1S§;
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
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
         (this.world.userData as SquirrelGame).map.§_-Y1E§(this,true);
      }
   }
}

