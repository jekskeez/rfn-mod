package §_-D1c§
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   
   public class §_-E2y§ extends §_-11t§
   {
      
      private var textField:TextField = new TextField();
      
      private var §_-H2i§:TextField = new TextField();
      
      private var §_-w26§:String;
      
      public function §_-E2y§(param1:String, param2:String, param3:Number, param4:Number, param5:Boolean = true)
      {
         super();
         this.§_-w26§ = param2;
         this.§_-H2i§.text = param1;
         §_-Y2P§(this.§_-H2i§);
         this.§_-H2i§.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.§_-H2i§);
         this.textField.y = this.§_-H2i§.textHeight + 10;
         this.textField.width = param3;
         this.textField.height = param4;
         this.textField.background = true;
         this.textField.multiline = param5;
         this.textField.wordWrap = true;
         this.textField.type = TextFieldType.INPUT;
         §_-Y2P§(this.textField,§_-L2F§);
         this.textField.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§,true,10,true);
         this.textField.addEventListener(FocusEvent.FOCUS_OUT,this.§_-R1E§);
         this.textField.addEventListener(FocusEvent.FOCUS_IN,this.§_-G1m§);
         addChild(this.textField);
      }
      
      private function §_-G1m§(param1:FocusEvent) : void
      {
         this.get();
      }
      
      private function §_-R1E§(param1:Event) : void
      {
         this.set();
      }
      
      override public function get inspectObject() : *
      {
         return super.inspectObject;
      }
      
      override public function set inspectObject(param1:*) : void
      {
         super.inspectObject = param1;
         this.get();
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.stopPropagation();
         param1.preventDefault();
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         this.set();
      }
      
      private function get() : void
      {
         this.textField.text = this.inspectObject[this.§_-w26§];
      }
      
      private function set() : void
      {
         this.inspectObject[this.§_-w26§] = this.textField.text;
         dispatch();
      }
   }
}

