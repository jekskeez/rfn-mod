package
{
   import protocol.§_-u1O§;
   
   public class §_-sL§
   {
      
      public static const §_-522§:int = 0;
      
      public static const §_-t25§:int = 1;
      
      public static const §_-v1J§:int = 2;
      
      public static const DATA:Array = [{
         "type":§_-u1O§.§_-A27§,
         "title":gls("Энергетический Напиток"),
         "description":gls("Прибавляет 250 энергии к имеющейся, независимо от того, сколько у тебя её сейчас.")
      },{
         "type":§_-u1O§.§_-gh§,
         "title":gls("Колдовской Отвар"),
         "description":gls("Прибавляет {0} маны к имеющейся, независимо от того, сколько у тебя ее сейчас.",400)
      },{
         "type":§_-u1O§.§_-Y2s§,
         "title":gls("Зелье Могущества"),
         "description":gls("Прибавляет 25 маны в минуту. Не может превысить максимум.")
      }];
      
      public function §_-sL§()
      {
         super();
      }
      
      public static function get §_-E1w§() : int
      {
         return DATA.length;
      }
      
      public static function get items() : Array
      {
         return [§_-522§,§_-t25§,§_-v1J§];
      }
      
      public static function §_-3f§(param1:int) : String
      {
         return DATA[param1]["title"];
      }
      
      public static function §_-ya§(param1:int) : String
      {
         return DATA[param1]["description"];
      }
      
      public static function §_-iM§(param1:int) : int
      {
         return DATA[param1]["type"];
      }
   }
}

