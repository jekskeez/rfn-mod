package utils
{
   import flash.utils.ByteArray;
   
   public final class §_-t2g§
   {
      
      private var §_-f2R§:Number = 0;
      
      private var §_-L1B§:Number = 0;
      
      public function §_-t2g§(param1:*, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.§_-f2R§ = param2;
         this.§_-L1B§ = param3;
         if(param1 is ByteArray)
         {
            this.§_-t1Y§(param1);
         }
         else if(param1 is String)
         {
            this.§_-A5§(param1);
         }
      }
      
      public static function §_-N1B§(param1:uint, param2:uint) : §_-t2g§
      {
         var _loc3_:§_-t2g§ = new §_-t2g§(null);
         _loc3_.§_-L1B§ = param1;
         _loc3_.§_-f2R§ = param2;
         return _loc3_;
      }
      
      public function get highValue() : Number
      {
         return this.§_-f2R§;
      }
      
      public function set highValue(param1:Number) : void
      {
         this.§_-f2R§ = param1;
      }
      
      public function get lowValue() : Number
      {
         return this.§_-L1B§;
      }
      
      public function set lowValue(param1:Number) : void
      {
         this.§_-L1B§ = param1;
      }
      
      public function §_-Ue§(param1:ByteArray) : void
      {
         param1.writeUnsignedInt(this.§_-L1B§);
         param1.writeUnsignedInt(this.§_-f2R§);
      }
      
      public function §_-t1k§() : String
      {
         var _loc1_:String = "00000000" + this.§_-L1B§.toString(16);
         _loc1_ = _loc1_.substr(_loc1_.length - 8,8);
         var _loc2_:String = "0000000000" + this.§_-f2R§.toString(16) + _loc1_;
         return _loc2_.substr(_loc2_.length - 10,10).toUpperCase();
      }
      
      public function toString() : String
      {
         var _loc4_:Number = NaN;
         if(this.§_-f2R§ == 0)
         {
            return String(this.§_-L1B§);
         }
         var _loc1_:String = "";
         var _loc2_:Number = this.§_-L1B§;
         var _loc3_:Number = this.§_-f2R§;
         while(_loc3_ != 0)
         {
            _loc4_ = _loc3_ % 10;
            _loc3_ = uint(_loc3_ / 10);
            _loc2_ += _loc4_ * 4294967296;
            _loc1_ = String(_loc2_ % 10) + _loc1_;
            _loc2_ = uint(_loc2_ / 10);
         }
         return String(_loc2_) + _loc1_;
      }
      
      private function §_-t1Y§(param1:ByteArray) : void
      {
         this.§_-L1B§ = param1.readUnsignedInt();
         this.§_-f2R§ = param1.readUnsignedInt();
      }
      
      private function §_-A5§(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:uint = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = int(param1.charAt(_loc2_));
            this.§_-L1B§ *= 10;
            this.§_-f2R§ *= 10;
            this.§_-L1B§ += _loc3_;
            if(this.§_-L1B§ >= 4294967296)
            {
               _loc4_ = uint(this.§_-L1B§ / 4294967296);
               this.§_-f2R§ += _loc4_;
               this.§_-L1B§ = uint(this.§_-L1B§);
            }
            _loc2_++;
         }
      }
   }
}

