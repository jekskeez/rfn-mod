package §_-33r§
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class §_-S26§ extends §_-AP§
   {
      
      private static const §_-O2E§:Number = 20;
      
      private static const §_-83§:Number = §_-O2E§ >> 1;
      
      protected var animation:MovieClip = null;
      
      protected var §_-L2N§:Rectangle = null;
      
      public function §_-S26§(param1:Number)
      {
         super(param1);
         this.animation = new PerkKickMovie();
         this.animation.y = -60;
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         if(!this.§_-L2N§ || !this.hero)
         {
            return;
         }
         var _loc2_:Point = this.hero.getPosition();
         if(_loc2_.x > this.§_-L2N§.right)
         {
            this.hero.moveRight(false);
            this.hero.moveLeft(true);
         }
         else if(_loc2_.x < this.§_-L2N§.left)
         {
            this.hero.moveLeft(false);
            this.hero.moveRight(true);
         }
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:Point = null;
         if(param1 == null && this.hero != null)
         {
            this.hero.isStopped = false;
            if(this.hero.heroView.contains(this.animation))
            {
               this.hero.heroView.removeChild(this.animation);
            }
            this.hero.moveLeft(false);
            this.hero.moveRight(false);
         }
         else
         {
            param1.heroView.addChild(this.animation);
            param1.isStopped = true;
            _loc2_ = param1.getPosition();
            this.§_-L2N§ = new Rectangle(_loc2_.x - §_-83§,_loc2_.y - §_-83§,§_-O2E§,§_-O2E§);
            param1.moveRight(false);
            param1.moveLeft(true);
         }
         super.hero = param1;
      }
   }
}

