package §_-D1c§
{
   import fl.controls.CheckBox;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import utils.§_-vo§;
   
   public class §_-N2T§ extends §_-11t§
   {
      
      private var §_-m2L§:CheckBox = new CheckBox();
      
      private var §_-w26§:String;
      
      public function §_-N2T§(param1:String, param2:String)
      {
         super();
         this.§_-w26§ = param2;
         §_-vo§.§_-l1V§(this.§_-m2L§,new TextFormat(§_-22V§.§_-F2z§,12,§_-22V§.§_-O2G§));
         this.§_-m2L§.label = param1;
         this.§_-m2L§.textField.autoSize = TextFieldAutoSize.LEFT;
         this.§_-m2L§.textField.height = this.§_-m2L§.textField.textHeight + 5;
         this.§_-m2L§.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         addChild(this.§_-m2L§);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
         this.inspectObject[this.§_-w26§] = this.§_-m2L§.selected;
         dispatch();
      }
      
      override public function get inspectObject() : *
      {
         return super.inspectObject;
      }
      
      override public function set inspectObject(param1:*) : void
      {
         super.inspectObject = param1;
         this.§_-m2L§.selected = Boolean(this.inspectObject[this.§_-w26§]);
      }
      
      override public function get widgetHeight() : Number
      {
         return 25;
      }
   }
}

