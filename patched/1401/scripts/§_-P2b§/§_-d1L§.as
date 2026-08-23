package §_-P2b§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-d1L§ extends §_-H2N§ implements §_-01l§
   {
      
      private var §_-XV§:Boolean = false;
      
      protected var §_-Lg§:MovieClip = null;
      
      protected var §_-iW§:MovieClip = null;
      
      protected var §_-M2I§:MovieClip = null;
      
      public function §_-d1L§(param1:Hero)
      {
         super(param1);
         this.§_-XV§ = false;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      protected function §_-V2U§() : void
      {
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-V2U§();
         if(this.§_-XV§ || !this.hero)
         {
            return;
         }
         this.§_-XV§ = true;
         this.hero.changeView(this.§_-Lg§,true);
         this.§_-Lg§.addEventListener(Event.CHANGE,this.§_-A2V§);
         this.§_-Lg§.gotoAndPlay(0);
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
         this.§_-XV§ = false;
         this.hero.changeView(this.§_-iW§,true);
         this.§_-iW§.addEventListener(Event.CHANGE,this.§_-c2F§);
         this.§_-iW§.gotoAndPlay(0);
         this.hero.jumpVelocity += 9;
         this.hero.runSpeed /= 2.5;
      }
      
      protected function §_-A2V§(param1:Event) : void
      {
         this.§_-Lg§.removeEventListener(Event.CHANGE,this.§_-A2V§);
         this.§_-Lg§.gotoAndStop(0);
         if(!this.hero)
         {
            return;
         }
         this.hero.changeView(this.§_-M2I§,true);
      }
      
      protected function §_-c2F§(param1:Event) : void
      {
         this.§_-iW§.removeEventListener(Event.CHANGE,this.§_-c2F§);
         this.§_-iW§.gotoAndStop(0);
         if(!this.hero)
         {
            return;
         }
         this.hero.changeView();
      }
   }
}

