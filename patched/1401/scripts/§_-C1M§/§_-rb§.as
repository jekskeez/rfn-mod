package §_-C1M§
{
   import §_-I10§.§_-S9§;
   import §_-k1c§.§_-7O§;
   
   public class §_-rb§ extends §_-7O§
   {
      
      public function §_-rb§()
      {
         super();
      }
      
      override public function buy(param1:int) : void
      {
         super.buy(param1);
         var _loc2_:Object = {
            "player_id":Game.selfId,
            "offer_id":§_-S9§.§_-b28§(param1).id,
            "href":"https://racefornuts.com",
            "sandbox":false
         };
         §_-dE§.show(_loc2_);
      }
   }
}

