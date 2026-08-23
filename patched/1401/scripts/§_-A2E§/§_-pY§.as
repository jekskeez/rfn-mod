package §_-A2E§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   
   public class §_-pY§ extends §_-kV§
   {
      
      private static const §_-c1F§:int = 8;
      
      private static const §_-G2r§:int = 40;
      
      private static var §_-93e§:MovieClip = null;
      
      private static var filter:GlowFilter = null;
      
      private var §_-Q2q§:MovieClip = null;
      
      public function §_-pY§(param1:Hero)
      {
         super(param1);
         this.view = new ObjectExcavationView();
         this.view.x = -12;
         this.view.y = -16;
         addChild(this.view);
         if(!§_-93e§)
         {
            §_-93e§ = new IconLuckView();
            §_-93e§.x = -19;
            §_-93e§.y = this.hero.heroView.topOffset - 5;
            filter = new GlowFilter(255,1,10,10,8,1,true);
            §_-93e§.filters = [filter];
         }
         this.visible = false;
         this.hero.addChild(§_-93e§);
      }
      
      override public function dispose() : void
      {
         this.hero.removeChild(§_-93e§);
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
         var _loc3_:Number = Math.min(§_-G2r§,_loc2_.Length()) / §_-G2r§;
         filter.color = 255 * _loc3_ + int((1 - _loc3_) * 255) * 256 * 256;
         §_-93e§.filters = [filter];
         §_-93e§.visible = !this.hero.isDead && !this.hero.inHollow;
         if(_loc2_.Length() >= §_-c1F§)
         {
            return;
         }
         this.visible = true;
         this.activated = true;
         §_-93e§.visible = false;
         this.§_-Q2q§ = new QuestItemExplode();
         this.§_-Q2q§.addEventListener(Event.CHANGE,this.§_-Hp§);
         addChild(this.§_-Q2q§);
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

