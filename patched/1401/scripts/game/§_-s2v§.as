package game
{
   import §_-42B§.TweenMax;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   
   public class §_-s2v§ extends §_-h2I§
   {
      
      private static const §_-gA§:int = 5;
      
      private static const §_-p2O§:int = 1;
      
      private var tween:TweenMax = null;
      
      public var object:* = null;
      
      public function §_-s2v§(param1:DisplayObject)
      {
         super();
         if(MovieClip(param1).numChildren > 1)
         {
            this.object = new §_-d2d§(param1 as MovieClip);
         }
         else
         {
            this.object = new §_-h2I§(param1);
         }
         this.§_-83v§(this.object);
      }
      
      override public function play() : void
      {
         this.reset();
         this.object.y = -§_-gA§;
         this.§_-9A§();
      }
      
      public function stop() : void
      {
         this.reset();
         this.object.y = -§_-gA§;
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
         this.tween.§_-h2r§();
         this.tween = null;
      }
      
      public function dispose() : void
      {
         (this.object as §_-v2j§).removeFromParent();
         this.removeFromParent();
      }
      
      private function §_-9A§() : void
      {
         this.tween = TweenMax.to(this.object,§_-p2O§,{
            "y":§_-gA§,
            "onComplete":this.§_-R2T§
         });
      }
      
      private function §_-R2T§() : void
      {
         this.tween = TweenMax.to(this.object,§_-p2O§,{
            "y":-§_-gA§,
            "onComplete":this.§_-9A§
         });
      }
   }
}

