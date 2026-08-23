package §_-U19§
{
   public class §_-a2i§
   {
      
      private var §_-423§:Object = {};
      
      public function §_-a2i§()
      {
         super();
      }
      
      public function §_-93n§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(!(param1[_loc2_] in this.§_-423§))
            {
               this.§_-423§[param1[_loc2_]] = {};
            }
            this.§_-423§[param1[_loc2_]]["totem_id"] = param1[_loc2_];
            this.§_-423§[param1[_loc2_]]["level"] = param1[_loc2_ + 1];
            this.§_-423§[param1[_loc2_]]["exp"] = param1[_loc2_ + 2];
            this.§_-423§[param1[_loc2_]]["max_exp"] = Number(param1[_loc2_ + 3]);
            _loc2_ += 4;
         }
      }
      
      public function §_-Kx§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(!(param1[_loc2_] in this.§_-423§))
            {
               this.§_-423§[param1[_loc2_]] = {};
            }
            this.§_-423§[param1[_loc2_]]["totem_id"] = param1[_loc2_];
            this.§_-423§[param1[_loc2_]]["bonus"] = param1[_loc2_ + 1];
            _loc2_ += 2;
         }
      }
      
      public function §_-Q15§(param1:int) : int
      {
         if(!(param1 in this.§_-423§))
         {
            return 0;
         }
         return this.§_-423§[param1]["bonus"];
      }
      
      public function §_-51c§(param1:int) : Object
      {
         if(!(param1 in this.§_-423§))
         {
            return null;
         }
         return this.§_-423§[param1];
      }
   }
}

