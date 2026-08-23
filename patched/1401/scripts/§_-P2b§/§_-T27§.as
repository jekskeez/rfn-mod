package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-u2r§.§_-T2M§;
   
   public class §_-T27§ extends §_-XT§
   {
      
      public function §_-T27§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function get castObject() : GameBody
      {
         return new §_-T2M§();
      }
   }
}

