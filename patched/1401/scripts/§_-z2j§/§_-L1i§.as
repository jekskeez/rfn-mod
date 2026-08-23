package §_-z2j§
{
   public class §_-L1i§ extends §_-33U§
   {
      
      public function §_-L1i§(param1:Hero)
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
         this.hero.§_-EO§ = true;
         (this.hero.heroView.§_-Wk§ as §_-31F§).§_-62l§ = true;
         this.hero.mass *= 4;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!(this.hero.heroView.§_-Wk§ as §_-31F§).§_-62l§)
         {
            return;
         }
         this.hero.sendLocation(-this.§_-i2D§);
         this.hero.§_-EO§ = false;
         (this.hero.heroView.§_-Wk§ as §_-31F§).§_-62l§ = false;
         this.hero.mass /= 4;
      }
      
      override public function get activeTime() : Number
      {
         return 5;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
   }
}

