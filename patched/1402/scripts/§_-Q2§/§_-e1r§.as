package §_-Q2§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-22D§.TweenMax;
   import §_-j2H§.§_-d2T§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-71b§;
   
   public class §_-e1r§ extends §_-d2T§ implements §_-71b§
   {
      
      private static const §_-O1Z§:int = 20000;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 20000;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-21H§:SquirrelGame = null;
      
      public function §_-e1r§()
      {
         super();
         this.size = new b2Vec2(0.1,0.1);
         this.affectObject = false;
         this.extGravity = false;
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
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
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
      
      override public function build(param1:b2World) : void
      {
         this.§_-21H§ = param1.userData as SquirrelGame;
         super.build(param1);
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
         if(Boolean(this.§_-21H§) && Boolean(this.§_-21H§.map))
         {
            this.§_-21H§.map.§_-Y1E§(this,true);
         }
      }
   }
}

