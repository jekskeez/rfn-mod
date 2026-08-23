package hscript
{
   import flash.Boot;
   
   public final class §_-V2E§
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function §_-V2E§(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function CTPath(param1:Array, param2:Array = undefined) : §_-V2E§
      {
         return new §_-V2E§("CTPath",0,[param1,param2]);
      }
      
      public static function CTParent(param1:§_-V2E§) : §_-V2E§
      {
         return new §_-V2E§("CTParent",3,[param1]);
      }
      
      public static function CTFun(param1:Array, param2:§_-V2E§) : §_-V2E§
      {
         return new §_-V2E§("CTFun",1,[param1,param2]);
      }
      
      public static function CTAnon(param1:Array) : §_-V2E§
      {
         return new §_-V2E§("CTAnon",2,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-I3§(this);
      }
   }
}

(global.§_-V2E§ = §§newclass(§_-V2E§,Object)).__constructs__ = ["CTPath","CTFun","CTAnon","CTParent"];

