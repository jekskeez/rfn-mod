package §_-D1c§
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   
   public class §_-c1n§ extends §_-11t§
   {
      
      private var §_-uu§:TextField = new TextField();
      
      private var §_-H2i§:TextField = new TextField();
      
      private var §_-w26§:String;
      
      private var §_-yZ§:Number;
      
      private var §_-MX§:Number;
      
      private var §_-g2T§:Number;
      
      public function §_-c1n§(param1:String, param2:String, param3:Number = 1, param4:Number = -1000000000, param5:Number = 1.7976931348623157e+308)
      {
         super();
         this.§_-yZ§ = param3;
         this.§_-w26§ = param2;
         this.§_-H2i§.text = param1;
         §_-Y2P§(this.§_-H2i§);
         this.§_-H2i§.autoSize = TextFieldAutoSize.LEFT;
         this.§_-H2i§.restrict = "-[0-9].";
         this.§_-H2i§.maxChars = 7;
         this.§_-H2i§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-R1E§);
         this.§_-H2i§.addEventListener(FocusEvent.FOCUS_IN,this.§_-G1m§);
         addChild(this.§_-H2i§);
         this.§_-uu§.x = this.§_-H2i§.textWidth + 10;
         this.§_-uu§.width = 100;
         this.§_-uu§.height = 20;
         this.§_-uu§.background = true;
         this.§_-uu§.type = TextFieldType.INPUT;
         §_-Y2P§(this.§_-uu§,§_-L2F§);
         this.§_-uu§.restrict = "-[0-9].";
         this.§_-uu§.maxChars = 7;
         this.§_-uu§.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         this.§_-uu§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-R1E§);
         this.§_-uu§.addEventListener(FocusEvent.FOCUS_IN,this.§_-G1m§);
         addChild(this.§_-uu§);
         this.§_-MX§ = param4;
         this.§_-g2T§ = param5;
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
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         this.set();
      }
      
      private function get() : void
      {
         this.§_-uu§.text = String(this.inspectObject[this.§_-w26§] * this.§_-yZ§);
      }
      
      private function set() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = Number(this.§_-uu§.text) / this.§_-yZ§;
         if(_loc1_ < this.§_-MX§)
         {
            _loc2_ = this.§_-MX§;
         }
         else if(_loc1_ > this.§_-g2T§)
         {
            _loc2_ = this.§_-g2T§;
         }
         else
         {
            _loc2_ = _loc1_;
         }
         this.inspectObject[this.§_-w26§] = _loc2_;
         dispatch();
      }
   }
}

