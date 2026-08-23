package §_-P2b§
{
   import flash.display.MovieClip;
   import sounds.GameMusic;
   
   public class §_-v1Y§ extends §_-H2N§
   {
      
      private var view:MovieClip = null;
      
      public function §_-v1Y§(param1:Hero)
      {
         super(param1);
         this.view = new LenPerkView();
         this.§_-it§ = "";
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
         if(!GameMusic.on)
         {
            return;
         }
         if(GameMusic.§_-y1l§ == "catwomen1")
         {
            return;
         }
         GameMusic.§_-f4§("catwomen1");
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.changeView();
         if(GameMusic.§_-y1l§ == "catwomen1")
         {
            GameMusic.§_-d2D§();
         }
      }
   }
}

