package §_-R1w§
{
   import flash.events.Event;
   
   public class DetectHeroEvent extends Event
   {
      
      public static const BEGIN_CONTACT:String = "BEGIN_CONTACT";
      
      public static const END_CONTACT:String = "END_CONTACT";
      
      public static const §_-41O§:String = "DetectHeroEvent.detected";
      
      public var hero:Hero;
      
      public var state:String;
      
      public var §_-t18§:Boolean;
      
      public function DetectHeroEvent(param1:Hero, param2:Boolean = true, param3:String = "BEGIN_CONTACT")
      {
         super(§_-41O§);
         this.hero = param1;
         this.state = param3;
         this.§_-t18§ = param2;
      }
   }
}

