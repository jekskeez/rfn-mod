package §_-p1g§
{
   import §_-B1O§.§_-W2J§;
   import §_-B1O§.§_-rJ§;
   import §_-Rj§.§_-W28§;
   import game.mainGame.GameMap;
   
   public class §_-PK§ extends §_-W28§
   {
      
      public function §_-PK§()
      {
         super();
         this.§_-Y1k§ = §_-534§;
      }
      
      override protected function §_-v2Q§(param1:int) : int
      {
         var _loc3_:Hero = null;
         var _loc2_:Object = §_-q1p§.§_-m15§[§_-l26§.§_-Z1G§];
         if(GameMap.instance.§_-2S§(§_-rJ§) && Boolean(_loc2_["shamanButton"]))
         {
            _loc3_ = get(param1);
            _loc3_.position = GameMap.instance.get(§_-rJ§)[0].position;
            _loc3_.team = Hero.§_-114§;
            §_-B1q§([param1--]);
         }
         return param1;
      }
      
      override protected function §_-Fs§(param1:int) : int
      {
         if(GameMap.instance.§_-2S§(§_-W2J§))
         {
            get(param1).team = Hero.§_-17§;
            get(param1).position = GameMap.instance.get(§_-W2J§)[0].position;
            §_-B1q§([param1--],false);
         }
         return param1;
      }
      
      override protected function §_-F2v§() : int
      {
         return GameMap.instance.§_-2S§(§_-W2J§) ? 1 : 0;
      }
   }
}

