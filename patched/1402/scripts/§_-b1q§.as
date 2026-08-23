package
{
   import flash.Boot;
   
   public class §_-b1q§
   {
      
      public var b:String;
      
      public function §_-b1q§()
      {
         if(Boot.§_-PC§)
         {
            return;
         }
         b = "";
      }
      
      public function toString() : String
      {
         return b;
      }
      
      public function §_-pL§(param1:String, param2:int, param3:Object = undefined) : void
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
      
      public function §_-e1o§(param1:int) : void
      {
         b += String.fromCharCode(param1);
      }
      
      public function add(param1:*) : void
      {
         b += param1;
      }
   }
}

