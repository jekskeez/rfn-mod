package protocol
{
   import flash.utils.Endian;
   
   public dynamic class §_-Kd§ extends §_-s2l§
   {
      
      private var §_-12m§:int = 0;
      
      public function §_-Kd§(param1:int, param2:Array)
      {
         var _loc3_:§_-z1i§ = §_-Q17§.get(0);
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         _loc3_.§_-C1W§(0);
         _loc3_.§_-C1W§(0);
         _loc3_.§_-C1W§(§_-s2l§.§_-F1g§);
         _loc3_.position = 0;
         super(_loc3_);
         this.§_-12m§ = param1;
         var _loc4_:int = 0;
         while(_loc4_ < param2.length)
         {
            this[_loc4_] = param2[_loc4_];
            _loc4_++;
         }
      }
      
      override public function get type() : int
      {
         return this.§_-12m§;
      }
   }
}

