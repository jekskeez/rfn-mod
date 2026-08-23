package §_-N14§
{
   import flash.utils.getTimer;
   
   public final class §_-w2t§ implements §_-N1Q§
   {
      
      public static var §_-R2J§:§_-w2t§ = new §_-w2t§();
      
      private var §_-23X§:Vector.<§_-N1Q§>;
      
      private var §_-l20§:Number;
      
      private var §_-ey§:Number = 1;
      
      public function §_-w2t§()
      {
         super();
         this.§_-l20§ = getTimer() * 0.001;
         this.§_-23X§ = new Vector.<§_-N1Q§>();
      }
      
      public function get time() : Number
      {
         return this.§_-l20§;
      }
      
      public function get timeScale() : Number
      {
         return this.§_-ey§;
      }
      
      public function set timeScale(param1:Number) : void
      {
         if(param1 < 0 || isNaN(param1))
         {
            param1 = 0;
         }
         this.§_-ey§ = param1;
      }
      
      public function contains(param1:§_-N1Q§) : Boolean
      {
         return this.§_-23X§.indexOf(param1) >= 0;
      }
      
      public function add(param1:§_-N1Q§) : void
      {
         if(Boolean(param1) && this.§_-23X§.indexOf(param1) == -1)
         {
            this.§_-23X§.push(param1);
         }
      }
      
      public function remove(param1:§_-N1Q§) : void
      {
         var _loc2_:int = this.§_-23X§.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.§_-23X§[_loc2_] = null;
         }
      }
      
      public function clear() : void
      {
         this.§_-23X§.length = 0;
      }
      
      public function §_-ld§(param1:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:§_-N1Q§ = null;
         if(param1 < 0)
         {
            _loc5_ = getTimer() * 0.001;
            param1 = _loc5_ - this.§_-l20§;
            this.§_-l20§ = _loc5_;
         }
         param1 *= this.§_-ey§;
         var _loc2_:int = int(this.§_-23X§.length);
         if(_loc2_ == 0)
         {
            return;
         }
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = this.§_-23X§[_loc4_];
            if(_loc6_)
            {
               if(_loc3_ != _loc4_)
               {
                  this.§_-23X§[_loc3_] = _loc6_;
                  this.§_-23X§[_loc4_] = null;
               }
               _loc6_.§_-ld§(param1);
               _loc3_++;
            }
            _loc4_++;
         }
         if(_loc3_ != _loc4_)
         {
            _loc2_ = int(this.§_-23X§.length);
            while(_loc4_ < _loc2_)
            {
               this.§_-23X§[_loc3_++] = this.§_-23X§[_loc4_++];
            }
            this.§_-23X§.length = _loc3_;
         }
      }
   }
}

