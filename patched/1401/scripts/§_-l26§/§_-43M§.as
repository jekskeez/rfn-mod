package §_-l26§
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class §_-43M§
   {
      
      public function §_-43M§()
      {
         super();
      }
      
      public static function §_-22h§(param1:TextField, param2:Sprite, param3:int, param4:int, param5:int, param6:int = 18, param7:int = 32, param8:Boolean = false) : void
      {
         param1.x = param3;
         param1.y = param4;
         param1.width = param5;
         param1.height = param6;
         param1.borderColor = 11776947;
         param1.defaultTextFormat = §_-32A§.§_-53t§;
         param1.maxChars = param7;
         param2.addChild(param1);
         if(param8)
         {
            param1.type = TextFieldType.INPUT;
            param1.border = true;
         }
      }
      
      public static function §_-71T§(param1:TextField, param2:Boolean) : void
      {
         if(param2)
         {
            param1.type = TextFieldType.INPUT;
            param1.border = true;
         }
         else
         {
            param1.type = TextFieldType.DYNAMIC;
            param1.border = false;
         }
      }
   }
}

