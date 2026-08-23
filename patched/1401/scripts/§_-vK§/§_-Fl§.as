package §_-vK§
{
   import §_-83V§.§_-532§;
   import §_-83V§.§_-I11§;
   import §_-83V§.§_-Q1J§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   
   public class §_-Fl§ extends §_-K17§
   {
      
      public static const §_-P2q§:int = 60;
      
      public function §_-Fl§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-uy§;
      }
      
      override public function get startCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return §_-P2q§ - §_-Nu§();
      }
      
      override public function get totalCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return §_-P2q§ - §_-Nu§();
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
            case Hero.§_-O18§:
               return;
            case Hero.§_-114§:
               _loc2_ = §_-I11§;
               break;
            case Hero.§_-17§:
               _loc2_ = §_-532§;
               break;
            case Hero.§_-JL§:
               _loc2_ = §_-Q1J§;
         }
         var _loc3_:Array = this.hero.game.map.get(_loc2_);
         if(_loc3_.length == 0)
         {
            return;
         }
         var _loc4_:§_-Q1J§ = _loc3_.shift();
         var _loc5_:Hero = this.hero.game.squirrels.get(param1);
         if(!_loc5_ || !_loc5_.§_-426§)
         {
            return;
         }
         _loc5_.teleportTo(_loc4_.position);
         §_-92z§.sendMessage(_loc5_.player.id,"",§_-A1n§.§_-Y2R§);
      }
      
      override protected function get maxSelectionsCount() : int
      {
         if(!Game.toggle)
         {
            return 30;
         }
         return §_-OD§();
      }
   }
}

