package §_-o10§
{
   import §_-Cc§.§_-Sb§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   
   public class §_-739§ extends §_-aM§
   {
      
      private static const §_-nS§:int = 2;
      
      private static const §_-A2G§:int = 10;
      
      public function §_-739§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-12T§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override protected function set selectedHero(param1:int) : void
      {
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDragon)
         {
            return;
         }
         super.selectedHero = param1;
         _loc2_.behaviourController.§_-W10§(new §_-Sb§(§_-A2G§,§_-bx§()));
         §_-u24§.sendMessage(_loc2_.player.id,"",§_-g1j§.§_-Z1w§);
      }
      
      override protected function get maxSelectionsCount() : int
      {
         return this.§_-53U§ ? §_-nS§ : 1;
      }
   }
}

