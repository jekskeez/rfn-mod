package §_-Oc§
{
   import §_-n1h§.§_-h1P§;
   
   public class §_-u16§
   {
      
      public static var §_-WL§:int = 199;
      
      public static var §_-429§:int = 200;
      
      public static var §_-V2Z§:int = 201;
      
      public static var §_-Y1D§:int = 202;
      
      public static var §_-l1p§:int = 203;
      
      public static var §_-P7§:int = 204;
      
      public static var §_-83P§:int = 205;
      
      public static var perkData:Object = {};
      
      public static var i:* = §_-u16§.init();
      
      public function §_-u16§()
      {
         super();
      }
      
      public static function init() : void
      {
         perkData[§_-WL§] = new §_-h1P§(gls("Возрождение"),gls("Автоматически возрождает тебя рядом с шаманом через 10 секунд после смерти"),HareRebornButton,§_-CE§);
         perkData[§_-429§] = new §_-h1P§(gls("Землетрясение"),gls("Устраивает землетрясение"),HareEarthquakeButton,§_-c5§);
         perkData[§_-V2Z§] = new §_-h1P§(gls("Окаменение"),gls("Превращает тебя в камень. Так ты можешь мешаться на пути других белок, толкать их и не отдавать орех"),HareStoneButton,§_-4Z§);
         perkData[§_-Y1D§] = new §_-h1P§(gls("Ускорение"),gls("Увеличивает твою скорость в 3 раза"),HareSpeed,§_-O26§);
         perkData[§_-l1p§] = new §_-h1P§(gls("Жвачка"),gls("Плюнь жвачкой и склей белок!"),HareGumButton,§_-H1Y§);
         perkData[§_-P7§] = new §_-h1P§(gls("Плевок"),gls("Залепи жвачкой весь экран!"),HareSpitButton,§_-s2P§);
      }
      
      public static function §_-92G§(param1:int) : Class
      {
         return (perkData[param1] as §_-h1P§).image;
      }
      
      public static function getName(param1:int) : String
      {
         return (perkData[param1] as §_-h1P§).name;
      }
      
      public static function §_-ya§(param1:int) : String
      {
         return (perkData[param1] as §_-h1P§).description;
      }
      
      public static function §_-vW§(param1:int) : Class
      {
         return (perkData[param1] as §_-h1P§).perk || null;
      }
   }
}

