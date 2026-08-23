package §_-1§
{
   import §_-S2§.§_-o1x§;
   import flash.display.DisplayObject;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class §_-tY§
   {
      
      public static const §_-k2D§:int = 1;
      
      public static const §_-8T§:int = 2;
      
      public static const §_-f11§:int = 3;
      
      public static const §_-625§:int = 4;
      
      public static const §_-12s§:int = 5;
      
      public static const §_-T2J§:int = 6;
      
      public static const §_-B1z§:int = 7;
      
      public static const §_-Yi§:int = 8;
      
      public static const §_-Mr§:int = 9;
      
      public static const §_-w12§:int = 10;
      
      public static const §_-6n§:int = 11;
      
      public static const §_-x1w§:Array = [§_-k2D§,§_-8T§,§_-T2J§,§_-w12§,§_-B1z§,§_-f11§,§_-12s§,§_-625§,§_-Mr§,§_-Yi§];
      
      public static var perkData:Dictionary = new Dictionary(false);
      
      public static var i:* = §_-tY§.init();
      
      public function §_-tY§()
      {
         super();
      }
      
      public static function init() : void
      {
         perkData[§_-k2D§] = new §_-o1x§(gls("Невидимка"),gls("Делает Белку прозрачной, в неё не попадают шары"),InvisibleButton,§_-X1k§);
         perkData[§_-8T§] = new §_-o1x§(gls("Белка-молния"),gls("Белка бегает быстрее на 20%"),HighSpeedButton,§_-c2t§);
         perkData[§_-T2J§] = new §_-o1x§(gls("Цепкие лапки"),gls("Белка не скользит ни по земле, ни по льду"),HightFrictionButton,§_-03q§);
         perkData[§_-f11§] = new §_-o1x§(gls("Высокий прыжок"),gls("Белка прыгает выше на 16%"),HighJumpButton,§_-k1u§);
         perkData[§_-12s§] = new §_-o1x§(gls("Белка-летяга"),gls("Если жать клавишу «вверх», белка вместо быстрого падения медленно парит"),SlowFallButton,§_-uV§);
         perkData[§_-625§] = new §_-o1x§(gls("Двойной прыжок"),gls("Белка сможет делать двойные прыжки, второй раз отталкиваясь от воздуха"),DoubleJumpButton,§_-UP§);
         perkData[§_-B1z§] = new §_-o1x§(gls("Белка-варвар"),gls("Позволяет ходить по головам других белок"),HeadWalkerButton,§_-Y2x§);
         perkData[§_-Yi§] = new §_-o1x§(gls("Реинкарнация"),gls("Воскрешает Белку рядом с шаманом"),ReincarnationButton,§_-vk§);
         perkData[§_-Mr§] = new §_-o1x§(gls("Телепортация"),gls("Мгновенное перемещение к шаману"),TeleportButton,§_-7F§);
         perkData[§_-w12§] = new §_-o1x§(gls("Малыш"),gls("Уменьшение размера белки"),SmallSizeButton,§_-Z10§);
      }
      
      public static function §_-Gi§(param1:int) : DisplayObject
      {
         return new (perkData[param1] as §_-o1x§).image();
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
         if(param1 in perkData)
         {
            return (perkData[param1] as §_-o1x§).perk;
         }
         return null;
      }
      
      public static function §_-H1Q§(param1:*) : Object
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

