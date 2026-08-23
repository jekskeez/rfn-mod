package §_-o10§
{
   import §_-Q2§.§_-N1y§;
   
   public class §_-zV§ extends §_-S2w§
   {
      
      public function §_-zV§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-z1H§;
      }
      
      override protected function activate() : void
      {
         if(!this.hero || !this.hero.game || !this.§_-j1q§())
         {
            this.active = false;
            return;
         }
         super.activate();
         this.active = false;
      }
      
      private function §_-j1q§() : Boolean
      {
         var _loc3_:§_-N1y§ = null;
         if(!this.hero.game)
         {
            return false;
         }
         var _loc1_:Array = this.hero.game.map.get(§_-N1y§);
         if(_loc1_.length == 0)
         {
            return false;
         }
         var _loc2_:Boolean = false;
         for each(_loc3_ in _loc1_)
         {
            if(_loc3_.playerId == this.hero.id)
            {
               _loc3_.§_-s2N§();
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
   }
}

