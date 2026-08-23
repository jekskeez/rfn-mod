package §_-Jf§
{
   import flash.Boot;
   
   public final class Error
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public static var Overflow:§_-Jf§.Error;
      
      public static var OutsideBounds:§_-Jf§.Error;
      
      public static var Blocked:§_-Jf§.Error;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Error(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function Custom(param1:*) : §_-Jf§.Error
      {
         return new §_-Jf§.Error("Custom",3,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-I3§(this);
      }
   }
}

_loc1_.§§slot[1] = new §_-Jf§.Error("Blocked",0,null);
_loc1_.§§slot[3] = new §_-Jf§.Error("OutsideBounds",2,null);
_loc1_.§§slot[4] = new §_-Jf§.Error("Overflow",1,null);
_loc1_.__constructs__ = ["Blocked","Overflow","OutsideBounds","Custom"];

