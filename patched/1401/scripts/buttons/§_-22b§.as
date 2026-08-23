package buttons
{
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-22b§ extends §_-G2L§
   {
      
      private var §_-32v§:int;
      
      private var §_-xx§:int;
      
      private var offsetX:int;
      
      private var offsetY:int;
      
      private var §_-H2O§:int = 0;
      
      protected var §_-E2J§:int;
      
      protected var §_-x16§:int;
      
      protected var §_-R14§:Array = [];
      
      protected var buttonNext:§_-wc§ = null;
      
      protected var buttonPrev:§_-wc§ = null;
      
      public function §_-22b§(param1:int, param2:int, param3:int, param4:int, param5:int = 0, param6:int = 0)
      {
         super();
         this.§_-E2J§ = param2;
         this.§_-x16§ = param1;
         this.§_-32v§ = param3;
         this.§_-xx§ = param4;
         this.offsetX = param5;
         this.offsetY = param6;
         this.§_-bX§();
      }
      
      override public function insert(param1:§_-F1F§, param2:* = null) : void
      {
         super.insert(param1,param2);
         this.§_-R14§.push(param1);
      }
      
      public function §_-D2s§(param1:Number, param2:Point, param3:Point, param4:int = 0, param5:int = 0) : void
      {
         this.buttonNext = new §_-wc§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         this.buttonPrev = new §_-wc§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         this.buttonNext.scaleX = param1;
         this.buttonPrev.scaleX = param1;
         this.buttonNext.scaleY = this.buttonPrev.scaleY = param1;
         this.buttonNext.x = param2.x;
         this.buttonNext.y = param2.y;
         this.buttonPrev.x = param3.x;
         this.buttonPrev.y = param3.y;
         this.buttonNext.rotation = param4;
         this.buttonPrev.rotation = param5;
         this.§_-bX§();
      }
      
      public function setData(param1:Array) : void
      {
         this.§_-R14§ = [];
         this.§_-H2O§ = 0;
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
         return this.§_-H2O§;
      }
      
      public function set offset(param1:int) : void
      {
         this.§_-H2O§ = param1;
         if(this.§_-R14§ != null)
         {
            this.§_-H2O§ = Math.min(this.§_-H2O§,this.§_-R14§.length);
         }
         this.§_-H2O§ = Math.max(this.§_-H2O§,0);
         this.update();
      }
      
      protected function update() : void
      {
         if(this.§_-R14§ == null)
         {
            return;
         }
         var _loc1_:int = this.offset;
         while(_loc1_ < this.offset + this.§_-E2J§ * this.§_-x16§)
         {
            if(_loc1_ > this.§_-R14§.length - 1)
            {
               break;
            }
            if(this.§_-R14§[_loc1_].sticked)
            {
               break;
            }
            _loc1_++;
         }
         this.§_-83H§();
         this.updateButtons();
         if(_loc1_ == this.offset + this.§_-E2J§ * this.§_-x16§ || _loc1_ == this.§_-R14§.length)
         {
            if(this.offset - 1 >= 0 && Boolean(this.§_-R14§[this.offset - 1].sticked))
            {
               §_-32c§(this.§_-R14§[this.offset]);
            }
            else
            {
               §_-32c§(this.§_-R14§[this.offset + this.§_-E2J§ * this.§_-x16§ - 1]);
            }
         }
      }
      
      protected function §_-83H§() : void
      {
         var _loc5_:§_-F1F§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this.§_-R14§ == null)
         {
            return;
         }
         this.§_-81T§();
         var _loc1_:Array = this.§_-R14§;
         var _loc2_:int = Math.min(this.offset + this.§_-E2J§ * this.§_-x16§,this.§_-R14§.length);
         var _loc3_:int = this.offset;
         var _loc4_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = _loc1_[_loc3_];
            _loc6_ = _loc4_ % this.§_-x16§;
            _loc7_ = _loc4_ / this.§_-x16§;
            _loc5_.x = _loc7_ == 0 ? 0 : _loc1_[_loc3_ - 1].x + _loc1_[_loc3_ - 1].width + this.offsetX;
            _loc5_.y = _loc6_ == 0 ? 0 : _loc1_[_loc3_ - 1].y + _loc1_[_loc3_ - 1].height + this.offsetY;
            addChild(_loc5_);
            _loc3_++;
            _loc4_++;
         }
      }
      
      protected function updateButtons() : void
      {
         var _loc1_:Boolean = this.offset + this.§_-E2J§ * this.§_-x16§ < this.§_-R14§.length;
         this.buttonNext.setState(_loc1_);
         this.buttonNext.visible = _loc1_;
         var _loc2_:Boolean = this.offset > 0;
         this.buttonPrev.setState(_loc2_);
         this.buttonPrev.visible = _loc2_;
      }
      
      protected function §_-bX§() : void
      {
         if(!this.buttonPrev || !this.buttonNext)
         {
            return;
         }
         addChild(this.buttonPrev);
         addChild(this.buttonNext);
         this.buttonPrev.addEventListener(MouseEvent.CLICK,this.§_-N2G§);
         this.buttonNext.addEventListener(MouseEvent.CLICK,this.§_-6C§);
      }
      
      private function §_-81T§() : void
      {
         while(this.numChildren > 0)
         {
            removeChildAt(0);
         }
         addChild(this.buttonPrev);
         addChild(this.buttonNext);
      }
      
      private function §_-6C§(param1:MouseEvent) : void
      {
         if(this.offset + this.§_-E2J§ * this.§_-x16§ >= this.§_-R14§.length)
         {
            return;
         }
         this.offset += 1;
      }
      
      private function §_-N2G§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         --this.offset;
      }
   }
}

