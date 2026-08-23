package §_-q0§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-22D§.TweenMax;
   
   public class §_-xW§ extends §_-K1r§
   {
      
      private static const §_-T26§:Number = 30;
      
      private static const §_-Bs§:Number = 10;
      
      private var point:b2Vec2 = null;
      
      private var §_-X5§:Boolean = true;
      
      public function §_-xW§(param1:Hero)
      {
         super(param1);
         this.view = new ObjectFearView();
         this.view.x = -15;
         this.view.y = -17;
         addChild(this.view);
         this.activated = true;
         this.alpha = 0;
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         super.update(param1);
         if(!this.activated || !this.hero || this.hero.isDead || this.hero.inHollow)
         {
            return;
         }
         if(this.§_-X5§)
         {
            this.§_-X5§ = false;
            _loc2_ = this.hero.position.Copy();
            _loc3_ = Math.random() * 360;
            _loc2_.Add(new b2Vec2(Math.cos(_loc3_) * §_-T26§,Math.sin(_loc3_) * §_-T26§));
            if(this.view)
            {
               this.view.scaleX = Math.cos(_loc3_) > 0 ? 1 : -1;
            }
            this.position = _loc2_;
            TweenMax.to(this,0.5,{
               "alpha":1,
               "onComplete":this.§_-x2c§
            });
         }
         else if(this.point != null)
         {
            _loc2_ = this.point.Copy();
            _loc2_.Subtract(this.position);
            _loc4_ = Number(_loc2_.Length());
            if(_loc4_ <= §_-Bs§ * param1)
            {
               this.point = null;
               TweenMax.to(this,0.5,{
                  "alpha":0,
                  "onComplete":this.§_-H1r§
               });
            }
            _loc5_ = Math.min(§_-Bs§ * param1,_loc4_);
            _loc6_ = this.position.x + _loc5_ * _loc2_.x / _loc4_;
            _loc7_ = this.position.y + _loc5_ * _loc2_.y / _loc4_;
            this.position = new b2Vec2(_loc6_,_loc7_);
            if(this.view)
            {
               this.view.scaleX = _loc2_.x > 0 ? -1 : 1;
            }
         }
         _loc2_ = this.hero.position.Copy();
         _loc2_.Subtract(this.position);
         if(_loc2_.Length() >= 3)
         {
            return;
         }
         this.visible = false;
         this.activated = false;
      }
      
      private function §_-H1r§() : void
      {
         this.§_-X5§ = true;
      }
      
      private function §_-x2c§() : void
      {
         if(!this.hero || !this.hero.position)
         {
            return;
         }
         this.point = new b2Vec2(this.hero.position.x * 2 - this.position.x,this.hero.position.y * 2 - this.position.y);
      }
   }
}

