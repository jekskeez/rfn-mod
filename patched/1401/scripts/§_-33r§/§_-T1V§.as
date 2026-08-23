package §_-33r§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.MovieClip;
   
   public class §_-T1V§ extends §_-AP§
   {
      
      private var power:Number = 0;
      
      protected var animation:MovieClip = null;
      
      public function §_-T1V§(param1:Number, param2:Number)
      {
         super(param1);
         this.power = param2;
         this.animation = new McTwistPerkView();
         this.animation.scaleX = this.animation.scaleY = 0.5;
         this.animation.y = -100;
         this.animation.x = -this.animation.width * 0.5;
      }
      
      override public function §_-g1A§(param1:Number) : void
      {
         super.update(param1);
         var _loc2_:b2Vec2 = this.hero.velocity;
         _loc2_.x *= this.power;
         if(_loc2_.y > 0)
         {
            _loc2_.y *= this.power;
         }
         this.hero.body.SetLinearVelocity(_loc2_);
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            if(this.hero.heroView.contains(this.animation))
            {
               this.hero.heroView.removeChild(this.animation);
            }
         }
         else
         {
            this.animation.y = param1.heroView.topOffset - 30;
            this.animation.play();
            param1.heroView.addChild(this.animation);
         }
         super.hero = param1;
      }
   }
}

