package §_-X1k§
{
   import §_-bN§.§_-YP§;
   import §_-c2C§.§_-t2c§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-F1Z§
   {
      
      public static const §_-43p§:int = 0;
      
      public static const §_-C3a§:int = 1;
      
      public static const §_-j26§:int = 2;
      
      public static const §_-o1o§:int = 3;
      
      public static const §_-p2T§:int = 4;
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      private static var §_-a§:Boolean = false;
      
      public static var §_-53T§:Boolean = false;
      
      public function §_-F1Z§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.BUY]);
         §_-ku§.addEventListener(GameEvent.EXPIRATIONS_CHANGE,§_-Q7§);
      }
      
      private static function §_-Q7§(param1:GameEvent) : void
      {
         if(param1.data["type"] != §_-ku§.VIP)
         {
            return;
         }
         if(§_-a§ == §_-ku§.§_-R1C§(§_-ku§.VIP))
         {
            return;
         }
         §_-a§ = §_-ku§.§_-R1C§(§_-ku§.VIP);
         §_-jx§.dispatchEvent(new GameEvent(§_-a§ ? GameEvent.VIP_START : GameEvent.VIP_END));
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.CHANGED));
         if(!§_-a§)
         {
            §_-t2c§.addCallback(§_-YP§.show);
         }
      }
      
      public static function buy(param1:int) : Boolean
      {
         return Game.§_-u2z§(§_-u1O§.§_-u2h§,§_-93H§.§_-z1K§(param1),0,Game.selfId,param1);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function get §_-j1x§() : String
      {
         return §_-ku§.§_-g2V§(§_-ku§.VIP);
      }
      
      public static function get §_-O1u§() : Boolean
      {
         return §_-ku§.§_-R1C§(§_-ku§.VIP);
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[0] != §_-s2l§.§_-v1E§ || param1[5] != Game.selfId)
         {
            return;
         }
         switch(param1[2])
         {
            case §_-u1O§.§_-u2h§:
               if(param1[6] != §_-43p§ || !§_-53T§)
               {
                  break;
               }
               §_-53T§ = false;
               Connection.§_-e2T§(§_-u1O§.§_-N1Y§,§_-s2l§.§_-c1a§);
         }
      }
   }
}

