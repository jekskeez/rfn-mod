package
{
   import flash.Boot;
   
   public class §_-63L§
   {
      
      public var b:String;
      
      public function §_-63L§()
      {
         if(Boot.§_-s2I§)
         {
            return;
         }
         b = "";
      }
      
      public function toString() : String
      {
         return b;
      }
      
      public function §_-p18§(param1:String, param2:int, param3:Object = undefined) : void
      {
         if(param3 == null)
         {
            b += param1.substr(param2);
         }
         else
         {
            b += param1.substr(param2,param3);
         }
      }
      
      public function §_-L2H§(param1:int) : void
      {
         b += String.fromCharCode(param1);
      }
      
      public function add(param1:*) : void
      {
         b += param1;
      }
   }
}

