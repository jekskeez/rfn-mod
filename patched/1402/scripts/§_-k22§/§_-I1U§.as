package §_-k22§
{
   import §_-X1k§.§_-C3E§;
   import §_-X1k§.§_-VZ§;
   import §_-bN§.§_-Sg§;
   import com.api.Services;
   
   public class §_-I1U§ extends §_-Sg§
   {
      
      private static var §_-9U§:Object = {
         "ru":function(param1:int):Number
         {
            return param1;
         },
         "en":function(param1:int):Number
         {
            return param1 * 0.03 - 0.01;
         }
      };
      
      public function §_-I1U§()
      {
         super();
      }
      
      override public function buy(param1:int) : void
      {
         super.buy(param1);
         var _loc2_:§_-VZ§ = §_-C3E§.§_-L2Q§(param1);
         var _loc3_:String = §_-Zy§.§_-E2M§ + _loc2_.§_-T1U§ + ".html";
         Services.buy({
            "amount":this.getPayment(_loc2_.price),
            "product":_loc3_
         });
      }
      
      override protected function getPayment(param1:Number) : Number
      {
         var _loc2_:Function = §_-9U§[§_-Zy§.§_-73r§] || §_-9U§[§_-Zy§.§_-o19§];
         return _loc2_(param1);
      }
   }
}

