package §_-q0§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-22D§.TweenMax;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-y2G§ extends §_-K1r§
   {
      
      private static const §_-Bs§:Number = -5;
      
      private var §_-O10§:MovieClip = null;
      
      private var distance:Number = 200;
      
      private var §_-Y1y§:int = -1;
      
      public function §_-y2G§(param1:Hero, param2:int)
      {
         super(param1);
         this.§_-Y1y§ = param2;
         this.view = new ObjectImmortalityView();
         addChild(this.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.visible || this.activated || !this.hero)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(this.position);
         if(_loc2_.Length() < 4)
         {
            this.visible = false;
            this.activated = true;
            this.§_-O10§ = new QuestItemExplode();
            this.§_-O10§.y = this.hero.heroView.topOffset - 5;
            this.§_-O10§.addEventListener(Event.CHANGE,this.§_-w1T§);
            this.hero.§_-s28§(this.§_-O10§,true);
            return;
         }
         if(this.distance <= 0)
         {
            return;
         }
         var _loc3_:Number = this.position.y + §_-Bs§ * param1;
         this.distance += §_-Bs§ * param1;
         this.position = new b2Vec2(this.position.x,_loc3_);
         if(this.distance <= 0)
         {
            TweenMax.to(this,0.5,{
               "alpha":0,
               "onComplete":this.§_-Z1K§
            });
         }
      }
      
      private function §_-Z1K§() : void
      {
         this.visible = false;
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
      
      public function get §_-C3W§() : int
      {
         return this.§_-Y1y§;
      }
   }
}

