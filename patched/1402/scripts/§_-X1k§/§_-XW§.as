package §_-X1k§
{
   import flash.utils.Dictionary;
   
   public class §_-XW§
   {
      
      private static var levels:Object;
      
      private static var §_-z3§:Array;
      
      private static var §_-dp§:Dictionary;
      
      public function §_-XW§()
      {
         super();
      }
      
      public static function init() : void
      {
         if(§_-z3§ != null)
         {
            return;
         }
         levels = §_-HZ§.player.levels;
         §_-z3§ = (levels.data as Array).concat();
         §_-z3§.sort(§_-D2r§);
         §_-dp§ = new Dictionary();
         var _loc1_:int = 0;
         while(_loc1_ < §_-z3§.length)
         {
            §_-dp§[§_-z3§[_loc1_].level] = §_-z3§[_loc1_].title;
            _loc1_++;
         }
      }
      
      private static function §_-D2r§(param1:Object, param2:Object) : int
      {
         return param1.level - param2.level;
      }
      
      public static function get §_-wC§() : int
      {
         return §_-z3§.length;
      }
      
      public static function get §_-313§() : int
      {
         return §_-z3§[§_-z3§.length - 1].experience;
      }
      
      public static function §_-s2h§(param1:int) : int
      {
         return §_-z3§[param1].experience;
      }
      
      public static function §_-hJ§(param1:int) : String
      {
         var _loc2_:String = §_-dp§[param1];
         if(_loc2_ == null)
         {
            _loc2_ = §_-z3§[Math.min(Math.max(param1,0),§_-z3§.length - 1)].title;
         }
         return gls(_loc2_);
      }
      
      public static function §_-UG§(param1:int, param2:int) : Boolean
      {
         if(param1 == param2)
         {
            return false;
         }
         var _loc3_:int = §_-82P§(param1);
         var _loc4_:int = §_-82P§(param2);
         return _loc3_ < _loc4_;
      }
      
      public static function §_-cO§(param1:int) : int
      {
         var _loc2_:int = §_-82P§(param1);
         return Math.max(Math.min(_loc2_,§_-wC§ - 1),0);
      }
      
      public static function §_-Wh§(param1:int) : String
      {
         var _loc2_:int = Math.min(§_-82P§(param1),§_-wC§ - 1);
         return String(_loc2_ > 0 ? _loc2_ : "-");
      }
      
      public static function §_-82P§(param1:int) : int
      {
         if(param1 >= §_-313§)
         {
            return §_-wC§;
         }
         var _loc2_:int = 0;
         while(_loc2_ < §_-XW§.§_-wC§)
         {
            if(param1 < §_-s2h§(_loc2_))
            {
               return _loc2_ - 1;
            }
            _loc2_++;
         }
         return §_-wC§;
      }
      
      public static function §_-3f§(param1:int, param2:Boolean = false) : String
      {
         var _loc3_:int = Math.min(param1,§_-XW§.§_-wC§ - 1);
         if(param2)
         {
            return §_-hJ§(param1) + " [" + String(_loc3_ > 0 ? _loc3_ : "-") + "]";
         }
         return §_-hJ§(param1);
      }
      
      public static function §_-23§(param1:int) : int
      {
         var _loc2_:int = §_-82P§(param1);
         if(_loc2_ >= §_-wC§)
         {
            return param1;
         }
         return §_-s2h§(_loc2_ + 1) - §_-s2h§(_loc2_);
      }
      
      public static function get §_-I1V§() : int
      {
         return levels.free_game_max_level;
      }
      
      public static function get §_-a26§() : int
      {
         return levels.free_chat_max_level;
      }
      
      public static function get §_-01R§() : int
      {
         return levels.free_name_change_max_level;
      }
   }
}

