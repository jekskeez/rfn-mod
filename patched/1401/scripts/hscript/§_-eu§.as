package hscript
{
   import flash.Boot;
   
   public final class §_-eu§
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public static var EContinue:§_-eu§;
      
      public static var EBreak:§_-eu§;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function §_-eu§(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function EWhile(param1:§_-eu§, param2:§_-eu§) : §_-eu§
      {
         return new §_-eu§("EWhile",10,[param1,param2]);
      }
      
      public static function EVar(param1:String, param2:§_-V2E§ = undefined, param3:§_-eu§ = undefined) : §_-eu§
      {
         return new §_-eu§("EVar",2,[param1,param2,param3]);
      }
      
      public static function EUnop(param1:String, param2:Boolean, param3:§_-eu§) : §_-eu§
      {
         return new §_-eu§("EUnop",7,[param1,param2,param3]);
      }
      
      public static function ETry(param1:§_-eu§, param2:String, param3:§_-V2E§, param4:§_-eu§) : §_-eu§
      {
         return new §_-eu§("ETry",20,[param1,param2,param3,param4]);
      }
      
      public static function EThrow(param1:§_-eu§) : §_-eu§
      {
         return new §_-eu§("EThrow",19,[param1]);
      }
      
      public static function ETernary(param1:§_-eu§, param2:§_-eu§, param3:§_-eu§) : §_-eu§
      {
         return new §_-eu§("ETernary",22,[param1,param2,param3]);
      }
      
      public static function EReturn(param1:§_-eu§ = undefined) : §_-eu§
      {
         return new §_-eu§("EReturn",15,[param1]);
      }
      
      public static function EParent(param1:§_-eu§) : §_-eu§
      {
         return new §_-eu§("EParent",3,[param1]);
      }
      
      public static function EObject(param1:Array) : §_-eu§
      {
         return new §_-eu§("EObject",21,[param1]);
      }
      
      public static function ENew(param1:String, param2:Array) : §_-eu§
      {
         return new §_-eu§("ENew",18,[param1,param2]);
      }
      
      public static function EIf(param1:§_-eu§, param2:§_-eu§, param3:§_-eu§ = undefined) : §_-eu§
      {
         return new §_-eu§("EIf",9,[param1,param2,param3]);
      }
      
      public static function EIdent(param1:String) : §_-eu§
      {
         return new §_-eu§("EIdent",1,[param1]);
      }
      
      public static function EFunction(param1:Array, param2:§_-eu§, param3:String = undefined, param4:§_-V2E§ = undefined) : §_-eu§
      {
         return new §_-eu§("EFunction",14,[param1,param2,param3,param4]);
      }
      
      public static function EFor(param1:String, param2:§_-eu§, param3:§_-eu§) : §_-eu§
      {
         return new §_-eu§("EFor",11,[param1,param2,param3]);
      }
      
      public static function EField(param1:§_-eu§, param2:String) : §_-eu§
      {
         return new §_-eu§("EField",5,[param1,param2]);
      }
      
      public static function EConst(param1:§_-g1n§) : §_-eu§
      {
         return new §_-eu§("EConst",0,[param1]);
      }
      
      public static function ECall(param1:§_-eu§, param2:Array) : §_-eu§
      {
         return new §_-eu§("ECall",8,[param1,param2]);
      }
      
      public static function EBlock(param1:Array) : §_-eu§
      {
         return new §_-eu§("EBlock",4,[param1]);
      }
      
      public static function EBinop(param1:String, param2:§_-eu§, param3:§_-eu§) : §_-eu§
      {
         return new §_-eu§("EBinop",6,[param1,param2,param3]);
      }
      
      public static function EArrayDecl(param1:Array) : §_-eu§
      {
         return new §_-eu§("EArrayDecl",17,[param1]);
      }
      
      public static function EArray(param1:§_-eu§, param2:§_-eu§) : §_-eu§
      {
         return new §_-eu§("EArray",16,[param1,param2]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-I3§(this);
      }
   }
}

_loc1_.§§slot[5] = new §_-eu§("EBreak",12,null);
_loc1_.§§slot[8] = new §_-eu§("EContinue",13,null);
_loc1_.__constructs__ = ["EConst","EIdent","EVar","EParent","EBlock","EField","EBinop","EUnop","ECall","EIf","EWhile","EFor","EBreak","EContinue","EFunction","EReturn","EArray","EArrayDecl","ENew","EThrow","ETry","EObject","ETernary"];

