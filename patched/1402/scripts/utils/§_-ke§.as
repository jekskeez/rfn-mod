package utils
{
   public class §_-ke§
   {
      
      public function §_-ke§()
      {
         super();
      }
      
      public static function §_-D1d§(param1:int, param2:int) : int
      {
         return param1 + Math.round(Math.random() * (param2 - param1));
      }
      
      public static function round(param1:Number, param2:int = 0) : Number
      {
         if(int(param1) == param1)
         {
            return param1;
         }
         var _loc3_:int = Math.pow(10,param2);
         return Math.round(param1 * _loc3_) / _loc3_;
      }
      
      public static function §_-L1T§(param1:int) : Vector.<int>
      {
         var _loc6_:int = 0;
         var _loc2_:Vector.<int> = new Vector.<int>();
         var _loc3_:int = param1.toString().length - 1;
         var _loc4_:int = 0;
         var _loc5_:* = _loc3_;
         while(_loc5_ >= 0)
         {
            _loc6_ = int((param1 - _loc4_) / Math.pow(10,_loc5_));
            _loc2_.push(_loc6_);
            _loc4_ += _loc6_ * Math.pow(10,_loc5_);
            _loc5_--;
         }
         return _loc2_;
      }
   }
}

