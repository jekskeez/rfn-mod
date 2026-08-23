package §_-C1M§
{
   import §_-I10§.§_-63q§;
   import §_-I10§.§_-S9§;
   import §_-k1c§.§_-7O§;
   import com.api.Services;
   
   public class §_-X2r§ extends §_-7O§
   {
      
      private static var §_-v2E§:Object = {
         "ru":function(param1:int):Number
         {
            return param1;
         },
         "en":function(param1:int):Number
         {
            return param1 * 0.03 - 0.01;
         }
      };
      
      public function §_-X2r§()
      {
         super();
      }
      
      override public function buy(param1:int) : void
      {
         super.buy(param1);
         var _loc2_:§_-63q§ = §_-S9§.§_-b28§(param1);
         var _loc3_:String = §_-a9§.§_-11q§ + _loc2_.§_-330§ + ".html";
         Services.buy({
            "amount":this.getPayment(_loc2_.price),
            "product":_loc3_
         });
      }
      
      override protected function getPayment(param1:Number) : Number
      {
         var _loc2_:Function = §_-v2E§[§_-a9§.§_-L2p§] || §_-v2E§[§_-a9§.§_-m2f§];
         return _loc2_(param1);
      }
   }
}

