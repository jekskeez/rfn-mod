package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-w27§;
   
   public class §_-w9§ extends §_-52h§
   {
      
      public function §_-w9§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function get castObject() : GameBody
      {
         return new §_-w27§();
      }
   }
}

