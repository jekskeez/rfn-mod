package
{
   import §_-X1k§.NotificationManager;
   import §_-X1k§.§_-Ac§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-kG§
   {
      
      public static var §_-E1U§:int = -1;
      
      public static var §_-Z2K§:int = -1;
      
      public static var quests:Vector.<§_-u1x§> = new Vector.<§_-u1x§>();
      
      private static var §_-L23§:int = -1;
      
      private static var §_-D27§:Boolean = false;
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function §_-kG§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-pY§]);
         if(§_-Ac§.§_-nG§)
         {
            §_-Ac§.addEventListener(GameEvent.EDUCATION_QUEST_FINISH,§_-aL§);
         }
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function §_-V24§(param1:int, param2:int) : void
      {
         if(quests[§_-Z2K§].type != param1)
         {
            return;
         }
         quests[§_-Z2K§].value += param2;
         Connection.§_-e2T§(§_-u1O§.§_-U10§,§_-Z2K§,param2);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.DAILY_QUEST_PROGRESS));
         §_-L1H§.show(NotificationManager.DAILY_QUEST);
         if(!quests[§_-Z2K§].§_-HU§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-M15§);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.§_-J7§));
      }
      
      private static function §_-62z§() : void
      {
         --§_-L23§;
         if(§_-L23§ > 0 || §_-D27§)
         {
            return;
         }
         §_-D27§ = true;
         Connection.§_-e2T§(§_-u1O§.§_-C1j§);
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         §_-D27§ = false;
         §_-p1V§.§_-63T§(§_-62z§);
         var _loc2_:Boolean = §_-E1U§ != -1;
         §_-L23§ = int.MAX_VALUE;
         quests = new Vector.<§_-u1x§>();
         var _loc3_:int = 0;
         while(_loc3_ < param1[0].length)
         {
            quests.push(new §_-u1x§(param1[0][_loc3_],param1[0][_loc3_ + 1],param1[0][_loc3_ + 2],param1[0][_loc3_ + 3],int(_loc3_ / 4)));
            §_-L23§ = Math.min(§_-L23§,param1[0][_loc3_ + 3]);
            _loc2_ &&= param1[0][_loc3_] != §_-E1U§;
            _loc3_ += 4;
         }
         if(_loc2_ && §_-t2c§.active is §_-u24§)
         {
            Connection.§_-e2T§(§_-u1O§.§_-M15§);
            §_-jx§.dispatchEvent(new GameEvent(GameEvent.§_-M2F§));
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.DAILY_QUEST_CHANGED));
         §_-L1H§.show(NotificationManager.DAILY_QUEST);
      }
      
      private static function §_-aL§(param1:GameEvent) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-C1j§);
      }
   }
}

