package §_-P2b§
{
   import flash.display.Sprite;
   import game.§_-28§;
   import sounds.GameSounds;
   import views.§_-nd§;
   
   public class §_-72I§ extends §_-H2N§
   {
      
      private static const §_-l1T§:int = 1;
      
      private static const §_-81p§:int = 2;
      
      private static const §_-dw§:int = 3;
      
      private static const §_-p2O§:int = 5;
      
      private static const §_-s1p§:int = 10;
      
      private static const §_-69§:int = 3;
      
      private static var §_-le§:Array = [];
      
      private static var §_-42h§:Sprite = null;
      
      private var §_-Qo§:Boolean = false;
      
      public function §_-72I§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "snowwarior";
         if(§_-42h§ == null)
         {
            §_-42h§ = new §_-28§();
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
         return this.§_-j2Y§ >= §_-l1T§ ? §_-s1p§ : §_-p2O§;
      }
      
      override public function dispose() : void
      {
         if(this.hero != null && this.hero.id == Game.selfId)
         {
            §_-nd§.§_-23V§(§_-nd§.§_-jM§);
            (§_-42h§ as §_-28§).dispose();
            §_-le§ = [];
         }
         if(this.active)
         {
            §_-nd§.stop(§_-nd§.§_-jM§,this.hero.id);
            this.§_-u7§ = false;
         }
         super.dispose();
      }
      
      override protected function activate() : void
      {
         super.activate();
         §_-42h§.width = Game.starling.stage.stageWidth;
         §_-42h§.height = Game.starling.stage.stageHeight;
         §_-nd§.start(§_-nd§.§_-jM§,this.hero.id);
         if(this.§_-j2Y§ >= §_-81p§)
         {
            this.§_-u7§ = true;
            GameSounds.play("snowfreeze");
         }
         else
         {
            GameSounds.play("snowfall");
         }
         if(this.§_-j2Y§ >= §_-dw§)
         {
            this.hero.runSpeed += §_-69§;
            this.§_-Qo§ = true;
         }
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         §_-nd§.stop(§_-nd§.§_-jM§,this.hero.id);
         if(this.§_-j2Y§ >= §_-81p§)
         {
            this.§_-u7§ = false;
         }
         if(this.§_-Qo§)
         {
            this.hero.runSpeed -= §_-69§;
            this.§_-Qo§ = false;
         }
      }
      
      private function set §_-u7§(param1:Boolean) : void
      {
         if(param1)
         {
            §_-le§.push(this.hero.id);
         }
         else if(§_-le§.indexOf(this.hero.id) != -1)
         {
            §_-le§.splice(§_-le§.indexOf(this.hero.id),1);
         }
         if(§_-le§.length > 0)
         {
            (§_-42h§ as §_-28§).start();
         }
         else
         {
            (§_-42h§ as §_-28§).stop();
         }
      }
   }
}

