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
   import utils.§_-L2J§;
   
   public class §_-Y20§ extends Sprite
   {
      
      private static const §_-dt§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,§_-i5§.§_-Y2H§);
      
      private static const §_-yI§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,§_-i5§.§_-Y2H§);
      
      public var label:TextField = new TextField();
      
      public var input:TextField = new TextField();
      
      private var §_-dJ§:Number;
      
      private var §_-Ht§:Number;
      
      public function §_-Y20§(param1:String, param2:Number = 0, param3:Number = 1.7976931348623157e+308)
      {
         super();
         this.§_-dJ§ = param2;
         this.§_-Ht§ = param3;
         §_-G1V§(this.label);
         this.label.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.label);
         this.input.width = 100;
         this.input.height = 20;
         this.input.type = TextFieldType.INPUT;
         this.input.background = true;
         §_-G1V§(this.input,§_-yI§);
         this.input.restrict = "0-9";
         this.input.addEventListener(FocusEvent.FOCUS_OUT,this.§_-Oa§);
         this.input.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         addChild(this.input);
         this.§_-s8§ = param1;
         this.update();
      }
      
      private static function §_-G1V§(param1:TextField, param2:TextFormat = null) : void
      {
         if(param2 == null)
         {
            param2 = §_-dt§;
         }
         §_-L2J§.embedFonts(param1);
         param1.defaultTextFormat = param2;
         if(param1.length > 0)
         {
            param1.setTextFormat(param2);
         }
      }
      
      public function set §_-s8§(param1:String) : void
      {
         this.label.text = param1;
         §_-G1V§(this.label);
         this.update();
      }
      
      public function get value() : Number
      {
         return this.clamp(Number(this.input.text));
      }
      
      public function set value(param1:Number) : void
      {
         this.input.text = String(this.clamp(param1));
         §_-G1V§(this.input,§_-yI§);
      }
      
      private function clamp(param1:Number) : Number
      {
         if(param1 < this.§_-dJ§)
         {
            return this.§_-dJ§;
         }
         if(param1 > this.§_-Ht§)
         {
            return this.§_-Ht§;
         }
         return param1;
      }
      
      private function §_-Oa§(param1:Event) : void
      {
         this.value = this.value;
      }
      
      private function §_-73S§(param1:KeyboardEvent) : void
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

