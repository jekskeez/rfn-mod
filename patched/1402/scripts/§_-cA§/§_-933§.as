package §_-cA§
{
   import §_-48§.ListDataEvent;
   import §_-I2Y§.§_-l2r§;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-933§ extends Sprite implements §_-l2r§
   {
      
      protected var §_-g2H§:int;
      
      protected var data:§_-I2x§ = null;
      
      private var sprite:Sprite = null;
      
      public function §_-933§(param1:int)
      {
         super();
         this.§_-g2H§ = param1;
         this.init();
      }
      
      public function dispose() : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(ListDataEvent.UPDATE,this.§_-S2M§);
         }
      }
      
      public function clear() : void
      {
         while(this.sprite.numChildren > 0)
         {
            this.sprite.removeChildAt(0);
         }
      }
      
      public function reset() : void
      {
         if(this.data == null)
         {
            this.clear();
            return;
         }
         this.data.§_-C30§();
         this.§_-nZ§();
      }
      
      public function get §_-y2i§() : int
      {
         if(this.data == null)
         {
            return 0;
         }
         return this.data.objects.length;
      }
      
      public function setData(param1:§_-I2x§) : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(ListDataEvent.UPDATE,this.§_-S2M§);
         }
         this.data = param1;
         this.§_-nZ§();
         this.data.addEventListener(ListDataEvent.UPDATE,this.§_-S2M§);
      }
      
      protected function §_-nZ§() : void
      {
         this.clear();
         if(this.data == null)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            if(this.data.objects[_loc2_].canAdd)
            {
               this.data.objects[_loc2_].y = _loc1_;
               this.sprite.addChild(this.data.objects[_loc2_]);
               _loc1_ += this.§_-g2H§;
            }
            _loc2_++;
         }
      }
      
      private function init() : void
      {
         this.sprite = new Sprite();
         addChild(this.sprite);
      }
      
      private function §_-S2M§(param1:Event) : void
      {
         this.§_-nZ§();
      }
   }
}

