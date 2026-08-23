package §_-z2Z§
{
   import §_-I10§.§_-h1f§;
   import §_-r2Y§.§_-33e§;
   import flash.events.MouseEvent;
   import tape.§_-A3s§;
   import tape.§_-wP§;
   import tape.§_-xc§;
   
   public class §_-ps§ extends §_-wP§
   {
      
      protected var §_-FV§:§_-A3s§ = null;
      
      protected var §_-vb§:Boolean = true;
      
      public function §_-ps§(param1:int, param2:int, param3:int = 5, param4:Boolean = true)
      {
         super(2,1,5,param3,param2,0,param1,param1,true,false,true);
         this.§_-43W§ = true;
         this.§_-vb§ = param4;
      }
      
      override public function setData(param1:§_-xc§) : void
      {
         var _loc2_:int = 0;
         if(param1.objects.length == 0)
         {
            super.setData(param1);
            return;
         }
         if(this.§_-FV§)
         {
            this.§_-FV§.removeEventListener(MouseEvent.CLICK,this.§_-y3§);
            removeChild(this.§_-FV§);
         }
         this.§_-FV§ = param1.objects.shift() as §_-A3s§;
         this.§_-FV§.scaleX = this.§_-FV§.scaleY = 1.2;
         this.§_-FV§.x = -this.§_-FV§.width + this.§_-32v§ - this.offsetX;
         this.§_-FV§.addEventListener(MouseEvent.CLICK,this.§_-y3§);
         addChild(this.§_-FV§);
         super.setData(param1);
         if(this.§_-vb§)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.objects.length)
            {
               if(§_-h1f§.§_-IS§.indexOf((param1.objects[_loc2_] as §_-A3s§).id) != -1)
               {
                  select(param1.objects[_loc2_] as §_-A3s§);
                  return;
               }
               _loc2_++;
            }
         }
         select(this.§_-FV§);
      }
      
      override protected function §_-jR§(param1:int, param2:int) : void
      {
         var _loc3_:int = this.§_-v§;
         if(param1 > 1 && param1 > _loc3_ && param1 - 1 != this.data.objects.length)
         {
            super.§_-jR§(param1 - 1,param2);
         }
         else if(param1 < _loc3_)
         {
            super.§_-jR§(param1,param2);
         }
         if(this.§_-43W§ && this.data.objects.length > param1)
         {
            select(this.data.objects[param1] as §_-A3s§);
         }
      }
      
      override protected function §_-a16§(param1:§_-33e§) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.data.objects.length)
         {
            if(this.data.objects[_loc2_] == param1.element as §_-A3s§)
            {
               this.§_-d1n§.§_-32c§(_loc2_);
               break;
            }
            _loc2_++;
         }
         select(param1.element as §_-A3s§);
      }
      
      override protected function get dotSize() : int
      {
         return 18;
      }
      
      private function §_-y3§(param1:MouseEvent) : void
      {
         §_-51b§();
         select(this.§_-FV§);
      }
   }
}

