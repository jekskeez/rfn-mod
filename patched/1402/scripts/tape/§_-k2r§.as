package tape
{
   import events.§_-F2k§;
   import flash.events.MouseEvent;
   
   public class §_-k2r§ extends §_-Zw§
   {
      
      public function §_-k2r§(param1:Array)
      {
         var _loc3_:Class = null;
         var _loc4_:§_-iT§ = null;
         super();
         var _loc2_:§_-h2f§ = new §_-h2f§();
         for each(_loc3_ in param1)
         {
            _loc4_ = new §_-iT§(_loc3_);
            _loc2_.addObject(_loc4_);
            _loc4_.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         }
         setData(_loc2_);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:§_-iT§ = param1.currentTarget as §_-iT§;
         dispatchEvent(new §_-F2k§(_loc2_.className));
      }
   }
}

