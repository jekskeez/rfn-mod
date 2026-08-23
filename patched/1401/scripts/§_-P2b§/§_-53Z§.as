package §_-P2b§
{
   import §_-33r§.§_-VV§;
   
   public class §_-53Z§ extends §_-H2N§
   {
      
      private var state:§_-VV§ = null;
      
      public function §_-53Z§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "orc";
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
         this.state = new §_-VV§(0,this.hero.heroView.direction);
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

