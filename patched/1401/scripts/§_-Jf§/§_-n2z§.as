package §_-Jf§
{
   import flash.Boot;
   import flash.utils.ByteArray;
   
   public class §_-n2z§
   {
      
      public var b:ByteArray;
      
      public function §_-n2z§()
      {
         if(Boot.§_-s2I§)
         {
            return;
         }
         b = new ByteArray();
      }
      
      public function §_-61v§() : §_-y1y§
      {
         var _loc1_:§_-y1y§ = new §_-y1y§(b.length,b);
         b.position = 0;
         b = null;
         return _loc1_;
      }
      
      public function §_-R2h§(param1:§_-y1y§, param2:int, param3:int) : void
      {
         if(param2 < 0 || param3 < 0 || param2 + param3 > param1.length)
         {
            Boot.§_-tp§ = new Error();
            throw §_-Jf§.Error.OutsideBounds;
         }
         b.writeBytes(param1.b,param2,param3);
      }
      
      public function §_-Il§(param1:int) : void
      {
         b.writeByte(param1);
      }
      
      public function add(param1:§_-y1y§) : void
      {
         b.writeBytes(param1.b);
      }
   }
}

