package §_-C1M§
{
   import §_-I10§.§_-63q§;
   import §_-I10§.§_-S9§;
   import §_-k1c§.§_-7O§;
   import com.api.Services;
   
   public class §_-Cq§ extends §_-7O§
   {
      
      public function §_-Cq§()
      {
         super();
      }
      
      override public function buy(param1:int) : void
      {
         super.buy(param1);
         var _loc2_:§_-63q§ = §_-S9§.§_-b28§(param1);
         Services.buy({
            "itemId":_loc2_.id,
            "name":_loc2_.name,
            "priceFmCents":this.getPayment(_loc2_.price) * 100,
            "picUrl":§_-a9§.§_-81b§ + _loc2_.§_-330§ + ".png",
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

