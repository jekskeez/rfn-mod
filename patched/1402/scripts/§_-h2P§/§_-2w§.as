package §_-h2P§
{
   import §_-8Q§.GameBody;
   
   public class §_-2w§
   {
      
      private var §_-kI§:Array = [];
      
      public function §_-2w§()
      {
         super();
      }
      
      public function add(param1:§_-sE§) : void
      {
         if(this.§_-z2q§(param1))
         {
            return;
         }
         this.§_-kI§.push(param1);
      }
      
      public function get §_-s2F§() : Array
      {
         return this.§_-kI§;
      }
      
      public function §_-DU§(param1:§_-sE§, param2:Array) : Boolean
      {
         var _loc4_:§_-4c§ = null;
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
               _loc4_.§_-s1c§(param1);
               return true;
            }
         }
         return false;
      }
      
      private function §_-z2q§(param1:§_-sE§) : Boolean
      {
         return this.§_-kI§.indexOf(param1) != -1;
      }
      
      public function remove(param1:int) : void
      {
         var _loc2_:§_-sE§ = null;
         for each(_loc2_ in this.§_-kI§)
         {
            if(_loc2_.id == param1)
            {
               this.§_-kI§.splice(this.§_-kI§.indexOf(_loc2_),1);
               break;
            }
         }
      }
      
      public function reset() : void
      {
         var _loc1_:§_-sE§ = null;
         for each(_loc1_ in this.§_-kI§)
         {
            _loc1_.dispose();
         }
         this.§_-kI§ = [];
      }
   }
}

