package utils
{
   public class §_-r1G§
   {
      
      public function §_-r1G§()
      {
         super();
      }
      
      public static function image(param1:String, param2:String = "", param3:String = "", param4:String = "", param5:String = "", param6:String = "", param7:String = "") : String
      {
         return tag("img",§_-pa§("id",param2) + §_-pa§("src",param1) + §_-pa§("width",param3) + §_-pa§("height",param4) + §_-pa§("align",param5) + §_-pa§("hspace",param6) + §_-pa§("vspace",param7)) + §_-43A§("img");
      }
      
      public static function §_-fU§(param1:String, param2:String = "", param3:String = "") : String
      {
         return tag("a",§_-pa§("href",param2) + §_-pa§("target",param3)) + param1 + §_-43A§("a");
      }
      
      public static function span(param1:String = "", param2:String = "") : String
      {
         return tag("span",§_-pa§("class",param2)) + param1 + §_-43A§("span");
      }
      
      public static function tag(param1:String, param2:String = "") : String
      {
         return "<" + param1 + " " + param2 + ">";
      }
      
      public static function §_-43A§(param1:String) : String
      {
         return "</" + param1 + ">";
      }
      
      public static function §_-pa§(param1:String, param2:String) : String
      {
         if(param2 != "")
         {
            return param1 + "=\"" + param2 + "\" ";
         }
         return "";
      }
   }
}

