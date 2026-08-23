package §_-P2b§
{
   import §_-33r§.§_-B1c§;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-2m§;
   
   public class §_-41a§ extends §_-C1§
   {
      
      public function §_-41a§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-2m§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         var _loc1_:§_-B1c§ = new §_-B1c§(10,true);
         this.hero.behaviourController.§_-gz§(_loc1_);
      }
   }
}

