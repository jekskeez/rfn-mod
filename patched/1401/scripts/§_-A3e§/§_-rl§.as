package §_-A3e§
{
   import §_-P2b§.§_-H2N§;
   import flash.display.MovieClip;
   
   public class §_-rl§ extends §_-H2N§
   {
      
      protected var view:MovieClip = null;
      
      public function §_-rl§(param1:Hero)
      {
         super(param1);
      }
      
      protected function §_-Y2U§() : MovieClip
      {
         return null;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero)
         {
            return;
         }
         this.view = this.§_-Y2U§();
         this.hero.heroView.addChild(this.view);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
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

