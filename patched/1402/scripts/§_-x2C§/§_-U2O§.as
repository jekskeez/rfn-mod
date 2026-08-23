package §_-x2C§
{
   import flash.Boot;
   import flash.utils.ByteArray;
   
   public class §_-U2O§
   {
      
      public var length:int;
      
      public var b:ByteArray;
      
      public function §_-U2O§(param1:int = 0, param2:ByteArray = undefined)
      {
         if(Boot.§_-PC§)
         {
            return;
         }
         length = param1;
         b = param2;
      }
      
      public static function §_-od§(param1:int) : §_-U2O§
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.length = param1;
         return new §_-U2O§(param1,_loc2_);
      }
      
      public static function ofString(param1:String) : §_-U2O§
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTFBytes(param1);
         return new §_-U2O§(_loc2_.length,_loc2_);
      }
      
      public static function §_-11c§(param1:ByteArray) : §_-U2O§
      {
         return new §_-U2O§(param1.length,param1);
      }
      
      public function toString() : String
      {
         b.position = 0;
         return b.readUTFBytes(length);
      }
      
      public function §_-K2w§() : String
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:§_-b1q§ = new §_-b1q§();
         var _loc2_:Array = [];
         var _loc3_:String = "0123456789abcdef";
         var _loc4_:int = 0;
         var _loc5_:int = _loc3_.length;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc2_.push(_loc3_.charCodeAt(_loc6_));
         }
         _loc4_ = 0;
         _loc5_ = length;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc7_ = int(b[_loc6_]);
            _loc8_ = _loc2_[_loc7_ >> 4];
            _loc1_.b += String.fromCharCode(_loc8_);
            _loc8_ = _loc2_[_loc7_ & 0x0F];
            _loc1_.b += String.fromCharCode(_loc8_);
         }
         return _loc1_.b;
      }
      
      public function sub(param1:int, param2:int) : §_-U2O§
      {
         if(param1 < 0 || param2 < 0 || param1 + param2 > length)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.OutsideBounds;
         }
         b.position = param1;
         var _loc3_:ByteArray = new ByteArray();
         b.readBytes(_loc3_,0,param2);
         return new §_-U2O§(param2,_loc3_);
      }
      
      public function set(param1:int, param2:int) : void
      {
         b[param1] = param2;
      }
      
      public function §_-M2r§(param1:int, param2:int) : String
      {
         if(param1 < 0 || param2 < 0 || param1 + param2 > length)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.OutsideBounds;
         }
         b.position = param1;
         return b.readUTFBytes(param2);
      }
      
      public function §_-n4§() : ByteArray
      {
         return b;
      }
      
      public function get(param1:int) : int
      {
         return int(b[param1]);
      }
      
      public function §_-t2T§(param1:§_-U2O§) : int
      {
         var _loc7_:int = 0;
         var _loc2_:int = length < param1.length ? length : param1.length;
         var _loc3_:ByteArray = b;
         var _loc4_:ByteArray = param1.b;
         _loc3_.position = 0;
         _loc4_.position = 0;
         var _loc5_:int = 0;
         var _loc6_:int = _loc2_ >> 2;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            if(_loc3_.readUnsignedInt() != _loc4_.readUnsignedInt())
            {
               _loc3_.position -= 4;
               _loc4_.position -= 4;
               return _loc3_.readUnsignedInt() - _loc4_.readUnsignedInt();
            }
         }
         _loc5_ = 0;
         _loc6_ = _loc2_ & 3;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            if(_loc3_.readUnsignedByte() != _loc4_.readUnsignedByte())
            {
               return int(_loc3_[_loc3_.position - 1]) - int(_loc4_[_loc4_.position - 1]);
            }
         }
         return length - param1.length;
      }
      
      public function §_-mm§(param1:int, param2:§_-U2O§, param3:int, param4:int) : void
      {
         if(param1 < 0 || param3 < 0 || param4 < 0 || param1 + param4 > length || param3 + param4 > param2.length)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.OutsideBounds;
         }
         b.position = param1;
         b.writeBytes(param2.b,param3,param4);
      }
   }
}

