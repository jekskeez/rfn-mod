package game.mainGame
{
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import utils.§_-Z1S§;
   
   public class §_-S2h§ extends §_-h2I§ implements §_-Tm§, §_-C2x§
   {
      
      private var object:§_-jP§;
      
      private var controller:§_-j2x§;
      
      private var icon:§_-h2I§;
      
      public function §_-S2h§(param1:§_-jP§, param2:§_-j2x§)
      {
         super();
         this.object = param1;
         this.controller = param2;
         this.icon = param1.sideIcon;
         §_-83v§(this.icon);
         this.update();
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.object)
         {
            return;
         }
         var _loc2_:Boolean = this.object.showIcon;
         if(!_loc2_ && !this.visible)
         {
            return;
         }
         if(_loc2_)
         {
            if(this.object is Hero)
            {
               (this.object as Hero).§_-N2u§();
            }
            this.§_-XJ§();
         }
         var _loc3_:Rectangle = §_-h2I§(this.object).boundsStarling();
         var _loc4_:Number = this.controller.§_-O1E§.§_-kz§.scaleX;
         _loc3_.x = _loc3_.x * _loc4_ + this.controller.§_-O1E§.x;
         _loc3_.y = _loc3_.y * _loc4_ + this.controller.§_-O1E§.y;
         _loc3_.width *= _loc4_;
         _loc3_.height *= _loc4_;
         this.visible = _loc2_ && !_loc3_.intersects(this.controller.§_-z2R§);
         if(!this.visible)
         {
            return;
         }
         this.x = _loc3_.x + _loc3_.width * 0.5;
         this.y = _loc3_.y + _loc3_.height * 0.5;
         this.x = Math.max(Math.min(this.x,this.controller.§_-z2R§.width),this.controller.§_-z2R§.x);
         this.y = Math.max(Math.min(this.y,this.controller.§_-z2R§.height),this.controller.§_-z2R§.y);
         this.icon.rotation = §_-Z1S§.getAngle(new Point(this.x,this.y),new Point(_loc3_.x + _loc3_.width * 0.5,_loc3_.y + _loc3_.height * 0.5));
      }
      
      private function §_-XJ§() : void
      {
         var _loc1_:§_-h2I§ = this.object.sideIcon;
         if(this.icon == _loc1_)
         {
            return;
         }
         if(this.icon)
         {
            removeChildStarling(this.icon);
         }
         this.icon = _loc1_;
         §_-83v§(this.icon);
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
         }
         this.removeFromParent();
         this.object = null;
         this.controller = null;
         this.icon = null;
      }
   }
}

