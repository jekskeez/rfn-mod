package §_-A2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-A2x§.GameMapNet;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-tt§ extends §_-kV§
   {
      
      private static const §_-Zj§:int = 10;
      
      private static const §_-u27§:int = 15;
      
      private var §_-Q2q§:MovieClip = null;
      
      private var time:Number = 0;
      
      public var count:int = 0;
      
      public function §_-tt§(param1:Hero)
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
            this.time = §_-Zj§ + Math.random() * (§_-u27§ - §_-Zj§);
            this.position = (this.hero.game.map as GameMapNet).§_-S15§(2,2,1)[0];
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
         this.§_-Q2q§ = new QuestItemExplode();
         this.§_-Q2q§.y = this.hero.heroView.topOffset - 5;
         this.§_-Q2q§.addEventListener(Event.CHANGE,this.§_-Hp§);
         this.hero.§_-72F§(this.§_-Q2q§);
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

