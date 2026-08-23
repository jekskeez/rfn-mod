package §_-X1o§
{
   import §_-5C§.ListDataEvent;
   import §_-5C§.ListElementEvent;
   import flash.display.Sprite;
   
   public class §_-93Q§ extends Sprite
   {
      
      public var objects:Vector.<§_-X27§> = new Vector.<§_-X27§>();
      
      public function §_-93Q§()
      {
         super();
      }
      
      public function get count() : int
      {
         return this.objects.length;
      }
      
      public function §_-yA§(param1:§_-X27§) : void
      {
         param1.addEventListener(ListElementEvent.CHANGED,this.§_-YC§);
         this.objects.push(param1);
      }
      
      public function §_-N1A§() : void
      {
         this.objects.pop().removeEventListener(ListElementEvent.CHANGED,this.§_-YC§);
      }
      
      public function §_-O1I§() : void
      {
         this.objects.shift().removeEventListener(ListElementEvent.CHANGED,this.§_-YC§);
      }
      
      public function §_-51V§(param1:§_-X27§) : void
      {
         param1.addEventListener(ListElementEvent.CHANGED,this.§_-YC§);
         this.objects.unshift(param1);
      }
      
      public function setData(param1:Vector.<§_-X27§>) : void
      {
         this.§_-61z§();
         this.objects = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.objects.length)
         {
            this.objects[_loc2_].addEventListener(ListElementEvent.CHANGED,this.§_-YC§);
            _loc2_++;
         }
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      public function §_-61z§() : void
      {
         while(this.objects.length > 0)
         {
            this.§_-N1A§();
         }
      }
      
      public function §_-YC§(param1:ListElementEvent) : void
      {
      }
   }
}

