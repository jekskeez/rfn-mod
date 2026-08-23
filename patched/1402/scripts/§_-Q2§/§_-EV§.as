package §_-Q2§
{
   import §_-22D§.TweenMax;
   import §_-8Q§.§_-622§;
   import flash.display.DisplayObject;
   import game.mainGame.entity.§_-71b§;
   
   public class §_-EV§ extends §_-622§ implements §_-71b§
   {
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 0;
      
      private var §_-C1L§:Boolean = false;
      
      public function §_-EV§()
      {
         super();
      }
      
      override protected function get image() : DisplayObject
      {
         return new LifeTimeBalkLongImg();
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
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body)
         {
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
         if(this.body == null)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}

