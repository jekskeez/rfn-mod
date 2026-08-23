package §_-53U§
{
   import §_-430§.§_-fr§;
   import §_-68§.§_-M10§;
   import §_-68§.§_-c1l§;
   import dragonBones.§_-Bq§;
   import dragonBones.§_-E1r§;
   import dragonBones.§_-TH§;
   
   public class §_-M26§
   {
      
      public var slots:Vector.<§_-Bq§> = new Vector.<§_-Bq§>();
      
      private var §_-rv§:Object;
      
      public function §_-M26§(param1:Object = null)
      {
         super();
         this.§_-rv§ = param1;
      }
      
      public function get params() : Object
      {
         return this.§_-rv§;
      }
      
      public function §_-83Y§(param1:§_-E1r§, param2:Boolean) : void
      {
         var _loc4_:§_-Bq§ = null;
         var _loc5_:§_-TH§ = null;
         var _loc3_:Vector.<§_-TH§> = param1.getBones();
         for each(_loc5_ in _loc3_)
         {
            _loc4_ = this.§_-y2e§(_loc5_,param2);
            if(!(!_loc4_ && !(_loc4_ = this.§_-g1F§(_loc5_,param2))))
            {
               this.slots.push(_loc4_);
            }
         }
      }
      
      public function §_-q2v§(param1:§_-E1r§) : void
      {
         var _loc2_:§_-Bq§ = null;
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
      
      protected function §_-g1F§(param1:§_-TH§, param2:Boolean) : §_-Bq§
      {
         var _loc4_:§_-Bq§ = null;
         var _loc3_:§_-E1r§ = this.§_-238§(this.params.id,param2).§_-g1F§(param1.name + "/" + this.params.skeleton);
         if(_loc3_)
         {
            _loc4_ = this.§_-r2s§(param1,param2);
            _loc4_.childArmature = _loc3_;
         }
         return _loc4_;
      }
      
      protected function §_-r2s§(param1:§_-TH§, param2:Boolean) : §_-Bq§
      {
         var _loc3_:§_-Bq§ = §_-M10§.§_-r2s§(param2);
         _loc3_.§_-I2C§.copy(param1.slot.§_-I2C§);
         _loc3_.zOrder = param1.slot.zOrder + 1;
         _loc3_.userData = true;
         param1.addChild(_loc3_);
         return _loc3_;
      }
      
      protected function §_-y2e§(param1:§_-TH§, param2:Boolean) : §_-Bq§
      {
         var _loc3_:Object = this.§_-238§(this.params.id,param2).§_-7Z§(param1.name + "/" + this.params.skeleton);
         if(!_loc3_)
         {
            return null;
         }
         param1.slot.display = _loc3_;
         return param1.slot;
      }
      
      protected function §_-238§(param1:int, param2:Boolean) : §_-fr§
      {
         return §_-c1l§.§_-238§(param1,param2);
      }
   }
}

