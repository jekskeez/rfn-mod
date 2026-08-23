package utils
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class §_-Y25§ extends EventDispatcher
   {
      
      private var §_-C3L§:int = 0;
      
      public function §_-Y25§(param1:int = 0)
      {
         super();
         this.count = param1;
      }
      
      public function get count() : int
      {
         return this.§_-C3L§;
      }
      
      public function set count(param1:int) : void
      {
         if(this.§_-C3L§ == param1)
         {
            return;
         }
         this.§_-C3L§ = param1;
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}

