package §_-vK§
{
   import §_-8I§.SquirrelEvent;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   
   public class §_-u6§ extends §_-K17§
   {
      
      public function §_-u6§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-o1X§;
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-41W§ ? 30 : 60;
      }
      
      override public function get maxCountUse() : int
      {
         return §_-Nu§();
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
         _loc2_.dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-722§,_loc2_));
         §_-92z§.sendMessage(_loc2_.player.id,"",§_-A1n§.§_-83W§);
      }
   }
}

