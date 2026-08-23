package §_-AY§
{
   import dragonBones.§_-83b§;
   import dragonBones.§_-z2H§;
   
   public dynamic class §_-b2C§ extends §_-Su§
   {
      
      public function §_-b2C§(param1:Object = null)
      {
         super(param1);
      }
      
      override protected function §_-J1t§(param1:§_-83b§, param2:Boolean) : §_-z2H§
      {
         var _loc4_:§_-z2H§ = null;
         var _loc3_:Object = §_-y1y§(this.params.id,param2).§_-Hq§(param1.name + "/" + this.params.skeleton);
         if(_loc3_)
         {
            _loc4_ = §_-73U§(param1,param2);
            _loc4_.display = _loc3_;
         }
         return _loc4_;
      }
   }
}

