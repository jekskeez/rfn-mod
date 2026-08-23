package §_-8I§
{
   import flash.events.Event;
   
   public class HollowEvent extends Event
   {
      
      public static const §_-63s§:String = "HollowEvent.hollow";
      
      public var player:Hero;
      
      public var §_-H2E§:int = -1;
      
      public function HollowEvent(param1:Hero, param2:int)
      {
         super(§_-63s§);
         this.player = param1;
         this.§_-H2E§ = param2;
      }
   }
}

