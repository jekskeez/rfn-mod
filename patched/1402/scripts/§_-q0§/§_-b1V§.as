package §_-q0§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-td§.GameMapNet;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-b1V§ extends §_-K1r§
   {
      
      private static const §_-j24§:int = 10;
      
      private static const §_-p1x§:int = 15;
      
      private var §_-O10§:MovieClip = null;
      
      private var time:Number = 0;
      
      public var count:int = 0;
      
      public function §_-b1V§(param1:Hero)
      {
         super(param1);
         this.view = new ObjectRainView();
         this.view.x = this.view.y = -30;
         addChild(this.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.hero || !this.hero.game || !this.hero.game.map)
         {
            return;
         }
         if(this.time <= 0)
         {
            this.time = §_-j24§ + Math.random() * (§_-p1x§ - §_-j24§);
            this.position = (this.hero.game.map as GameMapNet).§_-s13§(2,2,1)[0];
         }
         this.time -= param1;
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(this.position);
         if(_loc2_.Length() >= 4)
         {
            return;
         }
         ++this.count;
         this.time = 0;
         this.§_-O10§ = new QuestItemExplode();
         this.§_-O10§.y = this.hero.heroView.topOffset - 5;
         this.§_-O10§.addEventListener(Event.CHANGE,this.§_-w1T§);
         this.hero.§_-s28§(this.§_-O10§);
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

