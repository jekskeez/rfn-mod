package §_-k11§
{
   import flash.Boot;
   
   public final class §_-E2d§
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:*;
      
      public static var SContinue:§_-E2d§;
      
      public static var SBreak:§_-E2d§;
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function §_-E2d§(param1:String, param2:int, param3:*)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function SReturn(param1:*) : §_-E2d§
      {
         return new §_-E2d§("SReturn",2,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.§_-I3§(this);
      }
   }
}

_loc1_.§§slot[1] = new §_-E2d§("SBreak",0,null);
_loc1_.§§slot[2] = new §_-E2d§("SContinue",1,null);
_loc1_.__constructs__ = ["SBreak","SContinue","SReturn"];

