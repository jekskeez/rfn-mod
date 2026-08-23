package hscript
{
   import flash.Boot;
   
   public final class §_-F9§
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function §_-F9§(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function CTPath(param1:Array, param2:Array = undefined) : §_-F9§
      {
         return new §_-F9§("CTPath",0,[param1,param2]);
      }
      
      public static function CTParent(param1:§_-F9§) : §_-F9§
      {
         return new §_-F9§("CTParent",3,[param1]);
      }
      
      public static function CTFun(param1:Array, param2:§_-F9§) : §_-F9§
      {
         return new §_-F9§("CTFun",1,[param1,param2]);
      }
      
      public static function CTAnon(param1:Array) : §_-F9§
      {
         return new §_-F9§("CTAnon",2,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-11G§(this);
      }
   }
}

(global.§_-F9§ = §§newclass(§_-F9§,Object)).__constructs__ = ["CTPath","CTFun","CTAnon","CTParent"];

