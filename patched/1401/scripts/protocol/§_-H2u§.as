package protocol
{
   import §_-F1E§.§_-41e§;
   import flash.utils.Dictionary;
   
   public class §_-H2u§
   {
      
      private static var collection:Dictionary = new Dictionary();
      
      public function §_-H2u§()
      {
         super();
      }
      
      public static function §_-2S§(param1:int) : Boolean
      {
         var _loc2_:§_-41e§ = null;
         for each(_loc2_ in collection)
         {
            if(_loc2_.playerId == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function get §_-31k§() : Boolean
      {
         var _loc1_:§_-41e§ = null;
         var _loc2_:int = 0;
         var _loc3_:* = collection;
         for each(_loc1_ in _loc3_)
         {
            return false;
         }
         return true;
      }
      
      public static function add(param1:§_-41e§) : void
      {
         collection[param1] = param1;
      }
      
      public static function remove(param1:§_-41e§) : void
      {
         delete collection[param1];
      }
      
      public static function §_-q5§(param1:int, param2:Array) : void
      {
         var _loc3_:§_-41e§ = null;
         for each(_loc3_ in collection)
         {
            _loc3_.§_-q5§(param1,param2);
         }
      }
      
      public static function §_-t2O§(param1:§_-S2I§) : void
      {
         var _loc2_:§_-41e§ = null;
         for each(_loc2_ in collection)
         {
            _loc2_.§_-t2O§(param1);
         }
      }
   }
}

