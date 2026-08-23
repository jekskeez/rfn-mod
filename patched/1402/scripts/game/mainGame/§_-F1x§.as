package game.mainGame
{
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import utils.§_-iZ§;
   
   public class §_-F1x§ extends §_-aS§ implements §_-F1c§, §_-l2r§
   {
      
      private var object:§_-jC§;
      
      private var controller:§_-439§;
      
      private var icon:§_-aS§;
      
      public function §_-F1x§(param1:§_-jC§, param2:§_-439§)
      {
         super();
         this.object = param1;
         this.controller = param2;
         this.icon = param1.sideIcon;
         §_-J2J§(this.icon);
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
               (this.object as Hero).§_-Jw§();
            }
            this.§_-G1M§();
         }
         var _loc3_:Rectangle = §_-aS§(this.object).boundsStarling();
         var _loc4_:Number = this.controller.§_-e2§.§_-1l§.scaleX;
         _loc3_.x = _loc3_.x * _loc4_ + this.controller.§_-e2§.x;
         _loc3_.y = _loc3_.y * _loc4_ + this.controller.§_-e2§.y;
         _loc3_.width *= _loc4_;
         _loc3_.height *= _loc4_;
         this.visible = _loc2_ && !_loc3_.intersects(this.controller.§_-128§);
         if(!this.visible)
         {
            return;
         }
         this.x = _loc3_.x + _loc3_.width * 0.5;
         this.y = _loc3_.y + _loc3_.height * 0.5;
         this.x = Math.max(Math.min(this.x,this.controller.§_-128§.width),this.controller.§_-128§.x);
         this.y = Math.max(Math.min(this.y,this.controller.§_-128§.height),this.controller.§_-128§.y);
         this.icon.rotation = §_-iZ§.getAngle(new Point(this.x,this.y),new Point(_loc3_.x + _loc3_.width * 0.5,_loc3_.y + _loc3_.height * 0.5));
      }
      
      private function §_-G1M§() : void
      {
         var _loc1_:§_-aS§ = this.object.sideIcon;
         if(this.icon == _loc1_)
         {
            return;
         }
         if(this.icon)
         {
            removeChildStarling(this.icon);
         }
         this.icon = _loc1_;
         §_-J2J§(this.icon);
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
         this.removeFromParent();
         this.object = null;
         this.controller = null;
         this.icon = null;
      }
   }
}

