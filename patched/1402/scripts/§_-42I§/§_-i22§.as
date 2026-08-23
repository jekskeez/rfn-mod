package §_-42I§
{
   import fl.controls.CheckBox;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import utils.§_-L2J§;
   
   public class §_-i22§ extends §_-w1Y§
   {
      
      private var §_-w2a§:CheckBox = new CheckBox();
      
      private var §_-MF§:String;
      
      public function §_-i22§(param1:String, param2:String)
      {
         super();
         this.§_-MF§ = param2;
         §_-L2J§.§_-61Q§(this.§_-w2a§,new TextFormat(§_-i5§.§_-c10§,12,§_-i5§.§_-Y2H§));
         this.§_-w2a§.label = param1;
         this.§_-w2a§.textField.autoSize = TextFieldAutoSize.LEFT;
         this.§_-w2a§.textField.height = this.§_-w2a§.textField.textHeight + 5;
         this.§_-w2a§.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         addChild(this.§_-w2a§);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
         this.inspectObject[this.§_-MF§] = this.§_-w2a§.selected;
         dispatch();
      }
      
      override public function get inspectObject() : *
      {
         return super.inspectObject;
      }
      
      override public function set inspectObject(param1:*) : void
      {
         super.inspectObject = param1;
         this.§_-w2a§.selected = Boolean(this.inspectObject[this.§_-MF§]);
      }
      
      override public function get widgetHeight() : Number
      {
         return 25;
      }
   }
}

