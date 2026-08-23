package utils
{
   public class §_-J27§
   {
      
      private static const §_-d2W§:RegExp = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/i;
      
      public function §_-J27§()
      {
         super();
      }
      
      public static function §_-c1P§(param1:String) : Boolean
      {
         return Boolean(param1.match(§_-d2W§));
      }
   }
}

