package §_-U19§
{
   import flash.utils.getTimer;
   
   public class §_-4h§
   {
      
      private var §_-73K§:Object = {};
      
      public var §_-H1m§:int = 0;
      
      public function §_-4h§()
      {
         super();
      }
      
      public function §_-p24§(param1:Array) : void
      {
         this.clear();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(!(param1[_loc2_] in this.§_-73K§))
            {
               this.§_-73K§[param1[_loc2_]] = {};
            }
            this.§_-73K§[param1[_loc2_]]["totem_id"] = param1[_loc2_ + 2];
            this.§_-73K§[param1[_loc2_]]["expires"] = param1[_loc2_ + 1];
            this.§_-73K§[param1[_loc2_]]["slot_id"] = param1[_loc2_];
            _loc2_ += 3;
         }
         this.§_-H1m§ = getTimer() / 1000;
      }
      
      public function §_-h24§(param1:int) : Boolean
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this.§_-73K§)
         {
            if(_loc2_["totem_id"] == param1)
            {
               return _loc2_["slot_id"] == 0 || getTimer() / 1000 < this.§_-H1m§ + _loc2_["expires"];
            }
         }
         return false;
      }
      
      public function §_-HT§(param1:int) : int
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this.§_-73K§)
         {
            if(_loc2_["totem_id"] == param1)
            {
               return _loc2_["slot_id"];
            }
         }
         return §_-su§.NONE;
      }
      
      public function §_-y21§(param1:int) : int
      {
         if(!(param1 in this.§_-73K§))
         {
            return §_-su§.NONE;
         }
         return this.§_-73K§[param1]["totem_id"];
      }
      
      public function get §_-42P§() : Object
      {
         return this.§_-73K§;
      }
      
      private function clear() : void
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this.§_-73K§)
         {
            _loc1_["totem_id"] = §_-su§.NONE;
            _loc1_["expires"] = 0;
         }
      }
   }
}

