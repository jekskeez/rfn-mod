package §_-Oc§
{
   import sounds.GameSounds;
   
   public class §_-O26§ extends §_-WE§
   {
      
      public function §_-O26§(param1:Hero)
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
         GameSounds.playUnrepeatable("hare_speed",§_-23o§.§_-Q0§);
         this.hero.runSpeed *= 3;
         (this.hero.heroView.§_-t2V§ as §_-23o§).§_-72n§ += 2;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!(this.hero.heroView.§_-t2V§ as §_-23o§).§_-72n§ >= 2)
         {
            return;
         }
         this.hero.runSpeed /= 3;
         (this.hero.heroView.§_-t2V§ as §_-23o§).§_-72n§ -= 2;
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

