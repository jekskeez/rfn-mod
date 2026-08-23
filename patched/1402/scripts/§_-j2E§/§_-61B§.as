package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-K8§;
   
   public class §_-61B§ extends §_-52h§
   {
      
      public function §_-61B§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function get castObject() : GameBody
      {
         return new §_-K8§();
      }
   }
}

