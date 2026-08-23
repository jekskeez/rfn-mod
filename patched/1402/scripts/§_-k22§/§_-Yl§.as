package §_-k22§
{
   import §_-X1k§.§_-C3E§;
   import §_-bN§.§_-Sg§;
   
   public class §_-Yl§ extends §_-Sg§
   {
      
      public function §_-Yl§()
      {
         super();
      }
      
      override public function buy(param1:int) : void
      {
         super.buy(param1);
         var _loc2_:Object = {
            "player_id":Game.selfId,
            "offer_id":§_-C3E§.§_-L2Q§(param1).id,
            "href":"https://racefornuts.com",
            "sandbox":false
         };
         §_-62V§.show(_loc2_);
      }
   }
}

