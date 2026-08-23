package §_-81P§
{
   import §_-f1T§.Event;
   import §_-f1T§.EventDispatcher;
   import starling.core.starling_internal;
   
   public class §_-Io§ implements §_-93Y§
   {
      
      private var §_-712§:Vector.<§_-93Y§>;
      
      private var §_-Mp§:Number;
      
      public function §_-Io§()
      {
         super();
         this.§_-Mp§ = 0;
         this.§_-712§ = new Vector.<§_-93Y§>(0);
      }
      
      public function add(param1:§_-93Y§) : void
      {
         var _loc2_:EventDispatcher = null;
         if(Boolean(param1) && this.§_-712§.indexOf(param1) == -1)
         {
            this.§_-712§[this.§_-712§.length] = param1;
            _loc2_ = param1 as EventDispatcher;
            if(_loc2_)
            {
               _loc2_.addEventListener(Event.§_-a2X§,this.onRemove);
            }
         }
      }
      
      public function contains(param1:§_-93Y§) : Boolean
      {
         return this.§_-712§.indexOf(param1) != -1;
      }
      
      public function remove(param1:§_-93Y§) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:EventDispatcher = param1 as EventDispatcher;
         if(_loc2_)
         {
            _loc2_.removeEventListener(Event.§_-a2X§,this.onRemove);
         }
         var _loc3_:int = this.§_-712§.indexOf(param1);
         if(_loc3_ != -1)
         {
            this.§_-712§[_loc3_] = null;
         }
      }
      
      public function §_-I1J§(param1:Object) : void
      {
         var _loc3_:§_-f1D§ = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:* = int(this.§_-712§.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.§_-712§[_loc2_] as §_-f1D§;
            if(Boolean(_loc3_) && _loc3_.target == param1)
            {
               _loc3_.removeEventListener(Event.§_-a2X§,this.onRemove);
               this.§_-712§[_loc2_] = null;
            }
            _loc2_--;
         }
      }
      
      public function §_-21L§(param1:Object) : Boolean
      {
         var _loc3_:§_-f1D§ = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:* = int(this.§_-712§.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.§_-712§[_loc2_] as §_-f1D§;
            if(Boolean(_loc3_) && _loc3_.target == param1)
            {
               return true;
            }
            _loc2_--;
         }
         return false;
      }
      
      public function §_-H2h§() : void
      {
         var _loc2_:EventDispatcher = null;
         var _loc1_:* = int(this.§_-712§.length - 1);
         while(_loc1_ >= 0)
         {
            _loc2_ = this.§_-712§[_loc1_] as EventDispatcher;
            if(_loc2_)
            {
               _loc2_.removeEventListener(Event.§_-a2X§,this.onRemove);
            }
            this.§_-712§[_loc1_] = null;
            _loc1_--;
         }
      }
      
      public function §_-i1X§(param1:Function, param2:Number, ... rest) : §_-93Y§
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc4_:§_-h27§ = §_-h27§.starling_internal::§_-11t§(param1,param2,rest);
         _loc4_.addEventListener(Event.§_-a2X§,this.§_-03G§);
         this.add(_loc4_);
         return _loc4_;
      }
      
      public function §_-c2X§(param1:Function, param2:Number, param3:int = 0, ... rest) : §_-93Y§
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc5_:§_-h27§ = §_-h27§.starling_internal::§_-11t§(param1,param2,rest);
         _loc5_.repeatCount = param3;
         _loc5_.addEventListener(Event.§_-a2X§,this.§_-03G§);
         this.add(_loc5_);
         return _loc5_;
      }
      
      private function §_-03G§(param1:Event) : void
      {
         §_-h27§.starling_internal::§_-b3§(param1.target as §_-h27§);
      }
      
      public function tween(param1:Object, param2:Number, param3:Object) : §_-93Y§
      {
         var _loc5_:String = null;
         var _loc6_:Object = null;
         if(param1 == null)
         {
            throw new ArgumentError("target must not be null");
         }
         var _loc4_:§_-f1D§ = §_-f1D§.starling_internal::§_-11t§(param1,param2);
         for(_loc5_ in param3)
         {
            _loc6_ = param3[_loc5_];
            if(_loc4_.hasOwnProperty(_loc5_))
            {
               _loc4_[_loc5_] = _loc6_;
            }
            else
            {
               if(!param1.hasOwnProperty(§_-f1D§.§_-v2r§(_loc5_)))
               {
                  throw new ArgumentError("Invalid property: " + _loc5_);
               }
               _loc4_.§_-02Q§(_loc5_,_loc6_ as Number);
            }
         }
         _loc4_.addEventListener(Event.§_-a2X§,this.§_-f2L§);
         this.add(_loc4_);
         return _loc4_;
      }
      
      private function §_-f2L§(param1:Event) : void
      {
         §_-f1D§.starling_internal::§_-b3§(param1.target as §_-f1D§);
      }
      
      public function §_-a1Q§(param1:Number) : void
      {
         var _loc4_:* = 0;
         var _loc5_:§_-93Y§ = null;
         var _loc2_:int = int(this.§_-712§.length);
         var _loc3_:* = 0;
         this.§_-Mp§ += param1;
         if(_loc2_ == 0)
         {
            return;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = this.§_-712§[_loc4_];
            if(_loc5_)
            {
               if(_loc3_ != _loc4_)
               {
                  this.§_-712§[_loc3_] = _loc5_;
                  this.§_-712§[_loc4_] = null;
               }
               _loc5_.§_-a1Q§(param1);
               _loc3_++;
            }
            _loc4_++;
         }
         if(_loc3_ != _loc4_)
         {
            _loc2_ = int(this.§_-712§.length);
            while(_loc4_ < _loc2_)
            {
               this.§_-712§[int(_loc3_++)] = this.§_-712§[int(_loc4_++)];
            }
            this.§_-712§.length = _loc3_;
         }
      }
      
      private function onRemove(param1:Event) : void
      {
         this.remove(param1.target as §_-93Y§);
         var _loc2_:§_-f1D§ = param1.target as §_-f1D§;
         if(Boolean(_loc2_) && _loc2_.§_-HU§)
         {
            this.add(_loc2_.§_-r2§);
         }
      }
      
      public function get §_-S1U§() : Number
      {
         return this.§_-Mp§;
      }
      
      protected function get objects() : Vector.<§_-93Y§>
      {
         return this.§_-712§;
      }
   }
}

