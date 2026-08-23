package protocol
{
   import flash.utils.ByteArray;
   import utils.§_-t2g§;
   
   public class §_-U1M§ extends ByteArray
   {
      
      private static const §_-Z2v§:uint = 65000;
      
      public function §_-U1M§()
      {
         super();
      }
      
      public static function §_-p1M§(param1:uint) : Array
      {
         var _loc4_:uint = 0;
         var _loc2_:Array = [];
         var _loc3_:* = 0;
         do
         {
            _loc4_ = uint(param1 & 0x7F);
            if(param1 >>> 7 != 0)
            {
               _loc4_ |= 128;
            }
            _loc2_[_loc3_++] = _loc4_;
            param1 >>>= 7;
         }
         while(param1 != 0);
         return _loc2_;
      }
      
      override public function writeUTFBytes(param1:String) : void
      {
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         var _loc4_:int = _loc2_ & 0xFFFFFFF0;
         while(_loc3_ < _loc4_)
         {
            writeByte(param1.charCodeAt(_loc3_));
            writeByte(param1.charCodeAt(_loc3_ + 1));
            writeByte(param1.charCodeAt(_loc3_ + 2));
            writeByte(param1.charCodeAt(_loc3_ + 3));
            writeByte(param1.charCodeAt(_loc3_ + 4));
            writeByte(param1.charCodeAt(_loc3_ + 5));
            writeByte(param1.charCodeAt(_loc3_ + 6));
            writeByte(param1.charCodeAt(_loc3_ + 7));
            writeByte(param1.charCodeAt(_loc3_ + 8));
            writeByte(param1.charCodeAt(_loc3_ + 9));
            writeByte(param1.charCodeAt(_loc3_ + 10));
            writeByte(param1.charCodeAt(_loc3_ + 11));
            writeByte(param1.charCodeAt(_loc3_ + 12));
            writeByte(param1.charCodeAt(_loc3_ + 13));
            writeByte(param1.charCodeAt(_loc3_ + 14));
            writeByte(param1.charCodeAt(_loc3_ + 15));
            _loc3_ += 16;
         }
         while(_loc3_ < _loc2_)
         {
            writeByte(param1.charCodeAt(_loc3_));
            _loc3_++;
         }
      }
      
      override public function readUTFBytes(param1:uint) : String
      {
         var _loc6_:uint = 0;
         var _loc7_:Array = null;
         var _loc8_:uint = 0;
         if(bytesAvailable < param1)
         {
            throw new Error("Failed to read past end of the stream");
         }
         var _loc2_:String = "";
         var _loc3_:uint = §_-Z2v§;
         var _loc4_:uint = position + param1;
         var _loc5_:uint = position;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = Math.min(_loc3_,_loc4_ - _loc5_);
            _loc7_ = new Array(_loc6_);
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc7_[_loc8_] = String.fromCharCode(this[_loc5_ + _loc8_]);
               _loc8_++;
            }
            _loc2_ += _loc7_.join("");
            _loc5_ += _loc6_;
         }
         position = _loc4_;
         return this.§_-jx§(_loc2_);
      }
      
      override public function toString() : String
      {
         return "[BA: Length:" + this.length + "]";
      }
      
      public function §_-s15§(param1:*) : int
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:int = 0;
         if(param1 is §_-t2g§)
         {
            _loc2_ = uint(param1.lowValue);
            _loc3_ = uint(param1.highValue);
         }
         else
         {
            _loc2_ = uint(param1);
            _loc3_ = 0;
         }
         while(_loc3_ != 0 || _loc2_ >= 128)
         {
            writeByte(_loc2_ & 0x7F | 0x80);
            _loc2_ = uint(_loc2_ >>> 7 | _loc3_ << 25);
            _loc3_ >>>= 7;
            _loc4_++;
         }
         writeByte(_loc2_ & 0x7F);
         return _loc4_ + 1;
      }
      
      public function §_-C10§() : *
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc1_:int = 0;
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         while(bytesAvailable >= 1)
         {
            _loc4_ = readUnsignedByte();
            _loc5_ = uint(_loc4_ & 0x7F);
            if(_loc1_ < 32)
            {
               _loc2_ |= _loc5_ << _loc1_;
            }
            else
            {
               if(_loc1_ >= 64)
               {
                  break;
               }
               _loc3_ |= _loc5_ << _loc1_ - 32;
            }
            _loc1_ += 7;
            if((_loc4_ & 0x80) == 0)
            {
               break;
            }
         }
         return _loc3_ == 0 ? _loc2_ : §_-t2g§.§_-N1B§(_loc2_,_loc3_);
      }
      
      public function §_-4E§(param1:String) : void
      {
         var _loc2_:String = this.§_-rM§(param1);
         this.§_-s15§(_loc2_.length);
         this.writeUTFBytes(_loc2_);
      }
      
      public function §_-B2h§() : String
      {
         return this.readUTFBytes(this.§_-C10§());
      }
      
      public function §_-bk§(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc8_:uint = 0;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc3_:uint = position;
         position = param1;
         if(param2 == 0)
         {
            param2 = bytesAvailable;
         }
         else
         {
            param2 = Math.min(param2,bytesAvailable);
         }
         var _loc4_:String = "Hex dump of " + param2 + " bytes from offset " + param1 + ":\n";
         var _loc5_:uint = 16;
         var _loc6_:String = "";
         var _loc7_:uint = 0;
         while(_loc7_ < param2)
         {
            if(_loc7_ % _loc5_ == 0)
            {
               if(_loc7_ > 0)
               {
                  _loc4_ += _loc6_ + "\n";
                  _loc6_ = "";
               }
               _loc10_ = (param1 + _loc7_).toString(16).toUpperCase();
               while(_loc10_.length < 8)
               {
                  _loc10_ = "0" + _loc10_;
               }
               _loc4_ += _loc10_ + ": ";
            }
            _loc8_ = readUnsignedByte();
            _loc9_ = _loc8_.toString(16).toUpperCase();
            if(_loc9_.length == 1)
            {
               _loc9_ = "0" + _loc9_;
            }
            _loc6_ += _loc9_ + " ";
            _loc7_++;
         }
         _loc4_ += _loc6_ + "\n";
         position = _loc3_;
         return _loc4_;
      }
      
      private function §_-rM§(param1:String) : String
      {
         return unescape(encodeURIComponent(param1));
      }
      
      private function §_-jx§(param1:String) : String
      {
         return decodeURIComponent(escape(param1));
      }
   }
}

