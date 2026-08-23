package §_-o10§
{
   import §_-F5§.§_-63c§;
   
   public class §_-5k§ extends §_-Vd§
   {
      
      private var §_-Q1h§:Number;
      
      public function §_-5k§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-g2K§;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         if(this.§_-53U§)
         {
            this.hero.§_-11F§ = 16711680;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         this.§_-Q1h§ = this.hero.game.cast.§_-01c§ * (§_-bx§() / 100);
         this.hero.game.cast.§_-01c§ += this.§_-Q1h§;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero || !this.hero.isSelf || !this.hero.game || !this.hero.game.cast)
         {
            return;
         }
         if(this.§_-53U§)
         {
            this.hero.§_-11F§ = §_-63c§.§_-B1T§;
         }
         this.hero.game.cast.§_-01c§ -= this.§_-Q1h§;
      }
   }
}

