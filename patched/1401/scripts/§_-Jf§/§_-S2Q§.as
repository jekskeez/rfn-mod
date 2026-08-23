package §_-Jf§
{
   import flash.Boot;
   import flash.utils.ByteArray;
   
   public class §_-S2Q§
   {
      
      public var §_-rK§:Boolean;
      
      public function §_-S2Q§()
      {
      }
      
      public function writeUInt30(param1:int) : void
      {
         if(param1 < 0 || param1 >= 1073741824)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         if(§_-rK§)
         {
            writeByte(param1 >>> 24);
            writeByte(param1 >> 16 & 0xFF);
            writeByte(param1 >> 8 & 0xFF);
            writeByte(param1 & 0xFF);
         }
         else
         {
            writeByte(param1 & 0xFF);
            writeByte(param1 >> 8 & 0xFF);
            writeByte(param1 >> 16 & 0xFF);
            writeByte(param1 >>> 24);
         }
      }
      
      public function writeUInt24(param1:int) : void
      {
         if(param1 < 0 || param1 >= 16777216)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         if(§_-rK§)
         {
            writeByte(param1 >> 16);
            writeByte(param1 >> 8 & 0xFF);
            writeByte(param1 & 0xFF);
         }
         else
         {
            writeByte(param1 & 0xFF);
            writeByte(param1 >> 8 & 0xFF);
            writeByte(param1 >> 16);
         }
      }
      
      public function writeUInt16(param1:int) : void
      {
         if(param1 < 0 || param1 >= 65536)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         if(§_-rK§)
         {
            writeByte(param1 >> 8);
            writeByte(param1 & 0xFF);
         }
         else
         {
            writeByte(param1 & 0xFF);
            writeByte(param1 >> 8);
         }
      }
      
      public function §_-V2Q§(param1:String) : void
      {
         var _loc2_:§_-y1y§ = §_-y1y§.ofString(param1);
         §_-62W§(_loc2_,0,_loc2_.length);
      }
      
      public function writeInt8(param1:int) : void
      {
         if(param1 < -128 || param1 >= 128)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         writeByte(param1 & 0xFF);
      }
      
      public function writeInt32(param1:int) : void
      {
         var _loc2_:int = 0;
         if(§_-rK§)
         {
            §§push(§§findproperty(writeByte));
            _loc2_ = param1 >>> 24;
            if((_loc2_ >> 30 & 1) != _loc2_ >>> 31)
            {
               Boot.§_-tp§ = new Error();
               throw "Overflow " + _loc2_;
            }
            §§pop().writeByte(_loc2_);
            §§push(§§findproperty(writeByte));
            _loc2_ = param1 >>> 16;
            if((_loc2_ >> 30 & 1) != _loc2_ >>> 31)
            {
               Boot.§_-tp§ = new Error();
               throw "Overflow " + _loc2_;
            }
            §§pop().writeByte(_loc2_ & 0xFF);
            §§push(§§findproperty(writeByte));
            _loc2_ = param1 >>> 8;
            if((_loc2_ >> 30 & 1) != _loc2_ >>> 31)
            {
               Boot.§_-tp§ = new Error();
               throw "Overflow " + _loc2_;
            }
            §§pop().writeByte(_loc2_ & 0xFF);
            §§push(§§findproperty(writeByte));
            _loc2_ = param1 & 0xFF;
            if((_loc2_ >> 30 & 1) != _loc2_ >>> 31)
            {
               Boot.§_-tp§ = new Error();
               throw "Overflow " + _loc2_;
            }
            §§pop().writeByte(_loc2_);
         }
         else
         {
            §§push(§§findproperty(writeByte));
            _loc2_ = param1 & 0xFF;
            if((_loc2_ >> 30 & 1) != _loc2_ >>> 31)
            {
               Boot.§_-tp§ = new Error();
               throw "Overflow " + _loc2_;
            }
            §§pop().writeByte(_loc2_);
            §§push(§§findproperty(writeByte));
            _loc2_ = param1 >>> 8;
            if((_loc2_ >> 30 & 1) != _loc2_ >>> 31)
            {
               Boot.§_-tp§ = new Error();
               throw "Overflow " + _loc2_;
            }
            §§pop().writeByte(_loc2_ & 0xFF);
            §§push(§§findproperty(writeByte));
            _loc2_ = param1 >>> 16;
            if((_loc2_ >> 30 & 1) != _loc2_ >>> 31)
            {
               Boot.§_-tp§ = new Error();
               throw "Overflow " + _loc2_;
            }
            §§pop().writeByte(_loc2_ & 0xFF);
            §§push(§§findproperty(writeByte));
            _loc2_ = param1 >>> 24;
            if((_loc2_ >> 30 & 1) != _loc2_ >>> 31)
            {
               Boot.§_-tp§ = new Error();
               throw "Overflow " + _loc2_;
            }
            §§pop().writeByte(_loc2_);
         }
      }
      
      public function writeInt31(param1:int) : void
      {
         if(param1 < -1073741824 || param1 >= 1073741824)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         if(§_-rK§)
         {
            writeByte(param1 >>> 24);
            writeByte(param1 >> 16 & 0xFF);
            writeByte(param1 >> 8 & 0xFF);
            writeByte(param1 & 0xFF);
         }
         else
         {
            writeByte(param1 & 0xFF);
            writeByte(param1 >> 8 & 0xFF);
            writeByte(param1 >> 16 & 0xFF);
            writeByte(param1 >>> 24);
         }
      }
      
      public function writeInt24(param1:int) : void
      {
         if(param1 < -8388608 || param1 >= 8388608)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         writeUInt24(param1 & 0xFFFFFF);
      }
      
      public function writeInt16(param1:int) : void
      {
         if(param1 < -32768 || param1 >= 32768)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         writeUInt16(param1 & 0xFFFF);
      }
      
      public function §_-w2O§(param1:§_-r1D§, param2:Object = undefined) : void
      {
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null as Eof;
         if(param2 == null)
         {
            param2 = 4096;
         }
         var _loc4_:§_-y1y§ = §_-y1y§.§_-R6§(param2);
         try
         {
            while(true)
            {
               _loc5_ = param1.readBytes(_loc4_,0,param2);
               if(_loc5_ == 0)
               {
                  break;
               }
               _loc6_ = 0;
               while(_loc5_ > 0)
               {
                  _loc7_ = writeBytes(_loc4_,_loc6_,_loc5_);
                  if(_loc7_ == 0)
                  {
                     Boot.§_-tp§ = new Error();
                     throw §_-Jf§.Error.Blocked;
                  }
                  _loc6_ += _loc7_;
                  _loc5_ -= _loc7_;
               }
            }
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Blocked;
         }
         catch(_loc_e_:Eof)
         {
            _loc8_ = _loc_e_;
            return;
         }
      }
      
      public function §_-62W§(param1:§_-y1y§, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         while(param3 > 0)
         {
            _loc4_ = writeBytes(param1,param2,param3);
            param2 += _loc4_;
            param3 -= _loc4_;
         }
      }
      
      public function writeFloat(param1:Number) : void
      {
         Boot.§_-tp§ = new Error();
         throw "Not implemented";
      }
      
      public function writeDouble(param1:Number) : void
      {
         Boot.§_-tp§ = new Error();
         throw "Not implemented";
      }
      
      public function writeBytes(param1:§_-y1y§, param2:int, param3:int) : int
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
            writeByte(int(_loc5_[param2]));
            param2++;
            _loc4_--;
         }
         return param3;
      }
      
      public function writeByte(param1:int) : void
      {
         Boot.§_-tp§ = new Error();
         throw "Not implemented";
      }
      
      public function §_-Ue§(param1:§_-y1y§) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = param1.length;
         var _loc3_:* = 0;
         while(_loc2_ > 0)
         {
            _loc4_ = writeBytes(param1,_loc3_,_loc2_);
            if(_loc4_ == 0)
            {
               Boot.§_-tp§ = new Error();
               throw §_-Jf§.Error.Blocked;
            }
            _loc3_ += _loc4_;
            _loc2_ -= _loc4_;
         }
      }
      
      public function §_-xF§(param1:Boolean) : Boolean
      {
         §_-rK§ = param1;
         return param1;
      }
      
      public function §_-21w§(param1:int) : void
      {
      }
      
      public function flush() : void
      {
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

