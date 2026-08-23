package §_-U19§
{
   public class §_-F2Y§
   {
      
      public static const MAX_LEVEL:int = 60;
      
      private static const DATA:Array = [{"size":50},{"size":52},{"size":54},{"size":56},{"size":58},{"size":60},{"size":62},{"size":64},{"size":66},{"size":68},{"size":70},{"size":72},{"size":74},{"size":76},{"size":78},{"size":80},{"size":82},{"size":84},{"size":86},{"size":88},{"size":90},{"size":92},{"size":94},{"size":96},{"size":98},{"size":100},{"size":102},{"size":104},{"size":106},{"size":108},{"size":110},{"size":112},{"size":114},{"size":116},{"size":118},{"size":120},{"size":122},{"size":124},{"size":126},{"size":128},{"size":130},{"size":132},{"size":134},{"size":136},{"size":138},{"size":140},{"size":142},{"size":144},{"size":146},{"size":148},{"size":150},{"size":152},{"size":154},{"size":156},{"size":158},{"size":160},{"size":162},{"size":164},{"size":166},{"size":168}];
      
      public function §_-F2Y§()
      {
         super();
      }
      
      public static function §_-UZ§(param1:int) : int
      {
         if(param1 < 1)
         {
            return 0;
         }
         return DATA[param1 - 1]["size"];
      }
      
      public static function §_-L2C§(param1:int) : int
      {
         if(param1 < 1)
         {
            return 0;
         }
         return DATA[param1 - 1]["size"] * 15 * 2.5;
      }
   }
}

