package §_-P2b§
{
   import §_-33r§.§_-q2D§;
   
   public class §_-b2E§ extends §_-H2N§
   {
      
      private var state:§_-q2D§ = null;
      
      public function §_-b2E§(param1:Hero)
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
         return 5;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-q2D§(0,7);
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

