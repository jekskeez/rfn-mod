package §_-P2b§
{
   import §_-33r§.§_-kC§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   
   public class §_-73s§ extends §_-H2N§
   {
      
      private var state:§_-kC§;
      
      public function §_-73s§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get activeTime() : Number
      {
         return 15;
      }
      
      override public function get startCooldown() : Number
      {
         return 15;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.active && !this.hero.game.paused && this.hero.isScrat && this.hero.§_-426§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-kC§(this.activeTime);
         this.hero.behaviourController.§_-gz§(this.state);
         §_-92z§.sendMessage(this.hero.id,"",§_-A1n§.§_-vW§);
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

