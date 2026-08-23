package §_-A2E§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-323§ extends §_-kV§
   {
      
      private static var §_-82K§:MovieClip = null;
      
      private var §_-Q2q§:MovieClip = null;
      
      public function §_-323§(param1:Hero)
      {
         super(param1);
         this.view = new ObjectGreedView();
         this.view.x = -20;
         this.view.y = -15;
         addChild(this.view);
         if(!§_-82K§)
         {
            §_-82K§ = new IconGreedView();
            §_-82K§.x = -14;
            §_-82K§.y = this.hero.heroView.topOffset - 5;
            §_-82K§.visible = false;
            §_-82K§.stop();
            this.hero.§_-72F§(§_-82K§,true);
         }
      }
      
      override public function dispose() : void
      {
         if(§_-82K§)
         {
            this.hero.removeChild(§_-82K§);
            §_-82K§ = null;
         }
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         §_-82K§.visible = !this.hero.isDead && !this.hero.inHollow;
         if(this.activated)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(this.position);
         if(_loc2_.Length() >= 4)
         {
            return;
         }
         this.visible = false;
         this.activated = true;
         §_-82K§.gotoAndStop(§_-82K§.currentFrame + (§_-82K§.visible ? 5 : 0));
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"questFactor":0.9}));
         this.§_-Q2q§ = new QuestItemExplode();
         this.§_-Q2q§.y = -20;
         this.§_-Q2q§.addEventListener(Event.CHANGE,this.§_-Hp§);
         this.hero.§_-72F§(this.§_-Q2q§,true);
      }
      
      private function §_-Hp§(param1:Event) : void
      {
         if(!this.§_-Q2q§)
         {
            return;
         }
         this.§_-Q2q§.removeEventListener(Event.CHANGE,this.§_-Hp§);
         this.§_-Q2q§ = null;
         if(this.hero)
         {
            this.hero.changeView();
         }
      }
   }
}

