package ratings
{
   import §_-X1k§.§_-82O§;
   import flash.display.DisplayObject;
   import flash.utils.getDefinitionByName;
   
   public class §_-oU§ extends §_-u2r§
   {
      
      private static const §_-v1t§:int = 30;
      
      private static const §_-kv§:Array = [RatingGoldPlace,RatingSilverPlace,RatingBronzePlace];
      
      private var §_-61m§:DisplayObject = null;
      
      public function §_-oU§(param1:int, param2:int)
      {
         super(param1,param2);
      }
      
      override public function set place(param1:int) : void
      {
         super.place = param1;
         §_-82O§.§_-O2o§(this.id,this.type,param1 + 1);
         if(this.§_-61m§)
         {
            removeChild(this.§_-61m§);
         }
         this.§_-61m§ = null;
         if(param1 >= §_-kv§.length)
         {
            return;
         }
         this.§_-61m§ = new §_-kv§[param1]();
         this.§_-61m§.x = 2;
         addChildAt(this.§_-61m§,1);
      }
      
      override protected function get timeUpdate() : int
      {
         return §_-v1t§;
      }
      
      override protected function §_-I17§(param1:int) : void
      {
      }
   }
}

