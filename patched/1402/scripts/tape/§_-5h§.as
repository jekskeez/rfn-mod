package tape
{
   import §_-a11§.TapeDataEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-5h§ extends Sprite
   {
      
      private static const §_-ws§:int = 45;
      
      private static const §_-X2T§:int = 5;
      
      private var data:§_-cY§ = null;
      
      public function §_-5h§()
      {
         super();
      }
      
      public function setData(param1:§_-cY§) : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(TapeDataEvent.UPDATE,this.§_-S2M§);
         }
         this.data = param1;
         if(this.data != null)
         {
            this.data.addEventListener(TapeDataEvent.UPDATE,this.§_-S2M§);
            this.update();
         }
      }
      
      private function §_-S2M§(param1:TapeDataEvent) : void
      {
         this.update();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function update() : void
      {
         var _loc2_:§_-b2T§ = null;
         this.clear();
         if(this.data == null)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length)
         {
            _loc2_ = this.data.objects[_loc1_] as §_-b2T§;
            _loc2_.y = _loc1_ * (§_-ws§ + §_-X2T§);
            addChild(_loc2_);
            _loc1_++;
         }
      }
      
      private function clear() : void
      {
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
      }
      
      public function get count() : int
      {
         return this.data != null ? int(this.data.objects.length) : 0;
      }
   }
}

