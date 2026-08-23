package events
{
   import §_-U19§.Clan;
   import flash.events.Event;
   
   public class §_-a1V§ extends Event
   {
      
      public static const §_-n2H§:String = "onClanLoaded";
      
      public var §_-b19§:Clan;
      
      public var §_-03C§:Boolean;
      
      public function §_-a1V§(param1:Clan, param2:Boolean)
      {
         super(§_-n2H§);
         this.§_-b19§ = param1;
         this.§_-03C§ = param2;
      }
   }
}

