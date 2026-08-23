package §_-x2C§
{
   import flash.Boot;
   import flash.utils.ByteArray;
   
   public class §_-B3m§
   {
      
      public var §_-b1p§:Boolean;
      
      public function §_-B3m§()
      {
      }
      
      public function §_-o1m§(param1:Boolean) : Boolean
      {
         §_-b1p§ = param1;
         return param1;
      }
      
      public function §_-U1p§(param1:int) : String
      {
         var _loc3_:int = 0;
         var _loc2_:§_-b1q§ = new §_-b1q§();
         while(true)
         {
            _loc3_ = readByte();
            if(_loc3_ == param1)
            {
               break;
            }
            _loc2_.b += String.fromCharCode(_loc3_);
         }
         return _loc2_.b;
      }
      
      public function readUInt30() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         var _loc3_:int = readByte();
         var _loc4_:int = readByte();
         if((§_-b1p§ ? _loc1_ : _loc4_) >= 64)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.Overflow;
         }
         return §_-b1p§ ? _loc4_ | _loc3_ << 8 | _loc2_ << 16 | _loc1_ << 24 : _loc1_ | _loc2_ << 8 | _loc3_ << 16 | _loc4_ << 24;
      }
      
      public function readUInt24() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         var _loc3_:int = readByte();
         return §_-b1p§ ? _loc3_ | _loc2_ << 8 | _loc1_ << 16 : _loc1_ | _loc2_ << 8 | _loc3_ << 16;
      }
      
      public function readUInt16() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         return §_-b1p§ ? _loc2_ | _loc1_ << 8 : _loc1_ | _loc2_ << 8;
      }
      
      public function §_-M2r§(param1:int) : String
      {
         var _loc2_:§_-U2O§ = §_-U2O§.§_-od§(param1);
         §_-x2§(_loc2_,0,param1);
         return _loc2_.toString();
      }
      
      public function §_-yT§() : String
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Eof;
         var _loc2_:§_-b1q§ = new §_-b1q§();
         try
         {
            while(true)
            {
               _loc3_ = readByte();
               if(_loc3_ == 10)
               {
                  break;
               }
               _loc2_.b += String.fromCharCode(_loc3_);
            }
            _loc4_ = _loc2_.b;
            if(_loc4_.charCodeAt(_loc4_.length - 1) == 13)
            {
               _loc4_ = _loc4_.substr(0,-1);
            }
         }
         catch(_loc_e_:Eof)
         {
            _loc5_ = _loc_e_;
            _loc4_ = _loc2_.b;
            if(_loc4_.length == 0)
            {
               Boot.§_-B2g§ = new Error();
               throw _loc5_;
            }
         }
         return _loc4_;
      }
      
      public function readInt8() : int
      {
         var _loc1_:int = readByte();
         if(_loc1_ >= 128)
         {
            return _loc1_ - 256;
         }
         return _loc1_;
      }
      
      public function readInt32() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         var _loc3_:int = readByte();
         var _loc4_:int = readByte();
         return §_-b1p§ ? (_loc1_ << 8 | _loc2_) << 16 | (_loc3_ << 8 | _loc4_) : (_loc4_ << 8 | _loc3_) << 16 | (_loc2_ << 8 | _loc1_);
      }
      
      public function readInt31() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(§_-b1p§)
         {
            _loc4_ = readByte();
            _loc3_ = readByte();
            _loc2_ = readByte();
            _loc1_ = readByte();
         }
         else
         {
            _loc1_ = readByte();
            _loc2_ = readByte();
            _loc3_ = readByte();
            _loc4_ = readByte();
         }
         if((_loc4_ & 0x80) == 0 != ((_loc4_ & 0x40) == 0))
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.Overflow;
         }
         return _loc1_ | _loc2_ << 8 | _loc3_ << 16 | _loc4_ << 24;
      }
      
      public function readInt24() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         var _loc3_:int = readByte();
         var _loc4_:int = §_-b1p§ ? _loc3_ | _loc2_ << 8 | _loc1_ << 16 : _loc1_ | _loc2_ << 8 | _loc3_ << 16;
         if((_loc4_ & 0x800000) != 0)
         {
            return _loc4_ - 16777216;
         }
         return _loc4_;
      }
      
      public function readInt16() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         var _loc3_:int = §_-b1p§ ? _loc2_ | _loc1_ << 8 : _loc1_ | _loc2_ << 8;
         if((_loc3_ & 0x8000) != 0)
         {
            return _loc3_ - 65536;
         }
         return _loc3_;
      }
      
      public function §_-x2§(param1:§_-U2O§, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         while(param3 > 0)
         {
            _loc4_ = readBytes(param1,param2,param3);
            param2 += _loc4_;
            param3 -= _loc4_;
         }
      }
      
      public function readFloat() : Number
      {
         Boot.§_-B2g§ = new Error();
         throw "Not implemented";
      }
      
      public function readDouble() : Number
      {
         Boot.§_-B2g§ = new Error();
         throw "Not implemented";
      }
      
      public function readBytes(param1:§_-U2O§, param2:int, param3:int) : int
      {
         var _loc4_:int = param3;
         var _loc5_:ByteArray = param1.b;
         if(param2 < 0 || param3 < 0 || param2 + param3 > param1.length)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.OutsideBounds;
         }
         while(_loc4_ > 0)
         {
            _loc5_[param2] = readByte();
            param2++;
            _loc4_--;
         }
         return param3;
      }
      
      public function readByte() : int
      {
         Boot.§_-B2g§ = new Error();
         throw "Not implemented";
      }
      
      public function §_-yQ§(param1:Object = undefined) : §_-U2O§
      {
         var _loc5_:int = 0;
         var _loc6_:* = null as Eof;
         if(param1 == null)
         {
            param1 = 16384;
         }
         var _loc3_:§_-U2O§ = §_-U2O§.§_-od§(param1);
         var _loc4_:§_-23v§ = new §_-23v§();
         try
         {
            while(true)
            {
               _loc5_ = readBytes(_loc3_,0,param1);
               if(_loc5_ == 0)
               {
                  break;
               }
               if(_loc5_ < 0 || _loc5_ > _loc3_.length)
               {
                  Boot.§_-B2g§ = new Error();
                  throw §_-x2C§.Error.OutsideBounds;
               }
               _loc4_.b.writeBytes(_loc3_.b,0,_loc5_);
            }
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.Blocked;
         }
         catch(_loc_e_:Eof)
         {
            _loc6_ = _loc_e_;
            return _loc4_.§_-eK§();
         }
      }
      
      public function §_-ot§(param1:int) : §_-U2O§
      {
         var _loc4_:int = 0;
         var _loc2_:§_-U2O§ = §_-U2O§.§_-od§(param1);
         var _loc3_:* = 0;
         while(param1 > 0)
         {
            _loc4_ = readBytes(_loc2_,_loc3_,param1);
            if(_loc4_ == 0)
            {
               Boot.§_-B2g§ = new Error();
               throw §_-x2C§.Error.Blocked;
            }
            _loc3_ += _loc4_;
            param1 -= _loc4_;
         }
         return _loc2_;
      }
      
      public function close() : void
      {
      }
      
      public function §_-BF§(param1:Boolean) : Boolean
      {
         return §_-o1m§(param1);
      }
   }
}

