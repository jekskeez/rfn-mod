package §_-X1k§
{
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.filters.BevelFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-B1d§;
   import views.§_-P1V§;
   
   public class §_-y2L§
   {
      
      public static const §_-v1o§:Number = 0.8;
      
      public static const §_-b2n§:int = 20;
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,16776311);
      
      public static const §_-q2I§:Array = [new BevelFilter(1,58,16777215,1,16763904,1,2,2),new GlowFilter(13158,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      private static var time:int = 0;
      
      private static var §_-QF§:Array = [];
      
      public function §_-y2L§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-rV§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function §_-L8§(param1:int) : Number
      {
         var _loc2_:int = 0;
         while(_loc2_ < ids.length)
         {
            if(§_-P2x§.§_-y18§(§_-P2x§.§_-b2c§(ids[_loc2_])).indexOf(param1) != -1)
            {
               return §_-v1o§;
            }
            _loc2_++;
         }
         return 1;
      }
      
      public static function get ids() : Array
      {
         return §_-QF§;
      }
      
      public static function get timeString() : String
      {
         return §_-B1d§.§_-g2n§(time);
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         time = param1[0] - Game.§_-i24§ - int(getTimer() / 1000);
         §_-QF§ = param1[1];
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.CLOSEOUT_START));
         §_-p1V§.§_-63T§(§_-62z§);
      }
      
      private static function §_-62z§() : void
      {
         --time;
         §_-P1V§.update(time);
         if(time != 0)
         {
            return;
         }
         §_-p1V§.§_-B3x§(§_-62z§);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.CLOSEOUT_END));
         Connection.§_-e2T§(§_-u1O§.§_-L1a§);
      }
   }
}

