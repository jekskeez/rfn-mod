package §_-o1W§
{
   import §_-td§.GameMapNet;
   import game.mainGame.SquirrelGame;
   
   public class §_-e2W§ extends GameMapNet
   {
      
      public function §_-e2W§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override protected function §_-qv§() : *
      {
         var _loc3_:Hero = null;
         var _loc1_:Object = super.§_-qv§();
         var _loc2_:Array = [];
         for each(_loc3_ in this.game.squirrels.players)
         {
            if(_loc3_ is §_-Qz§)
            {
               _loc2_.push([_loc3_.player["id"],(_loc3_ as §_-Qz§).§_-Gm§,(_loc3_ as §_-Qz§).§_-21§]);
            }
         }
         _loc1_.push({"zombieData":_loc2_});
         return _loc1_;
      }
      
      override protected function §_-a2f§(param1:*, param2:Boolean = false) : void
      {
         var _loc4_:Array = null;
         var _loc5_:§_-Qz§ = null;
         param1 = §_-m1v§(param1);
         var _loc3_:Object = param1.pop();
         super.§_-a2f§(param1,true);
         if(!("zombieData" in _loc3_))
         {
            return;
         }
         for each(_loc4_ in _loc3_["zombieData"])
         {
            _loc5_ = game.squirrels.get(_loc4_[0]) as §_-Qz§;
            if(_loc5_)
            {
               _loc5_.§_-Gm§ = _loc4_[1];
               _loc5_.§_-21§ = _loc4_[2];
            }
         }
      }
   }
}

