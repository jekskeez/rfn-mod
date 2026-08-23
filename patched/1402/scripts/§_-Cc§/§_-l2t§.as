package §_-Cc§
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class §_-l2t§ extends §_-pp§
   {
      
      private static const §_-T26§:Number = 20;
      
      private static const §_-U29§:Number = §_-T26§ >> 1;
      
      protected var animation:MovieClip = null;
      
      protected var §_-Cs§:Rectangle = null;
      
      public function §_-l2t§(param1:Number)
      {
         super(param1);
         this.animation = new PerkKickMovie();
         this.animation.y = -60;
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         if(!this.§_-Cs§ || !this.hero)
         {
            return;
         }
         var _loc2_:Point = this.hero.getPosition();
         if(_loc2_.x > this.§_-Cs§.right)
         {
            this.hero.moveRight(false);
            this.hero.moveLeft(true);
         }
         else if(_loc2_.x < this.§_-Cs§.left)
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
            this.§_-Cs§ = new Rectangle(_loc2_.x - §_-U29§,_loc2_.y - §_-U29§,§_-T26§,§_-T26§);
            param1.moveRight(false);
            param1.moveLeft(true);
         }
         super.hero = param1;
      }
   }
}

