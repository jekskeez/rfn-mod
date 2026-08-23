package §_-A2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-42B§.TweenMax;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-q1h§ extends §_-kV§
   {
      
      private static const §_-01b§:Number = -5;
      
      private var §_-Q2q§:MovieClip = null;
      
      private var distance:Number = 200;
      
      private var §_-N2W§:int = -1;
      
      public function §_-q1h§(param1:Hero, param2:int)
      {
         super(param1);
         this.§_-N2W§ = param2;
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
            this.§_-Q2q§ = new QuestItemExplode();
            this.§_-Q2q§.y = this.hero.heroView.topOffset - 5;
            this.§_-Q2q§.addEventListener(Event.CHANGE,this.§_-Hp§);
            this.hero.§_-72F§(this.§_-Q2q§,true);
            return;
         }
         if(this.distance <= 0)
         {
            return;
         }
         var _loc3_:Number = this.position.y + §_-01b§ * param1;
         this.distance += §_-01b§ * param1;
         this.position = new b2Vec2(this.position.x,_loc3_);
         if(this.distance <= 0)
         {
            TweenMax.to(this,0.5,{
               "alpha":0,
               "onComplete":this.§_-H1N§
            });
         }
      }
      
      private function §_-H1N§() : void
      {
         this.visible = false;
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
      
      public function get §_-R1U§() : int
      {
         return this.§_-N2W§;
      }
   }
}

