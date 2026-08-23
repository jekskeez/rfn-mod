package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-u2r§.§_-rE§;
   
   public class §_-D2o§ extends §_-XT§
   {
      
      public function §_-D2o§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function get castObject() : GameBody
      {
         return new §_-rE§();
      }
   }
}

