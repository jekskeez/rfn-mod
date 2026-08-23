package ratings
{
   import §_-I10§.§_-13r§;
   import flash.display.DisplayObject;
   import flash.utils.getDefinitionByName;
   
   public class §_-51§ extends §_-f1T§
   {
      
      private static const §_-gb§:int = 30;
      
      private static const §_-b1S§:Array = [RatingGoldPlace,RatingSilverPlace,RatingBronzePlace];
      
      private var §_-x§:DisplayObject = null;
      
      public function §_-51§(param1:int, param2:int)
      {
         super(param1,param2);
      }
      
      override public function set place(param1:int) : void
      {
         super.place = param1;
         §_-13r§.§_-Y1x§(this.id,this.type,param1 + 1);
         if(this.§_-x§)
         {
            removeChild(this.§_-x§);
         }
         this.§_-x§ = null;
         if(param1 >= §_-b1S§.length)
         {
            return;
         }
         this.§_-x§ = new §_-b1S§[param1]();
         this.§_-x§.x = 2;
         addChildAt(this.§_-x§,1);
      }
      
      override protected function get timeUpdate() : int
      {
         return §_-gb§;
      }
      
      override protected function §_-01m§(param1:int) : void
      {
      }
   }
}

