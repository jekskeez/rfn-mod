package buttons
{
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-n1a§ extends §_-Hg§
   {
      
      private var §_-230§:int;
      
      private var §_-y2b§:int;
      
      private var offsetX:int;
      
      private var offsetY:int;
      
      private var §_-J1c§:int = 0;
      
      protected var §_-A1Z§:int;
      
      protected var §_-w1q§:int;
      
      protected var §_-GF§:Array = [];
      
      protected var buttonNext:§_-613§ = null;
      
      protected var buttonPrev:§_-613§ = null;
      
      public function §_-n1a§(param1:int, param2:int, param3:int, param4:int, param5:int = 0, param6:int = 0)
      {
         super();
         this.§_-A1Z§ = param2;
         this.§_-w1q§ = param1;
         this.§_-230§ = param3;
         this.§_-y2b§ = param4;
         this.offsetX = param5;
         this.offsetY = param6;
         this.§_-j2y§();
      }
      
      override public function insert(param1:§_-uH§, param2:* = null) : void
      {
         super.insert(param1,param2);
         this.§_-GF§.push(param1);
      }
      
      public function §_-E1Z§(param1:Number, param2:Point, param3:Point, param4:int = 0, param5:int = 0) : void
      {
         this.buttonNext = new §_-613§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         this.buttonPrev = new §_-613§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         this.buttonNext.scaleX = param1;
         this.buttonPrev.scaleX = param1;
         this.buttonNext.scaleY = this.buttonPrev.scaleY = param1;
         this.buttonNext.x = param2.x;
         this.buttonNext.y = param2.y;
         this.buttonPrev.x = param3.x;
         this.buttonPrev.y = param3.y;
         this.buttonNext.rotation = param4;
         this.buttonPrev.rotation = param5;
         this.§_-j2y§();
      }
      
      public function setData(param1:Array) : void
      {
         this.§_-GF§ = [];
         this.§_-J1c§ = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.insert(param1[_loc2_]);
            _loc2_++;
         }
         this.update();
      }
      
      public function get offset() : int
      {
         return this.§_-J1c§;
      }
      
      public function set offset(param1:int) : void
      {
         this.§_-J1c§ = param1;
         if(this.§_-GF§ != null)
         {
            this.§_-J1c§ = Math.min(this.§_-J1c§,this.§_-GF§.length);
         }
         this.§_-J1c§ = Math.max(this.§_-J1c§,0);
         this.update();
      }
      
      protected function update() : void
      {
         if(this.§_-GF§ == null)
         {
            return;
         }
         var _loc1_:int = this.offset;
         while(_loc1_ < this.offset + this.§_-A1Z§ * this.§_-w1q§)
         {
            if(_loc1_ > this.§_-GF§.length - 1)
            {
               break;
            }
            if(this.§_-GF§[_loc1_].sticked)
            {
               break;
            }
            _loc1_++;
         }
         this.§_-nZ§();
         this.updateButtons();
         if(_loc1_ == this.offset + this.§_-A1Z§ * this.§_-w1q§ || _loc1_ == this.§_-GF§.length)
         {
            if(this.offset - 1 >= 0 && Boolean(this.§_-GF§[this.offset - 1].sticked))
            {
               §_-l1Y§(this.§_-GF§[this.offset]);
            }
            else
            {
               §_-l1Y§(this.§_-GF§[this.offset + this.§_-A1Z§ * this.§_-w1q§ - 1]);
            }
         }
      }
      
      protected function §_-nZ§() : void
      {
         var _loc5_:§_-uH§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this.§_-GF§ == null)
         {
            return;
         }
         this.§_-S1q§();
         var _loc1_:Array = this.§_-GF§;
         var _loc2_:int = Math.min(this.offset + this.§_-A1Z§ * this.§_-w1q§,this.§_-GF§.length);
         var _loc3_:int = this.offset;
         var _loc4_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = _loc1_[_loc3_];
            _loc6_ = _loc4_ % this.§_-w1q§;
            _loc7_ = _loc4_ / this.§_-w1q§;
            _loc5_.x = _loc7_ == 0 ? 0 : _loc1_[_loc3_ - 1].x + _loc1_[_loc3_ - 1].width + this.offsetX;
            _loc5_.y = _loc6_ == 0 ? 0 : _loc1_[_loc3_ - 1].y + _loc1_[_loc3_ - 1].height + this.offsetY;
            addChild(_loc5_);
            _loc3_++;
            _loc4_++;
         }
      }
      
      protected function updateButtons() : void
      {
         var _loc1_:Boolean = this.offset + this.§_-A1Z§ * this.§_-w1q§ < this.§_-GF§.length;
         this.buttonNext.setState(_loc1_);
         this.buttonNext.visible = _loc1_;
         var _loc2_:Boolean = this.offset > 0;
         this.buttonPrev.setState(_loc2_);
         this.buttonPrev.visible = _loc2_;
      }
      
      protected function §_-j2y§() : void
      {
         if(!this.buttonPrev || !this.buttonNext)
         {
            return;
         }
         addChild(this.buttonPrev);
         addChild(this.buttonNext);
         this.buttonPrev.addEventListener(MouseEvent.CLICK,this.§_-SO§);
         this.buttonNext.addEventListener(MouseEvent.CLICK,this.§_-M12§);
      }
      
      private function §_-S1q§() : void
      {
         while(this.numChildren > 0)
         {
            removeChildAt(0);
         }
         addChild(this.buttonPrev);
         addChild(this.buttonNext);
      }
      
      private function §_-M12§(param1:MouseEvent) : void
      {
         if(this.offset + this.§_-A1Z§ * this.§_-w1q§ >= this.§_-GF§.length)
         {
            return;
         }
         this.offset += 1;
      }
      
      private function §_-SO§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         --this.offset;
      }
   }
}

