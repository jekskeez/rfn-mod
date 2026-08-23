package §_-AY§
{
   import §_-C1Y§.§_-tc§;
   import §_-s2e§.§_-O1h§;
   import §_-s2e§.§_-UB§;
   import dragonBones.§_-833§;
   import dragonBones.§_-83b§;
   import dragonBones.§_-z2H§;
   
   public class §_-Su§
   {
      
      public var slots:Vector.<§_-z2H§> = new Vector.<§_-z2H§>();
      
      private var §_-P2w§:Object;
      
      public function §_-Su§(param1:Object = null)
      {
         super();
         this.§_-P2w§ = param1;
      }
      
      public function get params() : Object
      {
         return this.§_-P2w§;
      }
      
      public function §_-N1Z§(param1:§_-833§, param2:Boolean) : void
      {
         var _loc4_:§_-z2H§ = null;
         var _loc5_:§_-83b§ = null;
         var _loc3_:Vector.<§_-83b§> = param1.getBones();
         for each(_loc5_ in _loc3_)
         {
            _loc4_ = this.§_-J1t§(_loc5_,param2);
            if(!(!_loc4_ && !(_loc4_ = this.§_-i2H§(_loc5_,param2))))
            {
               this.slots.push(_loc4_);
            }
         }
      }
      
      public function §_-O2O§(param1:§_-833§) : void
      {
         var _loc2_:§_-z2H§ = null;
         for each(_loc2_ in this.slots)
         {
            if(_loc2_.childArmature)
            {
               _loc2_.childArmature.dispose();
               _loc2_.childArmature = null;
            }
            _loc2_.display = null;
            if(_loc2_.userData)
            {
               _loc2_.parent.removeChild(_loc2_);
               _loc2_.dispose();
            }
         }
         this.slots = null;
      }
      
      protected function §_-i2H§(param1:§_-83b§, param2:Boolean) : §_-z2H§
      {
         var _loc4_:§_-z2H§ = null;
         var _loc3_:§_-833§ = this.§_-y1y§(this.params.id,param2).§_-i2H§(param1.name + "/" + this.params.skeleton);
         if(_loc3_)
         {
            _loc4_ = this.§_-73U§(param1,param2);
            _loc4_.childArmature = _loc3_;
         }
         return _loc4_;
      }
      
      protected function §_-73U§(param1:§_-83b§, param2:Boolean) : §_-z2H§
      {
         var _loc3_:§_-z2H§ = §_-O1h§.§_-73U§(param2);
         _loc3_.§_-x1D§.copy(param1.slot.§_-x1D§);
         _loc3_.zOrder = param1.slot.zOrder + 1;
         _loc3_.userData = true;
         param1.addChild(_loc3_);
         return _loc3_;
      }
      
      protected function §_-J1t§(param1:§_-83b§, param2:Boolean) : §_-z2H§
      {
         var _loc3_:Object = this.§_-y1y§(this.params.id,param2).§_-Hq§(param1.name + "/" + this.params.skeleton);
         if(!_loc3_)
         {
            return null;
         }
         param1.slot.display = _loc3_;
         return param1.slot;
      }
      
      protected function §_-y1y§(param1:int, param2:Boolean) : §_-tc§
      {
         return §_-UB§.§_-y1y§(param1,param2);
      }
   }
}

