package protocol
{
   import flash.utils.Endian;
   
   public dynamic class §_-J1C§ extends §_-S2I§
   {
      
      private var §_-L1L§:int = 0;
      
      public function §_-J1C§(param1:int, param2:Array)
      {
         var _loc3_:§_-U1M§ = §_-P1h§.get(0);
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         _loc3_.§_-s15§(0);
         _loc3_.§_-s15§(0);
         _loc3_.§_-s15§(§_-S2I§.§_-aY§);
         _loc3_.position = 0;
         super(_loc3_);
         this.§_-L1L§ = param1;
         var _loc4_:int = 0;
         while(_loc4_ < param2.length)
         {
            this[_loc4_] = param2[_loc4_];
            _loc4_++;
         }
      }
      
      override public function get type() : int
      {
         return this.§_-L1L§;
      }
   }
}

