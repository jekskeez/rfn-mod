package §_-t14§
{
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-Q2X§
   {
      
      public static const COMPLETE:int = 0;
      
      public static const §_-I1X§:int = 1;
      
      public static const START:int = 0;
      
      public static const §_-u2U§:int = 1;
      
      private static var §_-fv§:uint = 0;
      
      public function §_-Q2X§()
      {
         super();
      }
      
      public static function next() : void
      {
         §_-fv§ += §_-fv§ == START ? 2 : 1;
         §_-03W§(COMPLETE);
      }
      
      public static function dead() : void
      {
         §_-03W§(§_-I1X§);
      }
      
      public static function start() : void
      {
         §_-fv§ = START;
         §_-03W§(COMPLETE);
      }
      
      public static function finish() : void
      {
         §_-fv§ = §_-u2U§;
         §_-03W§(COMPLETE);
      }
      
      private static function §_-03W§(param1:int = 0) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-M2z§,(§_-fv§ << 8) + param1);
      }
   }
}

