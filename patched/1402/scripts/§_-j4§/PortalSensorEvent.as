package §_-j4§
{
   import flash.events.Event;
   
   public class PortalSensorEvent extends Event
   {
      
      public static const CONTACT:String = "PortalSensorEvent.CONTACT";
      
      public var hero:Hero = null;
      
      public function PortalSensorEvent(param1:String, param2:Hero)
      {
         super(param1);
         this.hero = param2;
      }
   }
}

