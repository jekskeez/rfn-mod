package §_-j2E§
{
   import §_-Cc§.§_-51N§;
   
   public class §_-7t§ extends §_-92f§
   {
      
      private var state:§_-51N§ = null;
      
      public function §_-7t§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "orc";
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override public function get activeTime() : Number
      {
         return 5;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-51N§(0,this.hero.heroView.direction);
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

