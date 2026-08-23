package §_-K2c§
{
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import starling.display.DisplayObject;
   import starling.display.Stage;
   
   public class §_-YR§
   {
      
      private static var §_-w1k§:Vector.<§_-e2m§> = new Vector.<§_-e2m§>(0);
      
      private static var §_-e2u§:Vector.<Object> = new Vector.<Object>(0);
      
      private static var §_-G2g§:Point = new Point();
      
      private var mStage:Stage;
      
      private var §_-mp§:DisplayObject;
      
      private var §_-M1U§:Number;
      
      private var §_-W1G§:§_-H22§;
      
      private var §_-n1d§:Vector.<§_-e2m§>;
      
      private var §_-93y§:Boolean = false;
      
      private var §_-A3H§:Boolean = false;
      
      private var §_-w2k§:Number = 0.3;
      
      private var §_-61f§:Number = 25;
      
      protected var §_-F1§:Vector.<Array>;
      
      protected var §_-82n§:Vector.<§_-e2m§>;
      
      public function §_-YR§(param1:Stage)
      {
         super();
         this.§_-mp§ = this.mStage = param1;
         this.§_-M1U§ = 0;
         this.§_-82n§ = new Vector.<§_-e2m§>(0);
         this.§_-F1§ = new Vector.<Array>(0);
         this.§_-n1d§ = new Vector.<§_-e2m§>(0);
         this.mStage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
         this.mStage.addEventListener(KeyboardEvent.KEY_UP,this.§_-21G§);
         this.§_-d8§(true);
      }
      
      public function dispose() : void
      {
         this.§_-d8§(false);
         this.mStage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
         this.mStage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-21G§);
         if(this.§_-W1G§)
         {
            this.§_-W1G§.dispose();
         }
      }
      
      public function §_-ld§(param1:Number) : void
      {
         var _loc2_:* = 0;
         var _loc3_:§_-e2m§ = null;
         var _loc4_:Array = null;
         this.§_-M1U§ += param1;
         §_-w1k§.length = 0;
         if(this.§_-n1d§.length > 0)
         {
            _loc2_ = int(this.§_-n1d§.length - 1);
            while(_loc2_ >= 0)
            {
               if(this.§_-M1U§ - this.§_-n1d§[_loc2_].§_-n2B§ > this.§_-w2k§)
               {
                  this.§_-n1d§.splice(_loc2_,1);
               }
               _loc2_--;
            }
         }
         while(this.§_-F1§.length > 0)
         {
            for each(_loc3_ in this.§_-82n§)
            {
               if(_loc3_.§_-Q2S§ == §_-sj§.§_-ML§ || _loc3_.§_-Q2S§ == §_-sj§.§_-i23§)
               {
                  _loc3_.§_-Q2S§ = §_-sj§.§_-61c§;
               }
            }
            while(this.§_-F1§.length > 0 && !this.§_-P2L§(§_-w1k§,this.§_-F1§[this.§_-F1§.length - 1][0]))
            {
               _loc4_ = this.§_-F1§.pop();
               _loc3_ = this.§_-p1N§(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6]);
               §_-w1k§[§_-w1k§.length] = _loc3_;
            }
            this.§_-p1l§(§_-w1k§,this.§_-93y§,this.§_-A3H§);
            _loc2_ = int(this.§_-82n§.length - 1);
            while(_loc2_ >= 0)
            {
               if(this.§_-82n§[_loc2_].§_-Q2S§ == §_-sj§.§_-L23§)
               {
                  this.§_-82n§.splice(_loc2_,1);
               }
               _loc2_--;
            }
            §_-w1k§.length = 0;
         }
      }
      
      protected function §_-p1l§(param1:Vector.<§_-e2m§>, param2:Boolean, param3:Boolean) : void
      {
         var _loc5_:§_-e2m§ = null;
         var _loc6_:Object = null;
         §_-e2u§.length = 0;
         var _loc4_:TouchEvent = new TouchEvent(TouchEvent.§_-N1l§,this.§_-82n§,param2,param3);
         for each(_loc5_ in param1)
         {
            if(_loc5_.§_-Q2S§ == §_-sj§.§_-X2J§ && Boolean(_loc5_.target))
            {
               §_-e2u§[§_-e2u§.length] = {
                  "touch":_loc5_,
                  "target":_loc5_.target,
                  "bubbleChain":_loc5_.bubbleChain
               };
            }
            if(_loc5_.§_-Q2S§ == §_-sj§.§_-X2J§ || _loc5_.§_-Q2S§ == §_-sj§.§_-ML§)
            {
               §_-G2g§.setTo(_loc5_.§_-n2h§,_loc5_.§_-Zv§);
               _loc5_.target = this.§_-mp§.hitTest(§_-G2g§,true);
            }
         }
         for each(_loc6_ in §_-e2u§)
         {
            if(_loc6_.touch.target != _loc6_.target)
            {
               _loc4_.dispatch(_loc6_.bubbleChain);
            }
         }
         for each(_loc5_ in param1)
         {
            _loc5_.dispatchEvent(_loc4_);
         }
      }
      
      public function §_-43O§(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1, param6:Number = 1, param7:Number = 1) : void
      {
         this.§_-F1§.unshift(arguments);
         if(this.§_-A3H§ && this.§_-D2A§ && param1 == 0)
         {
            this.§_-W1G§.§_-522§(param3,param4,this.§_-93y§);
            this.§_-F1§.unshift([1,param2,this.§_-W1G§.§_-m2y§,this.§_-W1G§.§_-R1T§]);
         }
      }
      
      public function §_-Cs§() : void
      {
         var _loc1_:§_-e2m§ = this.§_-r1A§(0);
         if(_loc1_ == null || _loc1_.§_-Q2S§ != §_-sj§.§_-X2J§)
         {
            return;
         }
         var _loc2_:int = 1;
         var _loc3_:Number = _loc1_.§_-n2h§;
         var _loc4_:Number = _loc1_.§_-Zv§;
         var _loc5_:Number = _loc1_.§_-n2h§;
         var _loc6_:Number = this.mStage.stageWidth - _loc5_;
         var _loc7_:Number = _loc1_.§_-Zv§;
         var _loc8_:Number = this.mStage.stageHeight - _loc7_;
         var _loc9_:Number = Math.min(_loc5_,_loc6_,_loc7_,_loc8_);
         if(_loc9_ == _loc5_)
         {
            _loc3_ = -_loc2_;
         }
         else if(_loc9_ == _loc6_)
         {
            _loc3_ = this.mStage.stageWidth + _loc2_;
         }
         else if(_loc9_ == _loc7_)
         {
            _loc4_ = -_loc2_;
         }
         else
         {
            _loc4_ = this.mStage.stageHeight + _loc2_;
         }
         this.§_-43O§(0,§_-sj§.§_-X2J§,_loc3_,_loc4_);
      }
      
      public function §_-B2c§() : void
      {
         var _loc1_:§_-e2m§ = null;
         if(this.§_-82n§.length > 0)
         {
            for each(_loc1_ in this.§_-82n§)
            {
               if(_loc1_.§_-Q2S§ == §_-sj§.§_-ML§ || _loc1_.§_-Q2S§ == §_-sj§.§_-i23§ || _loc1_.§_-Q2S§ == §_-sj§.§_-61c§)
               {
                  _loc1_.§_-Q2S§ = §_-sj§.§_-L23§;
                  _loc1_.§_-91e§ = true;
               }
            }
            this.§_-p1l§(this.§_-82n§,this.§_-93y§,this.§_-A3H§);
         }
         this.§_-82n§.length = 0;
         this.§_-F1§.length = 0;
      }
      
      private function §_-p1N§(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1, param6:Number = 1, param7:Number = 1) : §_-e2m§
      {
         var _loc8_:§_-e2m§ = this.§_-r1A§(param1);
         if(_loc8_ == null)
         {
            _loc8_ = new §_-e2m§(param1);
            this.§_-62I§(_loc8_);
         }
         _loc8_.§_-n2h§ = param3;
         _loc8_.§_-Zv§ = param4;
         _loc8_.§_-Q2S§ = param2;
         _loc8_.§_-n2B§ = this.§_-M1U§;
         _loc8_.pressure = param5;
         _loc8_.width = param6;
         _loc8_.height = param7;
         if(param2 == §_-sj§.§_-ML§)
         {
            this.§_-s1T§(_loc8_);
         }
         return _loc8_;
      }
      
      private function §_-s1T§(param1:§_-e2m§) : void
      {
         var _loc4_:§_-e2m§ = null;
         var _loc5_:Number = NaN;
         var _loc2_:§_-e2m§ = null;
         var _loc3_:Number = this.§_-61f§ * this.§_-61f§;
         for each(_loc4_ in this.§_-n1d§)
         {
            _loc5_ = Math.pow(_loc4_.§_-n2h§ - param1.§_-n2h§,2) + Math.pow(_loc4_.§_-Zv§ - param1.§_-Zv§,2);
            if(_loc5_ <= _loc3_)
            {
               _loc2_ = _loc4_;
               break;
            }
         }
         if(_loc2_)
         {
            param1.§_-l2B§ = _loc2_.§_-l2B§ + 1;
            this.§_-n1d§.splice(this.§_-n1d§.indexOf(_loc2_),1);
         }
         else
         {
            param1.§_-l2B§ = 1;
         }
         this.§_-n1d§.push(param1.clone());
      }
      
      private function §_-62I§(param1:§_-e2m§) : void
      {
         var _loc2_:* = int(this.§_-82n§.length - 1);
         while(_loc2_ >= 0)
         {
            if(this.§_-82n§[_loc2_].id == param1.id)
            {
               this.§_-82n§.splice(_loc2_,1);
            }
            _loc2_--;
         }
         this.§_-82n§.push(param1);
      }
      
      private function §_-r1A§(param1:int) : §_-e2m§
      {
         var _loc2_:§_-e2m§ = null;
         for each(_loc2_ in this.§_-82n§)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function §_-P2L§(param1:Vector.<§_-e2m§>, param2:int) : Boolean
      {
         var _loc3_:§_-e2m§ = null;
         for each(_loc3_ in param1)
         {
            if(_loc3_.id == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get §_-D2A§() : Boolean
      {
         return this.§_-W1G§ != null;
      }
      
      public function set §_-D2A§(param1:Boolean) : void
      {
         if(this.§_-D2A§ == param1)
         {
            return;
         }
         if(param1)
         {
            this.§_-W1G§ = new §_-H22§();
            this.§_-W1G§.visible = false;
            this.mStage.addChild(this.§_-W1G§);
         }
         else
         {
            this.§_-W1G§.removeFromParent(true);
            this.§_-W1G§ = null;
         }
      }
      
      public function get §_-t6§() : Number
      {
         return this.§_-w2k§;
      }
      
      public function set §_-t6§(param1:Number) : void
      {
         this.§_-w2k§ = param1;
      }
      
      public function get §_-2w§() : Number
      {
         return this.§_-61f§;
      }
      
      public function set §_-2w§(param1:Number) : void
      {
         this.§_-61f§ = param1;
      }
      
      public function get root() : DisplayObject
      {
         return this.§_-mp§;
      }
      
      public function set root(param1:DisplayObject) : void
      {
         this.§_-mp§ = param1;
      }
      
      public function get stage() : Stage
      {
         return this.mStage;
      }
      
      public function get §_-zA§() : int
      {
         return this.§_-82n§.length;
      }
      
      private function §_-21G§(param1:KeyboardEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:§_-e2m§ = null;
         var _loc4_:§_-e2m§ = null;
         if(param1.keyCode == 17 || param1.keyCode == 15)
         {
            _loc2_ = this.§_-A3H§;
            this.§_-A3H§ = param1.type == KeyboardEvent.KEY_DOWN;
            if(this.§_-D2A§ && _loc2_ != this.§_-A3H§)
            {
               this.§_-W1G§.visible = this.§_-A3H§;
               this.§_-W1G§.§_-k2A§(this.mStage.stageWidth / 2,this.mStage.stageHeight / 2);
               _loc3_ = this.§_-r1A§(0);
               _loc4_ = this.§_-r1A§(1);
               if(_loc3_)
               {
                  this.§_-W1G§.§_-522§(_loc3_.§_-n2h§,_loc3_.§_-Zv§);
               }
               if(Boolean(_loc2_) && Boolean(_loc4_) && _loc4_.§_-Q2S§ != §_-sj§.§_-L23§)
               {
                  this.§_-F1§.unshift([1,§_-sj§.§_-L23§,_loc4_.§_-n2h§,_loc4_.§_-Zv§]);
               }
               else if(this.§_-A3H§ && Boolean(_loc3_))
               {
                  if(_loc3_.§_-Q2S§ == §_-sj§.§_-X2J§ || _loc3_.§_-Q2S§ == §_-sj§.§_-L23§)
                  {
                     this.§_-F1§.unshift([1,§_-sj§.§_-X2J§,this.§_-W1G§.§_-m2y§,this.§_-W1G§.§_-R1T§]);
                  }
                  else
                  {
                     this.§_-F1§.unshift([1,§_-sj§.§_-ML§,this.§_-W1G§.§_-m2y§,this.§_-W1G§.§_-R1T§]);
                  }
               }
            }
         }
         else if(param1.keyCode == 16)
         {
            this.§_-93y§ = param1.type == KeyboardEvent.KEY_DOWN;
         }
      }
      
      private function §_-d8§(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         try
         {
            _loc2_ = getDefinitionByName("flash.desktop::NativeApplication");
            _loc3_ = _loc2_["nativeApplication"];
            if(param1)
            {
               _loc3_.addEventListener("deactivate",this.§_-c21§,false,0,true);
            }
            else
            {
               _loc3_.removeEventListener("deactivate",this.§_-c21§);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function §_-c21§(param1:Object) : void
      {
         this.§_-B2c§();
      }
   }
}

