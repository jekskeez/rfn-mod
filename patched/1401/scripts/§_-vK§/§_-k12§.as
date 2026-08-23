package §_-vK§
{
   import §_-83V§.§_-P2o§;
   import §_-e2w§.§_-52p§;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   
   public class §_-k12§ extends §_-21O§
   {
      
      private static const §_-p2O§:int = 30;
      
      public function §_-k12§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-i1I§;
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
         this.hero.heroView.§_-S2O§();
         this.hero.heroView.§_-A2O§(new §_-QC§.perkData[this.§_-i2D§]["buttonClass"](),1);
      }
      
      private function teleport() : void
      {
         if(!this.hero || !this.hero.game || !this.hero.game.map || this.hero.isDead)
         {
            return;
         }
         var _loc1_:Array = this.hero.game.map.get(§_-P2o§);
         if(_loc1_.length == 0 || !this.§_-41W§ || this.hero.§_-426§ || §_-52p§.§_-OW§() > §_-p2O§)
         {
            this.hero.teleport(Hero.§_-98§);
            return;
         }
         this.hero.teleportTo((_loc1_.pop() as §_-P2o§).position);
      }
   }
}

