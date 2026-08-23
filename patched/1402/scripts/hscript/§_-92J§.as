package hscript
{
   import flash.Boot;
   
   public final class §_-92J§
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function §_-92J§(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function CString(param1:String) : §_-92J§
      {
         return new §_-92J§("CString",2,[param1]);
      }
      
      public static function CInt32(param1:int) : §_-92J§
      {
         return new §_-92J§("CInt32",3,[param1]);
      }
      
      public static function CInt(param1:int) : §_-92J§
      {
         return new §_-92J§("CInt",0,[param1]);
      }
      
      public static function CFloat(param1:Number) : §_-92J§
      {
         return new §_-92J§("CFloat",1,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-11G§(this);
      }
   }
}

(global.§_-92J§ = §§newclass(§_-92J§,Object)).__constructs__ = ["CInt","CFloat","CString","CInt32"];

