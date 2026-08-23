package §_-P2b§
{
   import §_-33r§.§_-b2c§;
   
   public class §_-M1§ extends §_-H2N§
   {
      
      private var state:§_-b2c§ = null;
      
      public function §_-M1§(param1:Hero)
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
         return 7;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-b2c§(0);
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

