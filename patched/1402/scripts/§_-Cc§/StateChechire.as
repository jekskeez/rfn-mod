package §_-Cc§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   
   public class StateChechire extends §_-pp§
   {
      
      private var §_-N1l§:MovieClip = null;
      
      private var §_-F19§:MovieClip = null;
      
      private var §_-7u§:MovieClip;
      
      private var §_-822§:MovieClip;
      
      private var §_-6U§:b2Vec2;
      
      private var §_-L1X§:Boolean = false;
      
      public function StateChechire(param1:b2Vec2)
      {
         super(0);
         this.§_-6U§ = param1;
         this.§_-N1l§ = new CheshireTransformIn();
         this.§_-F19§ = new CheshireTransformOut();
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.visible = true;
            this.hero.isStopped = false;
            if(this.§_-L1X§)
            {
               this.hero.unlockBody(this);
            }
            this.§_-L1X§ = false;
            this.hero.changeView();
            if(Boolean(this.§_-822§) && Boolean(this.§_-822§.parent))
            {
               this.§_-822§.removeEventListener(Event.CHANGE,this.§_-62Q§);
               this.§_-822§.parent.removeChild(this.§_-822§);
               this.§_-822§ = null;
            }
            if(Boolean(this.§_-7u§) && Boolean(this.§_-7u§.parent))
            {
               this.§_-7u§.parent.removeChild(this.§_-7u§);
               this.§_-7u§ = null;
            }
         }
         else
         {
            param1.isStopped = true;
            param1.changeView(this.§_-N1l§);
            this.§_-N1l§.addEventListener(Event.CHANGE,this.§_-xw§);
            this.§_-N1l§.gotoAndPlay(0);
         }
         super.hero = param1;
      }
      
      private function §_-xw§(param1:Event) : void
      {
         this.§_-N1l§.removeEventListener(Event.CHANGE,this.§_-xw§);
         this.§_-N1l§.gotoAndStop(0);
         if(!this.hero || this.hero.onRemove)
         {
            return;
         }
         this.hero.visible = false;
         var _loc2_:Point = this.hero.getPosition();
         this.§_-7u§ = new CheshireSmile();
         this.§_-7u§.x = _loc2_.x;
         this.§_-7u§.y = _loc2_.y;
         this.§_-7u§.rotation = this.hero.rotation;
         this.§_-7u§.scaleX = (this.hero.heroView.direction ? 1 : -1) * Math.abs(this.§_-7u§.scaleX);
         this.hero.game.map.userUpperSprite.addChild(this.§_-7u§);
         setTimeout(this.teleport,1000);
      }
      
      private function teleport() : void
      {
         if(!this.hero || this.hero.onRemove)
         {
            return;
         }
         if(!this.§_-6U§ || isNaN(this.§_-6U§.x) || isNaN(this.§_-6U§.y))
         {
            §_-p2U§.add("StateChechire.teleport skipped NaN");
            this.hero.isStopped = false;
            return;
         }
         this.hero.teleportTo(new b2Vec2(this.§_-6U§.x,this.§_-6U§.y));
         this.hero.lockBody(this);
         this.§_-L1X§ = true;
         this.hero.visible = true;
         this.hero.changeView(this.§_-F19§);
         this.§_-F19§.addEventListener(Event.CHANGE,this.§_-Z2V§);
         this.§_-F19§.gotoAndPlay(0);
      }
      
      private function §_-Z2V§(param1:Event) : void
      {
         this.§_-F19§.removeEventListener(Event.CHANGE,this.§_-Z2V§);
         if(!this.hero || this.hero.onRemove)
         {
            return;
         }
         this.hero.changeView();
         this.hero.unlockBody(this);
         this.§_-L1X§ = false;
         this.hero.isStopped = false;
         setTimeout(this.§_-Q21§,500);
      }
      
      private function §_-Q21§() : void
      {
         if(!this.§_-7u§ || !this.§_-7u§.parent)
         {
            return;
         }
         this.§_-822§ = new CheshireSmileOut();
         this.§_-822§.x = this.§_-7u§.x;
         this.§_-822§.y = this.§_-7u§.y;
         this.§_-822§.scaleX = this.§_-7u§.scaleX;
         this.§_-822§.rotation = this.§_-7u§.rotation;
         this.§_-822§.addEventListener(Event.CHANGE,this.§_-62Q§);
         this.§_-7u§.parent.addChildAt(this.§_-822§,this.§_-7u§.parent.getChildIndex(this.§_-7u§));
         this.§_-7u§.parent.removeChild(this.§_-7u§);
         this.§_-7u§ = null;
      }
      
      private function §_-62Q§(param1:Event) : void
      {
         this.§_-qM§ = false;
      }
   }
}

