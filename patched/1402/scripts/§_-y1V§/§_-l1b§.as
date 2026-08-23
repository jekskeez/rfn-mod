package §_-y1V§
{
   import §_-5P§.§_-7z§;
   import §_-I2Y§.§_-l2r§;
   import §_-n1h§.Perk;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-l1b§ implements §_-l2r§
   {
      
      private var game:SquirrelGame = null;
      
      private var callback:Function = null;
      
      public function §_-l1b§(param1:SquirrelGame, param2:Function)
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
         var _loc3_:Perk = null;
         if(!("4" in param1))
         {
            return;
         }
         if(param1[4] != Game.selfId)
         {
            return;
         }
         if(!this.game || !this.game.squirrels)
         {
            return;
         }
         var _loc2_:Hero = this.game.squirrels.get(param1[0]);
         if(!_loc2_ || !_loc2_.perkController)
         {
            return;
         }
         for each(_loc3_ in _loc2_.perkController.§_-rI§)
         {
            if(_loc3_ is §_-7z§)
            {
               if(!_loc3_.active)
               {
                  return;
               }
               this.callback(§_-B2M§.§_-f2V§);
               return;
            }
         }
      }
   }
}

