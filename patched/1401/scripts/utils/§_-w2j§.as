package utils
{
   import flash.events.FocusEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   
   public class §_-w2j§ extends TextField
   {
      
      public static const §_-H1j§:int = 32;
      
      private var §_-52§:TextFormat;
      
      private var §_-AS§:TextFormat;
      
      private var §_-r2W§:String;
      
      public function §_-w2j§(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:TextFormat, param7:TextFormat = null, param8:int = 32)
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
         §_-vo§.embedFonts(this);
         this.§_-AS§ = param6;
         if(param7 == null)
         {
            this.§_-52§ = param6;
         }
         else
         {
            this.§_-52§ = param7;
         }
         this.§_-r2W§ = param1;
         this.§_-V1a§();
         addEventListener(FocusEvent.FOCUS_IN,this.§_-B1C§);
         addEventListener(FocusEvent.FOCUS_OUT,this.§_-V1a§);
      }
      
      private function §_-B1C§(param1:FocusEvent) : void
      {
         if(this.type != TextFieldType.INPUT)
         {
            return;
         }
         if(this.text == this.§_-r2W§)
         {
            this.text = "";
         }
         this.defaultTextFormat = this.§_-52§;
      }
      
      private function §_-V1a§(param1:FocusEvent = null) : void
      {
         if(this.type != TextFieldType.INPUT)
         {
            return;
         }
         if(this.text == "")
         {
            this.defaultTextFormat = this.§_-AS§;
            this.text = this.§_-r2W§;
         }
      }
   }
}

