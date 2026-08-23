package §_-vK§
{
   import §_-637§.§_-p1L§;
   
   public class §_-z2C§ extends §_-q4§
   {
      
      private var §_-ad§:Number;
      
      public function §_-z2C§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-d2J§;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         if(this.§_-41W§)
         {
            this.hero.§_-xv§ = 16711680;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         this.§_-ad§ = this.hero.game.cast.§_-O1Q§ * (§_-Nu§() / 100);
         this.hero.game.cast.§_-O1Q§ += this.§_-ad§;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero || !this.hero.isSelf || !this.hero.game || !this.hero.game.cast)
         {
            return;
         }
         if(this.§_-41W§)
         {
            this.hero.§_-xv§ = §_-p1L§.§_-J2L§;
         }
         this.hero.game.cast.§_-O1Q§ -= this.§_-ad§;
      }
   }
}

