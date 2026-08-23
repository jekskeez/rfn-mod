package §_-vK§
{
   import §_-b1B§.§_-gf§;
   
   public class §_-h1r§ extends §_-21O§
   {
      
      public function §_-h1r§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-N1r§;
      }
      
      override protected function activate() : void
      {
         if(!this.hero || !this.hero.game || !this.§_-q18§())
         {
            this.active = false;
            return;
         }
         super.activate();
         this.active = false;
      }
      
      private function §_-q18§() : Boolean
      {
         var _loc3_:§_-gf§ = null;
         if(!this.hero.game)
         {
            return false;
         }
         var _loc1_:Array = this.hero.game.map.get(§_-gf§);
         if(_loc1_.length == 0)
         {
            return false;
         }
         var _loc2_:Boolean = false;
         for each(_loc3_ in _loc1_)
         {
            if(_loc3_.playerId == this.hero.id)
            {
               _loc3_.§_-g2S§();
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
   }
}

