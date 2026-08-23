package §_-Vu§
{
   import §_-Sx§.§_-W1w§;
   import dragonBones.§_-833§;
   import dragonBones.§_-83b§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.AnimationData;
   import dragonBones.objects.Frame;
   import dragonBones.objects.TransformTimeline;
   
   use namespace dragonBones_internal;
   
   public final class §_-tW§
   {
      
      private static var §_-d2i§:Vector.<§_-tW§> = new Vector.<§_-tW§>();
      
      public var §_-n1§:Boolean;
      
      public var §_-Z1§:Boolean;
      
      public var group:String;
      
      public var weight:Number;
      
      dragonBones_internal var §_-i1§:Object;
      
      dragonBones_internal var §_-F1Q§:Number;
      
      private var §_-9Y§:§_-833§;
      
      private var §_-El§:Frame;
      
      private var §_-01Y§:Object;
      
      private var §_-M26§:int;
      
      private var §_-i1C§:Number;
      
      private var §_-i2c§:Number;
      
      private var §_-E2U§:Number;
      
      private var §_-Ma§:Number;
      
      private var §_-E1H§:Boolean;
      
      private var §_-X2U§:Boolean;
      
      private var §_-U§:int;
      
      private var _name:String;
      
      private var §_-6A§:AnimationData;
      
      private var §_-k1L§:int;
      
      private var §_-b1U§:int;
      
      private var §_-j2U§:uint;
      
      private var §_-KV§:Boolean;
      
      private var §_-j7§:Boolean;
      
      private var §_-m1V§:Number;
      
      private var §_-82X§:Number;
      
      private var §_-L2h§:Number;
      
      public var §_-03Y§:Boolean;
      
      public function §_-tW§()
      {
         super();
         this.§_-i1§ = {};
      }
      
      dragonBones_internal static function §_-M1V§() : §_-tW§
      {
         if(§_-d2i§.length == 0)
         {
            return new §_-tW§();
         }
         return §_-d2i§.pop();
      }
      
      dragonBones_internal static function §_-Oy§(param1:§_-tW§) : void
      {
         param1.clear();
         if(§_-d2i§.indexOf(param1) < 0)
         {
            §_-d2i§[§_-d2i§.length] = param1;
         }
      }
      
      dragonBones_internal static function clear() : void
      {
         var _loc1_:* = int(§_-d2i§.length);
         while(_loc1_--)
         {
            §_-d2i§[_loc1_].clear();
         }
         §_-d2i§.length = 0;
         §_-b2t§.clear();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get clip() : AnimationData
      {
         return this.§_-6A§;
      }
      
      public function get §_-j2§() : int
      {
         return this.§_-k1L§;
      }
      
      public function get loop() : int
      {
         return this.§_-b1U§;
      }
      
      public function get §_-I1b§() : uint
      {
         return this.§_-j2U§;
      }
      
      public function get isPlaying() : Boolean
      {
         return this.§_-KV§ && !this.§_-j7§;
      }
      
      public function get §_-HU§() : Boolean
      {
         return this.§_-j7§;
      }
      
      public function get fadeInTime() : Number
      {
         return this.§_-i1C§;
      }
      
      public function get §_-R1Z§() : Number
      {
         return this.§_-m1V§;
      }
      
      public function get currentTime() : Number
      {
         return this.§_-82X§;
      }
      
      public function set currentTime(param1:Number) : void
      {
         if(param1 < 0 || isNaN(param1))
         {
            param1 = 0;
         }
         this.§_-82X§ = param1;
      }
      
      public function get timeScale() : Number
      {
         return this.§_-L2h§;
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
         else if(this.§_-L2h§ == Infinity)
         {
            this.§_-L2h§ = 1;
         }
         this.§_-L2h§ = param1;
      }
      
      dragonBones_internal function fadeIn(param1:§_-833§, param2:AnimationData, param3:Number, param4:Number, param5:int, param6:uint, param7:Boolean, param8:Boolean) : void
      {
         this.§_-9Y§ = param1;
         this.§_-6A§ = param2;
         this._name = this.§_-6A§.name;
         this.§_-j2U§ = param6;
         this.§_-m1V§ = this.§_-6A§.duration;
         if(Math.round(this.§_-6A§.duration * this.§_-6A§.frameRate) < 2 || param4 == Infinity)
         {
            this.§_-L2h§ = 1;
            this.§_-82X§ = this.§_-m1V§;
            if(this.§_-b1U§ >= 0)
            {
               this.§_-b1U§ = 1;
            }
            else
            {
               this.§_-b1U§ = -1;
            }
         }
         else
         {
            this.§_-L2h§ = param4;
            this.§_-82X§ = 0;
            this.§_-b1U§ = param5;
         }
         if(param8)
         {
            this.§_-U§ = -1;
         }
         else
         {
            this.§_-U§ = 1;
         }
         this.§_-i1C§ = param3 * this.§_-L2h§;
         this.§_-k1L§ = -1;
         this.§_-M26§ = 1;
         this.§_-E2U§ = 0;
         this.§_-Ma§ = -1;
         this.§_-F1Q§ = 0;
         this.§_-KV§ = true;
         this.§_-j7§ = false;
         this.§_-E1H§ = true;
         this.§_-X2U§ = false;
         this.§_-03Y§ = param7;
         this.weight = 1;
         this.§_-Z1§ = true;
         this.§_-n1§ = true;
         this.§_-72O§();
      }
      
      public function fadeOut(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:§_-b2t§ = null;
         if(!this.§_-9Y§ || this.§_-Ma§ >= 0)
         {
            return;
         }
         this.§_-M26§ = -1;
         this.§_-Ma§ = this.§_-F1Q§;
         this.§_-i2c§ = param1 * this.§_-L2h§;
         this.§_-E2U§ = this.§_-82X§;
         this.§_-KV§ = !param2;
         this.§_-X2U§ = true;
         this.§_-03Y§ = false;
         for each(_loc3_ in this.§_-i1§)
         {
            _loc3_.fadeOut();
         }
      }
      
      public function play() : void
      {
         this.§_-KV§ = true;
      }
      
      public function stop() : void
      {
         this.§_-KV§ = false;
      }
      
      public function §_-XM§(param1:String) : int
      {
         if(this.§_-01Y§)
         {
            return int(this.§_-01Y§[param1]);
         }
         return -1;
      }
      
      public function §_-a1h§(param1:String, param2:int = 2, param3:Boolean = true) : void
      {
         var _loc4_:* = 0;
         var _loc5_:§_-83b§ = null;
         var _loc6_:§_-83b§ = null;
         if(Boolean(this.§_-6A§) && Boolean(this.§_-6A§.§_-h2U§(param1)))
         {
            if(!this.§_-01Y§)
            {
               this.§_-01Y§ = {};
            }
            if(param3)
            {
               _loc4_ = int(this.§_-9Y§.§_-d1d§.length);
               while(_loc4_--)
               {
                  _loc5_ = this.§_-9Y§.§_-d1d§[_loc4_];
                  if(_loc5_.name == param1)
                  {
                     _loc6_ = _loc5_;
                  }
                  if(Boolean(_loc6_) && (_loc6_ == _loc5_ || _loc6_.contains(_loc5_)))
                  {
                     this.§_-01Y§[_loc5_.name] = param2;
                  }
               }
            }
            else
            {
               this.§_-01Y§[param1] = param2;
            }
            this.§_-72O§();
            return;
         }
         throw new ArgumentError();
      }
      
      public function §_-t11§(param1:String = null, param2:Boolean = true) : void
      {
         var _loc3_:* = 0;
         var _loc4_:§_-83b§ = null;
         var _loc5_:§_-83b§ = null;
         var _loc6_:Boolean = false;
         if(param1)
         {
            if(param2)
            {
               _loc3_ = int(this.§_-9Y§.§_-d1d§.length);
               while(_loc3_--)
               {
                  _loc4_ = this.§_-9Y§.§_-d1d§[_loc3_];
                  if(_loc4_.name == param1)
                  {
                     _loc5_ = _loc4_;
                  }
                  if(Boolean(_loc5_) && (_loc5_ == _loc4_ || _loc5_.contains(_loc4_)))
                  {
                     delete this.§_-01Y§[_loc4_.name];
                  }
               }
            }
            else
            {
               delete this.§_-01Y§[param1];
            }
            var _loc7_:int = 0;
            var _loc8_:* = this.§_-01Y§;
            for each(param1 in _loc8_)
            {
               _loc6_ = true;
            }
            if(!_loc6_)
            {
               this.§_-01Y§ = null;
            }
         }
         else
         {
            this.§_-01Y§ = null;
         }
         this.§_-72O§();
      }
      
      public function §_-a1Q§(param1:Number) : Boolean
      {
         var _loc2_:§_-W1w§ = null;
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:§_-b2t§ = null;
         var _loc7_:Number = NaN;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         if(this.§_-E1H§)
         {
            this.§_-E1H§ = false;
            this.§_-9Y§.animation.§_-724§(this,true);
            if(this.§_-9Y§.hasEventListener(§_-W1w§.§_-F8§))
            {
               _loc2_ = new §_-W1w§(§_-W1w§.§_-F8§);
               _loc2_.§_-p1j§ = this;
               this.§_-9Y§.§_-iv§.push(_loc2_);
            }
         }
         if(this.§_-X2U§)
         {
            this.§_-X2U§ = false;
            this.§_-9Y§.animation.§_-724§(this,true);
            if(this.§_-9Y§.hasEventListener(§_-W1w§.§_-23P§))
            {
               _loc2_ = new §_-W1w§(§_-W1w§.§_-23P§);
               _loc2_.§_-p1j§ = this;
               this.§_-9Y§.§_-iv§.push(_loc2_);
            }
         }
         this.§_-82X§ += param1 * this.§_-L2h§;
         if(this.§_-KV§ && !this.§_-j7§ && Boolean(this.§_-U§))
         {
            if(this.§_-U§ == -1)
            {
               this.§_-U§ = 0;
               _loc4_ = 0;
               _loc5_ = _loc4_;
            }
            else
            {
               _loc4_ = this.§_-82X§ / this.§_-m1V§;
               _loc5_ = _loc4_;
               if(_loc5_ != this.§_-k1L§)
               {
                  if(this.§_-k1L§ == -1)
                  {
                     this.§_-9Y§.animation.§_-724§(this,true);
                     if(this.§_-9Y§.hasEventListener(§_-W1w§.START))
                     {
                        _loc2_ = new §_-W1w§(§_-W1w§.START);
                        _loc2_.§_-p1j§ = this;
                        this.§_-9Y§.§_-iv§.push(_loc2_);
                     }
                  }
                  this.§_-k1L§ = _loc5_;
                  if(this.§_-k1L§)
                  {
                     if(Boolean(this.§_-b1U§) && this.§_-k1L§ * this.§_-k1L§ >= this.§_-b1U§ * this.§_-b1U§ - 1)
                     {
                        _loc3_ = true;
                        _loc4_ = 1;
                        _loc5_ = 0;
                        if(this.§_-9Y§.hasEventListener(§_-W1w§.COMPLETE))
                        {
                           _loc2_ = new §_-W1w§(§_-W1w§.COMPLETE);
                           _loc2_.§_-p1j§ = this;
                           this.§_-9Y§.§_-iv§.push(_loc2_);
                        }
                     }
                     else if(this.§_-9Y§.hasEventListener(§_-W1w§.§_-2T§))
                     {
                        _loc2_ = new §_-W1w§(§_-W1w§.§_-2T§);
                        _loc2_.§_-p1j§ = this;
                        this.§_-9Y§.§_-iv§.push(_loc2_);
                     }
                  }
               }
            }
            for each(_loc6_ in this.§_-i1§)
            {
               _loc6_.update(_loc4_);
            }
            if(this.§_-6A§.frameList.length > 0)
            {
               _loc7_ = this.§_-m1V§ * (_loc4_ - _loc5_);
               _loc8_ = false;
               while(!this.§_-El§ || _loc7_ > this.§_-El§.position + this.§_-El§.duration || _loc7_ < this.§_-El§.position)
               {
                  if(_loc8_)
                  {
                     this.§_-9Y§.§_-P1L§(this.§_-El§,null,this,true);
                  }
                  _loc8_ = true;
                  if(this.§_-El§)
                  {
                     _loc9_ = this.§_-6A§.frameList.indexOf(this.§_-El§);
                     if(++_loc9_ >= this.§_-6A§.frameList.length)
                     {
                        _loc9_ = 0;
                     }
                     this.§_-El§ = this.§_-6A§.frameList[_loc9_];
                  }
                  else
                  {
                     this.§_-El§ = this.§_-6A§.frameList[0];
                  }
               }
               if(_loc8_)
               {
                  this.§_-9Y§.§_-P1L§(this.§_-El§,null,this,false);
               }
            }
         }
         if(this.§_-M26§ > 0)
         {
            if(this.§_-i1C§ == 0)
            {
               this.§_-F1Q§ = 1;
               this.§_-M26§ = 0;
               this.§_-U§ = 1;
               this.§_-9Y§.animation.§_-724§(this,false);
               if(this.§_-9Y§.hasEventListener(§_-W1w§.§_-716§))
               {
                  _loc2_ = new §_-W1w§(§_-W1w§.§_-716§);
                  _loc2_.§_-p1j§ = this;
                  this.§_-9Y§.§_-iv§.push(_loc2_);
               }
            }
            else
            {
               this.§_-F1Q§ = this.§_-82X§ / this.§_-i1C§;
               if(this.§_-F1Q§ >= 1)
               {
                  this.§_-F1Q§ = 1;
                  this.§_-M26§ = 0;
                  if(this.§_-U§ == 0)
                  {
                     this.§_-82X§ -= this.§_-i1C§;
                  }
                  this.§_-U§ = 1;
                  this.§_-9Y§.animation.§_-724§(this,false);
                  if(this.§_-9Y§.hasEventListener(§_-W1w§.§_-716§))
                  {
                     _loc2_ = new §_-W1w§(§_-W1w§.§_-716§);
                     _loc2_.§_-p1j§ = this;
                     this.§_-9Y§.§_-iv§.push(_loc2_);
                  }
               }
            }
         }
         else if(this.§_-M26§ < 0)
         {
            if(this.§_-i2c§ == 0)
            {
               this.§_-F1Q§ = 0;
               this.§_-M26§ = 0;
               this.§_-9Y§.animation.§_-724§(this,false);
               if(this.§_-9Y§.hasEventListener(§_-W1w§.§_-M2Y§))
               {
                  _loc2_ = new §_-W1w§(§_-W1w§.§_-M2Y§);
                  _loc2_.§_-p1j§ = this;
                  this.§_-9Y§.§_-iv§.push(_loc2_);
               }
               return true;
            }
            this.§_-F1Q§ = (1 - (this.§_-82X§ - this.§_-E2U§) / this.§_-i2c§) * this.§_-Ma§;
            if(this.§_-F1Q§ <= 0)
            {
               this.§_-F1Q§ = 0;
               this.§_-M26§ = 0;
               this.§_-9Y§.animation.§_-724§(this,false);
               if(this.§_-9Y§.hasEventListener(§_-W1w§.§_-M2Y§))
               {
                  _loc2_ = new §_-W1w§(§_-W1w§.§_-M2Y§);
                  _loc2_.§_-p1j§ = this;
                  this.§_-9Y§.§_-iv§.push(_loc2_);
               }
               return true;
            }
         }
         if(_loc3_)
         {
            this.§_-j7§ = true;
            if(this.§_-b1U§ < 0)
            {
               this.fadeOut((this.§_-Ma§ || this.§_-i1C§) / this.§_-L2h§,true);
            }
            else
            {
               this.§_-9Y§.animation.§_-724§(this,false);
            }
         }
         return false;
      }
      
      private function §_-72O§() : void
      {
         var _loc1_:String = null;
         if(this.§_-01Y§)
         {
            for(_loc1_ in this.§_-i1§)
            {
               if(this.§_-01Y§[_loc1_] == null)
               {
                  this.§_-Q1k§(_loc1_);
               }
            }
            for(_loc1_ in this.§_-01Y§)
            {
               if(!this.§_-i1§[_loc1_])
               {
                  this.§_-s1F§(_loc1_);
               }
            }
         }
         else
         {
            for(_loc1_ in this.§_-6A§.§_-yJ§)
            {
               if(!this.§_-i1§[_loc1_])
               {
                  this.§_-s1F§(_loc1_);
               }
            }
         }
      }
      
      private function §_-s1F§(param1:String) : void
      {
         var _loc3_:§_-b2t§ = null;
         var _loc4_:TransformTimeline = null;
         var _loc2_:§_-83b§ = this.§_-9Y§.§_-i2v§(param1);
         if(_loc2_)
         {
            _loc3_ = §_-b2t§.§_-M1V§();
            _loc4_ = this.§_-6A§.§_-h2U§(param1);
            _loc3_.fadeIn(_loc2_,this,_loc4_);
            this.§_-i1§[param1] = _loc3_;
         }
      }
      
      private function §_-Q1k§(param1:String) : void
      {
         §_-b2t§.§_-Oy§(this.§_-i1§[param1] as §_-b2t§);
         delete this.§_-i1§[param1];
      }
      
      private function clear() : void
      {
         var _loc1_:String = null;
         this.§_-9Y§ = null;
         this.§_-El§ = null;
         this.§_-6A§ = null;
         this.§_-01Y§ = null;
         for(_loc1_ in this.§_-i1§)
         {
            this.§_-Q1k§(_loc1_);
         }
      }
   }
}

