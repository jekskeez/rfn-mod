package §_-r16§
{
   import §_-I10§.§_-k1C§;
   import §_-I10§.§_-vy§;
   import §_-e1G§.§_-034§;
   import §_-e1G§.§_-Hb§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import tape.§_-K2k§;
   import utils.§_-Y25§;
   import utils.§_-x1Z§;
   
   public class §_-x2q§ extends §_-K2k§
   {
      
      public static const §_-rz§:int = 45;
      
      public static const §_-p1h§:int = 45;
      
      private var §_-XW§:§_-Hb§ = null;
      
      private var §_-f1A§:int;
      
      private var §_-D0§:§_-Y25§ = null;
      
      private var §_-51D§:§_-22V§ = null;
      
      protected var icon:DisplayObject = null;
      
      protected var background:MovieClip = null;
      
      public var elementId:int;
      
      public function §_-x2q§(param1:int, param2:int = 1)
      {
         super();
         this.elementId = param1;
         this.§_-f1A§ = param2;
         this.init();
         this.§_-XW§ = new §_-034§(this,§_-vy§.§_-N§,param1);
         this.§_-A3V§(this.§_-f1A§);
         this.§_-Dh§();
      }
      
      public function §_-L1x§() : void
      {
         §_-k1C§.§_-o0§(§_-vy§.§_-N§,this.elementId,this.§_-f1A§);
      }
      
      public function get §_-93Y§() : §_-Y25§
      {
         return this.§_-D0§;
      }
      
      public function set §_-93Y§(param1:§_-Y25§) : void
      {
         if(this.§_-D0§ == param1)
         {
            return;
         }
         if(this.§_-D0§ != null)
         {
            this.§_-D0§.removeEventListener(Event.CHANGE,this.§_-Dh§);
         }
         this.§_-D0§ = param1;
         this.§_-D0§.addEventListener(Event.CHANGE,this.§_-Dh§);
         this.§_-Dh§();
      }
      
      public function get §_-2B§() : Boolean
      {
         if(this.§_-93Y§ == null)
         {
            return false;
         }
         return this.§_-93Y§.count >= this.§_-f1A§;
      }
      
      protected function init() : void
      {
         this.graphics.beginFill(15784633);
         this.graphics.drawRoundRect(0,0,§_-rz§,§_-p1h§,5,5);
         this.background = new ElementSlotBack();
         this.background.width = §_-rz§;
         this.background.height = §_-p1h§;
         addChild(this.background);
         var _loc1_:Class = §_-vy§.§_-R2S§(this.elementId);
         this.icon = new _loc1_();
         this.icon.scaleX = this.icon.scaleY = 0.5;
         this.icon.x += int((this.background.width - this.icon.width) * 0.5);
         this.icon.y += int((this.background.height - this.icon.height) * 0.5);
         addChild(this.icon);
         var _loc2_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,5323544,true);
         this.§_-51D§ = new §_-22V§("0",0,25,_loc2_);
         this.§_-51D§.width = 41;
         this.§_-51D§.autoSize = TextFieldAutoSize.RIGHT;
         this.§_-51D§.mouseEnabled = false;
         this.§_-51D§.filters = [new GlowFilter(16777215,1,4,4,3)];
         addChild(this.§_-51D§);
      }
      
      private function §_-Dh§(param1:Event = null) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
         this.background.filters = this.§_-93Y§ == null || !this.§_-2B§ ? §_-x1Z§.§_-c2G§ : [];
         this.icon.filters = this.§_-93Y§ == null || !this.§_-2B§ ? §_-x1Z§.§_-c2G§ : [];
      }
      
      private function §_-A3V§(param1:int) : void
      {
         this.§_-51D§.text = param1.toString();
      }
   }
}

