package §_-Cc§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.§_-r2M§;
   import §_-WJ§.DetectHeroEvent;
   import flash.display.MovieClip;
   
   public class §_-K2X§ extends §_-pp§
   {
      
      protected var animation:MovieClip = null;
      
      protected var radius:Number = 0;
      
      public function §_-K2X§(param1:Number, param2:Number)
      {
         super(param1);
         this.radius = param2;
         this.animation = new BearPerkAuraView();
         this.animation.x = -75;
         this.animation.y = -100;
      }
      
      override public function update(param1:Number) : void
      {
         var _loc2_:§_-r2M§ = null;
         var _loc3_:b2Vec2 = null;
         super.update(param1);
         if(!this.hero)
         {
            return;
         }
         for each(_loc2_ in this.hero.game.map.elements)
         {
            if(_loc2_.§_-b1J§ != null)
            {
               _loc3_ = _loc2_.position.Copy();
               _loc3_.Subtract(this.hero.position);
               if(_loc3_.Length() <= this.radius)
               {
                  _loc2_.§_-b1J§.dispatchEvent(new DetectHeroEvent(this.hero));
               }
            }
         }
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
            param1.heroView.addChild(this.animation);
         }
         super.hero = param1;
      }
   }
}

