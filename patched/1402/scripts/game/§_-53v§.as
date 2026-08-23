package game
{
   import §_-22D§.TweenMax;
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   
   public class §_-53v§ extends §_-aS§
   {
      
      private static const §_-h2q§:int = 5;
      
      private static const §_-17§:int = 1;
      
      private var tween:TweenMax = null;
      
      public var object:* = null;
      
      public function §_-53v§(param1:DisplayObject)
      {
         super();
         if(MovieClip(param1).numChildren > 1)
         {
            this.object = new §_-f1u§(param1 as MovieClip);
         }
         else
         {
            this.object = new §_-aS§(param1);
         }
         this.§_-J2J§(this.object);
      }
      
      override public function play() : void
      {
         this.reset();
         this.object.y = -§_-h2q§;
         this.§_-Y1f§();
      }
      
      public function stop() : void
      {
         this.reset();
         this.object.y = -§_-h2q§;
      }
      
      public function get isPlaying() : Boolean
      {
         return this.tween != null;
      }
      
      public function reset() : void
      {
         if(this.tween == null)
         {
            return;
         }
         this.tween.§_-kl§();
         this.tween = null;
      }
      
      public function dispose() : void
      {
         (this.object as §_-51g§).removeFromParent();
         this.removeFromParent();
      }
      
      private function §_-Y1f§() : void
      {
         this.tween = TweenMax.to(this.object,§_-17§,{
            "y":§_-h2q§,
            "onComplete":this.§_-c1Y§
         });
      }
      
      private function §_-c1Y§() : void
      {
         this.tween = TweenMax.to(this.object,§_-17§,{
            "y":-§_-h2q§,
            "onComplete":this.§_-Y1f§
         });
      }
   }
}

