package protocol
{
   import §_-v2M§.§_-A3f§;
   import flash.utils.Dictionary;
   
   public class §_-Y2M§
   {
      
      private static var collection:Dictionary = new Dictionary();
      
      public function §_-Y2M§()
      {
         super();
      }
      
      public static function §_-FS§(param1:int) : Boolean
      {
         var _loc2_:§_-A3f§ = null;
         for each(_loc2_ in collection)
         {
            if(_loc2_.playerId == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function get §_-p2i§() : Boolean
      {
         var _loc1_:§_-A3f§ = null;
         var _loc2_:int = 0;
         var _loc3_:* = collection;
         for each(_loc1_ in _loc3_)
         {
            return false;
         }
         return true;
      }
      
      public static function add(param1:§_-A3f§) : void
      {
         collection[param1] = param1;
      }
      
      public static function remove(param1:§_-A3f§) : void
      {
         delete collection[param1];
      }
      
      public static function §_-S1u§(param1:int, param2:Array) : void
      {
         var _loc3_:§_-A3f§ = null;
         for each(_loc3_ in collection)
         {
            _loc3_.§_-S1u§(param1,param2);
         }
      }
      
      public static function §_-51x§(param1:§_-s2l§) : void
      {
         var _loc2_:§_-A3f§ = null;
         for each(_loc2_ in collection)
         {
            _loc2_.§_-51x§(param1);
         }
      }
   }
}

