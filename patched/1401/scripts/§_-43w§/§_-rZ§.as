package §_-43w§
{
   import §_-B1O§.§_-i26§;
   import §_-Rj§.§_-W28§;
   import game.mainGame.GameMap;
   
   public class §_-rZ§ extends §_-W28§
   {
      
      public function §_-rZ§()
      {
         super();
      }
      
      override protected function §_-Fs§(param1:int) : int
      {
         if(GameMap.instance.§_-2S§(§_-i26§))
         {
            get(param1).team = Hero.§_-O18§;
            get(param1).position = GameMap.instance.get(§_-i26§)[0].position;
            §_-B1q§([param1--]);
         }
         return param1;
      }
      
      override protected function §_-F2v§() : int
      {
         return GameMap.instance.§_-2S§(§_-i26§) ? 1 : 0;
      }
   }
}

