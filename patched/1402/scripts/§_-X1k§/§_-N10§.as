package §_-X1k§
{
   import flash.text.StyleSheet;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-N10§
   {
      
      private static const SHOWED:int = 0;
      
      private static const §_-G2H§:int = 1;
      
      public static const §_-aX§:int = 0;
      
      public static const §_-w1G§:int = 1;
      
      public static const §_-ty§:int = 2;
      
      public static const §_-FM§:int = 3;
      
      public static const §_-L2z§:int = 4;
      
      public static const §_-4N§:int = 5;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 16px;","color: #2D1B00;","text-align: center","}",".red {","color: #CC0000;","font-weight: bold;","}"].join("\n");
      
      public static const §_-X2R§:Array = ["vip_game"];
      
      private static const §_-TC§:Array = [24 * 60 * 60];
      
      private static var offers:Object = {};
      
      private static var §_-326§:Object = {};
      
      private static var style:StyleSheet = new StyleSheet();
      
      public function §_-N10§()
      {
         super();
      }
      
      public static function init() : void
      {
         style.parseCSS(§_-aD§);
         §_-326§ = §_-u2n§.load(§_-u2n§.§_-O2m§);
         §_-u2n§.addCallback(§_-u2n§.§_-O2m§,onLoad);
      }
      
      public static function §_-p2j§(param1:int) : void
      {
         if(!(param1 in offers))
         {
            offers[param1] = 0;
         }
         ++offers[param1];
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-Z2R§,(param1 << 16) + (offers[param1] << 8) + SHOWED);
      }
      
      public static function used(param1:int) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-Z2R§,(param1 << 16) + (offers[param1] << 8) + §_-G2H§);
      }
      
      public static function §_-o1G§(param1:int) : Boolean
      {
         var _loc2_:int = getTimer() / 1000 + Game.§_-i24§;
         var _loc3_:int = §_-X2R§[param1] in §_-326§ ? int(§_-326§[§_-X2R§[param1]]) : 0;
         if(_loc2_ < _loc3_ + §_-TC§[param1])
         {
            return false;
         }
         §_-326§[§_-X2R§[param1]] = _loc2_;
         §_-u2n§.save(§_-u2n§.§_-O2m§,§_-326§);
         return true;
      }
      
      private static function onLoad() : void
      {
         §_-326§ = §_-u2n§.load(§_-u2n§.§_-O2m§);
      }
   }
}

