package tape
{
   import §_-B1G§.§_-Pd§;
   import §_-a11§.TapeDataEvent;
   import buttons.§_-613§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §_-L2v§ extends Sprite
   {
      
      private var §_-p2X§:Boolean;
      
      private var §_-TS§:Boolean;
      
      private var §_-3x§:int = 0;
      
      protected var §_-H1J§:int = 0;
      
      protected var §_-A1Z§:int;
      
      protected var §_-w1q§:int;
      
      protected var §_-230§:int;
      
      protected var §_-y2b§:int;
      
      protected var offsetX:int;
      
      protected var offsetY:int;
      
      protected var §_-13r§:int;
      
      protected var §_-g6§:int;
      
      protected var §_-I2f§:Boolean;
      
      protected var sprite:Sprite = new Sprite();
      
      protected var §_-T1X§:§_-613§ = null;
      
      protected var §_-42u§:§_-613§ = null;
      
      protected var buttonNext:§_-613§ = null;
      
      protected var §_-025§:§_-613§ = null;
      
      protected var §_-J1c§:int;
      
      protected var data:§_-h2f§;
      
      public var §_-k26§:§_-Pd§ = null;
      
      public function §_-L2v§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean = false, param10:Boolean = true, param11:Boolean = false)
      {
         super();
         this.§_-A1Z§ = param1;
         this.§_-w1q§ = param2;
         this.§_-230§ = param3;
         this.§_-y2b§ = param4;
         this.offsetX = param5;
         this.offsetY = param6;
         this.§_-13r§ = param7;
         this.§_-g6§ = param8;
         this.§_-I2f§ = param10;
         this.sprite.x = this.§_-230§;
         this.sprite.y = this.§_-y2b§;
         addChild(this.sprite);
         this.§_-p2X§ = param9;
         this.§_-TS§ = param11;
         this.§_-j2y§();
      }
      
      public function §_-n4§() : §_-h2f§
      {
         return this.data;
      }
      
      public function get page() : int
      {
         return this.§_-H1J§;
      }
      
      public function set page(param1:int) : void
      {
         if(!this.§_-p2X§ || this.§_-H1J§ == param1)
         {
            return;
         }
         this.§_-H1J§ = param1;
         this.§_-k26§.§_-l1Y§(this.§_-H1J§);
      }
      
      public function show() : void
      {
         this.visible = true;
      }
      
      public function hide() : void
      {
         this.visible = false;
      }
      
      public function get offset() : int
      {
         return this.§_-J1c§;
      }
      
      public function set offset(param1:int) : void
      {
         this.§_-J1c§ = param1;
         if(this.data != null)
         {
            this.§_-J1c§ = Math.min(this.§_-J1c§,this.data.objects.length);
         }
         this.§_-J1c§ = Math.max(this.§_-J1c§,0);
         this.update();
      }
      
      public function get count() : int
      {
         return this.data.objects.length;
      }
      
      public function setData(param1:§_-h2f§) : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(TapeDataEvent.UPDATE,this.§_-S2M§);
         }
         this.offset = 0;
         this.data = param1;
         this.update();
         this.data.addEventListener(TapeDataEvent.UPDATE,this.§_-S2M§);
         if(!this.§_-p2X§)
         {
            return;
         }
         if(this.§_-TS§)
         {
            this.§_-3x§ = this.count;
         }
         else
         {
            this.§_-3x§ = (this.count - 1) / (this.§_-A1Z§ * this.§_-w1q§) + 1;
         }
         if(this.§_-k26§)
         {
            removeChild(this.§_-k26§);
         }
         this.§_-k26§ = new §_-Pd§(this.§_-3x§,this.dotSize * 2 + this.§_-3x§ * this.dotSize);
         this.§_-k26§.x = this.§_-230§ + int((this.§_-A1Z§ * (this.§_-13r§ + this.offsetX) - this.offsetX - this.§_-k26§.width) * 0.5);
         this.§_-k26§.y = this.§_-y2b§ * 2 + this.§_-w1q§ * (this.§_-g6§ + this.offsetY);
         this.§_-k26§.§_-l1Y§(0);
         this.§_-k26§.§_-E2B§(this.§_-P13§);
         this.§_-k26§.visible = this.count > this.§_-A1Z§ * this.§_-w1q§;
         addChild(this.§_-k26§);
         this.§_-i1L§();
      }
      
      protected function get dotSize() : int
      {
         return 25;
      }
      
      public function §_-S1q§() : void
      {
         while(this.sprite.numChildren > 0)
         {
            this.sprite.removeChildAt(0);
         }
      }
      
      protected function §_-j2y§() : void
      {
         if(!this.§_-T1X§)
         {
            this.§_-T1X§ = new §_-613§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
            this.§_-T1X§.x = -this.§_-T1X§.width - 1;
            this.§_-T1X§.y = this.§_-y2b§ + this.§_-w1q§ * (this.§_-g6§ + this.offsetY) * 0.5 - this.§_-T1X§.height * 0.5;
            this.§_-T1X§.visible = false;
         }
         if(!this.buttonNext)
         {
            this.buttonNext = new §_-613§(new ButtonRewindRight(),new ButtonRewindRightInactive());
            this.buttonNext.x = this.§_-230§ * 2 + this.§_-A1Z§ * (this.§_-13r§ + this.offsetX) - this.offsetX + 1;
            this.buttonNext.y = this.§_-y2b§ + this.§_-w1q§ * (this.§_-g6§ + this.offsetY) * 0.5 - this.buttonNext.height * 0.5;
            this.buttonNext.visible = false;
         }
         if(!this.§_-p2X§)
         {
            addChild(this.§_-T1X§);
            addChild(this.buttonNext);
         }
         this.§_-T1X§.addEventListener(MouseEvent.CLICK,this.§_-SO§);
         this.buttonNext.addEventListener(MouseEvent.CLICK,this.§_-M12§);
         if(this.§_-025§ == null)
         {
            return;
         }
         this.§_-025§.addEventListener(MouseEvent.CLICK,this.§_-d2a§);
         addChild(this.§_-025§);
         this.§_-42u§.addEventListener(MouseEvent.CLICK,this.§_-3C§);
         addChild(this.§_-42u§);
      }
      
      protected function §_-i1L§() : void
      {
      }
      
      protected function update() : void
      {
         if(this.data == null)
         {
            return;
         }
         var _loc1_:int = this.offset;
         while(_loc1_ < this.offset + this.§_-p2w§())
         {
            if(_loc1_ > this.data.objects.length - 1)
            {
               break;
            }
            this.data.objects[_loc1_].§_-O1s§();
            _loc1_++;
         }
         this.§_-nZ§();
         this.updateButtons();
      }
      
      protected function §_-p2w§() : int
      {
         return this.§_-A1Z§ * this.§_-w1q§;
      }
      
      protected function §_-nZ§() : void
      {
         var _loc4_:Sprite = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this.data == null)
         {
            return;
         }
         this.§_-S1q§();
         var _loc1_:int = Math.min(this.offset + this.§_-A1Z§ * this.§_-w1q§,this.data.objects.length);
         var _loc2_:int = this.offset;
         var _loc3_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc4_ = this.data.objects[_loc2_];
            if(this.§_-I2f§)
            {
               _loc4_.x = (this.§_-13r§ + this.offsetX) * int((_loc2_ - this.offset) % this.§_-A1Z§);
               _loc4_.y = (this.§_-g6§ + this.offsetY) * int((_loc2_ - this.offset) / this.§_-A1Z§);
            }
            else
            {
               _loc5_ = _loc3_ % this.§_-w1q§;
               _loc6_ = _loc3_ / this.§_-w1q§;
               _loc4_.x = (this.§_-13r§ + this.offsetX) * _loc6_;
               _loc4_.y = (this.§_-g6§ + this.offsetY) * _loc5_;
            }
            this.sprite.addChild(_loc4_);
            _loc2_++;
            _loc3_++;
         }
      }
      
      protected function updateButtons() : void
      {
         var _loc1_:Boolean = this.offset + this.§_-p2w§() < this.data.objects.length;
         this.buttonNext.setState(_loc1_);
         this.buttonNext.visible = this.data.objects.length > this.§_-p2w§();
         if(this.§_-025§ != null)
         {
            this.§_-025§.visible = this.buttonNext.visible;
            this.§_-025§.setState(_loc1_);
         }
         var _loc2_:Boolean = this.offset > 0;
         this.§_-T1X§.setState(_loc2_);
         this.§_-T1X§.visible = this.data.objects.length > this.§_-p2w§();
         if(this.§_-42u§ != null)
         {
            this.§_-42u§.visible = this.§_-T1X§.visible;
            this.§_-42u§.setState(_loc2_);
         }
         if(!this.§_-p2X§)
         {
            return;
         }
         this.§_-i1L§();
      }
      
      protected function §_-P13§(param1:int, param2:int) : void
      {
         if(this.§_-TS§)
         {
            this.offset = Math.max(0,Math.min(param1,this.count - this.§_-A1Z§ * this.§_-w1q§));
         }
         else
         {
            this.offset = param1 * (this.§_-A1Z§ * this.§_-w1q§);
         }
         this.§_-H1J§ = param1;
         this.update();
      }
      
      private function §_-S2M§(param1:TapeDataEvent) : void
      {
         this.update();
      }
      
      private function §_-M12§(param1:MouseEvent) : void
      {
         if(this.offset + this.§_-p2w§() >= this.data.objects.length)
         {
            return;
         }
         this.offset += this.§_-w1q§;
      }
      
      private function §_-SO§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         this.offset -= this.§_-w1q§;
      }
      
      private function §_-d2a§(param1:MouseEvent) : void
      {
         if(this.offset + this.§_-p2w§() >= this.data.objects.length)
         {
            return;
         }
         this.offset += this.§_-p2w§();
      }
      
      private function §_-3C§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         this.offset -= this.§_-p2w§();
      }
   }
}

