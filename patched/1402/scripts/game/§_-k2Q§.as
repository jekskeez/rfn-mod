package game
{
   import §_-8Q§.§_-u1i§;
   import §_-TK§.§_-aS§;
   import §_-X1k§.§_-42H§;
   import flash.display.DisplayObject;
   import starling.filters.BlurFilter;
   
   public class §_-k2Q§ extends §_-ZP§
   {
      
      public function §_-k2Q§()
      {
         super();
      }
      
      override protected function §_-r1Z§(param1:int, param2:int) : void
      {
         var _loc3_:Class = param2 == §_-u1i§.§_-13j§ ? §_-42H§.§_-D1U§(param1) : DisplayObject;
         this.§_-YK§ = new §_-aS§(new _loc3_(),true);
         this.§_-YK§.scaleX = this.§_-YK§.scaleY = 0.5;
         this.§_-YK§.x = 20;
         this.§_-YK§.alpha = 0.5;
         this.§_-YK§.getStarlingView().filter = BlurFilter.§_-J23§(16763955,1,0.5,0.5);
      }
   }
}

