package tape
{
   import events.§_-F2k§;
   import flash.events.MouseEvent;
   
   public class §_-Gn§ extends §_-71i§
   {
      
      public function §_-Gn§(param1:Array)
      {
         var _loc4_:§_-iT§ = null;
         super(13,2,32,8,false);
         var _loc2_:§_-h2f§ = new §_-h2f§();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = new §_-iT§(param1[_loc3_]);
            _loc4_.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
            _loc2_.addObject(_loc4_);
            _loc3_++;
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

