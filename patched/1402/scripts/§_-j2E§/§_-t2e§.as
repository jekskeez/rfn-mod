package §_-j2E§
{
   import §_-U19§.§_-B2U§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import views.§_-236§;
   
   public class §_-t2e§ extends §_-92f§
   {
      
      private var view:MovieClip = null;
      
      public function §_-t2e§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.§_-i1J§ = true;
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
         this.view.y = _loc1_.y + Hero.§_-a1A§;
         this.view.rotation = this.hero.rotation;
         this.hero.game.map.§_-1l§.addChild(this.view);
         this.view.addEventListener(Event.ENTER_FRAME,this.§_-52w§);
         this.view.play();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(Boolean(this.view) && Boolean(this.view.parent))
         {
            this.view.parent.removeChild(this.view);
            this.view.removeEventListener(Event.ENTER_FRAME,this.§_-52w§);
            this.view.stop();
         }
      }
      
      private function §_-52w§(param1:Event) : void
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
         this.view.removeEventListener(Event.ENTER_FRAME,this.§_-52w§);
         this.view.stop();
         this.§_-r1Z§();
      }
      
      private function §_-r1Z§() : void
      {
         var _loc1_:§_-236§ = null;
         var _loc2_:LegionPerkBaseIcon = null;
         if(this.hero.player["clan_id"] > 0 && §_-B2U§.§_-Q2g§(this.hero.player["clan_id"]).§_-51L§ != "")
         {
            _loc1_ = new §_-236§("",0,0,30);
            _loc1_.load(§_-B2U§.§_-Q2g§(this.hero.player["clan_id"]).§_-51L§);
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

