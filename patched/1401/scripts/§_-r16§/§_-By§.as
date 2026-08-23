package §_-r16§
{
   import §_-I10§.§_-vy§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import tape.§_-K2k§;
   import utils.§_-x1Z§;
   
   public class §_-By§ extends §_-K2k§
   {
      
      private static const §_-r2u§:int = 47;
      
      private static const §_-R1K§:int = 45;
      
      private var count:int = 0;
      
      private var §_-51D§:§_-22V§ = null;
      
      private var icon:DisplayObject = null;
      
      private var background:DisplayObject = null;
      
      public var elementId:int = -1;
      
      public function §_-By§()
      {
         super();
         this.background = new ElementSlotBack();
         this.background.width = this.background.height = 45;
         addChild(this.background);
         var _loc1_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,5323544,true,null,null,null,null,"right");
         this.§_-51D§ = new §_-22V§("0",0,28,_loc1_,45);
         this.§_-51D§.autoSize = TextFieldAutoSize.NONE;
         this.§_-51D§.width = 43;
         this.§_-51D§.mouseEnabled = false;
         this.§_-51D§.filters = [new GlowFilter(16777215,1,4,4,3)];
         addChildAt(this.§_-51D§,1);
         this.§_-Dh§(false);
      }
      
      public function setData(param1:int, param2:int, param3:Boolean = true) : void
      {
         var _loc4_:Class = null;
         if(this.icon != null && contains(this.icon))
         {
            removeChild(this.icon);
         }
         this.elementId = param1;
         if(this.elementId != -1)
         {
            _loc4_ = §_-vy§.§_-z2p§(param1);
            this.icon = new _loc4_();
            this.icon.scaleX = this.icon.scaleY = 0.56;
            this.icon.x = int((§_-r2u§ - this.icon.width) * 0.5);
            this.icon.y = int((§_-R1K§ - this.icon.height) * 0.5);
            addChildAt(this.icon,1);
         }
         this.count = param2;
         this.§_-Dh§(this.count == 0 || !param3);
      }
      
      private function §_-Dh§(param1:Boolean) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
         this.background.filters = param1 ? §_-x1Z§.§_-c2G§ : [];
         if(this.icon != null)
         {
            this.icon.filters = param1 ? §_-x1Z§.§_-c2G§ : [];
         }
         this.§_-51D§.text = this.count == 0 ? "" : this.count.toString();
      }
   }
}

