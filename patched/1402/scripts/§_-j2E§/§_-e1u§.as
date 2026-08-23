package §_-j2E§
{
   import §_-Cc§.§_-b2h§;
   import §_-I1q§.§_-S2F§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-e1u§ extends §_-j1k§
   {
      
      public function §_-e1u§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-S2F§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         var _loc1_:§_-b2h§ = new §_-b2h§(10,true);
         this.hero.behaviourController.§_-W10§(_loc1_);
      }
   }
}

