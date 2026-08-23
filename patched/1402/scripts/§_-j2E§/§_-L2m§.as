package §_-j2E§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-L2m§ extends §_-92f§ implements §_-x1v§
   {
      
      private var §_-Z§:Boolean = false;
      
      protected var §_-N1l§:MovieClip = null;
      
      protected var §_-F19§:MovieClip = null;
      
      protected var §_-P2c§:MovieClip = null;
      
      public function §_-L2m§(param1:Hero)
      {
         super(param1);
         this.§_-Z§ = false;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      protected function §_-o2x§() : void
      {
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-o2x§();
         if(this.§_-Z§ || !this.hero)
         {
            return;
         }
         this.§_-Z§ = true;
         this.hero.changeView(this.§_-N1l§,true);
         this.§_-N1l§.addEventListener(Event.CHANGE,this.§_-xw§);
         this.§_-N1l§.gotoAndPlay(0);
         this.hero.jumpVelocity -= 9;
         this.hero.runSpeed *= 2.5;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.§_-Z§ = false;
         this.hero.changeView(this.§_-F19§,true);
         this.§_-F19§.addEventListener(Event.CHANGE,this.§_-Z2V§);
         this.§_-F19§.gotoAndPlay(0);
         this.hero.jumpVelocity += 9;
         this.hero.runSpeed /= 2.5;
      }
      
      protected function §_-xw§(param1:Event) : void
      {
         this.§_-N1l§.removeEventListener(Event.CHANGE,this.§_-xw§);
         this.§_-N1l§.gotoAndStop(0);
         if(!this.hero)
         {
            return;
         }
         this.hero.changeView(this.§_-P2c§,true);
      }
      
      protected function §_-Z2V§(param1:Event) : void
      {
         this.§_-F19§.removeEventListener(Event.CHANGE,this.§_-Z2V§);
         this.§_-F19§.gotoAndStop(0);
         if(!this.hero)
         {
            return;
         }
         this.hero.changeView();
      }
   }
}

