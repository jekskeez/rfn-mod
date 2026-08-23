package §_-l2u§
{
   public class §_-lp§
   {
      
      private static var maps:Array = [];
      
      private static var §_-53Y§:int = -1;
      
      public function §_-lp§()
      {
         super();
      }
      
      public static function get §_-I2R§() : int
      {
         if(isEmpty)
         {
            return -1;
         }
         return maps[§_-53Y§];
      }
      
      public static function get first() : int
      {
         if(isEmpty)
         {
            return -1;
         }
         return maps[0];
      }
      
      public static function get last() : int
      {
         if(isEmpty)
         {
            return -1;
         }
         return maps[maps.length - 1];
      }
      
      public static function get isEmpty() : Boolean
      {
         return maps.length <= 0;
      }
      
      public static function §_-O1z§(param1:int) : void
      {
         maps.push(param1);
         maps.sort(Array.NUMERIC);
         §_-53Y§ = 0;
      }
      
      public static function §_-T1R§(param1:int) : void
      {
         maps.splice(maps.indexOf(param1),1);
      }
      
      public static function §_-9l§() : Boolean
      {
         if(§_-53Y§ + 1 == maps.length)
         {
            return false;
         }
         ++§_-53Y§;
         return true;
      }
      
      public static function §_-m1k§() : Boolean
      {
         if(§_-53Y§ - 1 == -1)
         {
            return false;
         }
         --§_-53Y§;
         return true;
      }
      
      public static function clear() : void
      {
         maps = [];
         §_-53Y§ = -1;
      }
   }
}

