package §_-z2j§
{
   import §_-S2§.§_-o1x§;
   
   public class §_-63h§
   {
      
      public static var §_-Jq§:int = 199;
      
      public static var §_-A2g§:int = 200;
      
      public static var §_-b2h§:int = 201;
      
      public static var §_-d2i§:int = 202;
      
      public static var §_-Rx§:int = 203;
      
      public static var §_-s1Q§:int = 204;
      
      public static var §_-I1l§:int = 205;
      
      public static var perkData:Object = {};
      
      public static var i:* = §_-63h§.init();
      
      public function §_-63h§()
      {
         super();
      }
      
      public static function init() : void
      {
         perkData[§_-Jq§] = new §_-o1x§(gls("Возрождение"),gls("Автоматически возрождает тебя рядом с шаманом через 10 секунд после смерти"),HareRebornButton,§_-d2q§);
         perkData[§_-A2g§] = new §_-o1x§(gls("Землетрясение"),gls("Устраивает землетрясение"),HareEarthquakeButton,§_-52E§);
         perkData[§_-b2h§] = new §_-o1x§(gls("Окаменение"),gls("Превращает тебя в камень. Так ты можешь мешаться на пути других белок, толкать их и не отдавать орех"),HareStoneButton,§_-L1i§);
         perkData[§_-d2i§] = new §_-o1x§(gls("Ускорение"),gls("Увеличивает твою скорость в 3 раза"),HareSpeed,§_-61J§);
         perkData[§_-Rx§] = new §_-o1x§(gls("Жвачка"),gls("Плюнь жвачкой и склей белок!"),HareGumButton,§_-w13§);
         perkData[§_-s1Q§] = new §_-o1x§(gls("Плевок"),gls("Залепи жвачкой весь экран!"),HareSpitButton,§_-t1n§);
      }
      
      public static function §_-D2L§(param1:int) : Class
      {
         return (perkData[param1] as §_-o1x§).image;
      }
      
      public static function getName(param1:int) : String
      {
         return (perkData[param1] as §_-o1x§).name;
      }
      
      public static function §_-l7§(param1:int) : String
      {
         return (perkData[param1] as §_-o1x§).description;
      }
      
      public static function §_-xZ§(param1:int) : Class
      {
         return (perkData[param1] as §_-o1x§).perk || null;
      }
   }
}

