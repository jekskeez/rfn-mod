package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-116§;
   import §_-p2L§.§_-j1k§;
   import flash.display.MovieClip;
   
   public class §_-11Q§ extends §_-j1k§
   {
      
      private var view:MovieClip = null;
      
      public function §_-11Q§(param1:Hero)
      {
         super(param1);
         this.§_-i1J§ = false;
         this.§_-S2A§ = "PerkGoat";
      }
      
      override public function get totalCooldown() : Number
      {
         return 17;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-116§;
      }
      
      override protected function get §_-532§() : Number
      {
         return 2.5;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-116§).lifeTime = 12 * 1000;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-52A§;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game || this.hero.game.paused)
         {
            this.§_-8x§ = false;
            return;
         }
         if(!this.view)
         {
            this.view = new PerkGoatAnimation();
            this.view.addFrameScript(this.view.totalFrames - 1,this.§_-TZ§);
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
      
      private function §_-TZ§() : void
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

