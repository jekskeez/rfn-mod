package §_-vK§
{
   import §_-T2y§.§_-92z§;
   import §_-b1B§.§_-r12§;
   import chat.§_-A1n§;
   
   public class §_-G1s§ extends §_-K17§
   {
      
      public function §_-G1s§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-t§;
      }
      
      override protected function set selectedHero(param1:int) : void
      {
         var _loc3_:§_-r12§ = null;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1);
         super.selectedHero = param1;
         if(!_loc2_ || !this.hero.isSelf)
         {
            return;
         }
         §_-92z§.sendMessage(_loc2_.player.id,"",§_-A1n§.§_-o2u§);
         _loc3_ = new §_-r12§();
         _loc3_.§_-K1v§ = _loc2_.id;
         _loc3_.size *= 1 + §_-OD§() / 100;
         _loc3_.§_-Z2r§ = this.§_-41W§;
         this.hero.game.map.§_-nA§(_loc3_,true);
         this.active = false;
      }
      
      override protected function §_-qu§(param1:Hero) : Boolean
      {
         return Boolean(super.§_-qu§(param1)) && !param1.§_-j2i§;
      }
      
      override public function get maxCountUse() : int
      {
         return §_-Nu§();
      }
   }
}

