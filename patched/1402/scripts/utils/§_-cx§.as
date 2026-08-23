package utils
{
   public class §_-cx§
   {
      
      public function §_-cx§()
      {
         super();
      }
      
      public static function §_-y1Z§(param1:Array) : Array
      {
         var _loc6_:* = undefined;
         var _loc2_:Array = [];
         var _loc3_:Object = {};
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1[_loc5_];
            if(typeof _loc3_[_loc6_] == "undefined" || _loc3_[_loc6_] == null)
            {
               _loc2_.push(_loc6_);
            }
            _loc3_[_loc6_] = _loc6_;
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function §_-Q1v§(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.push(new §_-X2n§(String(param1[_loc4_])));
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function §_-83G§(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:int = int(param1.length);
         var _loc4_:int = int(param2.length);
         if(_loc3_ != _loc4_)
         {
            return false;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if(param1[_loc5_] != param2[_loc5_])
            {
               return false;
            }
            _loc5_++;
         }
         return true;
      }
      
      public static function §_-i1c§(param1:Array, param2:Array) : Array
      {
         var a:Array = param1;
         var b:Array = param2;
         return a.filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            return b.indexOf(param1) == -1;
         });
      }
   }
}

