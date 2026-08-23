package §_-33r§
{
   import flash.utils.Dictionary;
   
   public class §_-J2Z§
   {
      
      private var §_-l1Q§:Dictionary = new Dictionary();
      
      private var hero:Hero = null;
      
      public function §_-J2Z§(param1:Hero)
      {
         super();
         this.hero = param1;
      }
      
      public function §_-gz§(param1:§_-AP§) : void
      {
         var _loc2_:Class = (param1 as Object).constructor as Class;
         if(_loc2_ in this.§_-l1Q§)
         {
            (this.§_-l1Q§[_loc2_] as §_-AP§).hero = null;
         }
         param1.hero = this.hero;
         this.§_-l1Q§[_loc2_] = param1;
      }
      
      public function removeState(param1:§_-AP§) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Class = (param1 as Object).constructor as Class;
         if(!(_loc2_ in this.§_-l1Q§))
         {
            return;
         }
         param1.hero = null;
         delete this.§_-l1Q§[_loc2_];
      }
      
      public function getState(param1:Class) : §_-AP§
      {
         if(param1 in this.§_-l1Q§)
         {
            return this.§_-l1Q§[param1];
         }
         return null;
      }
      
      public function reset() : void
      {
         var _loc1_:§_-AP§ = null;
         for each(_loc1_ in this.§_-l1Q§)
         {
            _loc1_.hero = null;
         }
         this.§_-l1Q§ = new Dictionary();
      }
      
      public function update(param1:Number) : void
      {
         var _loc2_:§_-AP§ = null;
         for each(_loc2_ in this.§_-l1Q§)
         {
            _loc2_.update(param1);
            if(_loc2_.ended)
            {
               _loc2_.hero = null;
               delete this.§_-l1Q§[(_loc2_ as Object).constructor as Class];
            }
         }
      }
      
      public function §_-g1A§(param1:Number) : void
      {
         var _loc2_:§_-AP§ = null;
         for each(_loc2_ in this.§_-l1Q§)
         {
            _loc2_.§_-g1A§(param1);
         }
      }
   }
}

