package utils
{
   public dynamic class §_-p1r§ extends Array
   {
      
      private static const §_-xv§:Array = [0,0.01,0.02,0.04,0.05,0.06,0.07,0.08,0.1,0.11,0.12,0.14,0.15,0.16,0.17,0.18,0.2,0.21,0.22,0.24,0.25,0.27,0.28,0.3,0.32,0.34,0.36,0.38,0.4,0.42,0.44,0.46,0.48,0.5,0.53,0.56,0.59,0.62,0.65,0.68,0.71,0.74,0.77,0.8,0.83,0.86,0.89,0.92,0.95,0.98,1,1.06,1.12,1.18,1.24,1.3,1.36,1.42,1.48,1.54,1.6,1.66,1.72,1.78,1.84,1.9,1.96,2,2.12,2.25,2.37,2.5,2.62,2.75,2.87,3,3.2,3.4,3.6,3.8,4,4.3,4.7,4.9,5,5.5,6,6.5,6.8,7,7.3,7.5,7.8,8,8.4,8.7,9,9.4,9.6,9.8,10];
      
      private static const §_-VP§:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1];
      
      private static const §_-N1i§:Number = §_-VP§.length;
      
      public function §_-p1r§(param1:Array = null)
      {
         super();
         param1 = this.§_-nr§(param1);
         this.§_-h1D§(param1.length == §_-N1i§ ? param1 : §_-VP§);
      }
      
      public function reset() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-N1i§)
         {
            this[_loc1_] = §_-VP§[_loc1_];
            _loc1_++;
         }
      }
      
      public function §_-xC§(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         this.§_-cr§(param4);
         this.§_-Qj§(param2);
         this.§_-9I§(param1);
         this.§_-M2U§(param3);
      }
      
      public function §_-9I§(param1:Number) : void
      {
         param1 = this.§_-Vo§(param1,100);
         if(param1 == 0 || isNaN(param1))
         {
            return;
         }
         this.§_-Pf§([1,0,0,0,param1,0,1,0,0,param1,0,0,1,0,param1,0,0,0,1,0,0,0,0,0,1]);
      }
      
      public function §_-Qj§(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         param1 = this.§_-Vo§(param1,100);
         if(param1 == 0)
         {
            return;
         }
         if(param1 < 0)
         {
            _loc2_ = 127 + param1 / 100 * 127;
         }
         else
         {
            _loc2_ = param1 % 1;
            if(_loc2_ == 0)
            {
               _loc2_ = Number(§_-xv§[param1]);
            }
            _loc2_ = _loc2_ * 127 + 127;
         }
         this.§_-Pf§([_loc2_ / 127,0,0,0,0.5 * (127 - _loc2_),0,_loc2_ / 127,0,0,0.5 * (127 - _loc2_),0,0,_loc2_ / 127,0,0.5 * (127 - _loc2_),0,0,0,1,0,0,0,0,0,1]);
      }
      
      public function §_-M2U§(param1:Number) : void
      {
         param1 = this.§_-Vo§(param1,100);
         if(param1 == 0)
         {
            return;
         }
         var _loc2_:Number = 1 + (param1 > 0 ? 3 * param1 / 100 : param1 / 100);
         var _loc3_:Number = 0.3086;
         var _loc4_:Number = 0.6094;
         var _loc5_:Number = 0.082;
         this.§_-Pf§([_loc3_ * (1 - _loc2_) + _loc2_,_loc4_ * (1 - _loc2_),_loc5_ * (1 - _loc2_),0,0,_loc3_ * (1 - _loc2_),_loc4_ * (1 - _loc2_) + _loc2_,_loc5_ * (1 - _loc2_),0,0,_loc3_ * (1 - _loc2_),_loc4_ * (1 - _loc2_),_loc5_ * (1 - _loc2_) + _loc2_,0,0,0,0,0,1,0,0,0,0,0,1]);
      }
      
      public function §_-cr§(param1:Number) : void
      {
         param1 = this.§_-Vo§(param1,180) / 180 * Math.PI;
         if(param1 == 0)
         {
            return;
         }
         var _loc2_:Number = Math.cos(param1);
         var _loc3_:Number = Math.sin(param1);
         var _loc4_:Number = 0.213;
         var _loc5_:Number = 0.715;
         var _loc6_:Number = 0.072;
         this.§_-Pf§([_loc4_ + _loc2_ * (1 - _loc4_) - _loc3_ * _loc4_,_loc5_ - _loc2_ * _loc5_ - _loc3_ * _loc5_,_loc6_ - _loc2_ * _loc6_ + _loc3_ * (1 - _loc6_),0,0,_loc4_ - _loc2_ * _loc4_ + _loc3_ * 0.143,_loc5_ + _loc2_ * (1 - _loc5_) + _loc3_ * 0.14,_loc6_ - _loc2_ * _loc6_ - _loc3_ * 0.283,0,0,_loc4_ - _loc2_ * _loc4_ - _loc3_ * (1 - _loc4_),_loc5_ - _loc2_ * _loc5_ + _loc3_ * _loc5_,_loc6_ + _loc2_ * (1 - _loc6_) + _loc3_ * _loc6_,0,0,0,0,0,1,0,0,0,0,0,1]);
      }
      
      protected function §_-h1D§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-N1i§)
         {
            this[_loc2_] = param1[_loc2_];
            _loc2_++;
         }
      }
      
      protected function §_-Pf§(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < 5)
         {
            _loc4_ = 0;
            while(_loc4_ < 5)
            {
               _loc2_[_loc4_] = this[_loc4_ + _loc3_ * 5];
               _loc4_++;
            }
            _loc4_ = 0;
            while(_loc4_ < 5)
            {
               _loc5_ = 0;
               _loc6_ = 0;
               while(_loc6_ < 5)
               {
                  _loc5_ += param1[_loc4_ + _loc6_ * 5] * _loc2_[_loc6_];
                  _loc6_++;
               }
               this[_loc4_ + _loc3_ * 5] = _loc5_;
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      protected function §_-Vo§(param1:Number, param2:Number) : Number
      {
         return Math.min(param2,Math.max(-param2,param1));
      }
      
      protected function §_-nr§(param1:Array = null) : Array
      {
         if(param1 == null)
         {
            return §_-VP§;
         }
         if(param1 is §_-p1r§)
         {
            param1 = param1.slice(0);
         }
         if(param1.length < §_-N1i§)
         {
            param1 = param1.slice(0,param1.length).concat(§_-VP§.slice(param1.length,§_-N1i§));
         }
         else if(param1.length > §_-N1i§)
         {
            param1 = param1.slice(0,§_-N1i§);
         }
         return param1;
      }
   }
}

