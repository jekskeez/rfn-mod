package §_-X2V§
{
   import flash.events.Event;
   
   public class HollowEvent extends Event
   {
      
      public static const §_-h1g§:String = "HollowEvent.hollow";
      
      public var player:Hero;
      
      public var §_-NV§:int = -1;
      
      public function HollowEvent(param1:Hero, param2:int)
      {
         super(§_-h1g§);
         this.player = param1;
         this.§_-NV§ = param2;
      }
   }
}

