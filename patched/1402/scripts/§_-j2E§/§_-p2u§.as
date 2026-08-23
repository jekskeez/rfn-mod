package §_-j2E§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-p2u§ extends §_-92f§ implements §_-x1v§
   {
      
      private var §_-N1l§:MovieClip;
      
      private var §_-F19§:MovieClip;
      
      private var transform:Boolean = false;
      
      private var §_-AA§:§_-I22§;
      
      public function §_-p2u§(param1:Hero)
      {
         var hero:Hero = param1;
         super(hero);
         this.§_-i1J§ = true;
         this.§_-S2A§ = §_-7d§;
         this.§_-N1l§ = new ArmadilloTransformIn();
         this.§_-N1l§.addFrameScript(this.§_-N1l§.totalFrames - 1,function():void
         {
            §_-N1l§.dispatchEvent(new Event(Event.CHANGE));
            §_-N1l§.stop();
         });
         this.§_-F19§ = new ArmadilloTransformOut();
         this.§_-F19§.addFrameScript(this.§_-F19§.totalFrames - 1,function():void
         {
            §_-F19§.dispatchEvent(new Event(Event.CHANGE));
            §_-F19§.stop();
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
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
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
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-52A§;
      }
      
      override protected function activate() : void
      {
         if(this.transform)
         {
            this.deactivate();
            return;
         }
         if(this.hero.heroView.running || this.hero.heroView.§_-52A§)
         {
            return;
         }
         super.activate();
         this.§_-AA§ = new §_-I22§(["ArmadilloBallRunView","ArmadilloBallStandView"]);
         this.hero.changeView(this.§_-N1l§,true);
         this.§_-N1l§.addEventListener(Event.CHANGE,this.§_-xw§);
         this.§_-N1l§.gotoAndPlay(1);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.changeView(this.§_-F19§,true);
         this.§_-F19§.gotoAndPlay(1);
         this.§_-F19§.addEventListener(Event.CHANGE,this.§_-Z2V§);
      }
      
      private function §_-xw§(param1:Event) : void
      {
         this.§_-N1l§.removeEventListener(Event.CHANGE,this.§_-xw§);
         this.§_-N1l§.gotoAndStop(1);
         if(this.hero.shaman)
         {
            return;
         }
         this.hero.changeView(this.§_-AA§);
         this.transform = true;
         this.hero.armadillo = true;
      }
      
      private function §_-Z2V§(param1:Event) : void
      {
         if(!this.hero)
         {
            return;
         }
         this.§_-F19§.removeEventListener(Event.CHANGE,this.§_-Z2V§);
         this.§_-F19§.gotoAndStop(1);
         this.hero.changeView();
         this.transform = false;
         this.hero.armadillo = false;
      }
   }
}

