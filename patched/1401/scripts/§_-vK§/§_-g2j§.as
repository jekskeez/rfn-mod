package §_-vK§
{
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-g2j§ extends §_-K17§
   {
      
      public static const §_-P2q§:int = 60;
      
      public function §_-g2j§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-d1§;
      }
      
      override public function get available() : Boolean
      {
         if(!Game.toggle)
         {
            return super.available;
         }
         return super.available && this.hero.§_-426§;
      }
      
      override public function get totalCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return §_-P2q§ - §_-OD§();
      }
      
      override protected function set selectedHero(param1:int) : void
      {
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1);
         if(!_loc2_ || _loc2_.§_-426§)
         {
            return;
         }
         super.selectedHero = param1;
         §_-92z§.sendMessage(_loc2_.player.id,"",§_-A1n§.§_-W1s§);
         _loc2_.§_-4j§(Hero.§_-517§);
         if(!_loc2_.isSelf)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-BW§);
      }
      
      override protected function get maxSelectionsCount() : int
      {
         if(!Game.toggle)
         {
            return 30;
         }
         return §_-Nu§();
      }
   }
}

