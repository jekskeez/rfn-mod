package §_-q0§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-Yo§ extends §_-K1r§
   {
      
      private static var §_-d2E§:MovieClip = null;
      
      private var §_-O10§:MovieClip = null;
      
      public function §_-Yo§(param1:Hero)
      {
         super(param1);
         this.view = new ObjectGreedView();
         this.view.x = -20;
         this.view.y = -15;
         addChild(this.view);
         if(!§_-d2E§)
         {
            §_-d2E§ = new IconGreedView();
            §_-d2E§.x = -14;
            §_-d2E§.y = this.hero.heroView.topOffset - 5;
            §_-d2E§.visible = false;
            §_-d2E§.stop();
            this.hero.§_-s28§(§_-d2E§,true);
         }
      }
      
      override public function dispose() : void
      {
         if(§_-d2E§)
         {
            this.hero.removeChild(§_-d2E§);
            §_-d2E§ = null;
         }
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         §_-d2E§.visible = !this.hero.isDead && !this.hero.inHollow;
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
         §_-d2E§.gotoAndStop(§_-d2E§.currentFrame + (§_-d2E§.visible ? 5 : 0));
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"questFactor":0.9}));
         this.§_-O10§ = new QuestItemExplode();
         this.§_-O10§.y = -20;
         this.§_-O10§.addEventListener(Event.CHANGE,this.§_-w1T§);
         this.hero.§_-s28§(this.§_-O10§,true);
      }
      
      private function §_-w1T§(param1:Event) : void
      {
         if(!this.§_-O10§)
         {
            return;
         }
         this.§_-O10§.removeEventListener(Event.CHANGE,this.§_-w1T§);
         this.§_-O10§ = null;
         if(this.hero)
         {
            this.hero.changeView();
         }
      }
   }
}

