package events
{
   import chat.§_-s2y§;
   import flash.events.Event;
   
   public class §_-11G§ extends Event
   {
      
      public static const REMOVE:String = "REMOVE";
      
      public var message:§_-s2y§;
      
      public function §_-11G§(param1:§_-s2y§)
      {
         super(REMOVE);
         this.message = param1;
      }
   }
}

