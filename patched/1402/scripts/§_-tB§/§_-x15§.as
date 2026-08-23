package §_-tB§
{
   import flash.events.Event;
   
   public class §_-x15§ extends Event
   {
      
      public static const §_-X1s§:String = "dataPrepareProgress";
      
      public static const §_-33g§:String = "dataPrepareComplete";
      
      public var bytesTotal:uint = 0;
      
      public var §_-q1U§:uint = 0;
      
      public function §_-x15§(param1:String, param2:uint = 0, param3:uint = 0)
      {
         super(param1);
         bytesTotal = param3;
         §_-q1U§ = param2;
      }
   }
}

