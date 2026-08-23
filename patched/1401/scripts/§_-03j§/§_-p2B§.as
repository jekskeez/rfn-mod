package §_-03j§
{
   import flash.events.Event;
   
   public class §_-p2B§ extends Event
   {
      
      public static const §_-J0§:String = "zOrderUpdated";
      
      public function §_-p2B§(param1:String)
      {
         super(param1,false,false);
      }
      
      override public function clone() : Event
      {
         return new §_-p2B§(type);
      }
   }
}

