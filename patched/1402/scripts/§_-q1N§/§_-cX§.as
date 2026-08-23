package §_-q1N§
{
   import §_-j2H§.§_-H18§;
   import §_-l2u§.§_-Rp§;
   import game.mainGame.GameMap;
   
   public class §_-cX§ extends §_-Rp§
   {
      
      public function §_-cX§()
      {
         super();
      }
      
      override protected function §_-o2o§(param1:int) : int
      {
         if(GameMap.instance.§_-FS§(§_-H18§))
         {
            get(param1).team = Hero.§_-m28§;
            get(param1).position = GameMap.instance.get(§_-H18§)[0].position;
            §_-J1N§([param1--]);
         }
         return param1;
      }
      
      override protected function §_-9v§() : int
      {
         return GameMap.instance.§_-FS§(§_-H18§) ? 1 : 0;
      }
   }
}

