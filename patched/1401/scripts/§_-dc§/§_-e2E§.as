package §_-dc§
{
   import flash.utils.getTimer;
   
   public class §_-e2E§
   {
      
      private var §_-12g§:Object = {};
      
      public var §_-rg§:int = 0;
      
      public function §_-e2E§()
      {
         super();
      }
      
      public function §_-DQ§(param1:Array) : void
      {
         this.clear();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(!(param1[_loc2_] in this.§_-12g§))
            {
               this.§_-12g§[param1[_loc2_]] = {};
            }
            this.§_-12g§[param1[_loc2_]]["totem_id"] = param1[_loc2_ + 2];
            this.§_-12g§[param1[_loc2_]]["expires"] = param1[_loc2_ + 1];
            this.§_-12g§[param1[_loc2_]]["slot_id"] = param1[_loc2_];
            _loc2_ += 3;
         }
         this.§_-rg§ = getTimer() / 1000;
      }
      
      public function §_-c2g§(param1:int) : Boolean
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this.§_-12g§)
         {
            if(_loc2_["totem_id"] == param1)
            {
               return _loc2_["slot_id"] == 0 || getTimer() / 1000 < this.§_-rg§ + _loc2_["expires"];
            }
         }
         return false;
      }
      
      public function §_-nz§(param1:int) : int
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this.§_-12g§)
         {
            if(_loc2_["totem_id"] == param1)
            {
               return _loc2_["slot_id"];
            }
         }
         return §_-d1q§.NONE;
      }
      
      public function §_-j2U§(param1:int) : int
      {
         if(!(param1 in this.§_-12g§))
         {
            return §_-d1q§.NONE;
         }
         return this.§_-12g§[param1]["totem_id"];
      }
      
      public function get §_-y2y§() : Object
      {
         return this.§_-12g§;
      }
      
      private function clear() : void
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this.§_-12g§)
         {
            _loc1_["totem_id"] = §_-d1q§.NONE;
            _loc1_["expires"] = 0;
         }
      }
   }
}

