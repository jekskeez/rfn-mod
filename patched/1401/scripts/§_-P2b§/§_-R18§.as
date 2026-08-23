package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-6u§;
   import flash.display.MovieClip;
   
   public class §_-R18§ extends §_-C1§
   {
      
      private var view:MovieClip = null;
      
      public function §_-R18§(param1:Hero)
      {
         super(param1);
         this.§_-mw§ = false;
         this.§_-it§ = "PerkGoat";
      }
      
      override public function get totalCooldown() : Number
      {
         return 17;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-6u§;
      }
      
      override protected function get §_-v2i§() : Number
      {
         return 2.5;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-6u§).lifeTime = 12 * 1000;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-k2P§;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game || this.hero.game.paused)
         {
            this.§_-c1w§ = false;
            return;
         }
         if(!this.view)
         {
            this.view = new PerkGoatAnimation();
            this.view.addFrameScript(this.view.totalFrames - 1,this.§_-bY§);
         }
         this.view.x = -22.35;
         this.view.y = -20.05;
         this.view.scaleX = this.hero.heroView.direction ? 1 : -1;
         this.hero.heroView.addChild(this.view);
         this.view.gotoAndPlay(0);
         super.activate();
      }
      
      override public function dispose() : void
      {
         this.view = null;
         super.dispose();
      }
      
      private function §_-bY§() : void
      {
         if(!this.hero)
         {
            return;
         }
         if(Boolean(this.view) && this.hero.heroView.contains(this.view))
         {
            this.hero.heroView.removeChild(this.view);
         }
         this.view = null;
      }
   }
}

