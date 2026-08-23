package §_-Sx§
{
   import flash.events.Event;
   
   public class §_-GE§ extends Event
   {
      
      public static const §_-f2p§:String = "zOrderUpdated";
      
      public function §_-GE§(param1:String)
      {
         super(param1,false,false);
      }
      
      override public function clone() : Event
      {
         return new §_-GE§(type);
      }
   }
}

