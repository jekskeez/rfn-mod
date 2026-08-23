package game.mainGame
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import utils.§_-Z1S§;
   
   public class §_-Iw§ extends Sprite
   {
      
      private static const §_-L1y§:int = 10;
      
      private var §_-n7§:Bitmap = null;
      
      private var §_-HC§:Point = null;
      
      private var speed:int = 0;
      
      private var §_-N2z§:Boolean = false;
      
      public function §_-Iw§(param1:Bitmap, param2:int)
      {
         super();
         this.§_-n7§ = param1;
         this.§_-n7§.x = -int(this.§_-n7§.width * 0.5);
         this.§_-n7§.y = -int(this.§_-n7§.height * 0.5);
         this.§_-n7§.scaleX = 0.8;
         this.§_-n7§.scaleY = 0.8;
         addChild(this.§_-n7§);
         this.§_-HC§ = new Point(0,0);
         this.speed = param2;
      }
      
      public function §_-V2V§(param1:Point) : void
      {
         this.§_-HC§ = param1;
         §_-01Y§.§_-h1R§(this.§_-02N§);
      }
      
      public function setPosition(param1:int, param2:int) : void
      {
         this.x = param1;
         this.y = param2;
      }
      
      public function §_-h2w§() : void
      {
         §_-01Y§.§_-t1s§(this.§_-02N§);
         §_-01Y§.§_-t1s§(this.§_-73D§);
         this.§_-N2z§ = false;
         dispatchEvent(new Event("Finished"));
      }
      
      private function §_-02N§() : void
      {
         if(this.§_-n7§ == null)
         {
            this.§_-h2w§();
            return;
         }
         var _loc1_:Point = this.§_-HC§.subtract(new Point(this.x,this.y));
         this.§_-N2z§ = _loc1_.length < 3 * this.speed;
         if(this.§_-N2z§)
         {
            §_-01Y§.§_-h1R§(this.§_-73D§);
         }
         var _loc2_:int = _loc1_.length;
         _loc1_.normalize(this.§_-N2z§ ? _loc2_ * 0.5 : this.speed);
         this.x += _loc1_.x;
         this.y += _loc1_.y;
         if(this.§_-N2z§)
         {
            return;
         }
         this.rotation = §_-Z1S§.getAngle(new Point(this.x,this.y),this.§_-HC§);
         §_-01Y§.§_-t1s§(this.§_-73D§);
      }
      
      private function §_-73D§() : void
      {
         if(this.rotation == 0)
         {
            this.§_-h2w§();
            return;
         }
         if(Math.abs(this.rotation) < 2 * §_-L1y§)
         {
            this.rotation = 0;
            return;
         }
         this.rotation += this.rotation > 0 ? -§_-L1y§ : §_-L1y§;
      }
   }
}

