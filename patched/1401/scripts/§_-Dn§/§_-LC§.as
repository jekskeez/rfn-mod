package §_-Dn§
{
   import §_-Y22§.§_-C2x§;
   import game.mainGame.§_-xe§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-LC§ implements §_-C2x§, §_-xe§
   {
      
      private var §_-93Y§:int = 0;
      
      private var callback:Function = null;
      
      public function §_-LC§(param1:Function)
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
      
      public function reset() : void
      {
         this.§_-93Y§ = 0;
      }
      
      public function §_-h2r§() : void
      {
         ++this.§_-93Y§;
         switch(this.§_-93Y§)
         {
            case 3:
               this.callback(§_-C3J§.§_-93J§);
               break;
            case 4:
               this.callback(§_-C3J§.§_-D21§);
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[0] == Game.selfId)
         {
            this.§_-93Y§ = 0;
            return;
         }
         if(!("4" in param1) || param1[4] != Game.selfId)
         {
            return;
         }
         this.§_-h2r§();
      }
   }
}

