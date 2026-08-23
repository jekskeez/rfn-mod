package hscript
{
   import flash.Boot;
   
   public final class §_-52O§
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public static var EContinue:§_-52O§;
      
      public static var EBreak:§_-52O§;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function §_-52O§(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function EWhile(param1:§_-52O§, param2:§_-52O§) : §_-52O§
      {
         return new §_-52O§("EWhile",10,[param1,param2]);
      }
      
      public static function EVar(param1:String, param2:§_-F9§ = undefined, param3:§_-52O§ = undefined) : §_-52O§
      {
         return new §_-52O§("EVar",2,[param1,param2,param3]);
      }
      
      public static function EUnop(param1:String, param2:Boolean, param3:§_-52O§) : §_-52O§
      {
         return new §_-52O§("EUnop",7,[param1,param2,param3]);
      }
      
      public static function ETry(param1:§_-52O§, param2:String, param3:§_-F9§, param4:§_-52O§) : §_-52O§
      {
         return new §_-52O§("ETry",20,[param1,param2,param3,param4]);
      }
      
      public static function EThrow(param1:§_-52O§) : §_-52O§
      {
         return new §_-52O§("EThrow",19,[param1]);
      }
      
      public static function ETernary(param1:§_-52O§, param2:§_-52O§, param3:§_-52O§) : §_-52O§
      {
         return new §_-52O§("ETernary",22,[param1,param2,param3]);
      }
      
      public static function EReturn(param1:§_-52O§ = undefined) : §_-52O§
      {
         return new §_-52O§("EReturn",15,[param1]);
      }
      
      public static function EParent(param1:§_-52O§) : §_-52O§
      {
         return new §_-52O§("EParent",3,[param1]);
      }
      
      public static function EObject(param1:Array) : §_-52O§
      {
         return new §_-52O§("EObject",21,[param1]);
      }
      
      public static function ENew(param1:String, param2:Array) : §_-52O§
      {
         return new §_-52O§("ENew",18,[param1,param2]);
      }
      
      public static function EIf(param1:§_-52O§, param2:§_-52O§, param3:§_-52O§ = undefined) : §_-52O§
      {
         return new §_-52O§("EIf",9,[param1,param2,param3]);
      }
      
      public static function EIdent(param1:String) : §_-52O§
      {
         return new §_-52O§("EIdent",1,[param1]);
      }
      
      public static function EFunction(param1:Array, param2:§_-52O§, param3:String = undefined, param4:§_-F9§ = undefined) : §_-52O§
      {
         return new §_-52O§("EFunction",14,[param1,param2,param3,param4]);
      }
      
      public static function EFor(param1:String, param2:§_-52O§, param3:§_-52O§) : §_-52O§
      {
         return new §_-52O§("EFor",11,[param1,param2,param3]);
      }
      
      public static function EField(param1:§_-52O§, param2:String) : §_-52O§
      {
         return new §_-52O§("EField",5,[param1,param2]);
      }
      
      public static function EConst(param1:§_-92J§) : §_-52O§
      {
         return new §_-52O§("EConst",0,[param1]);
      }
      
      public static function ECall(param1:§_-52O§, param2:Array) : §_-52O§
      {
         return new §_-52O§("ECall",8,[param1,param2]);
      }
      
      public static function EBlock(param1:Array) : §_-52O§
      {
         return new §_-52O§("EBlock",4,[param1]);
      }
      
      public static function EBinop(param1:String, param2:§_-52O§, param3:§_-52O§) : §_-52O§
      {
         return new §_-52O§("EBinop",6,[param1,param2,param3]);
      }
      
      public static function EArrayDecl(param1:Array) : §_-52O§
      {
         return new §_-52O§("EArrayDecl",17,[param1]);
      }
      
      public static function EArray(param1:§_-52O§, param2:§_-52O§) : §_-52O§
      {
         return new §_-52O§("EArray",16,[param1,param2]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-11G§(this);
      }
   }
}

_loc1_.§§slot[5] = new §_-52O§("EBreak",12,null);
_loc1_.§§slot[8] = new §_-52O§("EContinue",13,null);
_loc1_.__constructs__ = ["EConst","EIdent","EVar","EParent","EBlock","EField","EBinop","EUnop","ECall","EIf","EWhile","EFor","EBreak","EContinue","EFunction","EReturn","EArray","EArrayDecl","ENew","EThrow","ETry","EObject","ETernary"];

