package §_-TX§
{
   import §_-A2x§.GameMapNet;
   import game.mainGame.SquirrelGame;
   
   public class §_-f1c§ extends GameMapNet
   {
      
      public function §_-f1c§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override protected function §_-931§() : *
      {
         var _loc3_:Hero = null;
         var _loc1_:Object = super.§_-931§();
         var _loc2_:Array = [];
         for each(_loc3_ in this.game.squirrels.players)
         {
            if(_loc3_ is §_-LR§)
            {
               _loc2_.push([_loc3_.player["id"],(_loc3_ as §_-LR§).§_-uT§,(_loc3_ as §_-LR§).§_-DE§]);
            }
         }
         _loc1_.push({"zombieData":_loc2_});
         return _loc1_;
      }
      
      override protected function §_-sb§(param1:*, param2:Boolean = false) : void
      {
         var _loc4_:Array = null;
         var _loc5_:§_-LR§ = null;
         param1 = §_-a1O§(param1);
         var _loc3_:Object = param1.pop();
         super.§_-sb§(param1,true);
         if(!("zombieData" in _loc3_))
         {
            return;
         }
         for each(_loc4_ in _loc3_["zombieData"])
         {
            _loc5_ = game.squirrels.get(_loc4_[0]) as §_-LR§;
            if(_loc5_)
            {
               _loc5_.§_-uT§ = _loc4_[1];
               _loc5_.§_-DE§ = _loc4_[2];
            }
         }
      }
   }
}

