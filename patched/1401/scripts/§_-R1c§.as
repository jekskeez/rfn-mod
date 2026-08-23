package
{
   import §_-I10§.NotificationManager;
   import §_-I10§.§_-Q2v§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-R1c§
   {
      
      public static var §_-D1D§:int = -1;
      
      public static var §_-12D§:int = -1;
      
      public static var quests:Vector.<§_-QP§> = new Vector.<§_-QP§>();
      
      private static var §_-I9§:int = -1;
      
      private static var §_-42S§:Boolean = false;
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function §_-R1c§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-x2g§]);
         if(§_-Q2v§.§_-U2K§)
         {
            §_-Q2v§.addEventListener(GameEvent.EDUCATION_QUEST_FINISH,§_-L1g§);
         }
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function §_-32q§(param1:int, param2:int) : void
      {
         if(quests[§_-12D§].type != param1)
         {
            return;
         }
         quests[§_-12D§].value += param2;
         Connection.§_-Li§(§_-h2B§.§_-of§,§_-12D§,param2);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.DAILY_QUEST_PROGRESS));
         §_-fO§.show(NotificationManager.DAILY_QUEST);
         if(!quests[§_-12D§].§_-Y2w§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-n1x§);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.§_-O1U§));
      }
      
      private static function §_-A1b§() : void
      {
         --§_-I9§;
         if(§_-I9§ > 0 || §_-42S§)
         {
            return;
         }
         §_-42S§ = true;
         Connection.§_-Li§(§_-h2B§.§_-93T§);
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         §_-42S§ = false;
         §_-01Y§.§_-c9§(§_-A1b§);
         var _loc2_:Boolean = §_-D1D§ != -1;
         §_-I9§ = int.MAX_VALUE;
         quests = new Vector.<§_-QP§>();
         var _loc3_:int = 0;
         while(_loc3_ < param1[0].length)
         {
            quests.push(new §_-QP§(param1[0][_loc3_],param1[0][_loc3_ + 1],param1[0][_loc3_ + 2],param1[0][_loc3_ + 3],int(_loc3_ / 4)));
            §_-I9§ = Math.min(§_-I9§,param1[0][_loc3_ + 3]);
            _loc2_ &&= param1[0][_loc3_] != §_-D1D§;
            _loc3_ += 4;
         }
         if(_loc2_ && §_-71o§.active is §_-92z§)
         {
            Connection.§_-Li§(§_-h2B§.§_-n1x§);
            §_-u1o§.dispatchEvent(new GameEvent(GameEvent.§_-61C§));
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.DAILY_QUEST_CHANGED));
         §_-fO§.show(NotificationManager.DAILY_QUEST);
      }
      
      private static function §_-L1g§(param1:GameEvent) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-93T§);
      }
   }
}

