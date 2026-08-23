package §_-j2E§
{
   import §_-Cc§.§_-it§;
   
   public class §_-S1f§ extends §_-92f§
   {
      
      private var state:§_-it§ = null;
      
      public function §_-S1f§(param1:Hero)
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
         return 5;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-it§(0,7);
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

