package game
{
   import §_-83V§.§_-o29§;
   import §_-I10§.§_-vy§;
   import §_-RI§.§_-h2I§;
   import flash.display.DisplayObject;
   import starling.filters.BlurFilter;
   
   public class §_-s1B§ extends §_-Z2x§
   {
      
      public function §_-s1B§()
      {
         super();
      }
      
      override protected function §_-g1q§(param1:int, param2:int) : void
      {
         var _loc3_:Class = param2 == §_-o29§.§_-Y1l§ ? §_-vy§.§_-z2p§(param1) : DisplayObject;
         this.§_-o2s§ = new §_-h2I§(new _loc3_(),true);
         this.§_-o2s§.scaleX = this.§_-o2s§.scaleY = 0.5;
         this.§_-o2s§.x = 20;
         this.§_-o2s§.alpha = 0.5;
         this.§_-o2s§.getStarlingView().filter = BlurFilter.§_-q2e§(16763955,1,0.5,0.5);
      }
   }
}

