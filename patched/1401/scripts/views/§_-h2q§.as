package views
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import utils.§_-vo§;
   
   public class §_-h2q§ extends Sprite
   {
      
      private static const §_-xW§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,§_-22V§.§_-O2G§);
      
      private static const §_-L2F§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,§_-22V§.§_-O2G§);
      
      public var label:TextField = new TextField();
      
      public var input:TextField = new TextField();
      
      private var §_-MX§:Number;
      
      private var §_-g2T§:Number;
      
      public function §_-h2q§(param1:String, param2:Number = 0, param3:Number = 1.7976931348623157e+308)
      {
         super();
         this.§_-MX§ = param2;
         this.§_-g2T§ = param3;
         §_-Y2P§(this.label);
         this.label.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.label);
         this.input.width = 100;
         this.input.height = 20;
         this.input.type = TextFieldType.INPUT;
         this.input.background = true;
         §_-Y2P§(this.input,§_-L2F§);
         this.input.restrict = "0-9";
         this.input.addEventListener(FocusEvent.FOCUS_OUT,this.§_-R1E§);
         this.input.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         addChild(this.input);
         this.§_-v2X§ = param1;
         this.update();
      }
      
      private static function §_-Y2P§(param1:TextField, param2:TextFormat = null) : void
      {
         if(param2 == null)
         {
            param2 = §_-xW§;
         }
         §_-vo§.embedFonts(param1);
         param1.defaultTextFormat = param2;
         if(param1.length > 0)
         {
            param1.setTextFormat(param2);
         }
      }
      
      public function set §_-v2X§(param1:String) : void
      {
         this.label.text = param1;
         §_-Y2P§(this.label);
         this.update();
      }
      
      public function get value() : Number
      {
         return this.clamp(Number(this.input.text));
      }
      
      public function set value(param1:Number) : void
      {
         this.input.text = String(this.clamp(param1));
         §_-Y2P§(this.input,§_-L2F§);
      }
      
      private function clamp(param1:Number) : Number
      {
         if(param1 < this.§_-MX§)
         {
            return this.§_-MX§;
         }
         if(param1 > this.§_-g2T§)
         {
            return this.§_-g2T§;
         }
         return param1;
      }
      
      private function §_-R1E§(param1:Event) : void
      {
         this.value = this.value;
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.value = this.value;
         }
      }
      
      private function update() : void
      {
         this.input.x = this.label.textWidth + 10;
      }
   }
}

