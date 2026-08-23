package §_-C1m§
{
   import §_-83V§.GameBody;
   
   public class §_-P22§
   {
      
      private var §_-43L§:Array = [];
      
      public function §_-P22§()
      {
         super();
      }
      
      public function add(param1:§_-d29§) : void
      {
         if(this.§_-Bf§(param1))
         {
            return;
         }
         this.§_-43L§.push(param1);
      }
      
      public function get §_-23O§() : Array
      {
         return this.§_-43L§;
      }
      
      public function §_-218§(param1:§_-d29§, param2:Array) : Boolean
      {
         var _loc4_:§_-P1B§ = null;
         if(!param1 || !param1.id)
         {
            return false;
         }
         var _loc3_:GameBody = param2[param1.id] as GameBody;
         if(Boolean(_loc3_) && Boolean(param1))
         {
            if(!GameBody(_loc3_).hasOwnProperty("syncObject"))
            {
               return false;
            }
            _loc4_ = (_loc3_ as GameBody).syncObject;
            if(_loc4_ != null)
            {
               if(_loc4_.personalId != 0 && _loc4_.personalId != param1.personalId)
               {
                  return false;
               }
               _loc4_.§_-z1d§(param1);
               return true;
            }
         }
         return false;
      }
      
      private function §_-Bf§(param1:§_-d29§) : Boolean
      {
         return this.§_-43L§.indexOf(param1) != -1;
      }
      
      public function remove(param1:int) : void
      {
         var _loc2_:§_-d29§ = null;
         for each(_loc2_ in this.§_-43L§)
         {
            if(_loc2_.id == param1)
            {
               this.§_-43L§.splice(this.§_-43L§.indexOf(_loc2_),1);
               break;
            }
         }
      }
      
      public function reset() : void
      {
         var _loc1_:§_-d29§ = null;
         for each(_loc1_ in this.§_-43L§)
         {
            _loc1_.dispose();
         }
         this.§_-43L§ = [];
      }
   }
}

