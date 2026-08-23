package events
{
   import flash.events.Event;
   
   public class GameEvent extends Event
   {
      
      public static const SHOWED:String = "GameEvent.SHOWED";
      
      public static const HIDED:String = "GameEvent.HIDED";
      
      public static const CHANGED:String = "GameEvent.CHANGED";
      
      public static const BALANCE_CHANGED:String = "GameEvent.BALANCE_CHANGED";
      
      public static const ENERGY_CHANGED:String = "GameEvent.ENERGY_CHANGED";
      
      public static const MANA_CHANGED:String = "GameEvent.MANA_CHANGED";
      
      public static const MAX_POWERS_CHANGED:String = "GameEvent.MAX_POWERS_CHANGED";
      
      public static const EXPERIENCE_CHANGED:String = "GameEvent.EXPERIENCE_CHANGED";
      
      public static const LEVEL_CHANGED:String = "GameEvent.LEVEL_CHANGED";
      
      public static const SHAMAN_LEVEL_CHANGED:String = "GameEvent.SHAMAN_LEVEL_CHANGED";
      
      public static const ITEMS_CHANGED:String = "GameEvent.ITEMS_CHANGED";
      
      public static const AWARD_CHANGED:String = "GameEvent.AWARD_CHANGED";
      
      public static const AWARD_UPDATE:String = "GameEvent.AWARD_UPDATE";
      
      public static const LEAGUE_CHANGED:String = "GameEvent.LEAGUE_CHANGED";
      
      public static const RATING_CHANGED:String = "GameEvent.RATING_CHANGED";
      
      public static const DIVISION_CHANGED:String = "GameEvent.DIVISION_CHANGED";
      
      public static const SEASON_CHANGED:String = "GameEvent.SEASON_CHANGED";
      
      public static const TOP_CHANGED:String = "GameEvent.TOP_CHANGED";
      
      public static const PLACE_CHANGED:String = "GameEvent.PLACE_CHANGED";
      
      public static const ADD_FRIEND:String = "GameEvent.ADD_FRIEND";
      
      public static const REMOVE_FRIEND:String = "GameEvent.REMOVE_FRIEND";
      
      public static const FRIENDS_UPDATE:String = "GameEvent.FRIENDS_UPDATE";
      
      public static const INTERIOR_CHANGE:String = "GameEvent.INTERIOR_CHANGE";
      
      public static const PROFILE_PLAYER_CHANGED:String = "GameEvent.PROFILE_PLAYER_CHANGED";
      
      public static const VIP_START:String = "GameEvent.VIP_START";
      
      public static const VIP_END:String = "GameEvent.VIP_END";
      
      public static const CLOSEOUT_START:String = "GameEvent.CLOSEOUT_START";
      
      public static const CLOSEOUT_END:String = "GameEvent.CLOSEOUT_END";
      
      public static const PRODUCE_END:String = "GameEvent.PRODUCE_END";
      
      public static const PRODUCE_START:String = "GameEvent.PRODUCE_START";
      
      public static const PRODUCE_BONUS_END:String = "GameEvent.PRODUCE_BONUS_END";
      
      public static const PRODUCE_BONUS:String = "GameEvent.PRODUCE_BONUS";
      
      public static const PRODUCE_BONUS_START:String = "GameEvent.PRODUCE_BONUS_START";
      
      public static const PRODUCE_UPDATE:String = "GameEvent.PRODUCE_UPDATE";
      
      public static const DAILY_BONUS_UPDATE:String = "GameEvent.DAILY_BONUS_UPDATE";
      
      public static const DAILY_BONUS_GET:String = "GameEvent.DAILY_BONUS_GET";
      
      public static const COLLECTION_PICKUP:String = "GameEvent.COLLECTION_PICKUP";
      
      public static const EVENT_CHANGE:String = "GameEvent.EVENT_CHANGE";
      
      public static const GIFT_CHANGE:String = "GameEvent.GIFT_CHANGE";
      
      public static const ON_CHANGE:String = "GameEvent.ON_CHANGE";
      
      public static const DAILY_QUEST_PROGRESS:String = "GameEvent.DAILY_QUEST_PROGRESS";
      
      public static const DAILY_QUEST_CHANGED:String = "GameEvent.DAILY_QUEST_CHANGED";
      
      public static const §_-O1U§:String = "GameEvent.DAILY_QUEST_CHANGED";
      
      public static const §_-61C§:String = "GameEvent.DAILY_QUEST_CHANGED";
      
      public static const EDUCATION_QUEST_PROGRESS:String = "GameEvent.EDUCATION_QUEST_PROGRESS";
      
      public static const EDUCATION_QUEST_CHANGED:String = "GameEvent.EDUCATION_QUEST_CHANGED";
      
      public static const EDUCATION_QUEST_FINISH:String = "GameEvent.EDUCATION_QUEST_FINISH";
      
      public static const EXPIRATIONS_CHANGE:String = "GameEvent.EXPIRATIONS_CHANGE";
      
      public static const BUNDLE_UPDATE:String = "GameEvent.BUNDLE_UPDATE";
      
      public static const BUNDLE_REFILL:String = "GameEvent.BUNDLE_REFILL";
      
      public static const CLOTHES_STORAGE_CHANGE_MAGIC:String = "GameEvent.CLOTHES_STORAGE_CHANGE_MAGIC";
      
      public static const CLOTHES_STORAGE_CHANGE:String = "GameEvent.CLOTHES_STORAGE_CHANGE";
      
      public static const CLOTHES_HERO_CHANGE:String = "GameEvent.CLOTHES_HERO_CHANGE";
      
      public static const SMILES_CHANGED:String = "GameEvent.SMILES_CHANGED";
      
      public static const TOTEM_BONUS:String = "GameEvent.TOTEM_BONUS";
      
      public static const CONNECTION_CLOSED:String = "GameEvent.CONNECTION_CLOSED";
      
      public static const SWAP_BACKGROUND:String = "GameEvent.SWAP_BACKGROUND";
      
      public static const SUPERPACK_CHANGED:String = "GameEvent.SUPERPACK_CHANGED";
      
      public var data:Object = null;
      
      public function GameEvent(param1:String, param2:Object = null)
      {
         super(param1,false,true);
         this.data = param2;
      }
   }
}

