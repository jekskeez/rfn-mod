package §_-z2j§
{
   import sounds.GameSounds;
   
   public class §_-61J§ extends §_-33U§
   {
      
      public function §_-61J§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && !(this.hero.heroView.§_-Wk§ as §_-31F§).stomp;
      }
      
      override protected function activate() : void
      {
         super.activate();
         GameSounds.playUnrepeatable("hare_speed",§_-31F§.§_-Y2M§);
         this.hero.runSpeed *= 3;
         (this.hero.heroView.§_-Wk§ as §_-31F§).§_-P2§ += 2;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!(this.hero.heroView.§_-Wk§ as §_-31F§).§_-P2§ >= 2)
         {
            return;
         }
         this.hero.runSpeed /= 3;
         (this.hero.heroView.§_-Wk§ as §_-31F§).§_-P2§ -= 2;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
   }
}

