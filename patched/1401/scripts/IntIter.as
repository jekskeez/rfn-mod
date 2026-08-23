package
{
   import flash.Boot;
   
   public class IntIter
   {
      
      public var min:int;
      
      public var max:int;
      
      public function IntIter(param1:int = 0, param2:int = 0)
      {
         if(Boot.§_-s2I§)
         {
            return;
         }
         min = param1;
         max = param2;
      }
      
      public function next() : int
      {
         var _loc1_:int;
         min = (_loc1_ = min) + 1;
         return _loc1_;
      }
      
      public function hasNext() : Boolean
      {
         return min < max;
      }
   }
}

