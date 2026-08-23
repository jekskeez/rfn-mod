package utils
{
   import com.api.Player;
   import flash.text.TextField;
   
   public class §_-S1m§
   {
      
      public function §_-S1m§()
      {
         super();
      }
      
      public static function §_-hB§(param1:TextField, param2:Player, param3:int, param4:Boolean = false, param5:Boolean = true, param6:Boolean = false, param7:Boolean = false) : void
      {
         var _loc8_:String = param2.name;
         if(param7)
         {
            _loc8_ += " [" + param2.level + "]";
         }
         if(§_-33I§.§_-V1O§(param2.rights,§_-33I§.§_-42W§))
         {
            _loc8_ += " [A]";
         }
         else if(§_-33I§.§_-V1O§(param2.rights,§_-33I§.§_-AJ§))
         {
            _loc8_ += " [M]";
         }
         do
         {
            if(!param4)
            {
               param1.text = _loc8_;
            }
            else if(param5)
            {
               param1.htmlText = "<body><a class=\'name\' href=\'event:" + param2.id + "\'>" + _loc8_ + "</a></body>";
            }
            else
            {
               param1.htmlText = "<body><a class=\'name\'>" + _loc8_ + "</a></body>";
            }
            _loc8_ = _loc8_.substr(0,_loc8_.length - 1);
         }
         while(param1.textWidth > param3);
      }
      
      public static function §_-o15§(param1:String) : String
      {
         param1 = StringUtil.stripHTML(param1);
         param1 = param1.replace(/[^a-z^A-Z^0-9^а-я^А-Я^ё^Ё^ ^[^]]/g,"");
         return param1.substr(0,§_-Zy§.§_-u2H§);
      }
   }
}

