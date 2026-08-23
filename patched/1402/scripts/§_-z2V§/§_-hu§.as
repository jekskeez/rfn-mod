package §_-z2V§
{
   import §_-X1k§.§_-L1o§;
   import tape.§_-QN§;
   import tape.§_-o2N§;
   
   public class §_-hu§ extends §_-o2N§
   {
      
      private var §_-d2n§:Boolean = false;
      
      public function §_-hu§(param1:Boolean = false)
      {
         super(§_-B1H§);
         this.§_-d2n§ = param1;
      }
      
      override protected function §_-5p§(param1:int) : §_-QN§
      {
         var _loc2_:§_-B1H§ = new this.§_-L2b§(param1) as §_-B1H§;
         _loc2_.§_-d2n§ = this.§_-d2n§;
         return _loc2_;
      }
      
      override protected function sort() : void
      {
         this.objects.sort(this.§_-81N§);
      }
      
      private function §_-81N§(param1:§_-B1H§, param2:§_-B1H§) : int
      {
         var _loc3_:int = §_-L1o§.§_-Tg§(param1.id);
         var _loc4_:int = §_-L1o§.§_-Tg§(param2.id);
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

