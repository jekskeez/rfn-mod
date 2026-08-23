package §_-em§
{
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-82N§;
   import §_-I10§.§_-a1D§;
   import §_-I1W§.§_-J2z§;
   import §_-I1W§.§_-Uy§;
   import §_-T2y§.§_-J2n§;
   import §_-k1c§.Dialog;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import buttons.§_-T2z§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   
   public class §_-S2c§ extends Dialog
   {
      
      private var §_-L1t§:Sprite;
      
      private var §_-P1S§:§_-G2L§;
      
      private var §_-j1v§:Object = {};
      
      private var §_-T1m§:int = 0;
      
      private var seenEvents:Array;
      
      private var §_-EJ§:Object;
      
      public function §_-S2c§()
      {
         super(gls("Ореховый Пропуск"),true,true,null,false);
         this.§_-L1t§ = new Sprite();
         this.§_-L1t§.graphics.lineStyle(3,15522236);
         this.§_-L1t§.graphics.beginFill(16774885,1);
         this.§_-L1t§.graphics.drawRect(this.§_-R1Y§,46,420,482);
         this.§_-L1t§.graphics.endFill();
         addChild(this.§_-L1t§);
         this.§_-9B§();
         place();
         this.height = 571;
         this.§_-O2e§.x -= 15;
         this.§_-O2e§.y += 5;
         NuttyPassManager.addEventListener(NuttyPassManager.CHANGE,this.§_-UO§);
      }
      
      override public function show() : void
      {
         super.show();
         this.redrawModalBackdrop();
         if(this.§_-P1S§.§_-Y2N§.length > 0)
         {
            this.§_-P1S§.§_-vC§(0);
         }
         this.§_-I2r§(true);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         if(this.seenEvents)
         {
            §_-82N§.§_-s1o§(this.seenEvents);
            this.seenEvents = null;
         }
         this.§_-EJ§ = null;
         super.hide(param1);
      }
      
      public function §_-u2M§(param1:int, param2:Array = null) : void
      {
         var _loc4_:int = 0;
         if(param1 <= 0 || this.§_-P1S§.§_-Y2N§.length == 0)
         {
            return;
         }
         this.seenEvents = param2;
         var _loc3_:int = 0;
         for each(_loc4_ in §_-a1D§.§_-Yh§)
         {
            if(NuttyPassManager.§_-m1t§(_loc4_))
            {
               if(_loc4_ == param1)
               {
                  this.§_-P1S§.§_-vC§(_loc3_);
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
         this.§_-R1Y§ = 10;
         this.§_-4n§ = 5;
         this.topOffset = 5;
         this.§_-JZ§ = 0;
      }
      
      private function §_-UO§(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(this.§_-Yt§() != this.§_-T1m§)
         {
            this.§_-de§();
            this.§_-9B§();
            if(this.§_-P1S§.§_-Y2N§.length > 0)
            {
               this.§_-P1S§.§_-vC§(0);
            }
            this.§_-I2r§(true);
            return;
         }
         for each(_loc2_ in §_-a1D§.§_-Yh§)
         {
            this.§_-D1l§(_loc2_);
         }
         this.§_-I2r§(false);
      }
      
      private function §_-I2r§(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Object = param1 ? {} : this.§_-EJ§;
         if(!param1 && !_loc2_)
         {
            return;
         }
         for each(_loc3_ in §_-a1D§.§_-Yh§)
         {
            if(NuttyPassManager.§_-m1t§(_loc3_))
            {
               _loc4_ = Math.max(1,NuttyPassManager.§_-A1x§(_loc3_));
               if(!param1 && _loc2_[_loc3_] !== undefined && _loc4_ > int(_loc2_[_loc3_]))
               {
                  GameSounds.play("level_up");
               }
               _loc2_[_loc3_] = _loc4_;
            }
         }
         if(param1)
         {
            this.§_-EJ§ = _loc2_;
         }
      }
      
      private function §_-D1l§(param1:int) : void
      {
         var _loc2_:Sprite = this.§_-j1v§[param1];
         if(!_loc2_ || _loc2_.numChildren == 0)
         {
            return;
         }
         if(!(_loc2_.getChildAt(0) is §_-J2z§) || NuttyPassManager.§_-s1H§(param1))
         {
            return;
         }
         while(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         _loc2_.addChild(new §_-Uy§(param1));
      }
      
      private function §_-Yt§() : int
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = 1;
         for each(_loc3_ in §_-a1D§.§_-Yh§)
         {
            if(NuttyPassManager.§_-m1t§(_loc3_))
            {
               _loc1_ |= _loc2_;
            }
            _loc2_ <<= 1;
         }
         return _loc1_;
      }
      
      private function §_-de§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Sprite = null;
         for each(_loc1_ in §_-a1D§.§_-Yh§)
         {
            _loc2_ = this.§_-j1v§[_loc1_];
            if(Boolean(_loc2_) && Boolean(_loc2_.parent))
            {
               removeChild(_loc2_);
            }
         }
         this.§_-j1v§ = {};
         if(Boolean(this.§_-P1S§) && Boolean(this.§_-P1S§.parent))
         {
            removeChild(this.§_-P1S§);
         }
         this.§_-P1S§ = null;
      }
      
      private function §_-9B§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this.§_-P1S§ = new §_-G2L§();
         this.§_-P1S§.x = this.§_-R1Y§ - 4.5;
         this.§_-P1S§.y = this.topOffset + 5;
         addChild(this.§_-P1S§);
         for each(_loc1_ in §_-a1D§.§_-Yh§)
         {
            if(NuttyPassManager.§_-m1t§(_loc1_))
            {
               this.§_-j1v§[_loc1_] = this.§_-Sg§(_loc1_);
            }
         }
         _loc2_ = this.§_-P1S§.y + this.§_-P1S§.height + 8;
         for each(_loc1_ in §_-a1D§.§_-Yh§)
         {
            if(this.§_-j1v§[_loc1_])
            {
               this.§_-j1v§[_loc1_].y = _loc2_;
            }
         }
         this.§_-T1m§ = this.§_-Yt§();
      }
      
      private function §_-Sg§(param1:int) : Sprite
      {
         var _loc7_:* = undefined;
         var _loc2_:§_-F1F§ = new §_-F1F§(new §_-T2z§("",§_-J2n§.§_-HM§,ButtonNuttyPassTabTriple,13,0));
         var _loc3_:Class = §_-a1D§.§_-1A§(param1);
         var _loc4_:Sprite = new _loc3_();
         _loc4_.x = 4 + (_loc2_.width - _loc4_.width) * 0.5;
         _loc4_.y = 2 + (_loc2_.height - _loc4_.height) * 0.5;
         _loc2_.addChild(_loc4_);
         var _loc5_:int = int(this.§_-P1S§.§_-Y2N§.length);
         if(_loc5_ > 0)
         {
            _loc7_ = this.§_-P1S§.§_-Y2N§[_loc5_ - 1];
            _loc2_.x = _loc7_.x + _loc7_.width + 3;
         }
         var _loc6_:Sprite = new Sprite();
         _loc6_.x = this.§_-R1Y§ + 5;
         _loc6_.addChild(this.§_-k2Q§(param1));
         addChild(_loc6_);
         this.§_-P1S§.insert(_loc2_,_loc6_);
         return _loc6_;
      }
      
      private function §_-k2Q§(param1:int) : Sprite
      {
         if(!NuttyPassManager.§_-s1H§(param1))
         {
            return new §_-Uy§(param1);
         }
         if(param1 == §_-a1D§.§_-81j§)
         {
            return new §_-J2z§(param1,0,NuttyPassManager.§_-21m§);
         }
         return new §_-J2z§(param1,NuttyPassManager.§_-e2b§(param1));
      }
   }
}

