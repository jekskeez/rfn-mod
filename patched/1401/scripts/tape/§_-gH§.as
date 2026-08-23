package tape
{
   import events.§_-63A§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class §_-gH§ extends §_-k14§
   {
      
      public function §_-gH§(param1:Array)
      {
         var _loc3_:§_-Is§ = null;
         super();
         var _loc2_:§_-N25§ = new §_-N25§(param1);
         setData(_loc2_);
         for each(_loc3_ in _loc2_.objects)
         {
            _loc3_.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         }
      }
      
      private function §_-P2v§(param1:Event) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:§_-Is§ = param1.currentTarget as §_-Is§;
         dispatchEvent(new §_-63A§(_loc2_.className));
      }
   }
}

