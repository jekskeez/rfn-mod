package §_-cA§
{
   import §_-48§.ListDataEvent;
   import §_-48§.ListElementEvent;
   import flash.display.Sprite;
   
   public class §_-I2x§ extends Sprite
   {
      
      public var objects:Vector.<§_-3b§> = new Vector.<§_-3b§>();
      
      public function §_-I2x§()
      {
         super();
      }
      
      public function get count() : int
      {
         return this.objects.length;
      }
      
      public function §_-LF§(param1:§_-3b§) : void
      {
         param1.addEventListener(ListElementEvent.CHANGED,this.§_-Z1P§);
         this.objects.push(param1);
      }
      
      public function §_-L1h§() : void
      {
         this.objects.pop().removeEventListener(ListElementEvent.CHANGED,this.§_-Z1P§);
      }
      
      public function §_-yW§() : void
      {
         this.objects.shift().removeEventListener(ListElementEvent.CHANGED,this.§_-Z1P§);
      }
      
      public function §_-k2o§(param1:§_-3b§) : void
      {
         param1.addEventListener(ListElementEvent.CHANGED,this.§_-Z1P§);
         this.objects.unshift(param1);
      }
      
      public function setData(param1:Vector.<§_-3b§>) : void
      {
         this.§_-C30§();
         this.objects = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.objects.length)
         {
            this.objects[_loc2_].addEventListener(ListElementEvent.CHANGED,this.§_-Z1P§);
            _loc2_++;
         }
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      public function §_-C30§() : void
      {
         while(this.objects.length > 0)
         {
            this.§_-L1h§();
         }
      }
      
      public function §_-Z1P§(param1:ListElementEvent) : void
      {
      }
   }
}

