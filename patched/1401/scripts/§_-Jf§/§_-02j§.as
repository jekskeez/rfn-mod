package §_-Jf§
{
   import flash.Boot;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class §_-02j§ extends §_-S2Q§
   {
      
      public var b:ByteArray;
      
      public function §_-02j§()
      {
         if(Boot.§_-s2I§)
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
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         b.writeInt(param1);
      }
      
      override public function writeUInt16(param1:int) : void
      {
         if(param1 < 0 || param1 >= 65536)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         b.writeShort(param1);
      }
      
      override public function §_-V2Q§(param1:String) : void
      {
         b.writeUTFBytes(param1);
      }
      
      override public function writeInt8(param1:int) : void
      {
         if(param1 < -128 || param1 >= 128)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
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
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
         }
         b.writeInt(param1);
      }
      
      override public function writeInt16(param1:int) : void
      {
         if(param1 < -32768 || param1 >= 32768)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.Overflow;
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
      
      override public function writeBytes(param1:§_-y1y§, param2:int, param3:int) : int
      {
         if(param2 < 0 || param3 < 0 || param2 + param3 > param1.length)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.OutsideBounds;
         }
         b.writeBytes(param1.b,param2,param3);
         return param3;
      }
      
      override public function writeByte(param1:int) : void
      {
         b.writeByte(param1);
      }
      
      override public function §_-xF§(param1:Boolean) : Boolean
      {
         §_-rK§ = param1;
         b.endian = param1 ? Endian.BIG_ENDIAN : Endian.LITTLE_ENDIAN;
         return param1;
      }
      
      override public function §_-21w§(param1:int) : void
      {
         if(param1 > 0)
         {
            b[param1 - 1] = int(b[param1 - 1]);
         }
      }
      
      public function §_-61v§() : §_-y1y§
      {
         var _loc1_:ByteArray = b;
         b = null;
         return new §_-y1y§(_loc1_.length,_loc1_);
      }
   }
}

