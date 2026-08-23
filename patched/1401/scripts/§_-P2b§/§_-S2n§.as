package §_-P2b§
{
   import §_-33r§.§_-C2I§;
   
   public class §_-S2n§ extends §_-H2N§
   {
      
      private var state:§_-C2I§ = null;
      
      public function §_-S2n§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-VU§;
         this.§_-mw§ = true;
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
         return 7;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-C2I§(0,50);
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

