package §_-t1l§
{
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-EX§
   {
      
      public static const COMPLETE:int = 0;
      
      public static const §_-m19§:int = 1;
      
      public static const START:int = 0;
      
      public static const §_-Tw§:int = 1;
      
      private static var §_-93Y§:uint = 0;
      
      public function §_-EX§()
      {
         super();
      }
      
      public static function next() : void
      {
         §_-93Y§ += §_-93Y§ == START ? 2 : 1;
         §_-p2u§(COMPLETE);
      }
      
      public static function dead() : void
      {
         §_-p2u§(§_-m19§);
      }
      
      public static function start() : void
      {
         §_-93Y§ = START;
         §_-p2u§(COMPLETE);
      }
      
      public static function finish() : void
      {
         §_-93Y§ = §_-Tw§;
         §_-p2u§(COMPLETE);
      }
      
      private static function §_-p2u§(param1:int = 0) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-21E§,(§_-93Y§ << 8) + param1);
      }
   }
}

