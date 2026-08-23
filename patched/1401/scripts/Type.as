package
{
   import flash.Boot;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   
   public class Type
   {
      
      public function Type()
      {
      }
      
      public static function §_-s1f§(param1:Object) : Class
      {
         var _loc2_:String = getQualifiedClassName(param1);
         if(_loc2_ == "null" || _loc2_ == "Object" || _loc2_ == "int" || _loc2_ == "Number" || _loc2_ == "Boolean")
         {
            return null;
         }
         if(param1.hasOwnProperty("prototype"))
         {
            return null;
         }
         var _loc3_:* = getDefinitionByName(_loc2_) as Class;
         if(_loc3_.__isenum)
         {
            return null;
         }
         return _loc3_;
      }
      
      public static function §_-fR§(param1:Object) : Class
      {
         var _loc2_:String = getQualifiedClassName(param1);
         if(_loc2_ == "null" || _loc2_.substr(0,8) == "builtin.")
         {
            return null;
         }
         if(param1.hasOwnProperty("prototype"))
         {
            return null;
         }
         var _loc3_:* = getDefinitionByName(_loc2_) as Class;
         if(!_loc3_.__isenum)
         {
            return null;
         }
         return _loc3_;
      }
      
      public static function §_-63N§(param1:Class) : Class
      {
         var _loc2_:String = getQualifiedSuperclassName(param1);
         if(_loc2_ == null || _loc2_ == "Object")
         {
            return null;
         }
         return getDefinitionByName(_loc2_) as Class;
      }
      
      public static function §_-l25§(param1:Class) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:String = _loc2_;
         if(_loc3_ == "int")
         {
            return "Int";
         }
         if(_loc3_ == "Number")
         {
            return "Float";
         }
         if(_loc3_ == "Boolean")
         {
            return "Bool";
         }
         return _loc2_.split("::").join(".");
      }
      
      public static function §_-r29§(param1:Class) : String
      {
         return Type.§_-l25§(param1);
      }
      
      public static function resolveClass(param1:String) : Class
      {
         var _loc3_:* = null as Class;
         var _loc4_:* = null;
         var _loc5_:* = null as String;
         try
         {
            _loc3_ = getDefinitionByName(param1) as Class;
            if(_loc3_.__isenum)
            {
               return null;
            }
            return _loc3_;
         }
         catch(_loc_e_:*)
         {
            if(_loc5_ == "Float")
            {
               return Number;
            }
            return null;
         }
      }
      
      public static function §_-O2N§(param1:String) : Class
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         try
         {
            _loc3_ = getDefinitionByName(param1);
            if(!_loc3_.__isenum)
            {
               return null;
            }
            return _loc3_;
         }
         catch(_loc_e_:*)
         {
            return null;
         }
      }
      
      public static function §_-8D§(param1:Class, param2:Array) : Object
      {
         switch(int(param2.length))
         {
            case 0:
               return new param1();
            case 1:
               return new param1(param2[0]);
            case 2:
               return new param1(param2[0],param2[1]);
            case 3:
               return new param1(param2[0],param2[1],param2[2]);
            case 4:
               return new param1(param2[0],param2[1],param2[2],param2[3]);
            case 5:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4]);
            case 6:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5]);
            case 7:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6]);
            case 8:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7]);
            case 9:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8]);
            case 10:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9]);
            case 11:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10]);
            case 12:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11]);
            case 13:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12]);
            case 14:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13]);
            default:
               Boot.§_-tp§ = new Error();
               throw "Too many arguments";
         }
      }
      
      public static function §_-A3t§(param1:Class) : Object
      {
         var _loc3_:* = null as Object;
         var _loc4_:* = null;
         try
         {
            Boot.§_-s2I§ = true;
            _loc3_ = new param1();
            Boot.§_-s2I§ = false;
            return _loc3_;
         }
         catch(_loc_e_:*)
         {
            Boot.§_-s2I§ = false;
            Boot.§_-tp§ = new Error();
            throw _loc4_;
         }
      }
      
      public static function §_-Z2V§(param1:Class, param2:String, param3:Array = undefined) : Object
      {
         var _loc4_:Object = §_-h1J§.field(param1,param2);
         if(_loc4_ == null)
         {
            Boot.§_-tp§ = new Error();
            throw "No such constructor " + param2;
         }
         if(§_-h1J§.§_-SE§(_loc4_))
         {
            if(param3 == null)
            {
               Boot.§_-tp§ = new Error();
               throw "Constructor " + param2 + " need parameters";
            }
            return _loc4_.apply(param1,param3);
         }
         if(param3 != null && int(param3.length) != 0)
         {
            Boot.§_-tp§ = new Error();
            throw "Constructor " + param2 + " does not need parameters";
         }
         return _loc4_;
      }
      
      public static function §_-92g§(param1:Class, param2:int, param3:Array = undefined) : Object
      {
         var _loc4_:String = param1.__constructs__[param2];
         if(_loc4_ == null)
         {
            Boot.§_-tp§ = new Error();
            throw param2 + " is not a valid enum constructor index";
         }
         return Type.§_-Z2V§(param1,_loc4_,param3);
      }
      
      public static function §_-Xi§(param1:*, param2:Boolean) : Array
      {
         var _loc8_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:XML = describeType(param1);
         if(param2)
         {
            _loc4_ = _loc4_.factory[0];
         }
         var _loc5_:XMLList = _loc4_.child("method");
         var _loc6_:int = 0;
         var _loc7_:int = _loc5_.length();
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc3_.push(§_-630§.string(_loc5_[_loc8_].attribute("name")));
         }
         var _loc9_:XMLList = _loc4_.child("variable");
         _loc6_ = 0;
         _loc7_ = _loc9_.length();
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc3_.push(§_-630§.string(_loc9_[_loc8_].attribute("name")));
         }
         var _loc10_:XMLList = _loc4_.child("accessor");
         _loc6_ = 0;
         _loc7_ = _loc10_.length();
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc3_.push(§_-630§.string(_loc10_[_loc8_].attribute("name")));
         }
         return _loc3_;
      }
      
      public static function §_-D1f§(param1:Class) : Array
      {
         return Type.§_-Xi§(param1,true);
      }
      
      public static function §_-y2h§(param1:Class) : Array
      {
         var _loc2_:Array = Type.§_-Xi§(param1,false);
         _loc2_.remove("__construct__");
         _loc2_.remove("prototype");
         return _loc2_;
      }
      
      public static function §_-S1X§(param1:Class) : Array
      {
         var _loc2_:Array = param1.__constructs__;
         return _loc2_.copy();
      }
      
      public static function §_-s20§(param1:*) : §_-Vw§
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:String = getQualifiedClassName(param1);
         var _loc4_:String = _loc3_;
         if(_loc4_ == "null")
         {
            return §_-Vw§.TNull;
         }
         if(_loc4_ == "void")
         {
            return §_-Vw§.TNull;
         }
         if(_loc4_ == "int")
         {
            return §_-Vw§.TInt;
         }
         if(_loc4_ == "Number")
         {
            if((param1 < -268435456 || param1 >= 268435456) && int(param1) == param1)
            {
               return §_-Vw§.TInt;
            }
            return §_-Vw§.TFloat;
         }
         if(_loc4_ == "Boolean")
         {
            return §_-Vw§.TBool;
         }
         if(_loc4_ == "Object")
         {
            return §_-Vw§.TObject;
         }
         if(_loc4_ == "Function")
         {
            return §_-Vw§.TFunction;
         }
         _loc5_ = null;
         try
         {
            _loc5_ = getDefinitionByName(_loc3_);
            if(param1.hasOwnProperty("prototype"))
            {
               return §_-Vw§.TObject;
            }
            if(_loc5_.__isenum)
            {
               return §_-Vw§.TEnum(_loc5_);
            }
            return §_-Vw§.TClass(_loc5_);
         }
         catch(_loc_e_:*)
         {
            if(_loc3_ == "builtin.as$0::MethodClosure" || _loc3_.indexOf("-") != -1)
            {
               return §_-Vw§.TFunction;
            }
            return _loc5_ == null ? §_-Vw§.TFunction : §_-Vw§.TClass(_loc5_);
         }
      }
      
      public static function §_-8G§(param1:Object, param2:Object) : Boolean
      {
         var _loc4_:* = null as Array;
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         if(param1 == param2)
         {
            return true;
         }
         try
         {
            if(param1.index != param2.index)
            {
               return false;
            }
            _loc4_ = param1.params;
            _loc5_ = param2.params;
            _loc6_ = 0;
            _loc7_ = int(_loc4_.length);
            while(_loc6_ < _loc7_)
            {
               _loc8_ = _loc6_++;
               if(!Type.§_-8G§(_loc4_[_loc8_],_loc5_[_loc8_]))
               {
                  return false;
               }
            }
         }
         catch(_loc_e_:*)
         {
         }
      }
      
      public static function §_-B3V§(param1:Object) : String
      {
         return param1.tag;
      }
      
      public static function §_-N2e§(param1:Object) : Array
      {
         return param1.params == null ? [] : param1.params;
      }
      
      public static function §_-Tt§(param1:Object) : int
      {
         return param1.index;
      }
      
      public static function §_-612§(param1:Class) : Array
      {
         var _loc5_:* = null as String;
         var _loc6_:* = null as Object;
         var _loc2_:Array = [];
         var _loc3_:Array = param1.__constructs__;
         var _loc4_:int = 0;
         while(_loc4_ < int(_loc3_.length))
         {
            _loc5_ = _loc3_[_loc4_];
            _loc4_++;
            _loc6_ = §_-h1J§.field(param1,_loc5_);
            if(!§_-h1J§.§_-SE§(_loc6_))
            {
               _loc2_.push(_loc6_);
            }
         }
         return _loc2_;
      }
   }
}

