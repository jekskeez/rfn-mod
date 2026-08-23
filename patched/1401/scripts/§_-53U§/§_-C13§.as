package §_-53U§
{
   import dragonBones.§_-Bq§;
   import dragonBones.§_-TH§;
   
   public dynamic class §_-C13§ extends §_-M26§
   {
      
      public function §_-C13§(param1:Object = null)
      {
         super(param1);
      }
      
      override protected function §_-y2e§(param1:§_-TH§, param2:Boolean) : §_-Bq§
      {
         var _loc4_:§_-Bq§ = null;
         var _loc3_:Object = §_-238§(this.params.id,param2).§_-7Z§(param1.name + "/" + this.params.skeleton);
         if(_loc3_)
         {
            _loc4_ = §_-r2s§(param1,param2);
            _loc4_.display = _loc3_;
         }
         return _loc4_;
      }
   }
}

