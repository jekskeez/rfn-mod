package §_-o10§
{
   import §_-8Q§.GameBody;
   
   public class §_-c26§ extends §_-S2w§
   {
      
      private var §_-42A§:Array = [];
      
      public function §_-c26§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-g1K§;
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
         this.§_-t1D§();
         var _loc1_:Array = this.hero.game.map.get(GameBody,true);
         for each(_loc2_ in _loc1_)
         {
            if(!(!_loc2_ || !_loc2_.ghost))
            {
               _loc2_.ghost = false;
               _loc2_.§_-C2Q§(!this.§_-53U§ ? GameBody.§_-8Z§ : []);
               this.§_-42A§.push(_loc2_);
            }
         }
         if(!this.buff)
         {
            this.buff = §_-K5§(0.5);
         }
         for each(_loc3_ in this.hero.game.squirrels.players)
         {
            if(_loc3_ && _loc3_.§_-K13§)
            {
               _loc3_.heroView.§_-k1I§();
               _loc3_.§_-W1T§(this.buff);
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
            if(_loc1_ && _loc1_.§_-K13§)
            {
               _loc1_.removeBuff(this.buff);
            }
         }
         for each(_loc2_ in this.§_-42A§)
         {
            if(_loc2_)
            {
               _loc2_.ghost = true;
            }
         }
         this.§_-42A§.splice(0);
      }
      
      private function §_-t1D§() : void
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
               while(_loc3_ < _loc2_.§_-ov§.length)
               {
                  if(_loc2_.§_-ov§[_loc3_] is §_-c26§ && _loc2_.§_-ov§[_loc3_] != this && _loc2_.§_-ov§[_loc3_].active)
                  {
                     _loc2_.§_-ov§[_loc3_].active = false;
                  }
                  _loc3_++;
               }
            }
         }
      }
      
      override public function get activeTime() : Number
      {
         return §_-bx§();
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
   }
}

