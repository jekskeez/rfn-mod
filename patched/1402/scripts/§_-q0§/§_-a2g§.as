package §_-q0§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   
   public class §_-a2g§ extends §_-K1r§
   {
      
      private static const §_-A2L§:int = 8;
      
      private static const §_-D23§:int = 40;
      
      private static var §_-Y2z§:MovieClip = null;
      
      private static var filter:GlowFilter = null;
      
      private var §_-O10§:MovieClip = null;
      
      public function §_-a2g§(param1:Hero)
      {
         super(param1);
         this.view = new ObjectExcavationView();
         this.view.x = -12;
         this.view.y = -16;
         addChild(this.view);
         if(!§_-Y2z§)
         {
            §_-Y2z§ = new IconLuckView();
            §_-Y2z§.x = -19;
            §_-Y2z§.y = this.hero.heroView.topOffset - 5;
            filter = new GlowFilter(255,1,10,10,8,1,true);
            §_-Y2z§.filters = [filter];
         }
         this.visible = false;
         this.hero.addChild(§_-Y2z§);
      }
      
      override public function dispose() : void
      {
         this.hero.removeChild(§_-Y2z§);
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.activated)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(this.position);
         var _loc3_:Number = Math.min(§_-D23§,_loc2_.Length()) / §_-D23§;
         filter.color = 255 * _loc3_ + int((1 - _loc3_) * 255) * 256 * 256;
         §_-Y2z§.filters = [filter];
         §_-Y2z§.visible = !this.hero.isDead && !this.hero.inHollow;
         if(_loc2_.Length() >= §_-A2L§)
         {
            return;
         }
         this.visible = true;
         this.activated = true;
         §_-Y2z§.visible = false;
         this.§_-O10§ = new QuestItemExplode();
         this.§_-O10§.addEventListener(Event.CHANGE,this.§_-w1T§);
         addChild(this.§_-O10§);
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

