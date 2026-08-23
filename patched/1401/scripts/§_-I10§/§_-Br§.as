package §_-I10§
{
   import §_-T2y§.§_-71o§;
   import §_-k1c§.§_-F2X§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-Br§
   {
      
      public static const §_-F2a§:int = 0;
      
      public static const §_-ff§:int = 1;
      
      public static const §_-71§:int = 2;
      
      public static const §_-r2U§:int = 3;
      
      public static const §_-j12§:int = 4;
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private static var §_-jy§:Boolean = false;
      
      public static var §_-K2q§:Boolean = false;
      
      public function §_-Br§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.BUY]);
         §_-e1z§.addEventListener(GameEvent.EXPIRATIONS_CHANGE,§_-l2d§);
      }
      
      private static function §_-l2d§(param1:GameEvent) : void
      {
         if(param1.data["type"] != §_-e1z§.VIP)
         {
            return;
         }
         if(§_-jy§ == §_-e1z§.§_-Lq§(§_-e1z§.VIP))
         {
            return;
         }
         §_-jy§ = §_-e1z§.§_-Lq§(§_-e1z§.VIP);
         §_-u1o§.dispatchEvent(new GameEvent(§_-jy§ ? GameEvent.VIP_START : GameEvent.VIP_END));
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.CHANGED));
         if(!§_-jy§)
         {
            §_-71o§.addCallback(§_-F2X§.show);
         }
      }
      
      public static function buy(param1:int) : Boolean
      {
         return Game.§_-K2t§(§_-h2B§.§_-4B§,§_-8S§.§_-7h§(param1),0,Game.selfId,param1);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function get §_-M1D§() : String
      {
         return §_-e1z§.§_-7v§(§_-e1z§.VIP);
      }
      
      public static function get §_-f2k§() : Boolean
      {
         return §_-e1z§.§_-Lq§(§_-e1z§.VIP);
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[0] != §_-S2I§.§_-k2l§ || param1[5] != Game.selfId)
         {
            return;
         }
         switch(param1[2])
         {
            case §_-h2B§.§_-4B§:
               if(param1[6] != §_-F2a§ || !§_-K2q§)
               {
                  break;
               }
               §_-K2q§ = false;
               Connection.§_-Li§(§_-h2B§.§_-03G§,§_-S2I§.§_-7E§);
         }
      }
   }
}

