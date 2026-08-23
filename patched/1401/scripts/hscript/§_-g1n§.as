package hscript
{
   import flash.Boot;
   
   public final class §_-g1n§
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function §_-g1n§(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function CString(param1:String) : §_-g1n§
      {
         return new §_-g1n§("CString",2,[param1]);
      }
      
      public static function CInt32(param1:int) : §_-g1n§
      {
         return new §_-g1n§("CInt32",3,[param1]);
      }
      
      public static function CInt(param1:int) : §_-g1n§
      {
         return new §_-g1n§("CInt",0,[param1]);
      }
      
      public static function CFloat(param1:Number) : §_-g1n§
      {
         return new §_-g1n§("CFloat",1,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-I3§(this);
      }
   }
}

(global.§_-g1n§ = §§newclass(§_-g1n§,Object)).__constructs__ = ["CInt","CFloat","CString","CInt32"];

