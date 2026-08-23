package §_-k22§
{
   import §_-X1k§.§_-C3E§;
   import §_-X1k§.§_-VZ§;
   import §_-bN§.§_-Sg§;
   import com.api.Services;
   
   public class §_-8P§ extends §_-Sg§
   {
      
      public function §_-8P§()
      {
         super();
      }
      
      override public function buy(param1:int) : void
      {
         super.buy(param1);
         var _loc2_:§_-VZ§ = §_-C3E§.§_-L2Q§(param1);
         Services.buy({
            "itemId":_loc2_.id,
            "name":_loc2_.name,
            "priceFmCents":this.getPayment(_loc2_.price) * 100,
            "picUrl":§_-Zy§.§_-81C§ + _loc2_.§_-T1U§ + ".png",
            "amount":1,
            "isDebug":true,
            "receiverId":Game.self.nid
         });
      }
      
      override protected function get currencyName() : String
      {
         return gls("ФМ");
      }
      
      override protected function getPayment(param1:Number) : Number
      {
         return param1 / 35;
      }
   }
}

