package §_-o10§
{
   import §_-Q2§.§_-F1R§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   
   public class §_-12n§ extends §_-aM§
   {
      
      public function §_-12n§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-43u§;
      }
      
      override protected function set selectedHero(param1:int) : void
      {
         var _loc3_:§_-F1R§ = null;
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
         §_-u24§.sendMessage(_loc2_.player.id,"",§_-g1j§.§_-AV§);
         _loc3_ = new §_-F1R§();
         _loc3_.§_-F2U§ = _loc2_.id;
         _loc3_.size *= 1 + §_-s2t§() / 100;
         _loc3_.§_-XO§ = this.§_-53U§;
         this.hero.game.map.§_-TP§(_loc3_,true);
         this.active = false;
      }
      
      override protected function §_-3M§(param1:Hero) : Boolean
      {
         return Boolean(super.§_-3M§(param1)) && !param1.§_-424§;
      }
      
      override public function get maxCountUse() : int
      {
         return §_-bx§();
      }
   }
}

