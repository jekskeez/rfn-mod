package tape
{
   import §_-a11§.TapeDataEvent;
   import §_-a11§.§_-h2m§;
   import flash.events.EventDispatcher;
   
   public class §_-h2f§ extends EventDispatcher
   {
      
      public var objects:Vector.<§_-QN§> = new Vector.<§_-QN§>();
      
      protected var §_-L2b§:Class = null;
      
      public function §_-h2f§(param1:Class = null)
      {
         super();
         this.§_-L2b§ = param1;
      }
      
      public function setData(param1:Array) : void
      {
         this.clear();
         var _loc2_:* = int(param1.length - 1);
         while(_loc2_ >= 0)
         {
            this.addObject(this.§_-5p§(param1[_loc2_]));
            _loc2_--;
         }
         this.sort();
      }
      
      protected function §_-5p§(param1:int) : §_-QN§
      {
         return new this.§_-L2b§(param1) as §_-QN§;
      }
      
      public function addObject(param1:§_-QN§) : void
      {
         this.objects.unshift(param1);
         this.§_-w1d§(int.MAX_VALUE);
      }
      
      public function §_-L1M§(param1:§_-QN§, param2:int = 0) : void
      {
         this.objects.splice(param2,0,param1);
      }
      
      public function §_-LF§(param1:§_-QN§) : void
      {
         this.objects.push(param1);
         this.§_-a1I§(int.MAX_VALUE);
      }
      
      public function get count() : int
      {
         return this.objects.length;
      }
      
      public function §_-Z1P§(param1:§_-h2m§) : void
      {
         var _loc2_:§_-QN§ = null;
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
         this.§_-w1d§(0);
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      protected function sort() : void
      {
      }
      
      protected function §_-w1d§(param1:int) : void
      {
         var _loc2_:§_-QN§ = null;
         while(this.objects.length > param1)
         {
            _loc2_ = this.objects.pop();
            _loc2_.forget(this.§_-Z1P§);
         }
      }
      
      protected function §_-a1I§(param1:int) : void
      {
         var _loc2_:§_-QN§ = null;
         while(this.objects.length > param1)
         {
            _loc2_ = this.objects.shift();
            _loc2_.forget(this.§_-Z1P§);
         }
      }
   }
}

