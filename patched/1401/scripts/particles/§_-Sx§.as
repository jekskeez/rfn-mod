package particles
{
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class §_-Sx§ extends §_-h2I§
   {
      
      private static const §_-1S§:int = 1;
      
      private var §_-l2j§:Dictionary = new Dictionary();
      
      private var §_-N1R§:int = -1;
      
      public function §_-Sx§()
      {
         super();
      }
      
      public function §_-o2X§(param1:§_-Z2g§) : void
      {
         this.§_-l2j§[param1] = param1;
         if(param1 is §_-v2j§)
         {
            §_-83v§(param1 as §_-h2I§);
         }
      }
      
      public function §_-E1n§(param1:Number) : void
      {
         var _loc2_:§_-Z2g§ = null;
         for each(_loc2_ in this.§_-l2j§)
         {
            _loc2_.update(param1);
         }
         this.§_-o1m§();
      }
      
      public function clear() : void
      {
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0);
         }
         this.§_-l2j§ = new Dictionary();
      }
      
      private function §_-o1m§() : void
      {
         var _loc2_:§_-Z2g§ = null;
         var _loc1_:Number = getTimer();
         if(_loc1_ - this.§_-N1R§ < §_-1S§)
         {
            return;
         }
         this.§_-N1R§ = _loc1_;
         for each(_loc2_ in this.§_-l2j§)
         {
            if(_loc2_.garbage)
            {
               delete this.§_-l2j§[_loc2_];
               if(_loc2_ is §_-v2j§)
               {
                  removeChildStarling(_loc2_ as §_-h2I§);
               }
            }
         }
      }
   }
}

