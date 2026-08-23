package utils
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class §_-Y11§ extends EventDispatcher
   {
      
      private var §_-3N§:int = 0;
      
      public function §_-Y11§(param1:int = 0)
      {
         super();
         this.count = param1;
      }
      
      public function get count() : int
      {
         return this.§_-3N§;
      }
      
      public function set count(param1:int) : void
      {
         if(this.§_-3N§ == param1)
         {
            return;
         }
         this.§_-3N§ = param1;
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}

