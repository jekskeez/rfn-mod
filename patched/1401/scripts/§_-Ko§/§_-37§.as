package §_-Ko§
{
   import flash.events.Event;
   
   public class §_-37§ extends Event
   {
      
      public static const §_-b1R§:String = "dataPrepareProgress";
      
      public static const §_-Xf§:String = "dataPrepareComplete";
      
      public var bytesTotal:uint = 0;
      
      public var §_-4r§:uint = 0;
      
      public function §_-37§(param1:String, param2:uint = 0, param3:uint = 0)
      {
         super(param1);
         bytesTotal = param3;
         §_-4r§ = param2;
      }
   }
}

