package §_-j2E§
{
   import §_-Cc§.§_-hs§;
   
   public class §_-938§ extends §_-92f§
   {
      
      private var state:§_-hs§ = null;
      
      public function §_-938§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-j2B§;
         this.§_-i1J§ = true;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get activeTime() : Number
      {
         return 15;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-hs§(0,5);
         this.hero.behaviourController.§_-W10§(this.state);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.state)
         {
            this.hero.behaviourController.removeState(this.state);
         }
         this.state = null;
      }
   }
}

