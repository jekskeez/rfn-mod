package §_-I10§
{
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.filters.BevelFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-ex§;
   import views.§_-13U§;
   
   public class §_-g1R§
   {
      
      public static const §_-B2F§:Number = 0.8;
      
      public static const §_-j1h§:int = 20;
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,16776311);
      
      public static const §_-m2A§:Array = [new BevelFilter(1,58,16777215,1,16763904,1,2,2),new GlowFilter(13158,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private static var time:int = 0;
      
      private static var §_-336§:Array = [];
      
      public function §_-g1R§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-92j§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function §_-72d§(param1:int) : Number
      {
         var _loc2_:int = 0;
         while(_loc2_ < ids.length)
         {
            if(§_-g2W§.§_-W2m§(§_-g2W§.§_-X2e§(ids[_loc2_])).indexOf(param1) != -1)
            {
               return §_-B2F§;
            }
            _loc2_++;
         }
         return 1;
      }
      
      public static function get ids() : Array
      {
         return §_-336§;
      }
      
      public static function get timeString() : String
      {
         return §_-ex§.§_-d2X§(time);
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         time = param1[0] - Game.§_-nE§ - int(getTimer() / 1000);
         §_-336§ = param1[1];
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.CLOSEOUT_START));
         §_-01Y§.§_-c9§(§_-A1b§);
      }
      
      private static function §_-A1b§() : void
      {
         --time;
         §_-13U§.update(time);
         if(time != 0)
         {
            return;
         }
         §_-01Y§.§_-l2K§(§_-A1b§);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.CLOSEOUT_END));
         Connection.§_-Li§(§_-h2B§.§_-3J§);
      }
   }
}

