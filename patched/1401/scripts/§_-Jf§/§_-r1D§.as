package §_-Jf§
{
   import flash.Boot;
   import flash.utils.ByteArray;
   
   public class §_-r1D§
   {
      
      public var §_-rK§:Boolean;
      
      public function §_-r1D§()
      {
      }
      
      public function §_-xF§(param1:Boolean) : Boolean
      {
         §_-rK§ = param1;
         return param1;
      }
      
      public function §_-D1M§(param1:int) : String
      {
         var _loc3_:int = 0;
         var _loc2_:§_-63L§ = new §_-63L§();
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
         if((§_-rK§ ? _loc1_ : _loc4_) >= 64)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         return §_-rK§ ? _loc4_ | _loc3_ << 8 | _loc2_ << 16 | _loc1_ << 24 : _loc1_ | _loc2_ << 8 | _loc3_ << 16 | _loc4_ << 24;
      }
      
      public function readUInt24() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         var _loc3_:int = readByte();
         return §_-rK§ ? _loc3_ | _loc2_ << 8 | _loc1_ << 16 : _loc1_ | _loc2_ << 8 | _loc3_ << 16;
      }
      
      public function readUInt16() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         return §_-rK§ ? _loc2_ | _loc1_ << 8 : _loc1_ | _loc2_ << 8;
      }
      
      public function §_-A5§(param1:int) : String
      {
         var _loc2_:§_-y1y§ = §_-y1y§.§_-R6§(param1);
         §_-BP§(_loc2_,0,param1);
         return _loc2_.toString();
      }
      
      public function §_-Vv§() : String
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Eof;
         var _loc2_:§_-63L§ = new §_-63L§();
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
               Boot.§_-tp§ = new Error();
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
         return §_-rK§ ? (_loc1_ << 8 | _loc2_) << 16 | (_loc3_ << 8 | _loc4_) : (_loc4_ << 8 | _loc3_) << 16 | (_loc2_ << 8 | _loc1_);
      }
      
      public function readInt31() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(§_-rK§)
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
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         return _loc1_ | _loc2_ << 8 | _loc3_ << 16 | _loc4_ << 24;
      }
      
      public function readInt24() : int
      {
         var _loc1_:int = readByte();
         var _loc2_:int = readByte();
         var _loc3_:int = readByte();
         var _loc4_:int = §_-rK§ ? _loc3_ | _loc2_ << 8 | _loc1_ << 16 : _loc1_ | _loc2_ << 8 | _loc3_ << 16;
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
         var _loc3_:int = §_-rK§ ? _loc2_ | _loc1_ << 8 : _loc1_ | _loc2_ << 8;
         if((_loc3_ & 0x8000) != 0)
         {
            return _loc3_ - 65536;
         }
         return _loc3_;
      }
      
      public function §_-BP§(param1:§_-y1y§, param2:int, param3:int) : void
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
         Boot.§_-tp§ = new Error();
         throw "Not implemented";
      }
      
      public function readDouble() : Number
      {
         Boot.§_-tp§ = new Error();
         throw "Not implemented";
      }
      
      public function readBytes(param1:§_-y1y§, param2:int, param3:int) : int
      {
         var _loc4_:int = param3;
         var _loc5_:ByteArray = param1.b;
         if(param2 < 0 || param3 < 0 || param2 + param3 > param1.length)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.OutsideBounds;
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
         Boot.§_-tp§ = new Error();
         throw "Not implemented";
      }
      
      public function §_-j2a§(param1:Object = undefined) : §_-y1y§
      {
         var _loc5_:int = 0;
         var _loc6_:* = null as Eof;
         if(param1 == null)
         {
            param1 = 16384;
         }
         var _loc3_:§_-y1y§ = §_-y1y§.§_-R6§(param1);
         var _loc4_:§_-n2z§ = new §_-n2z§();
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
                  Boot.§_-tp§ = new Error();
                  throw §_-Jf§.Error.OutsideBounds;
               }
               _loc4_.b.writeBytes(_loc3_.b,0,_loc5_);
            }
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Blocked;
         }
         catch(_loc_e_:Eof)
         {
            _loc6_ = _loc_e_;
            return _loc4_.§_-61v§();
         }
      }
      
      public function §_-G2b§(param1:int) : §_-y1y§
      {
         var _loc4_:int = 0;
         var _loc2_:§_-y1y§ = §_-y1y§.§_-R6§(param1);
         var _loc3_:* = 0;
         while(param1 > 0)
         {
            _loc4_ = readBytes(_loc2_,_loc3_,param1);
            if(_loc4_ == 0)
            {
               Boot.§_-tp§ = new Error();
               throw §_-Jf§.Error.Blocked;
            }
            _loc3_ += _loc4_;
            param1 -= _loc4_;
         }
         return _loc2_;
      }
      
      public function close() : void
      {
      }
      
      public function §_-X23§(param1:Boolean) : Boolean
      {
         return §_-xF§(param1);
      }
   }
}

