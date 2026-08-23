package game
{
   import §_-TK§.§_-aS§;
   import flash.geom.Point;
   
   public class §_-Z2I§ extends §_-aS§
   {
      
      public static const §_-A3A§:int = 0;
      
      public static const §_-d2s§:int = 1;
      
      private var view:§_-aS§ = null;
      
      private var direction:int;
      
      private var hero:Hero = null;
      
      private var §_-Uv§:int = 0;
      
      private var §_-JB§:Point = null;
      
      private var offset:Point = null;
      
      private var onComplete:Function = null;
      
      public function §_-Z2I§(param1:§_-aS§)
      {
         super();
         this.view = param1;
         this.view.cacheAsBitmap = true;
         this.view.x = -int(param1.width * 0.5);
         this.view.y = -int(param1.height * 0.5);
         §_-J2J§(this.view);
      }
      
      public function show(param1:int, param2:Hero, param3:int, param4:Point, param5:Point, param6:Function) : void
      {
         this.direction = param1;
         this.hero = param2;
         this.§_-Uv§ = param3;
         this.offset = param5;
         this.onComplete = param6;
         if(param1 == §_-A3A§)
         {
            this.x = param4.x;
            this.y = param4.y;
            this.view.scaleX = this.view.scaleY = this.hero.scale;
            this.view.x = -int(this.view.width * 0.5);
            this.view.y = -int(this.view.height * 0.5);
            this.§_-JB§ = new Point(this.hero.x + param5.x,this.hero.y + param5.y);
         }
         else
         {
            this.x = param2.x + param5.x;
            this.y = param2.y + param5.y;
            this.§_-JB§ = param4;
         }
         this.hero.game.§_-W1Q§.addChild(this);
         §_-p1V§.§_-A3z§(this.§_-A1X§);
      }
      
      public function remove() : void
      {
         §_-p1V§.§_-DO§(this.§_-A1X§);
         this.hero = null;
         this.removeFromParent(false);
      }
      
      public function dispose() : void
      {
         this.remove();
         this.removeFromParent(true);
         this.offset = null;
         this.§_-JB§ = null;
         this.view = null;
         this.onComplete = null;
      }
      
      private function §_-A1X§() : void
      {
         var _loc1_:Point = this.§_-JB§.subtract(new Point(this.x,this.y));
         _loc1_.normalize(_loc1_.length / this.§_-Uv§--);
         if(this.direction == §_-A3A§)
         {
            this.x += _loc1_.x;
            this.y += _loc1_.y;
            this.§_-JB§ = new Point(this.hero.x + this.offset.x,this.hero.y + this.offset.y);
         }
         else
         {
            this.x += _loc1_.x;
            this.y += _loc1_.y;
         }
         if(this.§_-Uv§ > 0)
         {
            return;
         }
         if(this.onComplete != null)
         {
            this.onComplete();
         }
         §_-p1V§.§_-DO§(this.§_-A1X§);
      }
   }
}

