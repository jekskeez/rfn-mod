package hscript
{
   import flash.Boot;
   
   public final class Error
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public static var EUnterminatedString:hscript.Error;
      
      public static var EUnterminatedComment:hscript.Error;
      
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
      
      public static function EUnknownVariable(param1:String) : hscript.Error
      {
         return new hscript.Error("EUnknownVariable",4,[param1]);
      }
      
      public static function EUnexpected(param1:String) : hscript.Error
      {
         return new hscript.Error("EUnexpected",1,[param1]);
      }
      
      public static function EInvalidOp(param1:String) : hscript.Error
      {
         return new hscript.Error("EInvalidOp",6,[param1]);
      }
      
      public static function EInvalidIterator(param1:String) : hscript.Error
      {
         return new hscript.Error("EInvalidIterator",5,[param1]);
      }
      
      public static function EInvalidChar(param1:int) : hscript.Error
      {
         return new hscript.Error("EInvalidChar",0,[param1]);
      }
      
      public static function EInvalidAccess(param1:String) : hscript.Error
      {
         return new hscript.Error("EInvalidAccess",7,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-I3§(this);
      }
   }
}

_loc1_.§§slot[7] = new hscript.Error("EUnterminatedComment",3,null);
_loc1_.§§slot[8] = new hscript.Error("EUnterminatedString",2,null);
_loc1_.__constructs__ = ["EInvalidChar","EUnexpected","EUnterminatedString","EUnterminatedComment","EUnknownVariable","EInvalidIterator","EInvalidOp","EInvalidAccess"];

