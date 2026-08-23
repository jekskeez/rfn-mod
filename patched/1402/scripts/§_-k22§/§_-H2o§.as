package §_-k22§
{
   import §_-X1k§.§_-C3E§;
   import §_-X1k§.§_-VZ§;
   import §_-bN§.§_-Sg§;
   import com.api.Services;
   
   public class §_-H2o§ extends §_-Sg§
   {
      
      public function §_-H2o§()
      {
         super();
      }
      
      override public function buy(param1:int) : void
      {
         super.buy(param1);
         var _loc2_:§_-VZ§ = §_-C3E§.§_-L2Q§(param1);
         Services.buy({
            "type":"item",
            "item":_loc2_.§_-T1U§,
            "amount":this.getPayment(_loc2_.price)
         });
      }
      
      override protected function get currencyName() : String
      {
         return gls("голос");
      }
      
      override protected function getPayment(param1:Number) : Number
      {
         return int(param1 / 7);
      }
   }
}

