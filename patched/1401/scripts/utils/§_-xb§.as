package utils
{
   public class §_-xb§
   {
      
      public function §_-xb§()
      {
         super();
      }
      
      public static function image(param1:String, param2:String = "", param3:String = "", param4:String = "", param5:String = "", param6:String = "", param7:String = "") : String
      {
         return tag("img",§_-t1g§("id",param2) + §_-t1g§("src",param1) + §_-t1g§("width",param3) + §_-t1g§("height",param4) + §_-t1g§("align",param5) + §_-t1g§("hspace",param6) + §_-t1g§("vspace",param7)) + §_-p1§("img");
      }
      
      public static function §_-e1r§(param1:String, param2:String = "", param3:String = "") : String
      {
         return tag("a",§_-t1g§("href",param2) + §_-t1g§("target",param3)) + param1 + §_-p1§("a");
      }
      
      public static function span(param1:String = "", param2:String = "") : String
      {
         return tag("span",§_-t1g§("class",param2)) + param1 + §_-p1§("span");
      }
      
      public static function tag(param1:String, param2:String = "") : String
      {
         return "<" + param1 + " " + param2 + ">";
      }
      
      public static function §_-p1§(param1:String) : String
      {
         return "</" + param1 + ">";
      }
      
      public static function §_-t1g§(param1:String, param2:String) : String
      {
         if(param2 != "")
         {
            return param1 + "=\"" + param2 + "\" ";
         }
         return "";
      }
   }
}

