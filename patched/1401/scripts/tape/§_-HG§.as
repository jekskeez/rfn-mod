package tape
{
   import §_-r2Y§.TapeDataEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-HG§ extends Sprite
   {
      
      private static const §_-p1h§:int = 45;
      
      private static const §_-61a§:int = 5;
      
      private var data:§_-sp§ = null;
      
      public function §_-HG§()
      {
         super();
      }
      
      public function setData(param1:§_-sp§) : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(TapeDataEvent.UPDATE,this.§_-93v§);
         }
         this.data = param1;
         if(this.data != null)
         {
            this.data.addEventListener(TapeDataEvent.UPDATE,this.§_-93v§);
            this.update();
         }
      }
      
      private function §_-93v§(param1:TapeDataEvent) : void
      {
         this.update();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function update() : void
      {
         var _loc2_:§_-628§ = null;
         this.clear();
         if(this.data == null)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.data.objects.length)
         {
            _loc2_ = this.data.objects[_loc1_] as §_-628§;
            _loc2_.y = _loc1_ * (§_-p1h§ + §_-61a§);
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

