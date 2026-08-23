package tape
{
   import events.§_-63A§;
   import flash.events.MouseEvent;
   
   public class §_-L2D§ extends §_-k14§
   {
      
      public function §_-L2D§(param1:Array)
      {
         var _loc3_:Class = null;
         var _loc4_:§_-Is§ = null;
         super();
         var _loc2_:§_-xc§ = new §_-xc§();
         for each(_loc3_ in param1)
         {
            _loc4_ = new §_-Is§(_loc3_);
            _loc2_.addObject(_loc4_);
            _loc4_.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         }
         setData(_loc2_);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:§_-Is§ = param1.currentTarget as §_-Is§;
         dispatchEvent(new §_-63A§(_loc2_.className));
      }
   }
}

