package §_-z2Z§
{
   import §_-I10§.§_-h1f§;
   import tape.§_-91w§;
   import tape.§_-K2k§;
   
   public class §_-C1C§ extends §_-91w§
   {
      
      private var §_-41w§:Boolean = false;
      
      public function §_-C1C§(param1:Boolean = false)
      {
         super(§_-619§);
         this.§_-41w§ = param1;
      }
      
      override protected function §_-hN§(param1:int) : §_-K2k§
      {
         var _loc2_:§_-619§ = new this.§_-l1R§(param1) as §_-619§;
         _loc2_.§_-41w§ = this.§_-41w§;
         return _loc2_;
      }
      
      override protected function sort() : void
      {
         this.objects.sort(this.§_-m2P§);
      }
      
      private function §_-m2P§(param1:§_-619§, param2:§_-619§) : int
      {
         var _loc3_:int = §_-h1f§.§_-y2U§(param1.id);
         var _loc4_:int = §_-h1f§.§_-y2U§(param2.id);
         if(_loc3_ != 0 && _loc4_ != 0)
         {
            return _loc3_ > _loc4_ ? 1 : -1;
         }
         if(_loc3_ != 0 || _loc4_ != 0)
         {
            return _loc3_ < _loc4_ ? 1 : -1;
         }
         return param1.id < param2.id ? -1 : 1;
      }
   }
}

