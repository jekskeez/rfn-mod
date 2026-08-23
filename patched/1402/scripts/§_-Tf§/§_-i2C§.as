package §_-Tf§
{
   import flash.Boot;
   
   public final class §_-i2C§
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public static var SContinue:§_-i2C§;
      
      public static var SBreak:§_-i2C§;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function §_-i2C§(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function SReturn(param1:*) : §_-i2C§
      {
         return new §_-i2C§("SReturn",2,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-11G§(this);
      }
   }
}

_loc1_.§§slot[1] = new §_-i2C§("SBreak",0,null);
_loc1_.§§slot[2] = new §_-i2C§("SContinue",1,null);
_loc1_.__constructs__ = ["SBreak","SContinue","SReturn"];

