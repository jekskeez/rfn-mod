package §_-q0§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-W1O§ extends §_-K1r§
   {
      
      private static const §_-A2L§:int = 12;
      
      private static var §_-jB§:MovieClip = null;
      
      private var §_-O10§:MovieClip = null;
      
      public function §_-W1O§(param1:Hero)
      {
         super(param1);
         this.view = new ObjectExcavationView();
         this.view.x = -12;
         this.view.y = -16;
         addChild(this.view);
         this.visible = false;
         this.hero.addEventListener(Hero.§_-e1j§,this.§_-A1R§);
      }
      
      override public function dispose() : void
      {
         this.hero.removeEventListener(Hero.§_-e1j§,this.§_-A1R§);
         super.dispose();
      }
      
      private function §_-TZ§(param1:Event) : void
      {
         if(this.hero)
         {
            this.hero.changeView();
         }
         §_-jB§.removeEventListener(Event.CHANGE,this.§_-TZ§);
         §_-jB§ = null;
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(this.position);
         if(!§_-jB§)
         {
            §_-jB§ = new IconIntuitionView();
            §_-jB§.y = -this.hero.heroView.topOffset - 5;
            §_-jB§.addEventListener(Event.CHANGE,this.§_-TZ§);
            this.hero.§_-s28§(§_-jB§);
         }
         if(_loc2_.Length() >= §_-A2L§)
         {
            return;
         }
         this.visible = true;
         this.activated = true;
         this.§_-O10§ = new QuestItemExplode();
         this.§_-O10§.addEventListener(Event.CHANGE,this.§_-w1T§);
         addChild(this.§_-O10§);
         this.hero.removeEventListener(Hero.§_-e1j§,this.§_-A1R§);
      }
      
      private function §_-w1T§(param1:Event) : void
      {
         if(!this.§_-O10§ || !contains(this.§_-O10§))
         {
            return;
         }
         this.§_-O10§.removeEventListener(Event.CHANGE,this.§_-w1T§);
         removeChild(this.§_-O10§);
         this.§_-O10§ = null;
      }
   }
}

