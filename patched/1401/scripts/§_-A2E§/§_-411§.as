package §_-A2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-A2x§.GameMapNet;
   import flash.display.MovieClip;
   import flash.events.Event;
   import utils.§_-x1Z§;
   
   public class §_-411§ extends §_-kV§
   {
      
      private static const §_-U1o§:int = 3;
      
      private var objects:Vector.<§_-kV§> = new Vector.<§_-kV§>();
      
      private var §_-Q2q§:MovieClip = null;
      
      public function §_-411§(param1:Hero)
      {
         super(param1);
         this.view = new ObjectExcavationView();
         this.view.x = -12;
         this.view.y = -16;
         this.view.filters = §_-x1Z§.§_-c2G§;
         addChild(this.view);
         this.hero.addEventListener(Hero.§_-C2K§,this.§_-jf§);
      }
      
      override public function dispose() : void
      {
         this.hero.removeEventListener(Hero.§_-C2K§,this.§_-jf§);
         super.dispose();
      }
      
      private function §_-jf§(param1:Event) : void
      {
         var _loc5_:b2Vec2 = null;
         var _loc6_:b2Vec2 = null;
         var _loc7_:b2Vec2 = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         var _loc3_:§_-2U§ = new §_-2U§(null);
         _loc3_.position = _loc2_;
         (this.hero.game.map as GameMapNet).add(_loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < this.objects.length)
         {
            _loc3_.§_-lA§(this.objects[_loc4_].x - _loc3_.x,this.objects[_loc4_].y - _loc3_.y);
            _loc4_++;
         }
         this.objects.push(_loc3_);
         if(this.objects.length < §_-U1o§)
         {
            return;
         }
         this.hero.removeEventListener(Hero.§_-C2K§,this.§_-jf§);
         _loc4_ = 0;
         while(_loc4_ < this.objects.length)
         {
            _loc5_ = this.objects[_loc4_].position;
            _loc6_ = this.objects[(_loc4_ + 1) % §_-U1o§].position;
            _loc7_ = this.objects[(_loc4_ + 2) % §_-U1o§].position;
            _loc8_ = (_loc6_.x - _loc5_.x) * (this.position.y - _loc5_.y) - (_loc6_.y - _loc5_.y) * (this.position.x - _loc5_.x);
            _loc9_ = (_loc6_.x - _loc5_.x) * (_loc7_.y - _loc5_.y) - (_loc6_.y - _loc5_.y) * (_loc7_.x - _loc5_.x);
            if(_loc8_ * _loc9_ <= 0)
            {
               return;
            }
            _loc4_++;
         }
         this.activated = true;
         this.view.filters = [];
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

