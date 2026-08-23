package §_-735§
{
   public class §_-t23§
   {
      
      public static function trace(param1:*, param2:Object = undefined):void
      {
         var _loc3_:String = param2 == null ? "(null)" : param2.fileName + ":" + int(param2.lineNumber);
         trace(_loc3_ + ": " + Boot.__string_rec(param1,""));
      }
      public static function clear():void
      {
         Boot.__clear_trace();
      }
      public static function setColor(param1:int):void
      {
         Boot.__set_trace_color(param1);
      }
      public function §_-t23§()
      {
      }
   }
}

import flash.Boot;

var _temp_2:* = global;
var _temp_1:* = §§newclass(§_-t23§,Object);

