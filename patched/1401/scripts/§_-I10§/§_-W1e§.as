package §_-I10§
{
   import flash.text.StyleSheet;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-W1e§
   {
      
      private static const SHOWED:int = 0;
      
      private static const §_-P2N§:int = 1;
      
      public static const §_-g2r§:int = 0;
      
      public static const §_-P24§:int = 1;
      
      public static const §_-K1d§:int = 2;
      
      public static const §_-K12§:int = 3;
      
      public static const §_-l1l§:int = 4;
      
      public static const §_-RU§:int = 5;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 16px;","color: #2D1B00;","text-align: center","}",".red {","color: #CC0000;","font-weight: bold;","}"].join("\n");
      
      public static const §_-ZC§:Array = ["vip_game"];
      
      private static const §_-q24§:Array = [24 * 60 * 60];
      
      private static var offers:Object = {};
      
      private static var §_-Lc§:Object = {};
      
      private static var style:StyleSheet = new StyleSheet();
      
      public function §_-W1e§()
      {
         super();
      }
      
      public static function init() : void
      {
         style.parseCSS(§_-I2U§);
         §_-Lc§ = §_-82N§.load(§_-82N§.§_-c7§);
         §_-82N§.addCallback(§_-82N§.§_-c7§,onLoad);
      }
      
      public static function §_-q1R§(param1:int) : void
      {
         if(!(param1 in offers))
         {
            offers[param1] = 0;
         }
         ++offers[param1];
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-p2T§,(param1 << 16) + (offers[param1] << 8) + SHOWED);
      }
      
      public static function used(param1:int) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-p2T§,(param1 << 16) + (offers[param1] << 8) + §_-P2N§);
      }
      
      public static function §_-02P§(param1:int) : Boolean
      {
         var _loc2_:int = getTimer() / 1000 + Game.§_-nE§;
         var _loc3_:int = §_-ZC§[param1] in §_-Lc§ ? int(§_-Lc§[§_-ZC§[param1]]) : 0;
         if(_loc2_ < _loc3_ + §_-q24§[param1])
         {
            return false;
         }
         §_-Lc§[§_-ZC§[param1]] = _loc2_;
         §_-82N§.save(§_-82N§.§_-c7§,§_-Lc§);
         return true;
      }
      
      private static function onLoad() : void
      {
         §_-Lc§ = §_-82N§.load(§_-82N§.§_-c7§);
      }
   }
}

