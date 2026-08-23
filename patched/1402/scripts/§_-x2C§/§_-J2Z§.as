package §_-x2C§
{
   import flash.Boot;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class §_-J2Z§ extends §_-kc§
   {
      
      public var b:ByteArray;
      
      public function §_-J2Z§()
      {
         if(Boot.§_-PC§)
         {
            return;
         }
         b = new ByteArray();
         b.endian = Endian.LITTLE_ENDIAN;
      }
      
      override public function writeUInt30(param1:int) : void
      {
         if(param1 < 0 || param1 >= 1073741824)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.Overflow;
         }
         b.writeInt(param1);
      }
      
      override public function writeUInt16(param1:int) : void
      {
         if(param1 < 0 || param1 >= 65536)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.Overflow;
         }
         b.writeShort(param1);
      }
      
      override public function §_-Xb§(param1:String) : void
      {
         b.writeUTFBytes(param1);
      }
      
      override public function writeInt8(param1:int) : void
      {
         if(param1 < -128 || param1 >= 128)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.Overflow;
         }
         b.writeByte(param1);
      }
      
      override public function writeInt32(param1:int) : void
      {
         b.writeInt(param1);
      }
      
      override public function writeInt31(param1:int) : void
      {
         if(param1 < -1073741824 || param1 >= 1073741824)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.Overflow;
         }
         b.writeInt(param1);
      }
      
      override public function writeInt16(param1:int) : void
      {
         if(param1 < -32768 || param1 >= 32768)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.Overflow;
         }
         b.writeShort(param1);
      }
      
      override public function writeFloat(param1:Number) : void
      {
         b.writeFloat(param1);
      }
      
      override public function writeDouble(param1:Number) : void
      {
         b.writeDouble(param1);
      }
      
      override public function writeBytes(param1:§_-U2O§, param2:int, param3:int) : int
      {
         if(param2 < 0 || param3 < 0 || param2 + param3 > param1.length)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.OutsideBounds;
         }
         b.writeBytes(param1.b,param2,param3);
         return param3;
      }
      
      override public function writeByte(param1:int) : void
      {
         b.writeByte(param1);
      }
      
      override public function §_-o1m§(param1:Boolean) : Boolean
      {
         §_-b1p§ = param1;
         b.endian = param1 ? Endian.BIG_ENDIAN : Endian.LITTLE_ENDIAN;
         return param1;
      }
      
      override public function §_-C1M§(param1:int) : void
      {
         if(param1 > 0)
         {
            b[param1 - 1] = int(b[param1 - 1]);
         }
      }
      
      public function §_-eK§() : §_-U2O§
      {
         var _loc1_:ByteArray = b;
         b = null;
         return new §_-U2O§(_loc1_.length,_loc1_);
      }
   }
}

