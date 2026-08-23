package tape
{
   import events.§_-63A§;
   import flash.events.MouseEvent;
   
   public class §_-Es§ extends §_-Mt§
   {
      
      public function §_-Es§(param1:Array)
      {
         var _loc4_:§_-Is§ = null;
         super(13,2,32,8,false);
         var _loc2_:§_-xc§ = new §_-xc§();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = new §_-Is§(param1[_loc3_]);
            _loc4_.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
            _loc2_.addObject(_loc4_);
            _loc3_++;
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

