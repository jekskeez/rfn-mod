package §_-p2L§
{
   import §_-j2E§.§_-92f§;
   import flash.display.MovieClip;
   
   public class §_-t2P§ extends §_-92f§
   {
      
      protected var view:MovieClip = null;
      
      public function §_-t2P§(param1:Hero)
      {
         super(param1);
      }
      
      protected function §_-o2B§() : MovieClip
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
         this.view = this.§_-o2B§();
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

