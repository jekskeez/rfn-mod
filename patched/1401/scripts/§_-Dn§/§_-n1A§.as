package §_-Dn§
{
   import §_-T1r§.§_-b1U§;
   import §_-Y22§.§_-C2x§;
   import game.mainGame.SquirrelCollection;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-n1A§ implements §_-C2x§
   {
      
      private var game:§_-b1U§ = null;
      
      private var callback:Function = null;
      
      public function §_-n1A§(param1:§_-b1U§, param2:Function)
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
         if(!SquirrelCollection.instance)
         {
            return;
         }
         var _loc2_:Hero = SquirrelCollection.instance.get(param1[0]);
         if(!_loc2_ || !this.game)
         {
            return;
         }
         if(_loc2_.team == Hero.§_-17§ && int(this.game.§_-4G§()[1]) == 1)
         {
            this.callback(§_-C3J§.§_-Q2a§);
         }
         if(_loc2_.team == Hero.§_-114§ && int(this.game.§_-4G§()[0]) == 1)
         {
            this.callback(§_-C3J§.§_-Q2a§);
         }
      }
   }
}

