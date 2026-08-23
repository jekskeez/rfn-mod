package tape
{
   import events.§_-F2k§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class §_-TD§ extends §_-Zw§
   {
      
      public function §_-TD§(param1:Array)
      {
         var _loc3_:§_-iT§ = null;
         super();
         var _loc2_:§_-73M§ = new §_-73M§(param1);
         setData(_loc2_);
         for each(_loc3_ in _loc2_.objects)
         {
            _loc3_.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         }
      }
      
      private function §_-H1h§(param1:Event) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:§_-iT§ = param1.currentTarget as §_-iT§;
         dispatchEvent(new §_-F2k§(_loc2_.className));
      }
   }
}

