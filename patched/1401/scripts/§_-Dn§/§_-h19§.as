package §_-Dn§
{
   import §_-1§.§_-Z10§;
   import §_-S2§.Perk;
   import §_-Y22§.§_-C2x§;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-h19§ implements §_-C2x§
   {
      
      private var game:SquirrelGame = null;
      
      private var callback:Function = null;
      
      public function §_-h19§(param1:SquirrelGame, param2:Function)
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
         for each(_loc3_ in _loc2_.perkController.§_-s13§)
         {
            if(_loc3_ is §_-Z10§)
            {
               if(!_loc3_.active)
               {
                  return;
               }
               this.callback(§_-C3J§.§_-4S§);
               return;
            }
         }
      }
   }
}

