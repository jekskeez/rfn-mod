package §_-Vu§
{
   import flash.utils.getTimer;
   
   public final class §_-p4§ implements §_-93Y§
   {
      
      public static var §_-m1U§:§_-p4§ = new §_-p4§();
      
      private var §_-B3C§:Vector.<§_-93Y§>;
      
      private var §_-J1Z§:Number;
      
      private var §_-L2h§:Number = 1;
      
      public function §_-p4§()
      {
         super();
         this.§_-J1Z§ = getTimer() * 0.001;
         this.§_-B3C§ = new Vector.<§_-93Y§>();
      }
      
      public function get time() : Number
      {
         return this.§_-J1Z§;
      }
      
      public function get timeScale() : Number
      {
         return this.§_-L2h§;
      }
      
      public function set timeScale(param1:Number) : void
      {
         if(param1 < 0 || isNaN(param1))
         {
            param1 = 0;
         }
         this.§_-L2h§ = param1;
      }
      
      public function contains(param1:§_-93Y§) : Boolean
      {
         return this.§_-B3C§.indexOf(param1) >= 0;
      }
      
      public function add(param1:§_-93Y§) : void
      {
         if(Boolean(param1) && this.§_-B3C§.indexOf(param1) == -1)
         {
            this.§_-B3C§.push(param1);
         }
      }
      
      public function remove(param1:§_-93Y§) : void
      {
         var _loc2_:int = this.§_-B3C§.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.§_-B3C§[_loc2_] = null;
         }
      }
      
      public function clear() : void
      {
         this.§_-B3C§.length = 0;
      }
      
      public function §_-a1Q§(param1:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:§_-93Y§ = null;
         if(param1 < 0)
         {
            _loc5_ = getTimer() * 0.001;
            param1 = _loc5_ - this.§_-J1Z§;
            this.§_-J1Z§ = _loc5_;
         }
         param1 *= this.§_-L2h§;
         var _loc2_:int = int(this.§_-B3C§.length);
         if(_loc2_ == 0)
         {
            return;
         }
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = this.§_-B3C§[_loc4_];
            if(_loc6_)
            {
               if(_loc3_ != _loc4_)
               {
                  this.§_-B3C§[_loc3_] = _loc6_;
                  this.§_-B3C§[_loc4_] = null;
               }
               _loc6_.§_-a1Q§(param1);
               _loc3_++;
            }
            _loc4_++;
         }
         if(_loc3_ != _loc4_)
         {
            _loc2_ = int(this.§_-B3C§.length);
            while(_loc4_ < _loc2_)
            {
               this.§_-B3C§[_loc3_++] = this.§_-B3C§[_loc4_++];
            }
            this.§_-B3C§.length = _loc3_;
         }
      }
   }
}

