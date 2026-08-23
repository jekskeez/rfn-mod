package §_-X2V§
{
   import flash.events.Event;
   
   public class CastEvent extends Event
   {
      
      public static const CASTED:String = "CastEvent.CASTED";
      
      public static const SELECT:String = "CastEvent.SELECT";
      
      public var §_-P1Y§:*;
      
      public function CastEvent(param1:String, param2:*)
      {
         super(param1);
         this.§_-P1Y§ = param2;
      }
   }
}

