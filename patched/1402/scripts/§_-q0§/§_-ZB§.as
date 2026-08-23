package §_-q0§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-td§.GameMapNet;
   import flash.display.MovieClip;
   import flash.events.Event;
   import utils.§_-y1l§;
   
   public class §_-ZB§ extends §_-K1r§
   {
      
      private static const §_-Ea§:int = 3;
      
      private var objects:Vector.<§_-K1r§> = new Vector.<§_-K1r§>();
      
      private var §_-O10§:MovieClip = null;
      
      public function §_-ZB§(param1:Hero)
      {
         super(param1);
         this.view = new ObjectExcavationView();
         this.view.x = -12;
         this.view.y = -16;
         this.view.filters = §_-y1l§.§_-Tk§;
         addChild(this.view);
         this.hero.addEventListener(Hero.§_-e1j§,this.§_-A1R§);
      }
      
      override public function dispose() : void
      {
         this.hero.removeEventListener(Hero.§_-e1j§,this.§_-A1R§);
         super.dispose();
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         var _loc5_:b2Vec2 = null;
         var _loc6_:b2Vec2 = null;
         var _loc7_:b2Vec2 = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         var _loc3_:§_-A3D§ = new §_-A3D§(null);
         _loc3_.position = _loc2_;
         (this.hero.game.map as GameMapNet).add(_loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < this.objects.length)
         {
            _loc3_.§_-B1E§(this.objects[_loc4_].x - _loc3_.x,this.objects[_loc4_].y - _loc3_.y);
            _loc4_++;
         }
         this.objects.push(_loc3_);
         if(this.objects.length < §_-Ea§)
         {
            return;
         }
         this.hero.removeEventListener(Hero.§_-e1j§,this.§_-A1R§);
         _loc4_ = 0;
         while(_loc4_ < this.objects.length)
         {
            _loc5_ = this.objects[_loc4_].position;
            _loc6_ = this.objects[(_loc4_ + 1) % §_-Ea§].position;
            _loc7_ = this.objects[(_loc4_ + 2) % §_-Ea§].position;
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

