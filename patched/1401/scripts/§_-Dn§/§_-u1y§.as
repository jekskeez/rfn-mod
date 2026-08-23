package §_-Dn§
{
   import §_-Y22§.§_-C2x§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-xe§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-u1y§ implements §_-C2x§, §_-xe§
   {
      
      private var game:SquirrelGame = null;
      
      private var callback:Function = null;
      
      private var §_-x1k§:Boolean = false;
      
      public function §_-u1y§(param1:SquirrelGame, param2:Function)
      {
         super();
         this.game = param1;
         this.callback = param2;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-F2m§]);
      }
      
      public function dispose() : void
      {
         this.game = null;
         this.callback = null;
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-F2m§]);
      }
      
      public function reset() : void
      {
         this.§_-x1k§ = false;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(!("4" in param1))
         {
            return;
         }
         if(param1[0] == Game.selfId)
         {
            this.§_-x1k§ = false;
            return;
         }
         if(param1[4] != Game.selfId || !Hero.self)
         {
            return;
         }
         if(this.§_-x1k§ || param1[0] != Hero.self.§_-I1R§)
         {
            return;
         }
         this.§_-x1k§ = true;
         this.callback(§_-C3J§.§_-71m§);
      }
   }
}

