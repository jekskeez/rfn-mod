package §_-vK§
{
   public class §_-U2A§ extends §_-q4§
   {
      
      public function §_-U2A§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-01S§;
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
         this.hero.game.cast.§_-Xb§ = §_-Nu§() / 100;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero.isSelf || !this.hero.game || !this.hero.game.cast)
         {
            return;
         }
         this.hero.game.cast.§_-Xb§ = 0;
      }
   }
}

