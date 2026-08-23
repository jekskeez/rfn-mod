package §_-x2C§
{
   import flash.Boot;
   import flash.utils.ByteArray;
   
   public class §_-23v§
   {
      
      public var b:ByteArray;
      
      public function §_-23v§()
      {
         if(Boot.§_-PC§)
         {
            return;
         }
         b = new ByteArray();
      }
      
      public function §_-eK§() : §_-U2O§
      {
         var _loc1_:§_-U2O§ = new §_-U2O§(b.length,b);
         b.position = 0;
         b = null;
         return _loc1_;
      }
      
      public function §_-7P§(param1:§_-U2O§, param2:int, param3:int) : void
      {
         if(param2 < 0 || param3 < 0 || param2 + param3 > param1.length)
         {
            Boot.§_-B2g§ = new Error();
            throw §_-x2C§.Error.OutsideBounds;
         }
         b.writeBytes(param1.b,param2,param3);
      }
      
      public function §_-O12§(param1:int) : void
      {
         b.writeByte(param1);
      }
      
      public function add(param1:§_-U2O§) : void
      {
         b.writeBytes(param1.b);
      }
   }
}

