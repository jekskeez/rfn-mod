package §_-C1M§
{
   import §_-I10§.§_-63q§;
   import §_-I10§.§_-S9§;
   import §_-k1c§.§_-7O§;
   import com.api.Services;
   
   public class §_-Pq§ extends §_-7O§
   {
      
      public function §_-Pq§()
      {
         super();
      }
      
      override public function buy(param1:int) : void
      {
         super.buy(param1);
         var _loc2_:§_-63q§ = §_-S9§.§_-b28§(param1);
         Services.buy({
            "currency_name":_loc2_.name,
            "description":_loc2_.name,
            "service_id":_loc2_.id,
            "amount":getPayment(_loc2_.price)
         });
      }
      
      override protected function get currencyName() : String
      {
         return gls("OK");
      }
   }
}

