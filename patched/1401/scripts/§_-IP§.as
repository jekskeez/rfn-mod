package
{
   import flash.net.SharedObject;
   
   public class §_-IP§
   {
      
      private static var §_-g1T§:SharedObject = SharedObject.getLocal("SquirrelsIgnoreList","/");
      
      public function §_-IP§()
      {
         super();
      }
      
      public static function §_-S14§(param1:int) : void
      {
         if(§_-r1m§(param1))
         {
            return;
         }
         §_-g1T§.data[param1] = param1;
         §_-g1T§.flush();
      }
      
      public static function §_-b1X§(param1:int) : void
      {
         if(!§_-r1m§(param1))
         {
            return;
         }
         delete §_-g1T§.data[param1];
      }
      
      public static function §_-r1m§(param1:int) : Boolean
      {
         return param1 in §_-g1T§.data;
      }
   }
}

