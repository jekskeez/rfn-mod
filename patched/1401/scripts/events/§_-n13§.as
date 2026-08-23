package events
{
   import §_-dc§.Clan;
   import flash.events.Event;
   
   public class §_-n13§ extends Event
   {
      
      public static const §_-31q§:String = "onClanLoaded";
      
      public var §_-81t§:Clan;
      
      public var §_-414§:Boolean;
      
      public function §_-n13§(param1:Clan, param2:Boolean)
      {
         super(§_-31q§);
         this.§_-81t§ = param1;
         this.§_-414§ = param2;
      }
   }
}

