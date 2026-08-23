package §_-Dn§
{
   import §_-Y22§.§_-C2x§;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-sQ§ implements §_-C2x§
   {
      
      private static const §_-61S§:int = 10000;
      
      private var §_-93Y§:int = 0;
      
      private var §_-y2D§:int = 0;
      
      private var callback:Function = null;
      
      public function §_-sQ§(param1:Function)
      {
         super();
         this.callback = param1;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-F2m§]);
      }
      
      public function dispose() : void
      {
         this.callback = null;
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-F2m§]);
      }
      
      public function §_-h2r§() : void
      {
         var _loc1_:int = getTimer();
         if(_loc1_ - this.§_-y2D§ < §_-61S§)
         {
            ++this.§_-93Y§;
            this.§_-y2D§ = _loc1_;
            switch(this.§_-93Y§)
            {
               case 2:
                  this.callback(§_-C3J§.§_-st§);
                  break;
               case 3:
                  this.callback(§_-C3J§.§_-d21§);
                  break;
               case 4:
                  this.callback(§_-C3J§.§_-017§);
            }
            return;
         }
         this.§_-93Y§ = 1;
         this.§_-y2D§ = _loc1_;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(!("4" in param1))
         {
            return;
         }
         if(param1[4] != Game.selfId)
         {
            return;
         }
         this.§_-h2r§();
      }
   }
}

