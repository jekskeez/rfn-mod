package
{
   import protocol.§_-h2B§;
   
   public class §_-y1§
   {
      
      public static const §_-93q§:int = 0;
      
      public static const §_-m2R§:int = 1;
      
      public static const §_-8J§:int = 2;
      
      public static const DATA:Array = [{
         "type":§_-h2B§.§_-138§,
         "title":gls("Энергетический Напиток"),
         "description":gls("Прибавляет 250 энергии к имеющейся, независимо от того, сколько у тебя её сейчас.")
      },{
         "type":§_-h2B§.§_-W2d§,
         "title":gls("Колдовской Отвар"),
         "description":gls("Прибавляет {0} маны к имеющейся, независимо от того, сколько у тебя ее сейчас.",400)
      },{
         "type":§_-h2B§.§_-NV§,
         "title":gls("Зелье Могущества"),
         "description":gls("Прибавляет 25 маны в минуту. Не может превысить максимум.")
      }];
      
      public function §_-y1§()
      {
         super();
      }
      
      public static function get §_-OF§() : int
      {
         return DATA.length;
      }
      
      public static function get items() : Array
      {
         return [§_-93q§,§_-m2R§,§_-8J§];
      }
      
      public static function §_-bh§(param1:int) : String
      {
         return DATA[param1]["title"];
      }
      
      public static function §_-l7§(param1:int) : String
      {
         return DATA[param1]["description"];
      }
      
      public static function §_-eC§(param1:int) : int
      {
         return DATA[param1]["type"];
      }
   }
}

