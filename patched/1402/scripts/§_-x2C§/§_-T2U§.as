package §_-x2C§
{
   import flash.Boot;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class §_-T2U§ extends §_-B3m§
   {
      
      public var b:ByteArray;
      
      public function §_-T2U§(param1:§_-U2O§ = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.§_-PC§)
         {
            return;
         }
         if(param2 == null)
         {
            param2 = 0;
         }
         if(param3 == null)
         {
            param3 = param1.length - param2;
         }
         if(param2 < 0 || param3 < 0 || int(param2 + param3) > param1.length)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.OutsideBounds;
         }
         var _loc4_:ByteArray = param1.b;
         _loc4_.position = param2;
         if(param3 != _loc4_.bytesAvailable)
         {
            b = new ByteArray();
            _loc4_.readBytes(b,0,param3);
         }
         else
         {
            b = _loc4_;
         }
         b.endian = Endian.LITTLE_ENDIAN;
      }
      
      override public function §_-o1m§(param1:Boolean) : Boolean
      {
         §_-b1p§ = param1;
         b.endian = param1 ? Endian.BIG_ENDIAN : Endian.LITTLE_ENDIAN;
         return param1;
      }
      
      override public function readUInt30() : int
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         try
         {
            _loc2_ = b.readInt();
         }
         catch(_loc_e_:*)
         {
            Boot.§_-B2g§ = new Error();
            throw new Eof();
         }
      }
      
      override public function readUInt16() : int
      {
         var _loc2_:* = null;
         try
         {
            b.readUnsignedShort(); //unpopped
         }
         catch(_loc_e_:*)
         {
            Boot.§_-B2g§ = new Error();
            throw new Eof();
         }
      }
      
      override public function §_-M2r§(param1:int) : String
      {
         var _loc3_:* = null;
         try
         {
            b.readUTFBytes(param1); //unpopped
         }
         catch(_loc_e_:*)
         {
            Boot.§_-B2g§ = new Error();
            throw new Eof();
         }
      }
      
      override public function readInt8() : int
      {
         var _loc2_:* = null;
         try
         {
            b.readByte(); //unpopped
         }
         catch(_loc_e_:*)
         {
            Boot.§_-B2g§ = new Error();
            throw new Eof();
         }
      }
      
      override public function readInt32() : int
      {
         var _loc2_:* = null;
         try
         {
            b.readInt(); //unpopped
         }
         catch(_loc_e_:*)
         {
            Boot.§_-B2g§ = new Error();
            throw new Eof();
         }
      }
      
      override public function readInt31() : int
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         try
         {
            _loc2_ = b.readInt();
         }
         catch(_loc_e_:*)
         {
            Boot.§_-B2g§ = new Error();
            throw new Eof();
         }
      }
      
      override public function readInt16() : int
      {
         var _loc2_:* = null;
         try
         {
            b.readShort(); //unpopped
         }
         catch(_loc_e_:*)
         {
            Boot.§_-B2g§ = new Error();
            throw new Eof();
         }
      }
      
      override public function readFloat() : Number
      {
         var _loc2_:* = null;
         try
         {
            b.readFloat(); //unpopped
         }
         catch(_loc_e_:*)
         {
            Boot.§_-B2g§ = new Error();
            throw new Eof();
         }
      }
      
      override public function readDouble() : Number
      {
         var _loc2_:* = null;
         try
         {
            b.readDouble(); //unpopped
         }
         catch(_loc_e_:*)
         {
            Boot.§_-B2g§ = new Error();
            throw new Eof();
         }
      }
      
      override public function readBytes(param1:§_-U2O§, param2:int, param3:int) : int
      {
         var _loc6_:* = null;
         if(param2 < 0 || param3 < 0 || param2 + param3 > param1.length)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.OutsideBounds;
         }
         var _loc5_:int = int(b.bytesAvailable);
         if(param3 > _loc5_ && _loc5_ > 0)
         {
            param3 = _loc5_;
         }
         try
         {
            b.readBytes(param1.b,param2,param3);
         }
         catch(_loc_e_:*)
         {
            Boot.§_-B2g§ = new Error();
            throw new Eof();
         }
      }
      
      override public function readByte() : int
      {
         var _loc2_:* = null;
         try
         {
            b.readUnsignedByte(); //unpopped
         }
         catch(_loc_e_:*)
         {
            Boot.§_-B2g§ = new Error();
            throw new Eof();
         }
      }
   }
}

