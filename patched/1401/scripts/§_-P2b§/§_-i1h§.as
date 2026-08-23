package §_-P2b§
{
   import §_-33r§.§_-V2Z§;
   
   public class §_-i1h§ extends §_-H2N§
   {
      
      private var state:§_-V2Z§ = null;
      
      public function §_-i1h§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.§_-mw§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-V2Z§(0);
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

