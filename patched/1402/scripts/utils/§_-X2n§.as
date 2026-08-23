package utils
{
   import flash.utils.ByteArray;
   
   public final class §_-X2n§
   {
      
      private var §_-M1E§:Number = 0;
      
      private var §_-P1m§:Number = 0;
      
      public function §_-X2n§(param1:*, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.§_-M1E§ = param2;
         this.§_-P1m§ = param3;
         if(param1 is ByteArray)
         {
            this.§_-E1p§(param1);
         }
         else if(param1 is String)
         {
            this.§_-M2r§(param1);
         }
      }
      
      public static function §_-O2R§(param1:uint, param2:uint) : §_-X2n§
      {
         var _loc3_:§_-X2n§ = new §_-X2n§(null);
         _loc3_.§_-P1m§ = param1;
         _loc3_.§_-M1E§ = param2;
         return _loc3_;
      }
      
      public function get highValue() : Number
      {
         return this.§_-M1E§;
      }
      
      public function set highValue(param1:Number) : void
      {
         this.§_-M1E§ = param1;
      }
      
      public function get lowValue() : Number
      {
         return this.§_-P1m§;
      }
      
      public function set lowValue(param1:Number) : void
      {
         this.§_-P1m§ = param1;
      }
      
      public function §_-S6§(param1:ByteArray) : void
      {
         param1.writeUnsignedInt(this.§_-P1m§);
         param1.writeUnsignedInt(this.§_-M1E§);
      }
      
      public function §_-K2w§() : String
      {
         var _loc1_:String = "00000000" + this.§_-P1m§.toString(16);
         _loc1_ = _loc1_.substr(_loc1_.length - 8,8);
         var _loc2_:String = "0000000000" + this.§_-M1E§.toString(16) + _loc1_;
         return _loc2_.substr(_loc2_.length - 10,10).toUpperCase();
      }
      
      public function toString() : String
      {
         var _loc4_:Number = NaN;
         if(this.§_-M1E§ == 0)
         {
            return String(this.§_-P1m§);
         }
         var _loc1_:String = "";
         var _loc2_:Number = this.§_-P1m§;
         var _loc3_:Number = this.§_-M1E§;
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
      
      private function §_-E1p§(param1:ByteArray) : void
      {
         this.§_-P1m§ = param1.readUnsignedInt();
         this.§_-M1E§ = param1.readUnsignedInt();
      }
      
      private function §_-M2r§(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:uint = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = int(param1.charAt(_loc2_));
            this.§_-P1m§ *= 10;
            this.§_-M1E§ *= 10;
            this.§_-P1m§ += _loc3_;
            if(this.§_-P1m§ >= 4294967296)
            {
               _loc4_ = uint(this.§_-P1m§ / 4294967296);
               this.§_-M1E§ += _loc4_;
               this.§_-P1m§ = uint(this.§_-P1m§);
            }
            _loc2_++;
         }
      }
   }
}

