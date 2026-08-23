package §_-P2b§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-KN§ extends §_-H2N§ implements §_-01l§
   {
      
      private var §_-Lg§:MovieClip;
      
      private var §_-iW§:MovieClip;
      
      private var transform:Boolean = false;
      
      private var §_-t22§:§_-b2V§;
      
      public function §_-KN§(param1:Hero)
      {
         var hero:Hero = param1;
         super(hero);
         this.§_-mw§ = true;
         this.§_-it§ = §_-VU§;
         this.§_-Lg§ = new ArmadilloTransformIn();
         this.§_-Lg§.addFrameScript(this.§_-Lg§.totalFrames - 1,function():void
         {
            §_-Lg§.dispatchEvent(new Event(Event.CHANGE));
            §_-Lg§.stop();
         });
         this.§_-iW§ = new ArmadilloTransformOut();
         this.§_-iW§.addFrameScript(this.§_-iW§.totalFrames - 1,function():void
         {
            §_-iW§.dispatchEvent(new Event(Event.CHANGE));
            §_-iW§.stop();
         });
         this.transform = false;
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         this.hero.armadillo = false;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-k2P§;
      }
      
      override protected function activate() : void
      {
         if(this.transform)
         {
            this.deactivate();
            return;
         }
         if(this.hero.heroView.running || this.hero.heroView.§_-k2P§)
         {
            return;
         }
         super.activate();
         this.§_-t22§ = new §_-b2V§(["ArmadilloBallRunView","ArmadilloBallStandView"]);
         this.hero.changeView(this.§_-Lg§,true);
         this.§_-Lg§.addEventListener(Event.CHANGE,this.§_-A2V§);
         this.§_-Lg§.gotoAndPlay(1);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.changeView(this.§_-iW§,true);
         this.§_-iW§.gotoAndPlay(1);
         this.§_-iW§.addEventListener(Event.CHANGE,this.§_-c2F§);
      }
      
      private function §_-A2V§(param1:Event) : void
      {
         this.§_-Lg§.removeEventListener(Event.CHANGE,this.§_-A2V§);
         this.§_-Lg§.gotoAndStop(1);
         if(this.hero.shaman)
         {
            return;
         }
         this.hero.changeView(this.§_-t22§);
         this.transform = true;
         this.hero.armadillo = true;
      }
      
      private function §_-c2F§(param1:Event) : void
      {
         if(!this.hero)
         {
            return;
         }
         this.§_-iW§.removeEventListener(Event.CHANGE,this.§_-c2F§);
         this.§_-iW§.gotoAndStop(1);
         this.hero.changeView();
         this.transform = false;
         this.hero.armadillo = false;
      }
   }
}

