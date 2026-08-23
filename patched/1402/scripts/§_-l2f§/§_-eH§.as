package §_-l2f§
{
   import §_-31v§.§_-G1L§;
   import §_-31v§.§_-vi§;
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-C2b§;
   import §_-X1k§.§_-u2n§;
   import §_-bN§.Dialog;
   import §_-c2C§.§_-j2f§;
   import buttons.§_-Hg§;
   import buttons.§_-Q1W§;
   import buttons.§_-uH§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   
   public class §_-eH§ extends Dialog
   {
      
      private var §_-x10§:Sprite;
      
      private var §_-r16§:§_-Hg§;
      
      private var §_-SW§:Object = {};
      
      private var §_-ki§:int = 0;
      
      private var seenEvents:Array;
      
      private var §_-714§:Object;
      
      public function §_-eH§()
      {
         super(gls("Ореховый Пропуск"),true,true,null,false);
         this.§_-x10§ = new Sprite();
         this.§_-x10§.graphics.lineStyle(3,15522236);
         this.§_-x10§.graphics.beginFill(16774885,1);
         this.§_-x10§.graphics.drawRect(this.§_-01q§,46,420,482);
         this.§_-x10§.graphics.endFill();
         addChild(this.§_-x10§);
         this.§_-92X§();
         place();
         this.height = 571;
         this.§_-x2T§.x -= 15;
         this.§_-x2T§.y += 5;
         NuttyPassManager.addEventListener(NuttyPassManager.CHANGE,this.§_-G1W§);
      }
      
      override public function show() : void
      {
         super.show();
         this.redrawModalBackdrop();
         if(this.§_-r16§.§_-a3§.length > 0)
         {
            this.§_-r16§.§_-n10§(0);
         }
         this.§_-02S§(true);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         if(this.seenEvents)
         {
            §_-u2n§.§_-KQ§(this.seenEvents);
            this.seenEvents = null;
         }
         this.§_-714§ = null;
         super.hide(param1);
      }
      
      public function §_-t1u§(param1:int, param2:Array = null) : void
      {
         var _loc4_:int = 0;
         if(param1 <= 0 || this.§_-r16§.§_-a3§.length == 0)
         {
            return;
         }
         this.seenEvents = param2;
         var _loc3_:int = 0;
         for each(_loc4_ in §_-C2b§.§_-78§)
         {
            if(NuttyPassManager.§_-K2s§(_loc4_))
            {
               if(_loc4_ == param1)
               {
                  this.§_-r16§.§_-n10§(_loc3_);
                  return;
               }
               _loc3_++;
            }
         }
      }
      
      override protected function redrawModalBackdrop() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.1);
         this.graphics.drawRect(-this.x,-this.y,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
         this.graphics.endFill();
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 10;
         this.§_-7N§ = 5;
         this.topOffset = 5;
         this.§_-f2d§ = 0;
      }
      
      private function §_-G1W§(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(this.§_-S2m§() != this.§_-ki§)
         {
            this.§_-zc§();
            this.§_-92X§();
            if(this.§_-r16§.§_-a3§.length > 0)
            {
               this.§_-r16§.§_-n10§(0);
            }
            this.§_-02S§(true);
            return;
         }
         for each(_loc2_ in §_-C2b§.§_-78§)
         {
            this.§_-Fd§(_loc2_);
         }
         this.§_-02S§(false);
      }
      
      private function §_-02S§(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Object = param1 ? {} : this.§_-714§;
         if(!param1 && !_loc2_)
         {
            return;
         }
         for each(_loc3_ in §_-C2b§.§_-78§)
         {
            if(NuttyPassManager.§_-K2s§(_loc3_))
            {
               _loc4_ = Math.max(1,NuttyPassManager.§_-82P§(_loc3_));
               if(!param1 && _loc2_[_loc3_] !== undefined && _loc4_ > int(_loc2_[_loc3_]))
               {
                  GameSounds.play("level_up");
               }
               _loc2_[_loc3_] = _loc4_;
            }
         }
         if(param1)
         {
            this.§_-714§ = _loc2_;
         }
      }
      
      private function §_-Fd§(param1:int) : void
      {
         var _loc2_:Sprite = this.§_-SW§[param1];
         if(!_loc2_ || _loc2_.numChildren == 0)
         {
            return;
         }
         if(!(_loc2_.getChildAt(0) is §_-vi§) || NuttyPassManager.§_-n1H§(param1))
         {
            return;
         }
         while(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         _loc2_.addChild(new §_-G1L§(param1));
      }
      
      private function §_-S2m§() : int
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 1;
         for each(_loc3_ in §_-C2b§.§_-78§)
         {
            if(NuttyPassManager.§_-K2s§(_loc3_))
            {
               _loc1_ |= _loc2_;
            }
            _loc2_ <<= 1;
         }
         return _loc1_;
      }
      
      private function §_-zc§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Sprite = null;
         for each(_loc1_ in §_-C2b§.§_-78§)
         {
            _loc2_ = this.§_-SW§[_loc1_];
            if(Boolean(_loc2_) && Boolean(_loc2_.parent))
            {
               removeChild(_loc2_);
            }
         }
         this.§_-SW§ = {};
         if(Boolean(this.§_-r16§) && Boolean(this.§_-r16§.parent))
         {
            removeChild(this.§_-r16§);
         }
         this.§_-r16§ = null;
      }
      
      private function §_-92X§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this.§_-r16§ = new §_-Hg§();
         this.§_-r16§.x = this.§_-01q§ - 4.5;
         this.§_-r16§.y = this.topOffset + 5;
         addChild(this.§_-r16§);
         for each(_loc1_ in §_-C2b§.§_-78§)
         {
            if(NuttyPassManager.§_-K2s§(_loc1_))
            {
               this.§_-SW§[_loc1_] = this.§_-h7§(_loc1_);
            }
         }
         _loc2_ = this.§_-r16§.y + this.§_-r16§.height + 8;
         for each(_loc1_ in §_-C2b§.§_-78§)
         {
            if(this.§_-SW§[_loc1_])
            {
               this.§_-SW§[_loc1_].y = _loc2_;
            }
         }
         this.§_-ki§ = this.§_-S2m§();
      }
      
      private function §_-h7§(param1:int) : Sprite
      {
         var _loc7_:* = undefined;
         var _loc2_:§_-uH§ = new §_-uH§(new §_-Q1W§("",§_-j2f§.§_-D12§,ButtonNuttyPassTabTriple,13,0));
         var _loc3_:Class = §_-C2b§.§_-K2T§(param1);
         var _loc4_:Sprite = new _loc3_();
         _loc4_.x = 4 + (_loc2_.width - _loc4_.width) * 0.5;
         _loc4_.y = 2 + (_loc2_.height - _loc4_.height) * 0.5;
         _loc2_.addChild(_loc4_);
         var _loc5_:int = int(this.§_-r16§.§_-a3§.length);
         if(_loc5_ > 0)
         {
            _loc7_ = this.§_-r16§.§_-a3§[_loc5_ - 1];
            _loc2_.x = _loc7_.x + _loc7_.width + 3;
         }
         var _loc6_:Sprite = new Sprite();
         _loc6_.x = this.§_-01q§ + 5;
         _loc6_.addChild(this.§_-T2y§(param1));
         addChild(_loc6_);
         this.§_-r16§.insert(_loc2_,_loc6_);
         return _loc6_;
      }
      
      private function §_-T2y§(param1:int) : Sprite
      {
         if(!NuttyPassManager.§_-n1H§(param1))
         {
            return new §_-G1L§(param1);
         }
         if(param1 == §_-C2b§.§_-pP§)
         {
            return new §_-vi§(param1,0,NuttyPassManager.§_-L1D§);
         }
         return new §_-vi§(param1,NuttyPassManager.§_-xo§(param1));
      }
   }
}

