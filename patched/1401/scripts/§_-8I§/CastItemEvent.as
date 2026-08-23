package §_-8I§
{
   import flash.events.Event;
   import game.mainGame.§_-bM§;
   
   public class CastItemEvent extends Event
   {
      
      public static const ITEM_ADD:String = "CastItemEvent.ITEM_ADD";
      
      public static const ITEM_CHANGE:String = "CastItemEvent.ITEM_CHANGE";
      
      public static const §_-q1E§:String = "CastItemEvent.AMOUNT_END";
      
      public static const TAPE_UPDATE:String = "CastItemEvent.TAPE_UPDATE";
      
      public var §_-L1z§:§_-bM§ = null;
      
      public function CastItemEvent(param1:String, param2:§_-bM§)
      {
         super(param1);
         this.§_-L1z§ = param2;
      }
      
      override public function clone() : Event
      {
         return new CastItemEvent(type,this.§_-L1z§);
      }
      
      override public function toString() : String
      {
         return formatToString("CastItemEvent","type","bubbles","cancelable","eventPhase");
      }
   }
}

