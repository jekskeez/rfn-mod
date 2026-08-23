package §_-P2b§
{
   import §_-33r§.§_-23P§;
   
   public class §_-Xu§ extends §_-H2N§
   {
      
      private var state:§_-23P§ = null;
      
      public function §_-Xu§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-y2M§;
         this.§_-mw§ = true;
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
         this.state = new §_-23P§(0,5);
         this.hero.behaviourController.§_-gz§(this.state);
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

