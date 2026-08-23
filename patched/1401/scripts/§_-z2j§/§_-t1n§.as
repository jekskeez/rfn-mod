package §_-z2j§
{
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import game.§_-I15§;
   import game.mainGame.SquirrelGame;
   import sounds.GameSounds;
   
   public class §_-t1n§ extends §_-33U§
   {
      
      private static var §_-l2V§:§_-I15§ = new §_-I15§();
      
      private var §_-XC§:uint;
      
      public function §_-t1n§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && !(this.hero.heroView.§_-Wk§ as §_-31F§).stomp && !(this.hero.heroView.§_-Wk§ as §_-31F§).§_-62l§ && !(this.hero.heroView.§_-Wk§ as §_-31F§).§_-18§;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(!§_-l2V§)
         {
            return;
         }
         §_-l2V§.reset();
         if(§_-l2V§.parent)
         {
            §_-l2V§.parent.removeChild(§_-l2V§);
         }
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         clearTimeout(this.§_-XC§);
      }
      
      override public function get activeTime() : Number
      {
         return 6;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function activate() : void
      {
         super.activate();
         (this.hero.heroView.§_-Wk§ as §_-31F§).spit = true;
         this.hero.isStopped = true;
         this.§_-XC§ = setTimeout(this.spit,1900);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         (this.hero.heroView.§_-Wk§ as §_-31F§).spit = false;
         this.hero.isStopped = false;
      }
      
      private function spit() : void
      {
         if(!this.hero)
         {
            return;
         }
         GameSounds.play("spit");
         GameSounds.playUnrepeatable("hare_spit",§_-31F§.§_-Y2M§);
         §_-l2V§.activate();
         SquirrelGame.instance.addChild(§_-l2V§);
      }
   }
}

