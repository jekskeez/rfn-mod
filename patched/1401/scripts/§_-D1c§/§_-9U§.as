package §_-D1c§
{
   import §_-Kr§.§_-53G§;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class §_-9U§ extends §_-11t§
   {
      
      private static const §_-L1D§:int = 22;
      
      private var §_-H2i§:TextField = new TextField();
      
      private var §_-w26§:String;
      
      private var §_-S1e§:§_-53G§ = new §_-53G§();
      
      public function §_-9U§(param1:String, param2:String)
      {
         super();
         this.§_-w26§ = param2;
         this.§_-H2i§.text = param1;
         §_-Y2P§(this.§_-H2i§);
         this.§_-H2i§.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.§_-H2i§);
         this.§_-S1e§.x = this.§_-H2i§.textWidth + 10;
         this.§_-S1e§.addEventListener(Event.CHANGE,this.§_-Hp§,false,0,true);
         addChild(this.§_-S1e§);
      }
      
      override public function get widgetHeight() : Number
      {
         return Math.max(this.§_-H2i§.textHeight,§_-L1D§);
      }
      
      override public function set inspectObject(param1:*) : void
      {
         super.inspectObject = param1;
         this.§_-S1e§.§_-P1u§ = this.inspectObject[this.§_-w26§];
      }
      
      override public function dispose() : void
      {
         this.§_-S1e§.removeEventListener(Event.CHANGE,this.§_-Hp§);
         this.§_-S1e§.dispose();
      }
      
      private function §_-Hp§(param1:Event) : void
      {
         this.inspectObject[this.§_-w26§] = this.§_-S1e§.§_-P1u§;
         dispatch();
      }
   }
}

