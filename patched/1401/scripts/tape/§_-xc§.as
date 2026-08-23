package tape
{
   import §_-r2Y§.TapeDataEvent;
   import §_-r2Y§.§_-33e§;
   import flash.events.EventDispatcher;
   
   public class §_-xc§ extends EventDispatcher
   {
      
      public var objects:Vector.<§_-K2k§> = new Vector.<§_-K2k§>();
      
      protected var §_-l1R§:Class = null;
      
      public function §_-xc§(param1:Class = null)
      {
         super();
         this.§_-l1R§ = param1;
      }
      
      public function setData(param1:Array) : void
      {
         this.clear();
         var _loc2_:* = int(param1.length - 1);
         while(_loc2_ >= 0)
         {
            this.addObject(this.§_-hN§(param1[_loc2_]));
            _loc2_--;
         }
         this.sort();
      }
      
      protected function §_-hN§(param1:int) : §_-K2k§
      {
         return new this.§_-l1R§(param1) as §_-K2k§;
      }
      
      public function addObject(param1:§_-K2k§) : void
      {
         this.objects.unshift(param1);
         this.§_-93o§(int.MAX_VALUE);
      }
      
      public function §_-v1z§(param1:§_-K2k§, param2:int = 0) : void
      {
         this.objects.splice(param2,0,param1);
      }
      
      public function §_-yA§(param1:§_-K2k§) : void
      {
         this.objects.push(param1);
         this.§_-v3§(int.MAX_VALUE);
      }
      
      public function get count() : int
      {
         return this.objects.length;
      }
      
      public function §_-YC§(param1:§_-33e§) : void
      {
         var _loc2_:§_-K2k§ = null;
         for each(_loc2_ in this.objects)
         {
            if(!_loc2_.loaded)
            {
               return;
            }
         }
         this.sort();
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      public function clear() : void
      {
         this.§_-93o§(0);
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      protected function sort() : void
      {
      }
      
      protected function §_-93o§(param1:int) : void
      {
         var _loc2_:§_-K2k§ = null;
         while(this.objects.length > param1)
         {
            _loc2_ = this.objects.pop();
            _loc2_.forget(this.§_-YC§);
         }
      }
      
      protected function §_-v3§(param1:int) : void
      {
         var _loc2_:§_-K2k§ = null;
         while(this.objects.length > param1)
         {
            _loc2_ = this.objects.shift();
            _loc2_.forget(this.§_-YC§);
         }
      }
   }
}

