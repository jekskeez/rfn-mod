package §_-vK§
{
   import §_-33r§.§_-K2W§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   
   public class §_-s2e§ extends §_-K17§
   {
      
      private static const §_-J1T§:int = 2;
      
      private static const §_-J1l§:int = 10;
      
      public function §_-s2e§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-i2L§;
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
         _loc2_.behaviourController.§_-gz§(new §_-K2W§(§_-J1l§,§_-Nu§()));
         §_-92z§.sendMessage(_loc2_.player.id,"",§_-A1n§.§_-02O§);
      }
      
      override protected function get maxSelectionsCount() : int
      {
         return this.§_-41W§ ? §_-J1T§ : 1;
      }
   }
}

