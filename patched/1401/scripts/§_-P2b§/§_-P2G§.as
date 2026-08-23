package §_-P2b§
{
   import flash.display.MovieClip;
   
   public class §_-P2G§ extends §_-H2N§
   {
      
      private var view:MovieClip = null;
      
      public function §_-P2G§(param1:Hero)
      {
         super(param1);
         this.view = new LenPerkView();
         this.§_-it§ = "guitar";
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.active)
         {
            return;
         }
         if(Boolean(this.hero) && this.hero.heroView.running)
         {
            this.active = false;
         }
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.changeView(this.view);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.changeView();
      }
   }
}

