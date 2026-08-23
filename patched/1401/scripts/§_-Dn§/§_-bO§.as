package §_-Dn§
{
   import §_-Y22§.§_-C2x§;
   import game.mainGame.§_-xe§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-bO§ implements §_-C2x§, §_-xe§
   {
      
      private static const §_-E1C§:int = 3;
      
      private var §_-93Y§:int = 0;
      
      private var callback:Function = null;
      
      public function §_-bO§(param1:Function)
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
         if(this.§_-93Y§ >= §_-E1C§)
         {
            this.callback(§_-C3J§.§_-A2l§);
         }
         this.§_-93Y§ = 0;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[0] == Game.selfId)
         {
            ++this.§_-93Y§;
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

