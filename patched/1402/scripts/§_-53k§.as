package
{
   public class §_-53k§
   {
      
      public function §_-53k§()
      {
      }
      
      public static function §_-21j§(param1:*, param2:String) : Boolean
      {
         return param1.hasOwnProperty(param2);
      }
      
      public static function field(param1:*, param2:String) : *
      {
         var _loc4_:* = null;
         try
         {
            §§push(param1[param2]);
         }
         catch(_loc_e_:*)
         {
            return §§pop();
         }
      }
      
      public static function §_-G2L§(param1:*, param2:String, param3:*) : void
      {
         param1[param2] = param3;
      }
      
      public static function §_-w1W§(param1:*, param2:String) : *
      {
         var _loc4_:* = null;
         try
         {
            try
            {
               return param1["get_" + param2]();
            }
            catch(_loc_e_:*)
            {
            }
         }
         catch(_loc_e_:*)
         {
         }
      }
      
      public static function §_-Wi§(param1:*, param2:String, param3:*) : void
      {
         var _loc5_:* = null;
         try
         {
            param1["set_" + param2](param3);
         }
         catch(_loc_e_:*)
         {
            return;
         }
      }
      
      public static function §_-A1l§(param1:*, param2:*, param3:Array) : *
      {
         return param2.apply(param1,param3);
      }
      
      public static function §_-23Z§(param1:*) : Array
      {
         var _loc4_:* = null as String;
         if(param1 == null)
         {
            return [];
         }
         var _loc3_:Array = [];
         for(_loc4_ in param1)
         {
            if(param1.hasOwnProperty(_loc4_))
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public static function §_-M13§(param1:*) : Boolean
      {
         return typeof param1 == "function";
      }
      
      public static function §_-t2T§(param1:Object, param2:Object) : int
      {
         var _loc3_:* = param1;
         var _loc4_:* = param2;
         return _loc3_ == _loc4_ ? 0 : (_loc3_ > _loc4_ ? 1 : -1);
      }
      
      public static function §_-Q2R§(param1:*, param2:*) : Boolean
      {
         return param1 == param2;
      }
      
      public static function §_-12S§(param1:*) : Boolean
      {
         var _loc4_:* = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:String = typeof param1;
         if(_loc3_ != "object")
         {
            return _loc3_ == "string";
         }
         try
         {
            if(param1.__enum__ == true)
            {
               return false;
            }
         }
         catch(_loc_e_:*)
         {
            return true;
         }
      }
      
      public static function §_-d2t§(param1:*, param2:String) : Boolean
      {
         if(param1.hasOwnProperty(param2) != true)
         {
            return false;
         }
         delete param1[param2];
         return true;
      }
      
      public static function copy(param1:Object) : Object
      {
         var _loc5_:* = null as String;
         var _loc2_:* = {};
         var _loc3_:int = 0;
         var _loc4_:Array = §_-53k§.§_-23Z§(param1);
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_[_loc5_] = §_-53k§.field(param1,_loc5_);
         }
         return _loc2_;
      }
      
      public static function §_-79§(param1:Function) : *
      {
         var f:Function = param1;
         return function(... rest):*
         {
            return f(rest);
         };
      }
   }
}

