package §_-dc§
{
   public class §_-D2W§
   {
      
      private var §_-n2k§:Object = {};
      
      public function §_-D2W§()
      {
         super();
      }
      
      public function §_-23F§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(!(param1[_loc2_] in this.§_-n2k§))
            {
               this.§_-n2k§[param1[_loc2_]] = {};
            }
            this.§_-n2k§[param1[_loc2_]]["totem_id"] = param1[_loc2_];
            this.§_-n2k§[param1[_loc2_]]["level"] = param1[_loc2_ + 1];
            this.§_-n2k§[param1[_loc2_]]["exp"] = param1[_loc2_ + 2];
            this.§_-n2k§[param1[_loc2_]]["max_exp"] = Number(param1[_loc2_ + 3]);
            _loc2_ += 4;
         }
      }
      
      public function §_-N22§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(!(param1[_loc2_] in this.§_-n2k§))
            {
               this.§_-n2k§[param1[_loc2_]] = {};
            }
            this.§_-n2k§[param1[_loc2_]]["totem_id"] = param1[_loc2_];
            this.§_-n2k§[param1[_loc2_]]["bonus"] = param1[_loc2_ + 1];
            _loc2_ += 2;
         }
      }
      
      public function §_-p11§(param1:int) : int
      {
         if(!(param1 in this.§_-n2k§))
         {
            return 0;
         }
         return this.§_-n2k§[param1]["bonus"];
      }
      
      public function §_-N2m§(param1:int) : Object
      {
         if(!(param1 in this.§_-n2k§))
         {
            return null;
         }
         return this.§_-n2k§[param1];
      }
   }
}

