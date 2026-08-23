package §_-j2E§
{
   import flash.display.Sprite;
   import game.§_-43H§;
   import sounds.GameSounds;
   import views.§_-TE§;
   
   public class §_-22O§ extends §_-92f§
   {
      
      private static const §_-w1R§:int = 1;
      
      private static const §_-621§:int = 2;
      
      private static const §_-iu§:int = 3;
      
      private static const §_-17§:int = 5;
      
      private static const §_-6j§:int = 10;
      
      private static const §_-MS§:int = 3;
      
      private static var §_-R1N§:Array = [];
      
      private static var §_-AQ§:Sprite = null;
      
      private var §_-RA§:Boolean = false;
      
      public function §_-22O§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "snowwarior";
         if(§_-AQ§ == null)
         {
            §_-AQ§ = new §_-43H§();
         }
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get maxCountUse() : int
      {
         return 1;
      }
      
      override public function get startCooldown() : Number
      {
         return 30;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get activeTime() : Number
      {
         return this.§_-32l§ >= §_-w1R§ ? §_-6j§ : §_-17§;
      }
      
      override public function dispose() : void
      {
         if(this.hero != null && this.hero.id == Game.selfId)
         {
            §_-TE§.§_-82M§(§_-TE§.§_-e2G§);
            (§_-AQ§ as §_-43H§).dispose();
            §_-R1N§ = [];
         }
         if(this.active)
         {
            §_-TE§.stop(§_-TE§.§_-e2G§,this.hero.id);
            this.§_-25§ = false;
         }
         super.dispose();
      }
      
      override protected function activate() : void
      {
         super.activate();
         §_-AQ§.width = Game.starling.stage.stageWidth;
         §_-AQ§.height = Game.starling.stage.stageHeight;
         §_-TE§.start(§_-TE§.§_-e2G§,this.hero.id);
         if(this.§_-32l§ >= §_-621§)
         {
            this.§_-25§ = true;
            GameSounds.play("snowfreeze");
         }
         else
         {
            GameSounds.play("snowfall");
         }
         if(this.§_-32l§ >= §_-iu§)
         {
            this.hero.runSpeed += §_-MS§;
            this.§_-RA§ = true;
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         §_-TE§.stop(§_-TE§.§_-e2G§,this.hero.id);
         if(this.§_-32l§ >= §_-621§)
         {
            this.§_-25§ = false;
         }
         if(this.§_-RA§)
         {
            this.hero.runSpeed -= §_-MS§;
            this.§_-RA§ = false;
         }
      }
      
      private function set §_-25§(param1:Boolean) : void
      {
         if(param1)
         {
            §_-R1N§.push(this.hero.id);
         }
         else if(§_-R1N§.indexOf(this.hero.id) != -1)
         {
            §_-R1N§.splice(§_-R1N§.indexOf(this.hero.id),1);
         }
         if(§_-R1N§.length > 0)
         {
            (§_-AQ§ as §_-43H§).start();
         }
         else
         {
            (§_-AQ§ as §_-43H§).stop();
         }
      }
   }
}

