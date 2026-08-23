package §_-o10§
{
   import §_-X2V§.SquirrelEvent;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   
   public class §_-g1G§ extends §_-aM§
   {
      
      public function §_-g1G§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-W1k§;
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-53U§ ? 30 : 60;
      }
      
      override public function get maxCountUse() : int
      {
         return §_-bx§();
      }
      
      override protected function set selectedHero(param1:int) : void
      {
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1);
         if(!_loc2_)
         {
            return;
         }
         super.selectedHero = param1;
         _loc2_.ghost = true;
         _loc2_.dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-f2P§,_loc2_));
         §_-u24§.sendMessage(_loc2_.player.id,"",§_-g1j§.§_-j2A§);
      }
   }
}

