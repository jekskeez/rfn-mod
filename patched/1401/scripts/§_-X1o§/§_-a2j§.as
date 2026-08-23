package §_-X1o§
{
   import §_-5C§.ListDataEvent;
   import §_-Y22§.§_-C2x§;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-a2j§ extends Sprite implements §_-C2x§
   {
      
      protected var §_-G2j§:int;
      
      protected var data:§_-93Q§ = null;
      
      private var sprite:Sprite = null;
      
      public function §_-a2j§(param1:int)
      {
         super();
         this.§_-G2j§ = param1;
         this.init();
      }
      
      public function dispose() : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(ListDataEvent.UPDATE,this.§_-93v§);
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
         this.data.§_-61z§();
         this.§_-83H§();
      }
      
      public function get §_-WK§() : int
      {
         if(this.data == null)
         {
            return 0;
         }
         return this.data.objects.length;
      }
      
      public function setData(param1:§_-93Q§) : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(ListDataEvent.UPDATE,this.§_-93v§);
         }
         this.data = param1;
         this.§_-83H§();
         this.data.addEventListener(ListDataEvent.UPDATE,this.§_-93v§);
      }
      
      protected function §_-83H§() : void
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
               _loc1_ += this.§_-G2j§;
            }
            _loc2_++;
         }
      }
      
      private function init() : void
      {
         this.sprite = new Sprite();
         addChild(this.sprite);
      }
      
      private function §_-93v§(param1:Event) : void
      {
         this.§_-83H§();
      }
   }
}

