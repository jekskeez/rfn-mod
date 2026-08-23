package §_-o10§
{
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-13b§ extends §_-aM§
   {
      
      public static const §_-hp§:int = 60;
      
      public function §_-13b§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-63j§;
      }
      
      override public function get available() : Boolean
      {
         if(!Game.toggle)
         {
            return super.available;
         }
         return super.available && this.hero.§_-62F§;
      }
      
      override public function get totalCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return §_-hp§ - §_-s2t§();
      }
      
      override protected function set selectedHero(param1:int) : void
      {
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1);
         if(!_loc2_ || _loc2_.§_-62F§)
         {
            return;
         }
         super.selectedHero = param1;
         §_-u24§.sendMessage(_loc2_.player.id,"",§_-g1j§.§_-ly§);
         _loc2_.§_-I1u§(Hero.§_-43e§);
         if(!_loc2_.isSelf)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-A1F§);
      }
      
      override protected function get maxSelectionsCount() : int
      {
         if(!Game.toggle)
         {
            return 30;
         }
         return §_-bx§();
      }
   }
}

