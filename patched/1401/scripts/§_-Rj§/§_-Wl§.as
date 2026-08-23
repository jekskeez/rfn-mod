package §_-Rj§
{
   public class §_-Wl§
   {
      
      private static var maps:Array = [];
      
      private static var §_-dH§:int = -1;
      
      public function §_-Wl§()
      {
         super();
      }
      
      public static function get §_-GL§() : int
      {
         if(isEmpty)
         {
            return -1;
         }
         return maps[§_-dH§];
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
      
      public static function §_-j1d§(param1:int) : void
      {
         maps.push(param1);
         maps.sort(Array.NUMERIC);
         §_-dH§ = 0;
      }
      
      public static function §_-e2Q§(param1:int) : void
      {
         maps.splice(maps.indexOf(param1),1);
      }
      
      public static function §_-Sh§() : Boolean
      {
         if(§_-dH§ + 1 == maps.length)
         {
            return false;
         }
         ++§_-dH§;
         return true;
      }
      
      public static function §_-i1R§() : Boolean
      {
         if(§_-dH§ - 1 == -1)
         {
            return false;
         }
         --§_-dH§;
         return true;
      }
      
      public static function clear() : void
      {
         maps = [];
         §_-dH§ = -1;
      }
   }
}

