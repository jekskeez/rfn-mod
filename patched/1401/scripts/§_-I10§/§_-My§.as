package §_-I10§
{
   import flash.utils.Dictionary;
   
   public class §_-My§
   {
      
      private static var levels:Object;
      
      private static var §_-bx§:Array;
      
      private static var §_-H2t§:Dictionary;
      
      public function §_-My§()
      {
         super();
      }
      
      public static function init() : void
      {
         if(§_-bx§ != null)
         {
            return;
         }
         levels = §_-t2V§.player.levels;
         §_-bx§ = (levels.data as Array).concat();
         §_-bx§.sort(§_-nh§);
         §_-H2t§ = new Dictionary();
         var _loc1_:int = 0;
         while(_loc1_ < §_-bx§.length)
         {
            §_-H2t§[§_-bx§[_loc1_].level] = §_-bx§[_loc1_].title;
            _loc1_++;
         }
      }
      
      private static function §_-nh§(param1:Object, param2:Object) : int
      {
         return param1.level - param2.level;
      }
      
      public static function get §_-F2b§() : int
      {
         return §_-bx§.length;
      }
      
      public static function get §_-v1S§() : int
      {
         return §_-bx§[§_-bx§.length - 1].experience;
      }
      
      public static function §_-Vi§(param1:int) : int
      {
         return §_-bx§[param1].experience;
      }
      
      public static function §_-kA§(param1:int) : String
      {
         var _loc2_:String = §_-H2t§[param1];
         if(_loc2_ == null)
         {
            _loc2_ = §_-bx§[Math.min(Math.max(param1,0),§_-bx§.length - 1)].title;
         }
         return gls(_loc2_);
      }
      
      public static function §_-1P§(param1:int, param2:int) : Boolean
      {
         if(param1 == param2)
         {
            return false;
         }
         var _loc3_:int = §_-A1x§(param1);
         var _loc4_:int = §_-A1x§(param2);
         return _loc3_ < _loc4_;
      }
      
      public static function §_-51r§(param1:int) : int
      {
         var _loc2_:int = §_-A1x§(param1);
         return Math.max(Math.min(_loc2_,§_-F2b§ - 1),0);
      }
      
      public static function §_-n1z§(param1:int) : String
      {
         var _loc2_:int = Math.min(§_-A1x§(param1),§_-F2b§ - 1);
         return String(_loc2_ > 0 ? _loc2_ : "-");
      }
      
      public static function §_-A1x§(param1:int) : int
      {
         if(param1 >= §_-v1S§)
         {
            return §_-F2b§;
         }
         var _loc2_:int = 0;
         while(_loc2_ < §_-My§.§_-F2b§)
         {
            if(param1 < §_-Vi§(_loc2_))
            {
               return _loc2_ - 1;
            }
            _loc2_++;
         }
         return §_-F2b§;
      }
      
      public static function §_-bh§(param1:int, param2:Boolean = false) : String
      {
         var _loc3_:int = Math.min(param1,§_-My§.§_-F2b§ - 1);
         if(param2)
         {
            return §_-kA§(param1) + " [" + String(_loc3_ > 0 ? _loc3_ : "-") + "]";
         }
         return §_-kA§(param1);
      }
      
      public static function §_-M1a§(param1:int) : int
      {
         var _loc2_:int = §_-A1x§(param1);
         if(_loc2_ >= §_-F2b§)
         {
            return param1;
         }
         return §_-Vi§(_loc2_ + 1) - §_-Vi§(_loc2_);
      }
      
      public static function get §_-U1R§() : int
      {
         return levels.free_game_max_level;
      }
      
      public static function get §_-S1A§() : int
      {
         return levels.free_chat_max_level;
      }
      
      public static function get §_-32h§() : int
      {
         return levels.free_name_change_max_level;
      }
   }
}

