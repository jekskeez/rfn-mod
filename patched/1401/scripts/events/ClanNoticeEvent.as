package events
{
   import flash.events.Event;
   
   public class ClanNoticeEvent extends Event
   {
      
      public static const CLAN_NEWS_CHANGED:String = "ClanNoticeEvent.CLAN_NEWS_CHANGED";
      
      public static const CLAN_SUBLEADERS_CHANGED:String = "ClanNoticeEvent.CLAN_SUBLEADERS_CHANGED";
      
      public static const CLAN_TRANSACTIONS_UPDATE:String = "ClanNoticeEvent.CLAN_TRANSACTIONS_UPDATE";
      
      public function ClanNoticeEvent(param1:String)
      {
         super(param1,false,true);
      }
      
      override public function clone() : Event
      {
         return new ClanNoticeEvent(type);
      }
      
      override public function toString() : String
      {
         return formatToString("ClanNoticeEvent","type","bubbles","cancelable","eventPhase");
      }
   }
}

