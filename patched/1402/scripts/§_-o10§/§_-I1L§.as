package §_-o10§
{
   import §_-8Q§.§_-O2k§;
   import §_-J1i§.§_-k1U§;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   
   public class §_-I1L§ extends §_-S2w§
   {
      
      private static const §_-17§:int = 30;
      
      public function §_-I1L§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-a2Y§;
      }
      
      override public function get maxCountUse() : int
      {
         return 1;
      }
      
      override protected function activate() : void
      {
         this.hero.shaman = false;
         super.activate();
         if(Boolean(this.hero.game) && Boolean(this.hero.game.cast) && Boolean(this.hero.game.cast.castObject))
         {
            this.hero.game.cast.castObject = null;
         }
         setTimeout(this.teleport,500);
         this.hero.heroView.§_-k1I§();
         this.hero.heroView.§_-v2L§(new §_-pl§.perkData[this.§_-T2a§]["buttonClass"](),1);
      }
      
      private function teleport() : void
      {
         if(!this.hero || !this.hero.game || !this.hero.game.map || this.hero.isDead)
         {
            return;
         }
         var _loc1_:Array = this.hero.game.map.get(§_-O2k§);
         if(_loc1_.length == 0 || !this.§_-53U§ || this.hero.§_-62F§ || §_-k1U§.§_-V2p§() > §_-17§)
         {
            this.hero.teleport(Hero.§_-L1F§);
            return;
         }
         this.hero.teleportTo((_loc1_.pop() as §_-O2k§).position);
      }
   }
}

