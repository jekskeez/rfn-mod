package §_-wJ§
{
   import §_-X1k§.§_-42H§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import tape.§_-QN§;
   import utils.§_-y1l§;
   
   public class §_-2e§ extends §_-QN§
   {
      
      private static const §_-B1t§:int = 47;
      
      private static const §_-u1l§:int = 45;
      
      private var count:int = 0;
      
      private var §_-T2t§:§_-i5§ = null;
      
      private var icon:DisplayObject = null;
      
      private var background:DisplayObject = null;
      
      public var elementId:int = -1;
      
      public function §_-2e§()
      {
         super();
         this.background = new ElementSlotBack();
         this.background.width = this.background.height = 45;
         addChild(this.background);
         var _loc1_:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,5323544,true,null,null,null,null,"right");
         this.§_-T2t§ = new §_-i5§("0",0,28,_loc1_,45);
         this.§_-T2t§.autoSize = TextFieldAutoSize.NONE;
         this.§_-T2t§.width = 43;
         this.§_-T2t§.mouseEnabled = false;
         this.§_-T2t§.filters = [new GlowFilter(16777215,1,4,4,3)];
         addChildAt(this.§_-T2t§,1);
         this.§_-A2n§(false);
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
            _loc4_ = §_-42H§.§_-D1U§(param1);
            this.icon = new _loc4_();
            this.icon.scaleX = this.icon.scaleY = 0.56;
            this.icon.x = int((§_-B1t§ - this.icon.width) * 0.5);
            this.icon.y = int((§_-u1l§ - this.icon.height) * 0.5);
            addChildAt(this.icon,1);
         }
         this.count = param2;
         this.§_-A2n§(this.count == 0 || !param3);
      }
      
      private function §_-A2n§(param1:Boolean) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
         this.background.filters = param1 ? §_-y1l§.§_-Tk§ : [];
         if(this.icon != null)
         {
            this.icon.filters = param1 ? §_-y1l§.§_-Tk§ : [];
         }
         this.§_-T2t§.text = this.count == 0 ? "" : this.count.toString();
      }
   }
}

