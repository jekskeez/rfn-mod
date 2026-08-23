package utils
{
   import fl.controls.CheckBox;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class §_-vo§
   {
      
      private static const §_-L2e§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,0,false);
      
      public function §_-vo§()
      {
         super();
      }
      
      public static function embedFonts(param1:TextField) : void
      {
         param1.embedFonts = true;
         param1.antiAliasType = AntiAliasType.ADVANCED;
         param1.gridFitType = GridFitType.PIXEL;
         param1.thickness = 100;
         param1.sharpness = 0;
      }
      
      public static function §_-A2B§(param1:TextField, param2:String, param3:int, param4:Boolean = false, param5:Boolean = true, param6:int = 0) : void
      {
         do
         {
            if(!param4)
            {
               param1.text = param2;
            }
            else if(param5)
            {
               param1.htmlText = "<body><a class=\'name\' href=\'event:" + param6 + "\'>" + param2 + "</a></body>";
            }
            else
            {
               param1.htmlText = "<body><a class=\'name\'>" + param2 + "</a></body>";
            }
            param2 = param2.substr(0,param2.length - 1);
         }
         while(param1.textWidth > param3);
      }
      
      public static function §_-l1V§(param1:CheckBox, param2:TextFormat = null) : void
      {
         if(param2 == null)
         {
            param2 = §_-L2e§;
         }
         param1.setStyle("textFormat",param2);
         param1.setStyle("embedFonts",true);
         param1.setStyle("antiAliasType",AntiAliasType.ADVANCED);
         param1.setStyle("gridFitType",GridFitType.PIXEL);
         param1.setStyle("thickness",100);
         param1.setStyle("sharpness",0);
      }
   }
}

