package game
{
   import §_-RI§.§_-h2I§;
   import flash.geom.Point;
   
   public class §_-PY§ extends §_-h2I§
   {
      
      public static const §_-I2i§:int = 0;
      
      public static const §_-9P§:int = 1;
      
      private var view:§_-h2I§ = null;
      
      private var direction:int;
      
      private var hero:Hero = null;
      
      private var §_-U1P§:int = 0;
      
      private var §_-HC§:Point = null;
      
      private var offset:Point = null;
      
      private var onComplete:Function = null;
      
      public function §_-PY§(param1:§_-h2I§)
      {
         super();
         this.view = param1;
         this.view.cacheAsBitmap = true;
         this.view.x = -int(param1.width * 0.5);
         this.view.y = -int(param1.height * 0.5);
         §_-83v§(this.view);
      }
      
      public function show(param1:int, param2:Hero, param3:int, param4:Point, param5:Point, param6:Function) : void
      {
         this.direction = param1;
         this.hero = param2;
         this.§_-U1P§ = param3;
         this.offset = param5;
         this.onComplete = param6;
         if(param1 == §_-I2i§)
         {
            this.x = param4.x;
            this.y = param4.y;
            this.view.scaleX = this.view.scaleY = this.hero.scale;
            this.view.x = -int(this.view.width * 0.5);
            this.view.y = -int(this.view.height * 0.5);
            this.§_-HC§ = new Point(this.hero.x + param5.x,this.hero.y + param5.y);
         }
         else
         {
            this.x = param2.x + param5.x;
            this.y = param2.y + param5.y;
            this.§_-HC§ = param4;
         }
         this.hero.game.§_-3O§.addChild(this);
         §_-01Y§.§_-h1R§(this.§_-L1Y§);
      }
      
      public function remove() : void
      {
         §_-01Y§.§_-t1s§(this.§_-L1Y§);
         this.hero = null;
         this.removeFromParent(false);
      }
      
      public function dispose() : void
      {
         this.remove();
         this.removeFromParent(true);
         this.offset = null;
         this.§_-HC§ = null;
         this.view = null;
         this.onComplete = null;
      }
      
      private function §_-L1Y§() : void
      {
         var _loc1_:Point = this.§_-HC§.subtract(new Point(this.x,this.y));
         _loc1_.normalize(_loc1_.length / this.§_-U1P§--);
         if(this.direction == §_-I2i§)
         {
            this.x += _loc1_.x;
            this.y += _loc1_.y;
            this.§_-HC§ = new Point(this.hero.x + this.offset.x,this.hero.y + this.offset.y);
         }
         else
         {
            this.x += _loc1_.x;
            this.y += _loc1_.y;
         }
         if(this.§_-U1P§ > 0)
         {
            return;
         }
         if(this.onComplete != null)
         {
            this.onComplete();
         }
         §_-01Y§.§_-t1s§(this.§_-L1Y§);
      }
   }
}

