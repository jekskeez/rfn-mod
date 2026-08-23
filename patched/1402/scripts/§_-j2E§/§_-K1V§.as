package §_-j2E§
{
   import flash.display.MovieClip;
   import sounds.GameMusic;
   
   public class §_-K1V§ extends §_-92f§
   {
      
      private var view:MovieClip = null;
      
      public function §_-K1V§(param1:Hero)
      {
         super(param1);
         this.view = new LenPerkView();
         this.§_-S2A§ = "";
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
         if(GameMusic.§_-n1s§ == "catwomen1")
         {
            return;
         }
         GameMusic.§_-Q1b§("catwomen1");
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.changeView();
         if(GameMusic.§_-n1s§ == "catwomen1")
         {
            GameMusic.§_-g15§();
         }
      }
   }
}

