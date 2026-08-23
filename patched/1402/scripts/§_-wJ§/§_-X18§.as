package §_-wJ§
{
   import §_-S1n§.§_-kr§;
   import §_-S1n§.§_-nX§;
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-WS§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import tape.§_-QN§;
   import utils.§_-Y11§;
   import utils.§_-y1l§;
   
   public class §_-X18§ extends §_-QN§
   {
      
      public static const §_-Y1L§:int = 45;
      
      public static const §_-ws§:int = 45;
      
      private var §_-oj§:§_-kr§ = null;
      
      private var §_-mh§:int;
      
      private var §_-83h§:§_-Y11§ = null;
      
      private var §_-T2t§:§_-i5§ = null;
      
      protected var icon:DisplayObject = null;
      
      protected var background:MovieClip = null;
      
      public var elementId:int;
      
      public function §_-X18§(param1:int, param2:int = 1)
      {
         super();
         this.elementId = param1;
         this.§_-mh§ = param2;
         this.init();
         this.§_-oj§ = new §_-nX§(this,§_-42H§.§_-zL§,param1);
         this.§_-yB§(this.§_-mh§);
         this.§_-A2n§();
      }
      
      public function §_-E7§() : void
      {
         §_-WS§.§_-U1X§(§_-42H§.§_-zL§,this.elementId,this.§_-mh§);
      }
      
      public function get §_-fv§() : §_-Y11§
      {
         return this.§_-83h§;
      }
      
      public function set §_-fv§(param1:§_-Y11§) : void
      {
         if(this.§_-83h§ == param1)
         {
            return;
         }
         if(this.§_-83h§ != null)
         {
            this.§_-83h§.removeEventListener(Event.CHANGE,this.§_-A2n§);
         }
         this.§_-83h§ = param1;
         this.§_-83h§.addEventListener(Event.CHANGE,this.§_-A2n§);
         this.§_-A2n§();
      }
      
      public function get §_-6p§() : Boolean
      {
         if(this.§_-fv§ == null)
         {
            return false;
         }
         return this.§_-fv§.count >= this.§_-mh§;
      }
      
      protected function init() : void
      {
         this.graphics.beginFill(15784633);
         this.graphics.drawRoundRect(0,0,§_-Y1L§,§_-ws§,5,5);
         this.background = new ElementSlotBack();
         this.background.width = §_-Y1L§;
         this.background.height = §_-ws§;
         addChild(this.background);
         var _loc1_:Class = §_-42H§.§_-uI§(this.elementId);
         this.icon = new _loc1_();
         this.icon.scaleX = this.icon.scaleY = 0.5;
         this.icon.x += int((this.background.width - this.icon.width) * 0.5);
         this.icon.y += int((this.background.height - this.icon.height) * 0.5);
         addChild(this.icon);
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,5323544,true);
         this.§_-T2t§ = new §_-i5§("0",0,25,_loc2_);
         this.§_-T2t§.width = 41;
         this.§_-T2t§.autoSize = TextFieldAutoSize.RIGHT;
         this.§_-T2t§.mouseEnabled = false;
         this.§_-T2t§.filters = [new GlowFilter(16777215,1,4,4,3)];
         addChild(this.§_-T2t§);
      }
      
      private function §_-A2n§(param1:Event = null) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
         this.background.filters = this.§_-fv§ == null || !this.§_-6p§ ? §_-y1l§.§_-Tk§ : [];
         this.icon.filters = this.§_-fv§ == null || !this.§_-6p§ ? §_-y1l§.§_-Tk§ : [];
      }
      
      private function §_-yB§(param1:int) : void
      {
         this.§_-T2t§.text = param1.toString();
      }
   }
}

