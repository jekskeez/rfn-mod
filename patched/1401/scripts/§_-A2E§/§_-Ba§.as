package §_-A2E§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-Ba§ extends §_-kV§
   {
      
      private static const §_-c1F§:int = 12;
      
      private static var §_-Ie§:MovieClip = null;
      
      private var §_-Q2q§:MovieClip = null;
      
      public function §_-Ba§(param1:Hero)
      {
         super(param1);
         this.view = new ObjectExcavationView();
         this.view.x = -12;
         this.view.y = -16;
         addChild(this.view);
         this.visible = false;
         this.hero.addEventListener(Hero.§_-C2K§,this.§_-jf§);
      }
      
      override public function dispose() : void
      {
         this.hero.removeEventListener(Hero.§_-C2K§,this.§_-jf§);
         super.dispose();
      }
      
      private function §_-bY§(param1:Event) : void
      {
         if(this.hero)
         {
            this.hero.changeView();
         }
         §_-Ie§.removeEventListener(Event.CHANGE,this.§_-bY§);
         §_-Ie§ = null;
      }
      
      private function §_-jf§(param1:Event) : void
      {
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(this.position);
         if(!§_-Ie§)
         {
            §_-Ie§ = new IconIntuitionView();
            §_-Ie§.y = -this.hero.heroView.topOffset - 5;
            §_-Ie§.addEventListener(Event.CHANGE,this.§_-bY§);
            this.hero.§_-72F§(§_-Ie§);
         }
         if(_loc2_.Length() >= §_-c1F§)
         {
            return;
         }
         this.visible = true;
         this.activated = true;
         this.§_-Q2q§ = new QuestItemExplode();
         this.§_-Q2q§.addEventListener(Event.CHANGE,this.§_-Hp§);
         addChild(this.§_-Q2q§);
         this.hero.removeEventListener(Hero.§_-C2K§,this.§_-jf§);
      }
      
      private function §_-Hp§(param1:Event) : void
      {
         if(!this.§_-Q2q§ || !contains(this.§_-Q2q§))
         {
            return;
         }
         this.§_-Q2q§.removeEventListener(Event.CHANGE,this.§_-Hp§);
         removeChild(this.§_-Q2q§);
         this.§_-Q2q§ = null;
      }
   }
}

