package §_-y1V§
{
   import §_-I2Y§.§_-l2r§;
   import §_-cm§.§_-cV§;
   import game.mainGame.SquirrelCollection;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-B2V§ implements §_-l2r§
   {
      
      private var game:§_-cV§ = null;
      
      private var callback:Function = null;
      
      public function §_-B2V§(param1:§_-cV§, param2:Function)
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
      
      private function §_-x2f§(param1:§_-s2l§) : void
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
         if(_loc2_.team == Hero.§_-l1B§ && int(this.game.§_-PK§()[1]) == 1)
         {
            this.callback(§_-B2M§.§_-u2T§);
         }
         if(_loc2_.team == Hero.§_-i1Y§ && int(this.game.§_-PK§()[0]) == 1)
         {
            this.callback(§_-B2M§.§_-u2T§);
         }
      }
   }
}

