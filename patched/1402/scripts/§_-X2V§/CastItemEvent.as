package §_-X2V§
{
   import flash.events.Event;
   import game.mainGame.§_-v1N§;
   
   public class CastItemEvent extends Event
   {
      
      public static const ITEM_ADD:String = "CastItemEvent.ITEM_ADD";
      
      public static const ITEM_CHANGE:String = "CastItemEvent.ITEM_CHANGE";
      
      public static const §_-N1W§:String = "CastItemEvent.AMOUNT_END";
      
      public static const TAPE_UPDATE:String = "CastItemEvent.TAPE_UPDATE";
      
      public var §_-i1H§:§_-v1N§ = null;
      
      public function CastItemEvent(param1:String, param2:§_-v1N§)
      {
         super(param1);
         this.§_-i1H§ = param2;
      }
      
      override public function clone() : Event
      {
         return new CastItemEvent(type,this.§_-i1H§);
      }
      
      override public function toString() : String
      {
         return formatToString("CastItemEvent","type","bubbles","cancelable","eventPhase");
      }
   }
}

