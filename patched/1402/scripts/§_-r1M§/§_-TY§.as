package §_-r1M§
{
   import §_-j2H§.§_-62Y§;
   import §_-j2H§.§_-r29§;
   import §_-l2u§.§_-Rp§;
   import game.mainGame.GameMap;
   
   public class §_-TY§ extends §_-Rp§
   {
      
      public function §_-TY§()
      {
         super();
         this.§_-71Y§ = §_-l2C§;
      }
      
      override protected function §_-Ba§(param1:int) : int
      {
         var _loc3_:Hero = null;
         var _loc2_:Object = §_-at§.§_-02X§[§_-E1v§.§_-H2E§];
         if(GameMap.instance.§_-FS§(§_-62Y§) && Boolean(_loc2_["shamanButton"]))
         {
            _loc3_ = get(param1);
            _loc3_.position = GameMap.instance.get(§_-62Y§)[0].position;
            _loc3_.team = Hero.§_-i1Y§;
            §_-J1N§([param1--]);
         }
         return param1;
      }
      
      override protected function §_-o2o§(param1:int) : int
      {
         if(GameMap.instance.§_-FS§(§_-r29§))
         {
            get(param1).team = Hero.§_-l1B§;
            get(param1).position = GameMap.instance.get(§_-r29§)[0].position;
            §_-J1N§([param1--],false);
         }
         return param1;
      }
      
      override protected function §_-9v§() : int
      {
         return GameMap.instance.§_-FS§(§_-r29§) ? 1 : 0;
      }
   }
}

