package §_-o10§
{
   public class §_-v2q§ extends §_-Vd§
   {
      
      public function §_-v2q§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-A2H§;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         if(!this.hero.isSelf)
         {
            return;
         }
         this.hero.game.cast.§_-C2I§ = !Game.toggle ? 1 : §_-bx§() / 100;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero.isSelf || !this.hero.game || !this.hero.game.cast)
         {
            return;
         }
         this.hero.game.cast.§_-C2I§ = 0;
      }
   }
}

