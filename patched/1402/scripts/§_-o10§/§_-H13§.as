package §_-o10§
{
   public class §_-H13§ extends §_-Vd§
   {
      
      private var §_-UP§:Number = NaN;
      
      public function §_-H13§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-21N§;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.isSelf || !this.hero.shaman)
         {
            return;
         }
         this.hero.§_-Uz§ = this.active && !this.hero.swim;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.hero.§_-Uz§ = true;
         if(!this.hero.isSelf)
         {
            return;
         }
         this.§_-UP§ = this.hero.game.cast.§_-B3c§;
         this.hero.game.cast.§_-B3c§ = (1 + §_-bx§() / 100) * this.hero.game.cast.§_-L1R§ * 0.5;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.§_-Uz§ = false;
         if(!this.hero.isSelf || !this.hero.game || !this.hero.game.cast || isNaN(this.§_-UP§))
         {
            return;
         }
         this.hero.game.cast.§_-B3c§ = this.§_-UP§;
         this.§_-UP§ = NaN;
      }
   }
}

