package §_-Oc§
{
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import game.§_-bU§;
   import game.mainGame.SquirrelGame;
   import sounds.GameSounds;
   
   public class §_-s2P§ extends §_-WE§
   {
      
      private static var §_-K19§:§_-bU§ = new §_-bU§();
      
      private var §_-41y§:uint;
      
      public function §_-s2P§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get available() : Boolean
      {
         return super.available && !(this.hero.heroView.§_-t2V§ as §_-23o§).stomp && !(this.hero.heroView.§_-t2V§ as §_-23o§).§_-b2J§ && !(this.hero.heroView.§_-t2V§ as §_-23o§).§_-Y1A§;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(!§_-K19§)
         {
            return;
         }
         §_-K19§.reset();
         if(§_-K19§.parent)
         {
            §_-K19§.parent.removeChild(§_-K19§);
         }
      }
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
         clearTimeout(this.§_-41y§);
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
         (this.hero.heroView.§_-t2V§ as §_-23o§).spit = true;
         this.hero.isStopped = true;
         this.§_-41y§ = setTimeout(this.spit,1900);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         (this.hero.heroView.§_-t2V§ as §_-23o§).spit = false;
         this.hero.isStopped = false;
      }
      
      private function spit() : void
      {
         if(!this.hero)
         {
            return;
         }
         GameSounds.play("spit");
         GameSounds.playUnrepeatable("hare_spit",§_-23o§.§_-Q0§);
         §_-K19§.activate();
         SquirrelGame.instance.addChild(§_-K19§);
      }
   }
}

