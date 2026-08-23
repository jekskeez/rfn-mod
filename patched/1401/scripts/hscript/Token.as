package hscript
{
   import flash.Boot;
   
   public final class Token
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public static var TSemicolon:Token;
      
      public static var TQuestion:Token;
      
      public static var TPOpen:Token;
      
      public static var TPClose:Token;
      
      public static var TEof:Token;
      
      public static var TDoubleDot:Token;
      
      public static var TDot:Token;
      
      public static var TComma:Token;
      
      public static var TBrOpen:Token;
      
      public static var TBrClose:Token;
      
      public static var TBkOpen:Token;
      
      public static var TBkClose:Token;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Token(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function TOp(param1:String) : Token
      {
         return new Token("TOp",3,[param1]);
      }
      
      public static function TId(param1:String) : Token
      {
         return new Token("TId",2,[param1]);
      }
      
      public static function TConst(param1:§_-g1n§) : Token
      {
         return new Token("TConst",1,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-I3§(this);
      }
   }
}

_loc1_.§§slot[1] = new Token("TBkClose",12,null);
_loc1_.§§slot[2] = new Token("TBkOpen",11,null);
_loc1_.§§slot[3] = new Token("TBrClose",7,null);
_loc1_.§§slot[4] = new Token("TBrOpen",6,null);
_loc1_.§§slot[5] = new Token("TComma",9,null);
_loc1_.§§slot[7] = new Token("TDot",8,null);
_loc1_.§§slot[8] = new Token("TDoubleDot",14,null);
_loc1_.§§slot[9] = new Token("TEof",0,null);
_loc1_.§§slot[12] = new Token("TPClose",5,null);
_loc1_.§§slot[13] = new Token("TPOpen",4,null);
_loc1_.§§slot[14] = new Token("TQuestion",13,null);
_loc1_.§§slot[15] = new Token("TSemicolon",10,null);
_loc1_.__constructs__ = ["TEof","TConst","TId","TOp","TPOpen","TPClose","TBrOpen","TBrClose","TDot","TComma","TSemicolon","TBkOpen","TBkClose","TQuestion","TDoubleDot"];

