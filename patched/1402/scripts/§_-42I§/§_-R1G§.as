package §_-42I§
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   
   public class §_-R1G§ extends §_-w1Y§
   {
      
      private var textField:TextField = new TextField();
      
      private var §_-e1G§:TextField = new TextField();
      
      private var §_-MF§:String;
      
      public function §_-R1G§(param1:String, param2:String, param3:Number, param4:Number, param5:Boolean = true)
      {
         super();
         this.§_-MF§ = param2;
         this.§_-e1G§.text = param1;
         §_-G1V§(this.§_-e1G§);
         this.§_-e1G§.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.§_-e1G§);
         this.textField.y = this.§_-e1G§.textHeight + 10;
         this.textField.width = param3;
         this.textField.height = param4;
         this.textField.background = true;
         this.textField.multiline = param5;
         this.textField.wordWrap = true;
         this.textField.type = TextFieldType.INPUT;
         §_-G1V§(this.textField,§_-yI§);
         this.textField.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§,true,10,true);
         this.textField.addEventListener(FocusEvent.FOCUS_OUT,this.§_-Oa§);
         this.textField.addEventListener(FocusEvent.FOCUS_IN,this.§_-B2A§);
         addChild(this.textField);
      }
      
      private function §_-B2A§(param1:FocusEvent) : void
      {
         this.get();
      }
      
      private function §_-Oa§(param1:Event) : void
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
      
      private function §_-73S§(param1:KeyboardEvent) : void
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
         this.textField.text = this.inspectObject[this.§_-MF§];
      }
      
      private function set() : void
      {
         this.inspectObject[this.§_-MF§] = this.textField.text;
         dispatch();
      }
   }
}

