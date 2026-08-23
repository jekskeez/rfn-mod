package §_-X1g§
{
   import §_-n1h§.§_-h1P§;
   
   public class §_-s2y§
   {
      
      public static var §_-WL§:int = 205;
      
      public static var §_-z2a§:int = 206;
      
      public static var §_-83P§:int = 207;
      
      public static var perkData:Object = {};
      
      public static var i:* = §_-s2y§.init();
      
      public function §_-s2y§()
      {
         super();
      }
      
      public static function init() : void
      {
         perkData[§_-WL§] = new §_-h1P§(gls("Возрождение"),gls("Автоматически возрождает тебя рядом с шаманом через 10 секунд после смерти"),DragonRebornButton,§_-K24§);
         perkData[§_-z2a§] = new §_-h1P§(gls("Огненное дыхание"),gls("Позволяет поджигать других белок"),DragonFireButton,§_-b1C§);
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

