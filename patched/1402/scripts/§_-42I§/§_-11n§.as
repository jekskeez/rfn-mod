package §_-42I§
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   
   public class §_-11n§ extends §_-w1Y§
   {
      
      private var §_-31f§:TextField = new TextField();
      
      private var §_-e1G§:TextField = new TextField();
      
      private var §_-MF§:String;
      
      private var §_-61u§:Number;
      
      private var §_-dJ§:Number;
      
      private var §_-Ht§:Number;
      
      public function §_-11n§(param1:String, param2:String, param3:Number = 1, param4:Number = -1000000000, param5:Number = 1.7976931348623157e+308)
      {
         super();
         this.§_-61u§ = param3;
         this.§_-MF§ = param2;
         this.§_-e1G§.text = param1;
         §_-G1V§(this.§_-e1G§);
         this.§_-e1G§.autoSize = TextFieldAutoSize.LEFT;
         this.§_-e1G§.restrict = "-[0-9].";
         this.§_-e1G§.maxChars = 7;
         this.§_-e1G§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-Oa§);
         this.§_-e1G§.addEventListener(FocusEvent.FOCUS_IN,this.§_-B2A§);
         addChild(this.§_-e1G§);
         this.§_-31f§.x = this.§_-e1G§.textWidth + 10;
         this.§_-31f§.width = 100;
         this.§_-31f§.height = 20;
         this.§_-31f§.background = true;
         this.§_-31f§.type = TextFieldType.INPUT;
         §_-G1V§(this.§_-31f§,§_-yI§);
         this.§_-31f§.restrict = "-[0-9].";
         this.§_-31f§.maxChars = 7;
         this.§_-31f§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         this.§_-31f§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-Oa§);
         this.§_-31f§.addEventListener(FocusEvent.FOCUS_IN,this.§_-B2A§);
         addChild(this.§_-31f§);
         this.§_-dJ§ = param4;
         this.§_-Ht§ = param5;
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
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         this.set();
      }
      
      private function get() : void
      {
         this.§_-31f§.text = String(this.inspectObject[this.§_-MF§] * this.§_-61u§);
      }
      
      private function set() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = Number(this.§_-31f§.text) / this.§_-61u§;
         if(_loc1_ < this.§_-dJ§)
         {
            _loc2_ = this.§_-dJ§;
         }
         else if(_loc1_ > this.§_-Ht§)
         {
            _loc2_ = this.§_-Ht§;
         }
         else
         {
            _loc2_ = _loc1_;
         }
         this.inspectObject[this.§_-MF§] = _loc2_;
         dispatch();
      }
   }
}

