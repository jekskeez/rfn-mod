package §_-y1V§
{
   import §_-I2Y§.§_-l2r§;
   import game.mainGame.§_-T17§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-OM§ implements §_-l2r§, §_-T17§
   {
      
      private static const §_-2A§:int = 3;
      
      private var §_-fv§:int = 0;
      
      private var callback:Function = null;
      
      public function §_-OM§(param1:Function)
      {
         super();
         this.callback = param1;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-v1r§]);
      }
      
      public function dispose() : void
      {
         this.callback = null;
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-v1r§]);
      }
      
      public function reset() : void
      {
         this.§_-fv§ = 0;
      }
      
      public function §_-kl§() : void
      {
         if(this.§_-fv§ >= §_-2A§)
         {
            this.callback(§_-B2M§.§_-k1Z§);
         }
         this.§_-fv§ = 0;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[0] == Game.selfId)
         {
            ++this.§_-fv§;
            return;
         }
         if(!("4" in param1) || param1[4] != Game.selfId)
         {
            return;
         }
         this.§_-kl§();
      }
   }
}

