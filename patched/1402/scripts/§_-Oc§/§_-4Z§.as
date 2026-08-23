package §_-Oc§
{
   public class §_-4Z§ extends §_-WE§
   {
      
      public function §_-4Z§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && !(this.hero.heroView.§_-t2V§ as §_-23o§).stomp;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.§_-6l§ = true;
         (this.hero.heroView.§_-t2V§ as §_-23o§).§_-b2J§ = true;
         this.hero.mass *= 4;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!(this.hero.heroView.§_-t2V§ as §_-23o§).§_-b2J§)
         {
            return;
         }
         this.hero.sendLocation(-this.§_-T2a§);
         this.hero.§_-6l§ = false;
         (this.hero.heroView.§_-t2V§ as §_-23o§).§_-b2J§ = false;
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

