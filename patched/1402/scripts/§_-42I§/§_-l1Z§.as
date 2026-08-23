package §_-42I§
{
   import §_-B1G§.§_-mD§;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class §_-l1Z§ extends §_-w1Y§
   {
      
      private static const §_-92s§:int = 22;
      
      private var §_-e1G§:TextField = new TextField();
      
      private var §_-MF§:String;
      
      private var §_-5r§:§_-mD§ = new §_-mD§();
      
      public function §_-l1Z§(param1:String, param2:String)
      {
         super();
         this.§_-MF§ = param2;
         this.§_-e1G§.text = param1;
         §_-G1V§(this.§_-e1G§);
         this.§_-e1G§.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.§_-e1G§);
         this.§_-5r§.x = this.§_-e1G§.textWidth + 10;
         this.§_-5r§.addEventListener(Event.CHANGE,this.§_-w1T§,false,0,true);
         addChild(this.§_-5r§);
      }
      
      override public function get widgetHeight() : Number
      {
         return Math.max(this.§_-e1G§.textHeight,§_-92s§);
      }
      
      override public function set inspectObject(param1:*) : void
      {
         super.inspectObject = param1;
         this.§_-5r§.§_-u2l§ = this.inspectObject[this.§_-MF§];
      }
      
      override public function dispose() : void
      {
         this.§_-5r§.removeEventListener(Event.CHANGE,this.§_-w1T§);
         this.§_-5r§.dispose();
      }
      
      private function §_-w1T§(param1:Event) : void
      {
         this.inspectObject[this.§_-MF§] = this.§_-5r§.§_-u2l§;
         dispatch();
      }
   }
}

