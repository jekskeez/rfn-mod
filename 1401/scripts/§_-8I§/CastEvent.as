package §_-8I§
{
   import flash.events.Event;
   
   public class CastEvent extends Event
   {
      
      public static const CASTED:String = "CastEvent.CASTED";
      
      public static const SELECT:String = "CastEvent.SELECT";
      
      public var §_-Q1q§:*;
      
      public function CastEvent(param1:String, param2:*)
      {
         super(param1);
         this.§_-Q1q§ = param2;
      }
   }
}

