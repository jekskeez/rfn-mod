package
{
   import flash.net.SharedObject;
   
   public class §_-u1T§
   {
      
      private static var §_-z2R§:SharedObject = SharedObject.getLocal("SquirrelsIgnoreList","/");
      
      public function §_-u1T§()
      {
         super();
      }
      
      public static function §_-l2i§(param1:int) : void
      {
         if(§_-P1f§(param1))
         {
            return;
         }
         §_-z2R§.data[param1] = param1;
         §_-z2R§.flush();
      }
      
      public static function §_-yO§(param1:int) : void
      {
         if(!§_-P1f§(param1))
         {
            return;
         }
         delete §_-z2R§.data[param1];
      }
      
      public static function §_-P1f§(param1:int) : Boolean
      {
         return param1 in §_-z2R§.data;
      }
   }
}

