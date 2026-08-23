package §_-X1k§
{
   public class §_-1K§
   {
      
      private static const §_-J2T§:int = 1;
      
      private static const §_-d29§:int = 2;
      
      private static const §_-D1w§:int = 4;
      
      private static const §_-R1V§:int = 8;
      
      private static const §_-O14§:int = §_-J2T§ | §_-d29§ | §_-D1w§ | §_-R1V§;
      
      private static var §_-D2k§:int = 0;
      
      private static var §_-BV§:Boolean = false;
      
      private static var §_-I8§:Array = [];
      
      public function §_-1K§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-93H§.load();
         §_-x1h§();
         §_-Rz§();
         §_-d1r§();
         §_-l1G§();
         §_-hD§();
      }
      
      public static function get §_-a21§() : Boolean
      {
         return §_-BV§;
      }
      
      public static function set onLoaded(param1:Function) : void
      {
         if(§_-BV§)
         {
            if(param1 != null)
            {
               param1();
            }
            return;
         }
         if(param1 == null)
         {
            return;
         }
         §_-I8§.push(param1);
      }
      
      private static function §_-x1h§() : void
      {
         §_-HZ§.init();
         if(§_-HZ§.§_-Xh§)
         {
            §_-np§();
            return;
         }
         §_-HZ§.onLoaded = §_-np§;
      }
      
      private static function §_-Rz§() : void
      {
         §_-A3y§.init();
         if(§_-A3y§.§_-Xh§)
         {
            §_-iG§();
            return;
         }
         §_-A3y§.onLoaded = §_-iG§;
      }
      
      private static function §_-d1r§() : void
      {
         §_-z9§.init();
         if(§_-z9§.§_-Xh§)
         {
            §_-71L§();
            return;
         }
         §_-z9§.onLoaded = §_-71L§;
      }
      
      private static function §_-l1G§() : void
      {
         §_-5E§.init();
         if(§_-5E§.§_-Xh§)
         {
            §_-bA§();
            return;
         }
         §_-5E§.onLoaded = §_-bA§;
      }
      
      private static function §_-71L§() : void
      {
         §_-B1q§(§_-d29§);
      }
      
      private static function §_-iG§() : void
      {
         §_-B1q§(§_-D1w§);
      }
      
      private static function §_-bA§() : void
      {
         §_-B1q§(§_-R1V§);
      }
      
      private static function §_-np§() : void
      {
         §_-B1q§(§_-J2T§);
      }
      
      private static function §_-B1q§(param1:int) : void
      {
         if((§_-D2k§ & param1) != 0)
         {
            return;
         }
         §_-D2k§ |= param1;
         §_-hD§();
      }
      
      private static function §_-hD§() : void
      {
         var _loc1_:Function = null;
         if(§_-BV§)
         {
            return;
         }
         if((§_-D2k§ & §_-O14§) != §_-O14§)
         {
            return;
         }
         §_-BV§ = true;
         for each(_loc1_ in §_-I8§)
         {
            if(_loc1_ != null)
            {
               _loc1_();
            }
         }
         §_-I8§.length = 0;
      }
   }
}

