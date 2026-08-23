package §_-P2b§
{
   import §_-dc§.§_-e2W§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import views.§_-F1z§;
   
   public class §_-F2Z§ extends §_-H2N§
   {
      
      private var view:MovieClip = null;
      
      public function §_-F2Z§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.§_-mw§ = true;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get totalCooldown() : Number
      {
         return 5;
      }
      
      override public function get activeTime() : Number
      {
         return 15;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         this.view = new LegionPerkView();
         var _loc1_:Point = this.hero.getPosition();
         this.view.x = _loc1_.x;
         this.view.y = _loc1_.y + Hero.§_-YH§;
         this.view.rotation = this.hero.rotation;
         this.hero.game.map.§_-kz§.addChild(this.view);
         this.view.addEventListener(Event.ENTER_FRAME,this.§_-r5§);
         this.view.play();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(Boolean(this.view) && Boolean(this.view.parent))
         {
            this.view.parent.removeChild(this.view);
            this.view.removeEventListener(Event.ENTER_FRAME,this.§_-r5§);
            this.view.stop();
         }
      }
      
      private function §_-r5§(param1:Event) : void
      {
         if(!this.hero || !this.hero.game || !this.hero.game.map)
         {
            return;
         }
         if(!this.view)
         {
            return;
         }
         if(this.view.currentFrame < this.view.totalFrames - 1)
         {
            return;
         }
         this.view.removeEventListener(Event.ENTER_FRAME,this.§_-r5§);
         this.view.stop();
         this.§_-g1q§();
      }
      
      private function §_-g1q§() : void
      {
         var _loc1_:§_-F1z§ = null;
         var _loc2_:LegionPerkBaseIcon = null;
         if(this.hero.player["clan_id"] > 0 && §_-e2W§.§_-W2X§(this.hero.player["clan_id"]).§_-cy§ != "")
         {
            _loc1_ = new §_-F1z§("",0,0,30);
            _loc1_.load(§_-e2W§.§_-W2X§(this.hero.player["clan_id"]).§_-cy§);
            _loc1_.x = -_loc1_.width * 0.5 + 1;
            _loc1_.y = -70 - _loc1_.height * 0.5;
            this.view.addChild(_loc1_);
         }
         else
         {
            _loc2_ = new LegionPerkBaseIcon();
            _loc2_.y = -65;
            this.view.addChild(_loc2_);
         }
      }
   }
}

