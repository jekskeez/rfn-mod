package §_-I10§
{
   public class §_-539§
   {
      
      private static const §_-F2i§:int = 1;
      
      private static const §_-O29§:int = 2;
      
      private static const §_-dt§:int = 4;
      
      private static const §_-Q1f§:int = 8;
      
      private static const §_-J1K§:int = §_-F2i§ | §_-O29§ | §_-dt§ | §_-Q1f§;
      
      private static var §_-71n§:int = 0;
      
      private static var §_-b5§:Boolean = false;
      
      private static var §_-22k§:Array = [];
      
      public function §_-539§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-8S§.load();
         §_-w25§();
         §_-c1g§();
         §_-dX§();
         §_-11f§();
         §_-cf§();
      }
      
      public static function get §_-F2r§() : Boolean
      {
         return §_-b5§;
      }
      
      public static function set onLoaded(param1:Function) : void
      {
         if(§_-b5§)
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
         §_-22k§.push(param1);
      }
      
      private static function §_-w25§() : void
      {
         §_-t2V§.init();
         if(§_-t2V§.§_-v2e§)
         {
            §_-Bz§();
            return;
         }
         §_-t2V§.onLoaded = §_-Bz§;
      }
      
      private static function §_-c1g§() : void
      {
         §_-428§.init();
         if(§_-428§.§_-v2e§)
         {
            §_-32x§();
            return;
         }
         §_-428§.onLoaded = §_-32x§;
      }
      
      private static function §_-dX§() : void
      {
         §_-K1X§.init();
         if(§_-K1X§.§_-v2e§)
         {
            §_-139§();
            return;
         }
         §_-K1X§.onLoaded = §_-139§;
      }
      
      private static function §_-11f§() : void
      {
         §_-B2§.init();
         if(§_-B2§.§_-v2e§)
         {
            §_-6r§();
            return;
         }
         §_-B2§.onLoaded = §_-6r§;
      }
      
      private static function §_-139§() : void
      {
         §_-x2l§(§_-O29§);
      }
      
      private static function §_-32x§() : void
      {
         §_-x2l§(§_-dt§);
      }
      
      private static function §_-6r§() : void
      {
         §_-x2l§(§_-Q1f§);
      }
      
      private static function §_-Bz§() : void
      {
         §_-x2l§(§_-F2i§);
      }
      
      private static function §_-x2l§(param1:int) : void
      {
         if((§_-71n§ & param1) != 0)
         {
            return;
         }
         §_-71n§ |= param1;
         §_-cf§();
      }
      
      private static function §_-cf§() : void
      {
         var _loc1_:Function = null;
         if(§_-b5§)
         {
            return;
         }
         if((§_-71n§ & §_-J1K§) != §_-J1K§)
         {
            return;
         }
         §_-b5§ = true;
         for each(_loc1_ in §_-22k§)
         {
            if(_loc1_ != null)
            {
               _loc1_();
            }
         }
         §_-22k§.length = 0;
      }
   }
}

