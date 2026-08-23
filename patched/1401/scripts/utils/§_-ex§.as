package utils
{
   public class §_-ex§
   {
      
      public function §_-ex§()
      {
         super();
      }
      
      public static function §_-R2R§(param1:Number) : int
      {
         if(param1 == 0)
         {
            return 0;
         }
         var _loc2_:Date = new Date();
         var _loc3_:Date = new Date(param1 * 1000);
         var _loc4_:* = int(_loc2_.fullYear - _loc3_.fullYear);
         if(_loc3_.month > _loc2_.month || _loc3_.month == _loc2_.month && _loc3_.date > _loc2_.date)
         {
            _loc4_--;
         }
         if(_loc4_ < 0)
         {
            return 0;
         }
         return _loc4_;
      }
      
      public static function §_-d2X§(param1:int) : String
      {
         var _loc2_:int = param1;
         var _loc3_:int = int(_loc2_ / (24 * 60 * 60));
         _loc2_ %= 24 * 60 * 60;
         var _loc4_:String = new Date(0,0,0,0,0,_loc2_).toTimeString().slice(0,8);
         if(_loc3_ > 0)
         {
            _loc4_ = _loc3_ + gls("д.") + " " + _loc4_;
         }
         return _loc4_;
      }
      
      public static function §_-p1x§(param1:int) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = int(param1 / 60);
         var _loc4_:int = param1 % 60;
         _loc2_ += _loc3_.toString();
         _loc2_ += ":";
         return _loc2_ + ((_loc4_ > 9 ? "" : "0") + _loc4_.toString());
      }
      
      public static function §_-M1D§(param1:int) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = param1 / (24 * 3600);
         var _loc4_:int = param1 % (24 * 3600) / 3600;
         var _loc5_:int = param1 % 3600 / 60;
         var _loc6_:int = param1 % 60;
         if(_loc3_ != 0)
         {
            _loc2_ += _loc3_ + " " + StringUtil.word("день",_loc3_);
         }
         if(_loc4_ != 0)
         {
            if(_loc2_ != "")
            {
               _loc2_ += " ";
            }
            _loc2_ += _loc4_ + " " + StringUtil.word("час",_loc4_);
         }
         if(_loc5_ != 0)
         {
            if(_loc2_ != "")
            {
               _loc2_ += " ";
            }
            _loc2_ += _loc5_ + " " + StringUtil.word("минуту",_loc5_);
         }
         if(_loc6_ != 0 && _loc5_ == 0 && _loc4_ == 0)
         {
            if(_loc2_ != "")
            {
               _loc2_ += " ";
            }
            _loc2_ += _loc6_ + " " + StringUtil.word("секунду",_loc6_);
         }
         return _loc2_;
      }
      
      public static function §_-a1G§(param1:int, param2:Boolean = false) : String
      {
         var _loc3_:int = param1;
         var _loc4_:int = int(_loc3_ / (24 * 60 * 60));
         _loc3_ %= 24 * 60 * 60;
         if(_loc4_ > 0)
         {
            return String(_loc4_) + " " + (param2 ? gls("д.") : StringUtil.word("день",_loc4_));
         }
         var _loc5_:int = int(_loc3_ / 3600);
         _loc3_ %= 3600;
         if(_loc5_ > 0)
         {
            return String(_loc5_) + " " + (param2 ? gls("ч.") : StringUtil.word("час",_loc5_));
         }
         var _loc6_:int = int(_loc3_ / 60);
         return String(_loc6_) + " " + (param2 ? gls("мин.") : StringUtil.word("минута",_loc6_));
      }
      
      public static function §_-P1X§(param1:int) : String
      {
         var _loc2_:Date = new Date(param1 * 1000);
         var _loc3_:String = §_-61l§(_loc2_.getDate());
         var _loc4_:String = §_-61l§(_loc2_.getMonth() + 1);
         var _loc5_:String = §_-61l§(_loc2_.getFullYear());
         return _loc3_ + "." + _loc4_ + "." + _loc5_;
      }
      
      private static function §_-61l§(param1:int) : String
      {
         var _loc2_:String = String(param1);
         if(_loc2_.length < 2)
         {
            _loc2_ = "0" + _loc2_;
         }
         return _loc2_;
      }
   }
}

