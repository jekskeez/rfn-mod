package §_-j2E§
{
   import §_-Cc§.§_-62s§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   
   public class §_-a2o§ extends §_-92f§
   {
      
      private var state:§_-62s§;
      
      public function §_-a2o§(param1:Hero)
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
         return super.available && !this.hero.heroView.running && !this.active && !this.hero.game.paused && this.hero.isScrat && this.hero.§_-62F§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.state = new §_-62s§(this.activeTime);
         this.hero.behaviourController.§_-W10§(this.state);
         §_-u24§.sendMessage(this.hero.id,"",§_-g1j§.§_-pt§);
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

