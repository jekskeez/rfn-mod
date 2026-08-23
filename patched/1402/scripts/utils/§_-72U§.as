package utils
{
   import flash.events.FocusEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   
   public class §_-72U§ extends TextField
   {
      
      public static const §_-32T§:int = 32;
      
      private var §_-uE§:TextFormat;
      
      private var §_-4H§:TextFormat;
      
      private var §_-f2c§:String;
      
      public function §_-72U§(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:TextFormat, param7:TextFormat = null, param8:int = 32)
      {
         super();
         this.x = param2;
         this.y = param3;
         this.width = param4;
         this.height = param5;
         this.type = TextFieldType.INPUT;
         this.border = true;
         this.borderColor = 1966080;
         this.background = true;
         this.backgroundColor = 16777215;
         this.defaultTextFormat = param6;
         this.maxChars = param8;
         §_-L2J§.embedFonts(this);
         this.§_-4H§ = param6;
         if(param7 == null)
         {
            this.§_-uE§ = param6;
         }
         else
         {
            this.§_-uE§ = param7;
         }
         this.§_-f2c§ = param1;
         this.§_-A2A§();
         addEventListener(FocusEvent.FOCUS_IN,this.§_-i17§);
         addEventListener(FocusEvent.FOCUS_OUT,this.§_-A2A§);
      }
      
      private function §_-i17§(param1:FocusEvent) : void
      {
         if(this.type != TextFieldType.INPUT)
         {
            return;
         }
         if(this.text == this.§_-f2c§)
         {
            this.text = "";
         }
         this.defaultTextFormat = this.§_-uE§;
      }
      
      private function §_-A2A§(param1:FocusEvent = null) : void
      {
         if(this.type != TextFieldType.INPUT)
         {
            return;
         }
         if(this.text == "")
         {
            this.defaultTextFormat = this.§_-4H§;
            this.text = this.§_-f2c§;
         }
      }
   }
}

