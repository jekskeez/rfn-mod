package §_-m1z§
{
   import §_-K2c§.Event;
   import §_-K2c§.EventDispatcher;
   import starling.core.starling_internal;
   
   public class §_-537§ implements §_-N1Q§
   {
      
      private var §_-Vn§:Vector.<§_-N1Q§>;
      
      private var §_-M1U§:Number;
      
      public function §_-537§()
      {
         super();
         this.§_-M1U§ = 0;
         this.§_-Vn§ = new Vector.<§_-N1Q§>(0);
      }
      
      public function add(param1:§_-N1Q§) : void
      {
         var _loc2_:EventDispatcher = null;
         if(Boolean(param1) && this.§_-Vn§.indexOf(param1) == -1)
         {
            this.§_-Vn§[this.§_-Vn§.length] = param1;
            _loc2_ = param1 as EventDispatcher;
            if(_loc2_)
            {
               _loc2_.addEventListener(Event.§_-P2F§,this.onRemove);
            }
         }
      }
      
      public function contains(param1:§_-N1Q§) : Boolean
      {
         return this.§_-Vn§.indexOf(param1) != -1;
      }
      
      public function remove(param1:§_-N1Q§) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:EventDispatcher = param1 as EventDispatcher;
         if(_loc2_)
         {
            _loc2_.removeEventListener(Event.§_-P2F§,this.onRemove);
         }
         var _loc3_:int = this.§_-Vn§.indexOf(param1);
         if(_loc3_ != -1)
         {
            this.§_-Vn§[_loc3_] = null;
         }
      }
      
      public function §_-fL§(param1:Object) : void
      {
         var _loc3_:§_-529§ = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:* = int(this.§_-Vn§.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.§_-Vn§[_loc2_] as §_-529§;
            if(Boolean(_loc3_) && _loc3_.target == param1)
            {
               _loc3_.removeEventListener(Event.§_-P2F§,this.onRemove);
               this.§_-Vn§[_loc2_] = null;
            }
            _loc2_--;
         }
      }
      
      public function §_-J2J§(param1:Object) : Boolean
      {
         var _loc3_:§_-529§ = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:* = int(this.§_-Vn§.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.§_-Vn§[_loc2_] as §_-529§;
            if(Boolean(_loc3_) && _loc3_.target == param1)
            {
               return true;
            }
            _loc2_--;
         }
         return false;
      }
      
      public function §_-L1u§() : void
      {
         var _loc2_:EventDispatcher = null;
         var _loc1_:* = int(this.§_-Vn§.length - 1);
         while(_loc1_ >= 0)
         {
            _loc2_ = this.§_-Vn§[_loc1_] as EventDispatcher;
            if(_loc2_)
            {
               _loc2_.removeEventListener(Event.§_-P2F§,this.onRemove);
            }
            this.§_-Vn§[_loc1_] = null;
            _loc1_--;
         }
      }
      
      public function §_-13G§(param1:Function, param2:Number, ... rest) : §_-N1Q§
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc4_:§_-zJ§ = §_-zJ§.starling_internal::§_-11x§(param1,param2,rest);
         _loc4_.addEventListener(Event.§_-P2F§,this.§_-b1b§);
         this.add(_loc4_);
         return _loc4_;
      }
      
      public function §_-03h§(param1:Function, param2:Number, param3:int = 0, ... rest) : §_-N1Q§
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc5_:§_-zJ§ = §_-zJ§.starling_internal::§_-11x§(param1,param2,rest);
         _loc5_.repeatCount = param3;
         _loc5_.addEventListener(Event.§_-P2F§,this.§_-b1b§);
         this.add(_loc5_);
         return _loc5_;
      }
      
      private function §_-b1b§(param1:Event) : void
      {
         §_-zJ§.starling_internal::§_-3h§(param1.target as §_-zJ§);
      }
      
      public function tween(param1:Object, param2:Number, param3:Object) : §_-N1Q§
      {
         var _loc5_:String = null;
         var _loc6_:Object = null;
         if(param1 == null)
         {
            throw new ArgumentError("target must not be null");
         }
         var _loc4_:§_-529§ = §_-529§.starling_internal::§_-11x§(param1,param2);
         for(_loc5_ in param3)
         {
            _loc6_ = param3[_loc5_];
            if(_loc4_.hasOwnProperty(_loc5_))
            {
               _loc4_[_loc5_] = _loc6_;
            }
            else
            {
               if(!param1.hasOwnProperty(§_-529§.§_-TF§(_loc5_)))
               {
                  throw new ArgumentError("Invalid property: " + _loc5_);
               }
               _loc4_.§_-42i§(_loc5_,_loc6_ as Number);
            }
         }
         _loc4_.addEventListener(Event.§_-P2F§,this.§_-E12§);
         this.add(_loc4_);
         return _loc4_;
      }
      
      private function §_-E12§(param1:Event) : void
      {
         §_-529§.starling_internal::§_-3h§(param1.target as §_-529§);
      }
      
      public function §_-ld§(param1:Number) : void
      {
         var _loc4_:* = 0;
         var _loc5_:§_-N1Q§ = null;
         var _loc2_:int = int(this.§_-Vn§.length);
         var _loc3_:* = 0;
         this.§_-M1U§ += param1;
         if(_loc2_ == 0)
         {
            return;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = this.§_-Vn§[_loc4_];
            if(_loc5_)
            {
               if(_loc3_ != _loc4_)
               {
                  this.§_-Vn§[_loc3_] = _loc5_;
                  this.§_-Vn§[_loc4_] = null;
               }
               _loc5_.§_-ld§(param1);
               _loc3_++;
            }
            _loc4_++;
         }
         if(_loc3_ != _loc4_)
         {
            _loc2_ = int(this.§_-Vn§.length);
            while(_loc4_ < _loc2_)
            {
               this.§_-Vn§[int(_loc3_++)] = this.§_-Vn§[int(_loc4_++)];
            }
            this.§_-Vn§.length = _loc3_;
         }
      }
      
      private function onRemove(param1:Event) : void
      {
         this.remove(param1.target as §_-N1Q§);
         var _loc2_:§_-529§ = param1.target as §_-529§;
         if(Boolean(_loc2_) && _loc2_.§_-Y2w§)
         {
            this.add(_loc2_.§_-n2Z§);
         }
      }
      
      public function get §_-12j§() : Number
      {
         return this.§_-M1U§;
      }
      
      protected function get objects() : Vector.<§_-N1Q§>
      {
         return this.§_-Vn§;
      }
   }
}

