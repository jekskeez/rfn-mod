package tape
{
   import §_-Kr§.§_-Q2o§;
   import §_-r2Y§.TapeDataEvent;
   import buttons.§_-wc§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §_-3l§ extends Sprite
   {
      
      private var §_-F2l§:Boolean;
      
      private var §_-NS§:Boolean;
      
      private var §_-u1s§:int = 0;
      
      protected var §_-v§:int = 0;
      
      protected var §_-E2J§:int;
      
      protected var §_-x16§:int;
      
      protected var §_-32v§:int;
      
      protected var §_-xx§:int;
      
      protected var offsetX:int;
      
      protected var offsetY:int;
      
      protected var §_-i2s§:int;
      
      protected var §_-c28§:int;
      
      protected var §_-72G§:Boolean;
      
      protected var sprite:Sprite = new Sprite();
      
      protected var §_-Z2B§:§_-wc§ = null;
      
      protected var §_-F1m§:§_-wc§ = null;
      
      protected var buttonNext:§_-wc§ = null;
      
      protected var §_-s19§:§_-wc§ = null;
      
      protected var §_-H2O§:int;
      
      protected var data:§_-xc§;
      
      public var §_-d1n§:§_-Q2o§ = null;
      
      public function §_-3l§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean = false, param10:Boolean = true, param11:Boolean = false)
      {
         super();
         this.§_-E2J§ = param1;
         this.§_-x16§ = param2;
         this.§_-32v§ = param3;
         this.§_-xx§ = param4;
         this.offsetX = param5;
         this.offsetY = param6;
         this.§_-i2s§ = param7;
         this.§_-c28§ = param8;
         this.§_-72G§ = param10;
         this.sprite.x = this.§_-32v§;
         this.sprite.y = this.§_-xx§;
         addChild(this.sprite);
         this.§_-F2l§ = param9;
         this.§_-NS§ = param11;
         this.§_-bX§();
      }
      
      public function §_-H1Q§() : §_-xc§
      {
         return this.data;
      }
      
      public function get page() : int
      {
         return this.§_-v§;
      }
      
      public function set page(param1:int) : void
      {
         if(!this.§_-F2l§ || this.§_-v§ == param1)
         {
            return;
         }
         this.§_-v§ = param1;
         this.§_-d1n§.§_-32c§(this.§_-v§);
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
         return this.§_-H2O§;
      }
      
      public function set offset(param1:int) : void
      {
         this.§_-H2O§ = param1;
         if(this.data != null)
         {
            this.§_-H2O§ = Math.min(this.§_-H2O§,this.data.objects.length);
         }
         this.§_-H2O§ = Math.max(this.§_-H2O§,0);
         this.update();
      }
      
      public function get count() : int
      {
         return this.data.objects.length;
      }
      
      public function setData(param1:§_-xc§) : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(TapeDataEvent.UPDATE,this.§_-93v§);
         }
         this.offset = 0;
         this.data = param1;
         this.update();
         this.data.addEventListener(TapeDataEvent.UPDATE,this.§_-93v§);
         if(!this.§_-F2l§)
         {
            return;
         }
         if(this.§_-NS§)
         {
            this.§_-u1s§ = this.count;
         }
         else
         {
            this.§_-u1s§ = (this.count - 1) / (this.§_-E2J§ * this.§_-x16§) + 1;
         }
         if(this.§_-d1n§)
         {
            removeChild(this.§_-d1n§);
         }
         this.§_-d1n§ = new §_-Q2o§(this.§_-u1s§,this.dotSize * 2 + this.§_-u1s§ * this.dotSize);
         this.§_-d1n§.x = this.§_-32v§ + int((this.§_-E2J§ * (this.§_-i2s§ + this.offsetX) - this.offsetX - this.§_-d1n§.width) * 0.5);
         this.§_-d1n§.y = this.§_-xx§ * 2 + this.§_-x16§ * (this.§_-c28§ + this.offsetY);
         this.§_-d1n§.§_-32c§(0);
         this.§_-d1n§.§_-G0§(this.§_-jR§);
         this.§_-d1n§.visible = this.count > this.§_-E2J§ * this.§_-x16§;
         addChild(this.§_-d1n§);
         this.§_-B3w§();
      }
      
      protected function get dotSize() : int
      {
         return 25;
      }
      
      public function §_-81T§() : void
      {
         while(this.sprite.numChildren > 0)
         {
            this.sprite.removeChildAt(0);
         }
      }
      
      protected function §_-bX§() : void
      {
         if(!this.§_-Z2B§)
         {
            this.§_-Z2B§ = new §_-wc§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
            this.§_-Z2B§.x = -this.§_-Z2B§.width - 1;
            this.§_-Z2B§.y = this.§_-xx§ + this.§_-x16§ * (this.§_-c28§ + this.offsetY) * 0.5 - this.§_-Z2B§.height * 0.5;
            this.§_-Z2B§.visible = false;
         }
         if(!this.buttonNext)
         {
            this.buttonNext = new §_-wc§(new ButtonRewindRight(),new ButtonRewindRightInactive());
            this.buttonNext.x = this.§_-32v§ * 2 + this.§_-E2J§ * (this.§_-i2s§ + this.offsetX) - this.offsetX + 1;
            this.buttonNext.y = this.§_-xx§ + this.§_-x16§ * (this.§_-c28§ + this.offsetY) * 0.5 - this.buttonNext.height * 0.5;
            this.buttonNext.visible = false;
         }
         if(!this.§_-F2l§)
         {
            addChild(this.§_-Z2B§);
            addChild(this.buttonNext);
         }
         this.§_-Z2B§.addEventListener(MouseEvent.CLICK,this.§_-N2G§);
         this.buttonNext.addEventListener(MouseEvent.CLICK,this.§_-6C§);
         if(this.§_-s19§ == null)
         {
            return;
         }
         this.§_-s19§.addEventListener(MouseEvent.CLICK,this.§_-v2I§);
         addChild(this.§_-s19§);
         this.§_-F1m§.addEventListener(MouseEvent.CLICK,this.§_-62E§);
         addChild(this.§_-F1m§);
      }
      
      protected function §_-B3w§() : void
      {
      }
      
      protected function update() : void
      {
         if(this.data == null)
         {
            return;
         }
         var _loc1_:int = this.offset;
         while(_loc1_ < this.offset + this.§_-X2w§())
         {
            if(_loc1_ > this.data.objects.length - 1)
            {
               break;
            }
            this.data.objects[_loc1_].§_-027§();
            _loc1_++;
         }
         this.§_-83H§();
         this.updateButtons();
      }
      
      protected function §_-X2w§() : int
      {
         return this.§_-E2J§ * this.§_-x16§;
      }
      
      protected function §_-83H§() : void
      {
         var _loc4_:Sprite = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this.data == null)
         {
            return;
         }
         this.§_-81T§();
         var _loc1_:int = Math.min(this.offset + this.§_-E2J§ * this.§_-x16§,this.data.objects.length);
         var _loc2_:int = this.offset;
         var _loc3_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc4_ = this.data.objects[_loc2_];
            if(this.§_-72G§)
            {
               _loc4_.x = (this.§_-i2s§ + this.offsetX) * int((_loc2_ - this.offset) % this.§_-E2J§);
               _loc4_.y = (this.§_-c28§ + this.offsetY) * int((_loc2_ - this.offset) / this.§_-E2J§);
            }
            else
            {
               _loc5_ = _loc3_ % this.§_-x16§;
               _loc6_ = _loc3_ / this.§_-x16§;
               _loc4_.x = (this.§_-i2s§ + this.offsetX) * _loc6_;
               _loc4_.y = (this.§_-c28§ + this.offsetY) * _loc5_;
            }
            this.sprite.addChild(_loc4_);
            _loc2_++;
            _loc3_++;
         }
      }
      
      protected function updateButtons() : void
      {
         var _loc1_:Boolean = this.offset + this.§_-X2w§() < this.data.objects.length;
         this.buttonNext.setState(_loc1_);
         this.buttonNext.visible = this.data.objects.length > this.§_-X2w§();
         if(this.§_-s19§ != null)
         {
            this.§_-s19§.visible = this.buttonNext.visible;
            this.§_-s19§.setState(_loc1_);
         }
         var _loc2_:Boolean = this.offset > 0;
         this.§_-Z2B§.setState(_loc2_);
         this.§_-Z2B§.visible = this.data.objects.length > this.§_-X2w§();
         if(this.§_-F1m§ != null)
         {
            this.§_-F1m§.visible = this.§_-Z2B§.visible;
            this.§_-F1m§.setState(_loc2_);
         }
         if(!this.§_-F2l§)
         {
            return;
         }
         this.§_-B3w§();
      }
      
      protected function §_-jR§(param1:int, param2:int) : void
      {
         if(this.§_-NS§)
         {
            this.offset = Math.max(0,Math.min(param1,this.count - this.§_-E2J§ * this.§_-x16§));
         }
         else
         {
            this.offset = param1 * (this.§_-E2J§ * this.§_-x16§);
         }
         this.§_-v§ = param1;
         this.update();
      }
      
      private function §_-93v§(param1:TapeDataEvent) : void
      {
         this.update();
      }
      
      private function §_-6C§(param1:MouseEvent) : void
      {
         if(this.offset + this.§_-X2w§() >= this.data.objects.length)
         {
            return;
         }
         this.offset += this.§_-x16§;
      }
      
      private function §_-N2G§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         this.offset -= this.§_-x16§;
      }
      
      private function §_-v2I§(param1:MouseEvent) : void
      {
         if(this.offset + this.§_-X2w§() >= this.data.objects.length)
         {
            return;
         }
         this.offset += this.§_-X2w§();
      }
      
      private function §_-62E§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         this.offset -= this.§_-X2w§();
      }
   }
}

