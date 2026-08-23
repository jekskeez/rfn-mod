package §_-f1x§
{
   import §_-I10§.§_-vy§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-p1R§;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import utils.§_-x1Z§;
   
   public class §_-t3§ extends Sprite
   {
      
      private static const §_-rz§:int = 45;
      
      private static const §_-p1h§:int = 45;
      
      private var icon:DisplayObject = null;
      
      private var button:§_-p1R§ = null;
      
      private var §_-XW§:§_-Hb§;
      
      public var elementId:int = -2;
      
      public var level:int = -1;
      
      public function §_-t3§()
      {
         super();
         this.buttonMode = true;
         this.elementId = -1;
         this.graphics.beginFill(15784633);
         this.graphics.drawRoundRect(0,0,§_-rz§,§_-p1h§,5,5);
         this.button = new §_-p1R§(new ButtonExchangeElment(),new ButtonExhangeSticked(),false);
         addChild(this.button);
         this.mouseEnabled = false;
         this.mouseChildren = false;
      }
      
      public function set id(param1:int) : void
      {
         if(this.button)
         {
            this.button.visible = param1 != -1;
         }
         if(this.§_-XW§)
         {
            this.§_-XW§.remove();
         }
         this.sticked = false;
         if(Boolean(this.icon) && contains(this.icon))
         {
            removeChild(this.icon);
         }
         this.elementId = param1;
         this.mouseEnabled = this.available && this.elementId != -1;
         this.mouseChildren = this.mouseEnabled;
         this.filters = this.available ? [] : §_-x1Z§.§_-c2G§;
         if(param1 == -1)
         {
            return;
         }
         var _loc2_:Class = §_-vy§.§_-z2p§(this.elementId);
         this.icon = new _loc2_();
         this.icon.scaleX = this.icon.scaleY = 0.6;
         this.icon.x = int((§_-rz§ - this.icon.width) * 0.5);
         this.icon.y = int((§_-p1h§ - this.icon.height) * 0.5);
         (this.icon as DisplayObjectContainer).mouseEnabled = false;
         addChild(this.icon);
         this.§_-XW§ = new §_-Hb§(this,§_-vy§.§_-U2M§[this.elementId]["tittle"]);
      }
      
      public function set sticked(param1:Boolean) : void
      {
         if(!this.icon)
         {
            return;
         }
         if(param1)
         {
            this.button.on();
         }
         else
         {
            this.button.off();
         }
      }
      
      private function get available() : Boolean
      {
         if(this.elementId == -1 || this.level == -1)
         {
            return true;
         }
         var _loc1_:int = int(§_-vy§.§_-U2M§[this.elementId]["collection"]);
         var _loc2_:int = 0;
         while(_loc2_ < §_-vy§.§_-e2P§.length)
         {
            if((§_-vy§.§_-e2P§[_loc2_]["set"] as Array).indexOf(_loc1_) != -1)
            {
               return §_-q1p§.§_-l29§(§_-vy§.§_-e2P§[_loc2_]["location"]).level <= this.level;
            }
            _loc2_++;
         }
         return true;
      }
   }
}

