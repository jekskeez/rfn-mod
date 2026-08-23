package §_-Cc§
{
   import flash.utils.Dictionary;
   
   public class §_-21k§
   {
      
      private var §_-i1P§:Dictionary = new Dictionary();
      
      private var hero:Hero = null;
      
      public function §_-21k§(param1:Hero)
      {
         super();
         this.hero = param1;
      }
      
      public function §_-W10§(param1:§_-pp§) : void
      {
         var _loc2_:Class = (param1 as Object).constructor as Class;
         if(_loc2_ in this.§_-i1P§)
         {
            (this.§_-i1P§[_loc2_] as §_-pp§).hero = null;
         }
         param1.hero = this.hero;
         this.§_-i1P§[_loc2_] = param1;
      }
      
      public function removeState(param1:§_-pp§) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Class = (param1 as Object).constructor as Class;
         if(!(_loc2_ in this.§_-i1P§))
         {
            return;
         }
         param1.hero = null;
         delete this.§_-i1P§[_loc2_];
      }
      
      public function getState(param1:Class) : §_-pp§
      {
         if(param1 in this.§_-i1P§)
         {
            return this.§_-i1P§[param1];
         }
         return null;
      }
      
      public function reset() : void
      {
         var _loc1_:§_-pp§ = null;
         for each(_loc1_ in this.§_-i1P§)
         {
            _loc1_.hero = null;
         }
         this.§_-i1P§ = new Dictionary();
      }
      
      public function update(param1:Number) : void
      {
         var _loc2_:§_-pp§ = null;
         for each(_loc2_ in this.§_-i1P§)
         {
            _loc2_.update(param1);
            if(_loc2_.ended)
            {
               _loc2_.hero = null;
               delete this.§_-i1P§[(_loc2_ as Object).constructor as Class];
            }
         }
      }
      
      public function §_-k20§(param1:Number) : void
      {
         var _loc2_:§_-pp§ = null;
         for each(_loc2_ in this.§_-i1P§)
         {
            _loc2_.§_-k20§(param1);
         }
      }
   }
}

