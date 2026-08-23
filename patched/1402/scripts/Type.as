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
      
      public static function §_-71N§(param1:Object) : Class
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
      
      public static function §_-02j§(param1:Object) : Class
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
      
      public static function §_-ia§(param1:Class) : Class
      {
         var _loc2_:String = getQualifiedSuperclassName(param1);
         if(_loc2_ == null || _loc2_ == "Object")
         {
            return null;
         }
         return getDefinitionByName(_loc2_) as Class;
      }
      
      public static function §_-Z2W§(param1:Class) : String
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
      
      public static function §_-MY§(param1:Class) : String
      {
         return Type.§_-Z2W§(param1);
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
      
      public static function §_-23D§(param1:String) : Class
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
      
      public static function §_-b2u§(param1:Class, param2:Array) : Object
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
               Boot.§_-B2g§ = new Error();
               throw "Too many arguments";
         }
      }
      
      public static function §_-Nk§(param1:Class) : Object
      {
         var _loc3_:* = null as Object;
         var _loc4_:* = null;
         try
         {
            Boot.§_-PC§ = true;
            _loc3_ = new param1();
            Boot.§_-PC§ = false;
            return _loc3_;
         }
         catch(_loc_e_:*)
         {
            Boot.§_-PC§ = false;
            Boot.§_-B2g§ = new Error();
            throw _loc4_;
         }
      }
      
      public static function §_-V2G§(param1:Class, param2:String, param3:Array = undefined) : Object
      {
         var _loc4_:Object = §_-53k§.field(param1,param2);
         if(_loc4_ == null)
         {
            Boot.§_-B2g§ = new Error();
            throw "No such constructor " + param2;
         }
         if(§_-53k§.§_-M13§(_loc4_))
         {
            if(param3 == null)
            {
               Boot.§_-B2g§ = new Error();
               throw "Constructor " + param2 + " need parameters";
            }
            return _loc4_.apply(param1,param3);
         }
         if(param3 != null && int(param3.length) != 0)
         {
            Boot.§_-B2g§ = new Error();
            throw "Constructor " + param2 + " does not need parameters";
         }
         return _loc4_;
      }
      
      public static function §_-ax§(param1:Class, param2:int, param3:Array = undefined) : Object
      {
         var _loc4_:String = param1.__constructs__[param2];
         if(_loc4_ == null)
         {
            Boot.§_-B2g§ = new Error();
            throw param2 + " is not a valid enum constructor index";
         }
         return Type.§_-V2G§(param1,_loc4_,param3);
      }
      
      public static function §_-ry§(param1:*, param2:Boolean) : Array
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
            _loc3_.push(§_-Mk§.string(_loc5_[_loc8_].attribute("name")));
         }
         var _loc9_:XMLList = _loc4_.child("variable");
         _loc6_ = 0;
         _loc7_ = _loc9_.length();
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc3_.push(§_-Mk§.string(_loc9_[_loc8_].attribute("name")));
         }
         var _loc10_:XMLList = _loc4_.child("accessor");
         _loc6_ = 0;
         _loc7_ = _loc10_.length();
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc3_.push(§_-Mk§.string(_loc10_[_loc8_].attribute("name")));
         }
         return _loc3_;
      }
      
      public static function §_-B32§(param1:Class) : Array
      {
         return Type.§_-ry§(param1,true);
      }
      
      public static function §_-FO§(param1:Class) : Array
      {
         var _loc2_:Array = Type.§_-ry§(param1,false);
         _loc2_.remove("__construct__");
         _loc2_.remove("prototype");
         return _loc2_;
      }
      
      public static function §_-k17§(param1:Class) : Array
      {
         var _loc2_:Array = param1.__constructs__;
         return _loc2_.copy();
      }
      
      public static function §_-A38§(param1:*) : §_-R1W§
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:String = getQualifiedClassName(param1);
         var _loc4_:String = _loc3_;
         if(_loc4_ == "null")
         {
            return §_-R1W§.TNull;
         }
         if(_loc4_ == "void")
         {
            return §_-R1W§.TNull;
         }
         if(_loc4_ == "int")
         {
            return §_-R1W§.TInt;
         }
         if(_loc4_ == "Number")
         {
            if((param1 < -268435456 || param1 >= 268435456) && int(param1) == param1)
            {
               return §_-R1W§.TInt;
            }
            return §_-R1W§.TFloat;
         }
         if(_loc4_ == "Boolean")
         {
            return §_-R1W§.TBool;
         }
         if(_loc4_ == "Object")
         {
            return §_-R1W§.TObject;
         }
         if(_loc4_ == "Function")
         {
            return §_-R1W§.TFunction;
         }
         _loc5_ = null;
         try
         {
            _loc5_ = getDefinitionByName(_loc3_);
            if(param1.hasOwnProperty("prototype"))
            {
               return §_-R1W§.TObject;
            }
            if(_loc5_.__isenum)
            {
               return §_-R1W§.TEnum(_loc5_);
            }
            return §_-R1W§.TClass(_loc5_);
         }
         catch(_loc_e_:*)
         {
            if(_loc3_ == "builtin.as$0::MethodClosure" || _loc3_.indexOf("-") != -1)
            {
               return §_-R1W§.TFunction;
            }
            return _loc5_ == null ? §_-R1W§.TFunction : §_-R1W§.TClass(_loc5_);
         }
      }
      
      public static function §_-v1x§(param1:Object, param2:Object) : Boolean
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
               if(!Type.§_-v1x§(_loc4_[_loc8_],_loc5_[_loc8_]))
               {
                  return false;
               }
            }
         }
         catch(_loc_e_:*)
         {
         }
      }
      
      public static function §_-AB§(param1:Object) : String
      {
         return param1.tag;
      }
      
      public static function §_-G2U§(param1:Object) : Array
      {
         return param1.params == null ? [] : param1.params;
      }
      
      public static function §_-Fy§(param1:Object) : int
      {
         return param1.index;
      }
      
      public static function §_-RK§(param1:Class) : Array
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
            _loc6_ = §_-53k§.field(param1,_loc5_);
            if(!§_-53k§.§_-M13§(_loc6_))
            {
               _loc2_.push(_loc6_);
            }
         }
         return _loc2_;
      }
   }
}

