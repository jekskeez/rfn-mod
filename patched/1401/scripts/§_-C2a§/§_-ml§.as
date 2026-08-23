package §_-C2a§
{
   import §_-S2§.§_-o1x§;
   
   public class §_-ml§
   {
      
      public static var §_-Jq§:int = 205;
      
      public static var §_-u1U§:int = 206;
      
      public static var §_-I1l§:int = 207;
      
      public static var perkData:Object = {};
      
      public static var i:* = §_-ml§.init();
      
      public function §_-ml§()
      {
         super();
      }
      
      public static function init() : void
      {
         perkData[§_-Jq§] = new §_-o1x§(gls("Возрождение"),gls("Автоматически возрождает тебя рядом с шаманом через 10 секунд после смерти"),DragonRebornButton,§_-fe§);
         perkData[§_-u1U§] = new §_-o1x§(gls("Огненное дыхание"),gls("Позволяет поджигать других белок"),DragonFireButton,§_-Iq§);
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

