package §_-b1B§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-42B§.TweenMax;
   import §_-B1O§.§_-i2t§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-Q2k§;
   
   public class §_-R1n§ extends §_-i2t§ implements §_-Q2k§
   {
      
      private static const §_-O2K§:int = 20000;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 20000;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-H2D§:SquirrelGame = null;
      
      public function §_-R1n§()
      {
         super();
         this.size = new b2Vec2(0.1,0.1);
         this.affectObject = false;
         this.extGravity = false;
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
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
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
      
      override public function build(param1:b2World) : void
      {
         this.§_-H2D§ = param1.userData as SquirrelGame;
         super.build(param1);
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
         if(Boolean(this.§_-H2D§) && Boolean(this.§_-H2D§.map))
         {
            this.§_-H2D§.map.§_-Qc§(this,true);
         }
      }
   }
}

