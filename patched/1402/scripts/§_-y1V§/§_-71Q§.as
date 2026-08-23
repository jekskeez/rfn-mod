package §_-y1V§
{
   import §_-I2Y§.§_-l2r§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-T17§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-71Q§ implements §_-l2r§, §_-T17§
   {
      
      private var game:SquirrelGame = null;
      
      private var callback:Function = null;
      
      private var §_-M1y§:Boolean = false;
      
      public function §_-71Q§(param1:SquirrelGame, param2:Function)
      {
         super();
         this.game = param1;
         this.callback = param2;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-v1r§]);
      }
      
      public function dispose() : void
      {
         this.game = null;
         this.callback = null;
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-v1r§]);
      }
      
      public function reset() : void
      {
         this.§_-M1y§ = false;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(!("4" in param1))
         {
            return;
         }
         if(param1[0] == Game.selfId)
         {
            this.§_-M1y§ = false;
            return;
         }
         if(param1[4] != Game.selfId || !Hero.self)
         {
            return;
         }
         if(this.§_-M1y§ || param1[0] != Hero.self.§_-43c§)
         {
            return;
         }
         this.§_-M1y§ = true;
         this.callback(§_-B2M§.§_-YS§);
      }
   }
}

