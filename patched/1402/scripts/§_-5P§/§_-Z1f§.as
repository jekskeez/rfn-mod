package §_-5P§
{
   import §_-n1h§.§_-h1P§;
   import flash.display.DisplayObject;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class §_-Z1f§
   {
      
      public static const §_-lH§:int = 1;
      
      public static const §_-z1d§:int = 2;
      
      public static const §_-m1Q§:int = 3;
      
      public static const §_-r4§:int = 4;
      
      public static const §_-h2X§:int = 5;
      
      public static const §_-ms§:int = 6;
      
      public static const §_-ek§:int = 7;
      
      public static const §_-q1E§:int = 8;
      
      public static const §_-fl§:int = 9;
      
      public static const §_-o2v§:int = 10;
      
      public static const §_-x2G§:int = 11;
      
      public static const §_-3P§:Array = [§_-lH§,§_-z1d§,§_-ms§,§_-o2v§,§_-ek§,§_-m1Q§,§_-h2X§,§_-r4§,§_-fl§,§_-q1E§];
      
      public static var perkData:Dictionary = new Dictionary(false);
      
      public static var i:* = §_-Z1f§.init();
      
      public function §_-Z1f§()
      {
         super();
      }
      
      public static function init() : void
      {
         perkData[§_-lH§] = new §_-h1P§(gls("Невидимка"),gls("Делает Белку прозрачной, в неё не попадают шары"),InvisibleButton,§_-R1n§);
         perkData[§_-z1d§] = new §_-h1P§(gls("Белка-молния"),gls("Белка бегает быстрее на 20%"),HighSpeedButton,§_-l2L§);
         perkData[§_-ms§] = new §_-h1P§(gls("Цепкие лапки"),gls("Белка не скользит ни по земле, ни по льду"),HightFrictionButton,§_-ER§);
         perkData[§_-m1Q§] = new §_-h1P§(gls("Высокий прыжок"),gls("Белка прыгает выше на 16%"),HighJumpButton,§_-V11§);
         perkData[§_-h2X§] = new §_-h1P§(gls("Белка-летяга"),gls("Если жать клавишу «вверх», белка вместо быстрого падения медленно парит"),SlowFallButton,§_-y22§);
         perkData[§_-r4§] = new §_-h1P§(gls("Двойной прыжок"),gls("Белка сможет делать двойные прыжки, второй раз отталкиваясь от воздуха"),DoubleJumpButton,§_-r2x§);
         perkData[§_-ek§] = new §_-h1P§(gls("Белка-варвар"),gls("Позволяет ходить по головам других белок"),HeadWalkerButton,§_-B31§);
         perkData[§_-q1E§] = new §_-h1P§(gls("Реинкарнация"),gls("Воскрешает Белку рядом с шаманом"),ReincarnationButton,§_-A1n§);
         perkData[§_-fl§] = new §_-h1P§(gls("Телепортация"),gls("Мгновенное перемещение к шаману"),TeleportButton,§_-F2D§);
         perkData[§_-o2v§] = new §_-h1P§(gls("Малыш"),gls("Уменьшение размера белки"),SmallSizeButton,§_-7z§);
      }
      
      public static function §_-51T§(param1:int) : DisplayObject
      {
         return new (perkData[param1] as §_-h1P§).image();
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
         if(param1 in perkData)
         {
            return (perkData[param1] as §_-h1P§).perk;
         }
         return null;
      }
      
      public static function §_-n4§(param1:*) : Object
      {
         var _loc2_:* = undefined;
         for(_loc2_ in perkData)
         {
            if(getQualifiedClassName(_loc2_) == getQualifiedClassName(param1))
            {
               return perkData[_loc2_];
            }
         }
         return null;
      }
   }
}

