package §_-vK§
{
   public class §_-K1y§ extends §_-q4§
   {
      
      private var §_-u1w§:Number = NaN;
      
      public function §_-K1y§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-oS§;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.isSelf || !this.hero.shaman)
         {
            return;
         }
         this.hero.§_-o15§ = this.active && !this.hero.swim;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.hero.§_-o15§ = true;
         if(!this.hero.isSelf)
         {
            return;
         }
         this.§_-u1w§ = this.hero.game.cast.§_-zY§;
         this.hero.game.cast.§_-zY§ = (1 + §_-Nu§() / 100) * this.hero.game.cast.§_-J1L§ * 0.5;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.§_-o15§ = false;
         if(!this.hero.isSelf || !this.hero.game || !this.hero.game.cast || isNaN(this.§_-u1w§))
         {
            return;
         }
         this.hero.game.cast.§_-zY§ = this.§_-u1w§;
         this.§_-u1w§ = NaN;
      }
   }
}

