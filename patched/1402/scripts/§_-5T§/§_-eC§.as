package §_-5T§
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-42H§;
   import buttons.§_-c6§;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import utils.§_-y1l§;
   
   public class §_-eC§ extends Sprite
   {
      
      private static const §_-Y1L§:int = 45;
      
      private static const §_-ws§:int = 45;
      
      private var icon:DisplayObject = null;
      
      private var button:§_-c6§ = null;
      
      private var §_-oj§:§_-kr§;
      
      public var elementId:int = -2;
      
      public var level:int = -1;
      
      public function §_-eC§()
      {
         super();
         this.buttonMode = true;
         this.elementId = -1;
         this.graphics.beginFill(15784633);
         this.graphics.drawRoundRect(0,0,§_-Y1L§,§_-ws§,5,5);
         this.button = new §_-c6§(new ButtonExchangeElment(),new ButtonExhangeSticked(),false);
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
         if(this.§_-oj§)
         {
            this.§_-oj§.remove();
         }
         this.sticked = false;
         if(Boolean(this.icon) && contains(this.icon))
         {
            removeChild(this.icon);
         }
         this.elementId = param1;
         this.mouseEnabled = this.available && this.elementId != -1;
         this.mouseChildren = this.mouseEnabled;
         this.filters = this.available ? [] : §_-y1l§.§_-Tk§;
         if(param1 == -1)
         {
            return;
         }
         var _loc2_:Class = §_-42H§.§_-D1U§(this.elementId);
         this.icon = new _loc2_();
         this.icon.scaleX = this.icon.scaleY = 0.6;
         this.icon.x = int((§_-Y1L§ - this.icon.width) * 0.5);
         this.icon.y = int((§_-ws§ - this.icon.height) * 0.5);
         (this.icon as DisplayObjectContainer).mouseEnabled = false;
         addChild(this.icon);
         this.§_-oj§ = new §_-kr§(this,§_-42H§.§_-U13§[this.elementId]["tittle"]);
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
         var _loc1_:int = int(§_-42H§.§_-U13§[this.elementId]["collection"]);
         var _loc2_:int = 0;
         while(_loc2_ < §_-42H§.§_-xO§.length)
         {
            if((§_-42H§.§_-xO§[_loc2_]["set"] as Array).indexOf(_loc1_) != -1)
            {
               return §_-at§.§_-13l§(§_-42H§.§_-xO§[_loc2_]["location"]).level <= this.level;
            }
            _loc2_++;
         }
         return true;
      }
   }
}

