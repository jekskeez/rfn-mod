package §_-z2V§
{
   import §_-X1k§.§_-L1o§;
   import §_-a11§.§_-h2m§;
   import flash.events.MouseEvent;
   import tape.§_-2n§;
   import tape.§_-S1M§;
   import tape.§_-h2f§;
   
   public class §_-D2g§ extends §_-S1M§
   {
      
      protected var §_-Ot§:§_-2n§ = null;
      
      protected var §_-ck§:Boolean = true;
      
      public function §_-D2g§(param1:int, param2:int, param3:int = 5, param4:Boolean = true)
      {
         super(2,1,5,param3,param2,0,param1,param1,true,false,true);
         this.§_-F2l§ = true;
         this.§_-ck§ = param4;
      }
      
      override public function setData(param1:§_-h2f§) : void
      {
         var _loc2_:int = 0;
         if(param1.objects.length == 0)
         {
            super.setData(param1);
            return;
         }
         if(this.§_-Ot§)
         {
            this.§_-Ot§.removeEventListener(MouseEvent.CLICK,this.§_-71s§);
            removeChild(this.§_-Ot§);
         }
         this.§_-Ot§ = param1.objects.shift() as §_-2n§;
         this.§_-Ot§.scaleX = this.§_-Ot§.scaleY = 1.2;
         this.§_-Ot§.x = -this.§_-Ot§.width + this.§_-230§ - this.offsetX;
         this.§_-Ot§.addEventListener(MouseEvent.CLICK,this.§_-71s§);
         addChild(this.§_-Ot§);
         super.setData(param1);
         if(this.§_-ck§)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.objects.length)
            {
               if(§_-L1o§.§_-m2I§.indexOf((param1.objects[_loc2_] as §_-2n§).id) != -1)
               {
                  select(param1.objects[_loc2_] as §_-2n§);
                  return;
               }
               _loc2_++;
            }
         }
         select(this.§_-Ot§);
      }
      
      override protected function §_-P13§(param1:int, param2:int) : void
      {
         var _loc3_:int = this.§_-H1J§;
         if(param1 > 1 && param1 > _loc3_ && param1 - 1 != this.data.objects.length)
         {
            super.§_-P13§(param1 - 1,param2);
         }
         else if(param1 < _loc3_)
         {
            super.§_-P13§(param1,param2);
         }
         if(this.§_-F2l§ && this.data.objects.length > param1)
         {
            select(this.data.objects[param1] as §_-2n§);
         }
      }
      
      override protected function §_-X1z§(param1:§_-h2m§) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            if(this.data.objects[_loc2_] == param1.element as §_-2n§)
            {
               this.§_-k26§.§_-l1Y§(_loc2_);
               break;
            }
            _loc2_++;
         }
         select(param1.element as §_-2n§);
      }
      
      override protected function get dotSize() : int
      {
         return 18;
      }
      
      private function §_-71s§(param1:MouseEvent) : void
      {
         §_-W2w§();
         select(this.§_-Ot§);
      }
   }
}

