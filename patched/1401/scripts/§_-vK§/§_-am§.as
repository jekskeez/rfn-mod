package §_-vK§
{
   import §_-83V§.GameBody;
   
   public class §_-am§ extends §_-21O§
   {
      
      private var §_-l22§:Array = [];
      
      public function §_-am§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-a2F§;
      }
      
      override protected function activate() : void
      {
         var _loc2_:GameBody = null;
         var _loc3_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.§_-Fv§();
         var _loc1_:Array = this.hero.game.map.get(GameBody,true);
         for each(_loc2_ in _loc1_)
         {
            if(!(!_loc2_ || !_loc2_.ghost))
            {
               _loc2_.ghost = false;
               _loc2_.§_-01q§(!this.§_-41W§ ? GameBody.§_-b2e§ : []);
               this.§_-l22§.push(_loc2_);
            }
         }
         if(!this.buff)
         {
            this.buff = §_-T1G§(0.5);
         }
         for each(_loc3_ in this.hero.game.squirrels.players)
         {
            if(_loc3_ && _loc3_.§_-k2W§)
            {
               _loc3_.heroView.§_-S2O§();
               _loc3_.§_-Aj§(this.buff);
            }
         }
      }
      
      override protected function deactivate() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:GameBody = null;
         super.deactivate();
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(_loc1_ && _loc1_.§_-k2W§)
            {
               _loc1_.removeBuff(this.buff);
            }
         }
         for each(_loc2_ in this.§_-l22§)
         {
            if(_loc2_)
            {
               _loc2_.ghost = true;
            }
         }
         this.§_-l22§.splice(0);
      }
      
      private function §_-Fv§() : void
      {
         var _loc2_:Hero = null;
         var _loc3_:int = 0;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         var _loc1_:Object = this.hero.game.squirrels.players;
         for each(_loc2_ in _loc1_)
         {
            if(!(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || !_loc2_.shaman))
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.§_-515§.length)
               {
                  if(_loc2_.§_-515§[_loc3_] is §_-am§ && _loc2_.§_-515§[_loc3_] != this && _loc2_.§_-515§[_loc3_].active)
                  {
                     _loc2_.§_-515§[_loc3_].active = false;
                  }
                  _loc3_++;
               }
            }
         }
      }
      
      override public function get activeTime() : Number
      {
         return §_-Nu§();
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
   }
}

