package
{
   import flash.Boot;
   
   public final class §_-R1W§
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public static var TUnknown:§_-R1W§;
      
      public static var TObject:§_-R1W§;
      
      public static var TNull:§_-R1W§;
      
      public static var TInt:§_-R1W§;
      
      public static var TFunction:§_-R1W§;
      
      public static var TFloat:§_-R1W§;
      
      public static var TBool:§_-R1W§;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function §_-R1W§(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function TEnum(param1:Class) : §_-R1W§
      {
         return new §_-R1W§("TEnum",7,[param1]);
      }
      
      public static function TClass(param1:Class) : §_-R1W§
      {
         return new §_-R1W§("TClass",6,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-11G§(this);
      }
   }
}

_loc1_.§§slot[1] = new §_-R1W§("TBool",3,null);
_loc1_.§§slot[4] = new §_-R1W§("TFloat",2,null);
_loc1_.§§slot[5] = new §_-R1W§("TFunction",5,null);
_loc1_.§§slot[6] = new §_-R1W§("TInt",1,null);
_loc1_.§§slot[7] = new §_-R1W§("TNull",0,null);
_loc1_.§§slot[8] = new §_-R1W§("TObject",4,null);
_loc1_.§§slot[9] = new §_-R1W§("TUnknown",8,null);
_loc1_.__constructs__ = ["TNull","TInt","TFloat","TBool","TObject","TFunction","TClass","TEnum","TUnknown"];

