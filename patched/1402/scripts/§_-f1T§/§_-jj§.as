package §_-f1T§
{
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import starling.display.DisplayObject;
   import starling.display.Stage;
   
   public class §_-jj§
   {
      
      private static var §_-sD§:Vector.<§_-J1a§> = new Vector.<§_-J1a§>(0);
      
      private static var §_-W2G§:Vector.<Object> = new Vector.<Object>(0);
      
      private static var §_-O§:Point = new Point();
      
      private var mStage:Stage;
      
      private var §_-X13§:DisplayObject;
      
      private var §_-Mp§:Number;
      
      private var §_-72q§:§_-V1r§;
      
      private var §_-fR§:Vector.<§_-J1a§>;
      
      private var §_-O5§:Boolean = false;
      
      private var §_-X19§:Boolean = false;
      
      private var §_-g1l§:Number = 0.3;
      
      private var §_-C3f§:Number = 25;
      
      protected var §_-fs§:Vector.<Array>;
      
      protected var §_-tX§:Vector.<§_-J1a§>;
      
      public function §_-jj§(param1:Stage)
      {
         super();
         this.§_-X13§ = this.mStage = param1;
         this.§_-Mp§ = 0;
         this.§_-tX§ = new Vector.<§_-J1a§>(0);
         this.§_-fs§ = new Vector.<Array>(0);
         this.§_-fR§ = new Vector.<§_-J1a§>(0);
         this.mStage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
         this.mStage.addEventListener(KeyboardEvent.KEY_UP,this.§_-r1i§);
         this.§_-t2g§(true);
      }
      
      public function dispose() : void
      {
         this.§_-t2g§(false);
         this.mStage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
         this.mStage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-r1i§);
         if(this.§_-72q§)
         {
            this.§_-72q§.dispose();
         }
      }
      
      public function §_-a1Q§(param1:Number) : void
      {
         var _loc2_:* = 0;
         var _loc3_:§_-J1a§ = null;
         var _loc4_:Array = null;
         this.§_-Mp§ += param1;
         §_-sD§.length = 0;
         if(this.§_-fR§.length > 0)
         {
            _loc2_ = int(this.§_-fR§.length - 1);
            while(_loc2_ >= 0)
            {
               if(this.§_-Mp§ - this.§_-fR§[_loc2_].§_-EK§ > this.§_-g1l§)
               {
                  this.§_-fR§.splice(_loc2_,1);
               }
               _loc2_--;
            }
         }
         while(this.§_-fs§.length > 0)
         {
            for each(_loc3_ in this.§_-tX§)
            {
               if(_loc3_.§_-iR§ == §_-01Z§.§_-N1v§ || _loc3_.§_-iR§ == §_-01Z§.§_-kg§)
               {
                  _loc3_.§_-iR§ = §_-01Z§.§_-02I§;
               }
            }
            while(this.§_-fs§.length > 0 && !this.§_-E1R§(§_-sD§,this.§_-fs§[this.§_-fs§.length - 1][0]))
            {
               _loc4_ = this.§_-fs§.pop();
               _loc3_ = this.§_-61X§(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6]);
               §_-sD§[§_-sD§.length] = _loc3_;
            }
            this.§_-t10§(§_-sD§,this.§_-O5§,this.§_-X19§);
            _loc2_ = int(this.§_-tX§.length - 1);
            while(_loc2_ >= 0)
            {
               if(this.§_-tX§[_loc2_].§_-iR§ == §_-01Z§.§_-1Z§)
               {
                  this.§_-tX§.splice(_loc2_,1);
               }
               _loc2_--;
            }
            §_-sD§.length = 0;
         }
      }
      
      protected function §_-t10§(param1:Vector.<§_-J1a§>, param2:Boolean, param3:Boolean) : void
      {
         var _loc5_:§_-J1a§ = null;
         var _loc6_:Object = null;
         §_-W2G§.length = 0;
         var _loc4_:TouchEvent = new TouchEvent(TouchEvent.§_-qu§,this.§_-tX§,param2,param3);
         for each(_loc5_ in param1)
         {
            if(_loc5_.§_-iR§ == §_-01Z§.§_-zX§ && Boolean(_loc5_.target))
            {
               §_-W2G§[§_-W2G§.length] = {
                  "touch":_loc5_,
                  "target":_loc5_.target,
                  "bubbleChain":_loc5_.bubbleChain
               };
            }
            if(_loc5_.§_-iR§ == §_-01Z§.§_-zX§ || _loc5_.§_-iR§ == §_-01Z§.§_-N1v§)
            {
               §_-O§.setTo(_loc5_.§_-ca§,_loc5_.§_-n2z§);
               _loc5_.target = this.§_-X13§.hitTest(§_-O§,true);
            }
         }
         for each(_loc6_ in §_-W2G§)
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
      
      public function §_-ze§(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1, param6:Number = 1, param7:Number = 1) : void
      {
         this.§_-fs§.unshift(arguments);
         if(this.§_-X19§ && this.§_-h2r§ && param1 == 0)
         {
            this.§_-72q§.§_-yc§(param3,param4,this.§_-O5§);
            this.§_-fs§.unshift([1,param2,this.§_-72q§.§_-a2j§,this.§_-72q§.§_-132§]);
         }
      }
      
      public function §_-Gb§() : void
      {
         var _loc1_:§_-J1a§ = this.§_-h2N§(0);
         if(_loc1_ == null || _loc1_.§_-iR§ != §_-01Z§.§_-zX§)
         {
            return;
         }
         var _loc2_:int = 1;
         var _loc3_:Number = _loc1_.§_-ca§;
         var _loc4_:Number = _loc1_.§_-n2z§;
         var _loc5_:Number = _loc1_.§_-ca§;
         var _loc6_:Number = this.mStage.stageWidth - _loc5_;
         var _loc7_:Number = _loc1_.§_-n2z§;
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
         this.§_-ze§(0,§_-01Z§.§_-zX§,_loc3_,_loc4_);
      }
      
      public function §_-UX§() : void
      {
         var _loc1_:§_-J1a§ = null;
         if(this.§_-tX§.length > 0)
         {
            for each(_loc1_ in this.§_-tX§)
            {
               if(_loc1_.§_-iR§ == §_-01Z§.§_-N1v§ || _loc1_.§_-iR§ == §_-01Z§.§_-kg§ || _loc1_.§_-iR§ == §_-01Z§.§_-02I§)
               {
                  _loc1_.§_-iR§ = §_-01Z§.§_-1Z§;
                  _loc1_.§_-61F§ = true;
               }
            }
            this.§_-t10§(this.§_-tX§,this.§_-O5§,this.§_-X19§);
         }
         this.§_-tX§.length = 0;
         this.§_-fs§.length = 0;
      }
      
      private function §_-61X§(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1, param6:Number = 1, param7:Number = 1) : §_-J1a§
      {
         var _loc8_:§_-J1a§ = this.§_-h2N§(param1);
         if(_loc8_ == null)
         {
            _loc8_ = new §_-J1a§(param1);
            this.§_-93c§(_loc8_);
         }
         _loc8_.§_-ca§ = param3;
         _loc8_.§_-n2z§ = param4;
         _loc8_.§_-iR§ = param2;
         _loc8_.§_-EK§ = this.§_-Mp§;
         _loc8_.pressure = param5;
         _loc8_.width = param6;
         _loc8_.height = param7;
         if(param2 == §_-01Z§.§_-N1v§)
         {
            this.§_-O2T§(_loc8_);
         }
         return _loc8_;
      }
      
      private function §_-O2T§(param1:§_-J1a§) : void
      {
         var _loc4_:§_-J1a§ = null;
         var _loc5_:Number = NaN;
         var _loc2_:§_-J1a§ = null;
         var _loc3_:Number = this.§_-C3f§ * this.§_-C3f§;
         for each(_loc4_ in this.§_-fR§)
         {
            _loc5_ = Math.pow(_loc4_.§_-ca§ - param1.§_-ca§,2) + Math.pow(_loc4_.§_-n2z§ - param1.§_-n2z§,2);
            if(_loc5_ <= _loc3_)
            {
               _loc2_ = _loc4_;
               break;
            }
         }
         if(_loc2_)
         {
            param1.§_-W2H§ = _loc2_.§_-W2H§ + 1;
            this.§_-fR§.splice(this.§_-fR§.indexOf(_loc2_),1);
         }
         else
         {
            param1.§_-W2H§ = 1;
         }
         this.§_-fR§.push(param1.clone());
      }
      
      private function §_-93c§(param1:§_-J1a§) : void
      {
         var _loc2_:* = int(this.§_-tX§.length - 1);
         while(_loc2_ >= 0)
         {
            if(this.§_-tX§[_loc2_].id == param1.id)
            {
               this.§_-tX§.splice(_loc2_,1);
            }
            _loc2_--;
         }
         this.§_-tX§.push(param1);
      }
      
      private function §_-h2N§(param1:int) : §_-J1a§
      {
         var _loc2_:§_-J1a§ = null;
         for each(_loc2_ in this.§_-tX§)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function §_-E1R§(param1:Vector.<§_-J1a§>, param2:int) : Boolean
      {
         var _loc3_:§_-J1a§ = null;
         for each(_loc3_ in param1)
         {
            if(_loc3_.id == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get §_-h2r§() : Boolean
      {
         return this.§_-72q§ != null;
      }
      
      public function set §_-h2r§(param1:Boolean) : void
      {
         if(this.§_-h2r§ == param1)
         {
            return;
         }
         if(param1)
         {
            this.§_-72q§ = new §_-V1r§();
            this.§_-72q§.visible = false;
            this.mStage.addChild(this.§_-72q§);
         }
         else
         {
            this.§_-72q§.removeFromParent(true);
            this.§_-72q§ = null;
         }
      }
      
      public function get §_-c1z§() : Number
      {
         return this.§_-g1l§;
      }
      
      public function set §_-c1z§(param1:Number) : void
      {
         this.§_-g1l§ = param1;
      }
      
      public function get §_-n1p§() : Number
      {
         return this.§_-C3f§;
      }
      
      public function set §_-n1p§(param1:Number) : void
      {
         this.§_-C3f§ = param1;
      }
      
      public function get root() : DisplayObject
      {
         return this.§_-X13§;
      }
      
      public function set root(param1:DisplayObject) : void
      {
         this.§_-X13§ = param1;
      }
      
      public function get stage() : Stage
      {
         return this.mStage;
      }
      
      public function get §_-L3§() : int
      {
         return this.§_-tX§.length;
      }
      
      private function §_-r1i§(param1:KeyboardEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:§_-J1a§ = null;
         var _loc4_:§_-J1a§ = null;
         if(param1.keyCode == 17 || param1.keyCode == 15)
         {
            _loc2_ = this.§_-X19§;
            this.§_-X19§ = param1.type == KeyboardEvent.KEY_DOWN;
            if(this.§_-h2r§ && _loc2_ != this.§_-X19§)
            {
               this.§_-72q§.visible = this.§_-X19§;
               this.§_-72q§.§_-j2p§(this.mStage.stageWidth / 2,this.mStage.stageHeight / 2);
               _loc3_ = this.§_-h2N§(0);
               _loc4_ = this.§_-h2N§(1);
               if(_loc3_)
               {
                  this.§_-72q§.§_-yc§(_loc3_.§_-ca§,_loc3_.§_-n2z§);
               }
               if(Boolean(_loc2_) && Boolean(_loc4_) && _loc4_.§_-iR§ != §_-01Z§.§_-1Z§)
               {
                  this.§_-fs§.unshift([1,§_-01Z§.§_-1Z§,_loc4_.§_-ca§,_loc4_.§_-n2z§]);
               }
               else if(this.§_-X19§ && Boolean(_loc3_))
               {
                  if(_loc3_.§_-iR§ == §_-01Z§.§_-zX§ || _loc3_.§_-iR§ == §_-01Z§.§_-1Z§)
                  {
                     this.§_-fs§.unshift([1,§_-01Z§.§_-zX§,this.§_-72q§.§_-a2j§,this.§_-72q§.§_-132§]);
                  }
                  else
                  {
                     this.§_-fs§.unshift([1,§_-01Z§.§_-N1v§,this.§_-72q§.§_-a2j§,this.§_-72q§.§_-132§]);
                  }
               }
            }
         }
         else if(param1.keyCode == 16)
         {
            this.§_-O5§ = param1.type == KeyboardEvent.KEY_DOWN;
         }
      }
      
      private function §_-t2g§(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         try
         {
            _loc2_ = getDefinitionByName("flash.desktop::NativeApplication");
            _loc3_ = _loc2_["nativeApplication"];
            if(param1)
            {
               _loc3_.addEventListener("deactivate",this.§_-I1Z§,false,0,true);
            }
            else
            {
               _loc3_.removeEventListener("deactivate",this.§_-I1Z§);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function §_-I1Z§(param1:Object) : void
      {
         this.§_-UX§();
      }
   }
}

