package
{
   import flash.Boot;
   
   public final class §_-Vw§
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public static var TUnknown:§_-Vw§;
      
      public static var TObject:§_-Vw§;
      
      public static var TNull:§_-Vw§;
      
      public static var TInt:§_-Vw§;
      
      public static var TFunction:§_-Vw§;
      
      public static var TFloat:§_-Vw§;
      
      public static var TBool:§_-Vw§;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function §_-Vw§(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function TEnum(param1:Class) : §_-Vw§
      {
         return new §_-Vw§("TEnum",7,[param1]);
      }
      
      public static function TClass(param1:Class) : §_-Vw§
      {
         return new §_-Vw§("TClass",6,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-I3§(this);
      }
   }
}

_loc1_.§§slot[1] = new §_-Vw§("TBool",3,null);
_loc1_.§§slot[4] = new §_-Vw§("TFloat",2,null);
_loc1_.§§slot[5] = new §_-Vw§("TFunction",5,null);
_loc1_.§§slot[6] = new §_-Vw§("TInt",1,null);
_loc1_.§§slot[7] = new §_-Vw§("TNull",0,null);
_loc1_.§§slot[8] = new §_-Vw§("TObject",4,null);
_loc1_.§§slot[9] = new §_-Vw§("TUnknown",8,null);
_loc1_.__constructs__ = ["TNull","TInt","TFloat","TBool","TObject","TFunction","TClass","TEnum","TUnknown"];

