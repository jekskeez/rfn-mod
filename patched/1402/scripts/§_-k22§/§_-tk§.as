package §_-k22§
{
   import §_-X1k§.§_-C3E§;
   import §_-X1k§.§_-VZ§;
   import §_-bN§.§_-Sg§;
   import com.api.Services;
   
   public class §_-tk§ extends §_-Sg§
   {
      
      public function §_-tk§()
      {
         super();
      }
      
      override public function buy(param1:int) : void
      {
         super.buy(param1);
         var _loc2_:§_-VZ§ = §_-C3E§.§_-L2Q§(param1);
         Services.buy({
            "name":_loc2_.name,
            "service_id":_loc2_.id,
            "amount":getPayment(_loc2_.price)
         });
      }
      
      override protected function get currencyName() : String
      {
         return gls("мэйлик");
      }
   }
}

