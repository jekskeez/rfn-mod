package §_-o10§
{
   import §_-8Q§.§_-I1j§;
   import §_-8Q§.§_-O1Y§;
   import §_-8Q§.§_-t20§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   
   public class §_-jc§ extends §_-aM§
   {
      
      public static const §_-hp§:int = 60;
      
      public function §_-jc§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-UC§;
      }
      
      override public function get startCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return §_-hp§ - §_-bx§();
      }
      
      override public function get totalCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return §_-hp§ - §_-bx§();
      }
      
      override protected function set selectedHero(param1:int) : void
      {
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Class = null;
         switch(this.hero.team)
         {
            case Hero.§_-m28§:
               return;
            case Hero.§_-i1Y§:
               _loc2_ = §_-I1j§;
               break;
            case Hero.§_-l1B§:
               _loc2_ = §_-O1Y§;
               break;
            case Hero.§_-PM§:
               _loc2_ = §_-t20§;
         }
         var _loc3_:Array = this.hero.game.map.get(_loc2_);
         if(_loc3_.length == 0)
         {
            return;
         }
         var _loc4_:§_-t20§ = _loc3_.shift();
         var _loc5_:Hero = this.hero.game.squirrels.get(param1);
         if(!_loc5_ || !_loc5_.§_-62F§)
         {
            return;
         }
         _loc5_.teleportTo(_loc4_.position);
         §_-u24§.sendMessage(_loc5_.player.id,"",§_-g1j§.§_-32Z§);
      }
      
      override protected function get maxSelectionsCount() : int
      {
         if(!Game.toggle)
         {
            return 30;
         }
         return §_-s2t§();
      }
   }
}

