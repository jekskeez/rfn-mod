package §_-33r§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   
   public class StateChechire extends §_-AP§
   {
      
      private var §_-Lg§:MovieClip = null;
      
      private var §_-iW§:MovieClip = null;
      
      private var §_-j28§:MovieClip;
      
      private var §_-n1o§:MovieClip;
      
      private var §_-g1u§:b2Vec2;
      
      private var §_-b1L§:Boolean = false;
      
      public function StateChechire(param1:b2Vec2)
      {
         super(0);
         this.§_-g1u§ = param1;
         this.§_-Lg§ = new CheshireTransformIn();
         this.§_-iW§ = new CheshireTransformOut();
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.visible = true;
            this.hero.isStopped = false;
            if(this.§_-b1L§)
            {
               this.hero.unlockBody(this);
            }
            this.§_-b1L§ = false;
            this.hero.changeView();
            if(Boolean(this.§_-n1o§) && Boolean(this.§_-n1o§.parent))
            {
               this.§_-n1o§.removeEventListener(Event.CHANGE,this.§_-l2X§);
               this.§_-n1o§.parent.removeChild(this.§_-n1o§);
               this.§_-n1o§ = null;
            }
            if(Boolean(this.§_-j28§) && Boolean(this.§_-j28§.parent))
            {
               this.§_-j28§.parent.removeChild(this.§_-j28§);
               this.§_-j28§ = null;
            }
         }
         else
         {
            param1.isStopped = true;
            param1.changeView(this.§_-Lg§);
            this.§_-Lg§.addEventListener(Event.CHANGE,this.§_-A2V§);
            this.§_-Lg§.gotoAndPlay(0);
         }
         super.hero = param1;
      }
      
      private function §_-A2V§(param1:Event) : void
      {
         this.§_-Lg§.removeEventListener(Event.CHANGE,this.§_-A2V§);
         this.§_-Lg§.gotoAndStop(0);
         if(!this.hero || this.hero.onRemove)
         {
            return;
         }
         this.hero.visible = false;
         var _loc2_:Point = this.hero.getPosition();
         this.§_-j28§ = new CheshireSmile();
         this.§_-j28§.x = _loc2_.x;
         this.§_-j28§.y = _loc2_.y;
         this.§_-j28§.rotation = this.hero.rotation;
         this.§_-j28§.scaleX = (this.hero.heroView.direction ? 1 : -1) * Math.abs(this.§_-j28§.scaleX);
         this.hero.game.map.userUpperSprite.addChild(this.§_-j28§);
         setTimeout(this.teleport,1000);
      }
      
      private function teleport() : void
      {
         if(!this.hero || this.hero.onRemove)
         {
            return;
         }
         if(!this.§_-g1u§ || isNaN(this.§_-g1u§.x) || isNaN(this.§_-g1u§.y))
         {
            §_-TQ§.add("StateChechire.teleport skipped NaN");
            this.hero.isStopped = false;
            return;
         }
         this.hero.teleportTo(new b2Vec2(this.§_-g1u§.x,this.§_-g1u§.y));
         this.hero.lockBody(this);
         this.§_-b1L§ = true;
         this.hero.visible = true;
         this.hero.changeView(this.§_-iW§);
         this.§_-iW§.addEventListener(Event.CHANGE,this.§_-c2F§);
         this.§_-iW§.gotoAndPlay(0);
      }
      
      private function §_-c2F§(param1:Event) : void
      {
         this.§_-iW§.removeEventListener(Event.CHANGE,this.§_-c2F§);
         if(!this.hero || this.hero.onRemove)
         {
            return;
         }
         this.hero.changeView();
         this.hero.unlockBody(this);
         this.§_-b1L§ = false;
         this.hero.isStopped = false;
         setTimeout(this.§_-lo§,500);
      }
      
      private function §_-lo§() : void
      {
         if(!this.§_-j28§ || !this.§_-j28§.parent)
         {
            return;
         }
         this.§_-n1o§ = new CheshireSmileOut();
         this.§_-n1o§.x = this.§_-j28§.x;
         this.§_-n1o§.y = this.§_-j28§.y;
         this.§_-n1o§.scaleX = this.§_-j28§.scaleX;
         this.§_-n1o§.rotation = this.§_-j28§.rotation;
         this.§_-n1o§.addEventListener(Event.CHANGE,this.§_-l2X§);
         this.§_-j28§.parent.addChildAt(this.§_-n1o§,this.§_-j28§.parent.getChildIndex(this.§_-j28§));
         this.§_-j28§.parent.removeChild(this.§_-j28§);
         this.§_-j28§ = null;
      }
      
      private function §_-l2X§(param1:Event) : void
      {
         this.§_-x2n§ = false;
      }
   }
}

