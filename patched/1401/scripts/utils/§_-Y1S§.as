package utils
{
   import com.api.Player;
   import flash.text.TextField;
   
   public class §_-Y1S§
   {
      
      public function §_-Y1S§()
      {
         super();
      }
      
      public static function §_-uc§(param1:TextField, param2:Player, param3:int, param4:Boolean = false, param5:Boolean = true, param6:Boolean = false, param7:Boolean = false) : void
      {
         var _loc8_:String = param2.name;
         if(param7)
         {
            _loc8_ += " [" + param2.level + "]";
         }
         if(§_-c10§.§_-73j§(param2.rights,§_-c10§.§_-MR§))
         {
            _loc8_ += " [A]";
         }
         else if(§_-c10§.§_-73j§(param2.rights,§_-c10§.§_-639§))
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
      
      public static function §_-9K§(param1:String) : String
      {
         param1 = StringUtil.stripHTML(param1);
         param1 = param1.replace(/[^a-z^A-Z^0-9^а-я^А-Я^ё^Ё^ ^[^]]/g,"");
         return param1.substr(0,§_-a9§.§_-y1i§);
      }
   }
}

