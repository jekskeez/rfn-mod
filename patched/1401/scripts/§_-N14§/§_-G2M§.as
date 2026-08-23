package §_-N14§
{
   import §_-03j§.§_-Q24§;
   import dragonBones.§_-E1r§;
   import dragonBones.§_-TH§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.AnimationData;
   import dragonBones.objects.Frame;
   import dragonBones.objects.TransformTimeline;
   
   use namespace dragonBones_internal;
   
   public final class §_-G2M§
   {
      
      private static var §_-a1x§:Vector.<§_-G2M§> = new Vector.<§_-G2M§>();
      
      public var §_-q2t§:Boolean;
      
      public var §_-11n§:Boolean;
      
      public var group:String;
      
      public var weight:Number;
      
      dragonBones_internal var §_-f2d§:Object;
      
      dragonBones_internal var §_-A6§:Number;
      
      private var §_-H2x§:§_-E1r§;
      
      private var §_-gw§:Frame;
      
      private var §_-l1g§:Object;
      
      private var §_-rh§:int;
      
      private var §_-no§:Number;
      
      private var §_-935§:Number;
      
      private var §_-Em§:Number;
      
      private var §_-b2o§:Number;
      
      private var §_-b2D§:Boolean;
      
      private var §_-x21§:Boolean;
      
      private var §_-m1M§:int;
      
      private var _name:String;
      
      private var §_-c1k§:AnimationData;
      
      private var §_-yq§:int;
      
      private var §_-Du§:int;
      
      private var §_-Ii§:uint;
      
      private var §_-L5§:Boolean;
      
      private var §_-8j§:Boolean;
      
      private var §_-B2B§:Number;
      
      private var §_-l2x§:Number;
      
      private var §_-ey§:Number;
      
      public var §_-t2T§:Boolean;
      
      public function §_-G2M§()
      {
         super();
         this.§_-f2d§ = {};
      }
      
      dragonBones_internal static function §_-XL§() : §_-G2M§
      {
         if(§_-a1x§.length == 0)
         {
            return new §_-G2M§();
         }
         return §_-a1x§.pop();
      }
      
      dragonBones_internal static function §_-F1t§(param1:§_-G2M§) : void
      {
         param1.clear();
         if(§_-a1x§.indexOf(param1) < 0)
         {
            §_-a1x§[§_-a1x§.length] = param1;
         }
      }
      
      dragonBones_internal static function clear() : void
      {
         var _loc1_:* = int(§_-a1x§.length);
         while(_loc1_--)
         {
            §_-a1x§[_loc1_].clear();
         }
         §_-a1x§.length = 0;
         §_-12B§.clear();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get clip() : AnimationData
      {
         return this.§_-c1k§;
      }
      
      public function get §_-Q1h§() : int
      {
         return this.§_-yq§;
      }
      
      public function get loop() : int
      {
         return this.§_-Du§;
      }
      
      public function get §_-n2g§() : uint
      {
         return this.§_-Ii§;
      }
      
      public function get isPlaying() : Boolean
      {
         return this.§_-L5§ && !this.§_-8j§;
      }
      
      public function get §_-Y2w§() : Boolean
      {
         return this.§_-8j§;
      }
      
      public function get fadeInTime() : Number
      {
         return this.§_-no§;
      }
      
      public function get §_-D2C§() : Number
      {
         return this.§_-B2B§;
      }
      
      public function get currentTime() : Number
      {
         return this.§_-l2x§;
      }
      
      public function set currentTime(param1:Number) : void
      {
         if(param1 < 0 || isNaN(param1))
         {
            param1 = 0;
         }
         this.§_-l2x§ = param1;
      }
      
      public function get timeScale() : Number
      {
         return this.§_-ey§;
      }
      
      public function set timeScale(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(isNaN(param1))
         {
            param1 = 1;
         }
         else if(this.§_-ey§ == Infinity)
         {
            this.§_-ey§ = 1;
         }
         this.§_-ey§ = param1;
      }
      
      dragonBones_internal function fadeIn(param1:§_-E1r§, param2:AnimationData, param3:Number, param4:Number, param5:int, param6:uint, param7:Boolean, param8:Boolean) : void
      {
         this.§_-H2x§ = param1;
         this.§_-c1k§ = param2;
         this._name = this.§_-c1k§.name;
         this.§_-Ii§ = param6;
         this.§_-B2B§ = this.§_-c1k§.duration;
         if(Math.round(this.§_-c1k§.duration * this.§_-c1k§.frameRate) < 2 || param4 == Infinity)
         {
            this.§_-ey§ = 1;
            this.§_-l2x§ = this.§_-B2B§;
            if(this.§_-Du§ >= 0)
            {
               this.§_-Du§ = 1;
            }
            else
            {
               this.§_-Du§ = -1;
            }
         }
         else
         {
            this.§_-ey§ = param4;
            this.§_-l2x§ = 0;
            this.§_-Du§ = param5;
         }
         if(param8)
         {
            this.§_-m1M§ = -1;
         }
         else
         {
            this.§_-m1M§ = 1;
         }
         this.§_-no§ = param3 * this.§_-ey§;
         this.§_-yq§ = -1;
         this.§_-rh§ = 1;
         this.§_-Em§ = 0;
         this.§_-b2o§ = -1;
         this.§_-A6§ = 0;
         this.§_-L5§ = true;
         this.§_-8j§ = false;
         this.§_-b2D§ = true;
         this.§_-x21§ = false;
         this.§_-t2T§ = param7;
         this.weight = 1;
         this.§_-11n§ = true;
         this.§_-q2t§ = true;
         this.§_-W2p§();
      }
      
      public function fadeOut(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:§_-12B§ = null;
         if(!this.§_-H2x§ || this.§_-b2o§ >= 0)
         {
            return;
         }
         this.§_-rh§ = -1;
         this.§_-b2o§ = this.§_-A6§;
         this.§_-935§ = param1 * this.§_-ey§;
         this.§_-Em§ = this.§_-l2x§;
         this.§_-L5§ = !param2;
         this.§_-x21§ = true;
         this.§_-t2T§ = false;
         for each(_loc3_ in this.§_-f2d§)
         {
            _loc3_.fadeOut();
         }
      }
      
      public function play() : void
      {
         this.§_-L5§ = true;
      }
      
      public function stop() : void
      {
         this.§_-L5§ = false;
      }
      
      public function §_-Ub§(param1:String) : int
      {
         if(this.§_-l1g§)
         {
            return int(this.§_-l1g§[param1]);
         }
         return -1;
      }
      
      public function §_-lR§(param1:String, param2:int = 2, param3:Boolean = true) : void
      {
         var _loc4_:* = 0;
         var _loc5_:§_-TH§ = null;
         var _loc6_:§_-TH§ = null;
         if(Boolean(this.§_-c1k§) && Boolean(this.§_-c1k§.§_-923§(param1)))
         {
            if(!this.§_-l1g§)
            {
               this.§_-l1g§ = {};
            }
            if(param3)
            {
               _loc4_ = int(this.§_-H2x§.§_-G1x§.length);
               while(_loc4_--)
               {
                  _loc5_ = this.§_-H2x§.§_-G1x§[_loc4_];
                  if(_loc5_.name == param1)
                  {
                     _loc6_ = _loc5_;
                  }
                  if(Boolean(_loc6_) && (_loc6_ == _loc5_ || _loc6_.contains(_loc5_)))
                  {
                     this.§_-l1g§[_loc5_.name] = param2;
                  }
               }
            }
            else
            {
               this.§_-l1g§[param1] = param2;
            }
            this.§_-W2p§();
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-Y1L§(param1:String = null, param2:Boolean = true) : void
      {
         var _loc3_:* = 0;
         var _loc4_:§_-TH§ = null;
         var _loc5_:§_-TH§ = null;
         var _loc6_:Boolean = false;
         if(param1)
         {
            if(param2)
            {
               _loc3_ = int(this.§_-H2x§.§_-G1x§.length);
               while(_loc3_--)
               {
                  _loc4_ = this.§_-H2x§.§_-G1x§[_loc3_];
                  if(_loc4_.name == param1)
                  {
                     _loc5_ = _loc4_;
                  }
                  if(Boolean(_loc5_) && (_loc5_ == _loc4_ || _loc5_.contains(_loc4_)))
                  {
                     delete this.§_-l1g§[_loc4_.name];
                  }
               }
            }
            else
            {
               delete this.§_-l1g§[param1];
            }
            var _loc7_:int = 0;
            var _loc8_:* = this.§_-l1g§;
            for each(param1 in _loc8_)
            {
               _loc6_ = true;
            }
            if(!_loc6_)
            {
               this.§_-l1g§ = null;
            }
         }
         else
         {
            this.§_-l1g§ = null;
         }
         this.§_-W2p§();
      }
      
      public function §_-ld§(param1:Number) : Boolean
      {
         var _loc2_:§_-Q24§ = null;
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:§_-12B§ = null;
         var _loc7_:Number = NaN;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         if(this.§_-b2D§)
         {
            this.§_-b2D§ = false;
            this.§_-H2x§.animation.§_-51m§(this,true);
            if(this.§_-H2x§.hasEventListener(§_-Q24§.§_-A2e§))
            {
               _loc2_ = new §_-Q24§(§_-Q24§.§_-A2e§);
               _loc2_.§_-y8§ = this;
               this.§_-H2x§.§_-A2H§.push(_loc2_);
            }
         }
         if(this.§_-x21§)
         {
            this.§_-x21§ = false;
            this.§_-H2x§.animation.§_-51m§(this,true);
            if(this.§_-H2x§.hasEventListener(§_-Q24§.§_-G2z§))
            {
               _loc2_ = new §_-Q24§(§_-Q24§.§_-G2z§);
               _loc2_.§_-y8§ = this;
               this.§_-H2x§.§_-A2H§.push(_loc2_);
            }
         }
         this.§_-l2x§ += param1 * this.§_-ey§;
         if(this.§_-L5§ && !this.§_-8j§ && Boolean(this.§_-m1M§))
         {
            if(this.§_-m1M§ == -1)
            {
               this.§_-m1M§ = 0;
               _loc4_ = 0;
               _loc5_ = _loc4_;
            }
            else
            {
               _loc4_ = this.§_-l2x§ / this.§_-B2B§;
               _loc5_ = _loc4_;
               if(_loc5_ != this.§_-yq§)
               {
                  if(this.§_-yq§ == -1)
                  {
                     this.§_-H2x§.animation.§_-51m§(this,true);
                     if(this.§_-H2x§.hasEventListener(§_-Q24§.START))
                     {
                        _loc2_ = new §_-Q24§(§_-Q24§.START);
                        _loc2_.§_-y8§ = this;
                        this.§_-H2x§.§_-A2H§.push(_loc2_);
                     }
                  }
                  this.§_-yq§ = _loc5_;
                  if(this.§_-yq§)
                  {
                     if(Boolean(this.§_-Du§) && this.§_-yq§ * this.§_-yq§ >= this.§_-Du§ * this.§_-Du§ - 1)
                     {
                        _loc3_ = true;
                        _loc4_ = 1;
                        _loc5_ = 0;
                        if(this.§_-H2x§.hasEventListener(§_-Q24§.COMPLETE))
                        {
                           _loc2_ = new §_-Q24§(§_-Q24§.COMPLETE);
                           _loc2_.§_-y8§ = this;
                           this.§_-H2x§.§_-A2H§.push(_loc2_);
                        }
                     }
                     else if(this.§_-H2x§.hasEventListener(§_-Q24§.§_-X2a§))
                     {
                        _loc2_ = new §_-Q24§(§_-Q24§.§_-X2a§);
                        _loc2_.§_-y8§ = this;
                        this.§_-H2x§.§_-A2H§.push(_loc2_);
                     }
                  }
               }
            }
            for each(_loc6_ in this.§_-f2d§)
            {
               _loc6_.update(_loc4_);
            }
            if(this.§_-c1k§.frameList.length > 0)
            {
               _loc7_ = this.§_-B2B§ * (_loc4_ - _loc5_);
               _loc8_ = false;
               while(!this.§_-gw§ || _loc7_ > this.§_-gw§.position + this.§_-gw§.duration || _loc7_ < this.§_-gw§.position)
               {
                  if(_loc8_)
                  {
                     this.§_-H2x§.§_-o2w§(this.§_-gw§,null,this,true);
                  }
                  _loc8_ = true;
                  if(this.§_-gw§)
                  {
                     _loc9_ = this.§_-c1k§.frameList.indexOf(this.§_-gw§);
                     if(++_loc9_ >= this.§_-c1k§.frameList.length)
                     {
                        _loc9_ = 0;
                     }
                     this.§_-gw§ = this.§_-c1k§.frameList[_loc9_];
                  }
                  else
                  {
                     this.§_-gw§ = this.§_-c1k§.frameList[0];
                  }
               }
               if(_loc8_)
               {
                  this.§_-H2x§.§_-o2w§(this.§_-gw§,null,this,false);
               }
            }
         }
         if(this.§_-rh§ > 0)
         {
            if(this.§_-no§ == 0)
            {
               this.§_-A6§ = 1;
               this.§_-rh§ = 0;
               this.§_-m1M§ = 1;
               this.§_-H2x§.animation.§_-51m§(this,false);
               if(this.§_-H2x§.hasEventListener(§_-Q24§.§_-01P§))
               {
                  _loc2_ = new §_-Q24§(§_-Q24§.§_-01P§);
                  _loc2_.§_-y8§ = this;
                  this.§_-H2x§.§_-A2H§.push(_loc2_);
               }
            }
            else
            {
               this.§_-A6§ = this.§_-l2x§ / this.§_-no§;
               if(this.§_-A6§ >= 1)
               {
                  this.§_-A6§ = 1;
                  this.§_-rh§ = 0;
                  if(this.§_-m1M§ == 0)
                  {
                     this.§_-l2x§ -= this.§_-no§;
                  }
                  this.§_-m1M§ = 1;
                  this.§_-H2x§.animation.§_-51m§(this,false);
                  if(this.§_-H2x§.hasEventListener(§_-Q24§.§_-01P§))
                  {
                     _loc2_ = new §_-Q24§(§_-Q24§.§_-01P§);
                     _loc2_.§_-y8§ = this;
                     this.§_-H2x§.§_-A2H§.push(_loc2_);
                  }
               }
            }
         }
         else if(this.§_-rh§ < 0)
         {
            if(this.§_-935§ == 0)
            {
               this.§_-A6§ = 0;
               this.§_-rh§ = 0;
               this.§_-H2x§.animation.§_-51m§(this,false);
               if(this.§_-H2x§.hasEventListener(§_-Q24§.§_-bu§))
               {
                  _loc2_ = new §_-Q24§(§_-Q24§.§_-bu§);
                  _loc2_.§_-y8§ = this;
                  this.§_-H2x§.§_-A2H§.push(_loc2_);
               }
               return true;
            }
            this.§_-A6§ = (1 - (this.§_-l2x§ - this.§_-Em§) / this.§_-935§) * this.§_-b2o§;
            if(this.§_-A6§ <= 0)
            {
               this.§_-A6§ = 0;
               this.§_-rh§ = 0;
               this.§_-H2x§.animation.§_-51m§(this,false);
               if(this.§_-H2x§.hasEventListener(§_-Q24§.§_-bu§))
               {
                  _loc2_ = new §_-Q24§(§_-Q24§.§_-bu§);
                  _loc2_.§_-y8§ = this;
                  this.§_-H2x§.§_-A2H§.push(_loc2_);
               }
               return true;
            }
         }
         if(_loc3_)
         {
            this.§_-8j§ = true;
            if(this.§_-Du§ < 0)
            {
               this.fadeOut((this.§_-b2o§ || this.§_-no§) / this.§_-ey§,true);
            }
            else
            {
               this.§_-H2x§.animation.§_-51m§(this,false);
            }
         }
         return false;
      }
      
      private function §_-W2p§() : void
      {
         var _loc1_:String = null;
         if(this.§_-l1g§)
         {
            for(_loc1_ in this.§_-f2d§)
            {
               if(this.§_-l1g§[_loc1_] == null)
               {
                  this.§_-l1m§(_loc1_);
               }
            }
            for(_loc1_ in this.§_-l1g§)
            {
               if(!this.§_-f2d§[_loc1_])
               {
                  this.§_-r2O§(_loc1_);
               }
            }
         }
         else
         {
            for(_loc1_ in this.§_-c1k§.§_-xo§)
            {
               if(!this.§_-f2d§[_loc1_])
               {
                  this.§_-r2O§(_loc1_);
               }
            }
         }
      }
      
      private function §_-r2O§(param1:String) : void
      {
         var _loc3_:§_-12B§ = null;
         var _loc4_:TransformTimeline = null;
         var _loc2_:§_-TH§ = this.§_-H2x§.§_-M1s§(param1);
         if(_loc2_)
         {
            _loc3_ = §_-12B§.§_-XL§();
            _loc4_ = this.§_-c1k§.§_-923§(param1);
            _loc3_.fadeIn(_loc2_,this,_loc4_);
            this.§_-f2d§[param1] = _loc3_;
         }
      }
      
      private function §_-l1m§(param1:String) : void
      {
         §_-12B§.§_-F1t§(this.§_-f2d§[param1] as §_-12B§);
         delete this.§_-f2d§[param1];
      }
      
      private function clear() : void
      {
         var _loc1_:String = null;
         this.§_-H2x§ = null;
         this.§_-gw§ = null;
         this.§_-c1k§ = null;
         this.§_-l1g§ = null;
         for(_loc1_ in this.§_-f2d§)
         {
            this.§_-l1m§(_loc1_);
         }
      }
   }
}

