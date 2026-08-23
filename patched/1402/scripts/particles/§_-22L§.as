package particles
{
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class §_-22L§ extends §_-aS§
   {
      
      private static const §_-tU§:int = 1;
      
      private var §_-Ox§:Dictionary = new Dictionary();
      
      private var §_-d1p§:int = -1;
      
      public function §_-22L§()
      {
         super();
      }
      
      public function §_-r2I§(param1:§_-X2o§) : void
      {
         this.§_-Ox§[param1] = param1;
         if(param1 is §_-51g§)
         {
            §_-J2J§(param1 as §_-aS§);
         }
      }
      
      public function §_-v3§(param1:Number) : void
      {
         var _loc2_:§_-X2o§ = null;
         for each(_loc2_ in this.§_-Ox§)
         {
            _loc2_.update(param1);
         }
         this.§_-kZ§();
      }
      
      public function clear() : void
      {
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
         this.§_-Ox§ = new Dictionary();
      }
      
      private function §_-kZ§() : void
      {
         var _loc2_:§_-X2o§ = null;
         var _loc1_:Number = getTimer();
         if(_loc1_ - this.§_-d1p§ < §_-tU§)
         {
            return;
         }
         this.§_-d1p§ = _loc1_;
         for each(_loc2_ in this.§_-Ox§)
         {
            if(_loc2_.garbage)
            {
               delete this.§_-Ox§[_loc2_];
               if(_loc2_ is §_-51g§)
               {
                  removeChildStarling(_loc2_ as §_-aS§);
               }
            }
         }
      }
   }
}

