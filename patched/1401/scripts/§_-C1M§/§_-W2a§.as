package §_-C1M§
{
   import §_-I10§.§_-63q§;
   import §_-I10§.§_-S9§;
   import §_-k1c§.§_-7O§;
   import com.api.Services;
   
   public class §_-W2a§ extends §_-7O§
   {
      
      public function §_-W2a§()
      {
         super();
      }
      
      override public function buy(param1:int) : void
      {
         super.buy(param1);
         var _loc2_:§_-63q§ = §_-S9§.§_-b28§(param1);
         Services.buy({
            "type":"item",
            "item":_loc2_.§_-330§,
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

