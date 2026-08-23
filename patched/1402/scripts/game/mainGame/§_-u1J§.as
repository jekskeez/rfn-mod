package game.mainGame
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import utils.§_-iZ§;
   
   public class §_-u1J§ extends Sprite
   {
      
      private static const §_-51G§:int = 10;
      
      private var §_-35§:Bitmap = null;
      
      private var §_-JB§:Point = null;
      
      private var speed:int = 0;
      
      private var §_-e1§:Boolean = false;
      
      public function §_-u1J§(param1:Bitmap, param2:int)
      {
         super();
         this.§_-35§ = param1;
         this.§_-35§.x = -int(this.§_-35§.width * 0.5);
         this.§_-35§.y = -int(this.§_-35§.height * 0.5);
         this.§_-35§.scaleX = 0.8;
         this.§_-35§.scaleY = 0.8;
         addChild(this.§_-35§);
         this.§_-JB§ = new Point(0,0);
         this.speed = param2;
      }
      
      public function §_-tu§(param1:Point) : void
      {
         this.§_-JB§ = param1;
         §_-p1V§.§_-A3z§(this.§_-M1g§);
      }
      
      public function setPosition(param1:int, param2:int) : void
      {
         this.x = param1;
         this.y = param2;
      }
      
      public function §_-A6§() : void
      {
         §_-p1V§.§_-DO§(this.§_-M1g§);
         §_-p1V§.§_-DO§(this.§_-e2s§);
         this.§_-e1§ = false;
         dispatchEvent(new Event("Finished"));
      }
      
      private function §_-M1g§() : void
      {
         if(this.§_-35§ == null)
         {
            this.§_-A6§();
            return;
         }
         var _loc1_:Point = this.§_-JB§.subtract(new Point(this.x,this.y));
         this.§_-e1§ = _loc1_.length < 3 * this.speed;
         if(this.§_-e1§)
         {
            §_-p1V§.§_-A3z§(this.§_-e2s§);
         }
         var _loc2_:int = _loc1_.length;
         _loc1_.normalize(this.§_-e1§ ? _loc2_ * 0.5 : this.speed);
         this.x += _loc1_.x;
         this.y += _loc1_.y;
         if(this.§_-e1§)
         {
            return;
         }
         this.rotation = §_-iZ§.getAngle(new Point(this.x,this.y),this.§_-JB§);
         §_-p1V§.§_-DO§(this.§_-e2s§);
      }
      
      private function §_-e2s§() : void
      {
         if(this.rotation == 0)
         {
            this.§_-A6§();
            return;
         }
         if(Math.abs(this.rotation) < 2 * §_-51G§)
         {
            this.rotation = 0;
            return;
         }
         this.rotation += this.rotation > 0 ? -§_-51G§ : §_-51G§;
      }
   }
}

