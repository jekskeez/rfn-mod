package §_-1§
{
   import §_-T1r§.§_-03i§;
   import §_-dc§.§_-V17§;
   import §_-dc§.§_-d1q§;
   
   public class §_-k1u§ extends §_-K19§
   {
      
      private var buff:§_-03i§ = null;
      
      private var §_-9n§:int;
      
      public function §_-k1u§(param1:Hero)
      {
         super(param1);
         this.§_-i2D§ = §_-tY§.§_-f11§;
      }
      
      override protected function activate() : void
      {
         var _loc2_:§_-V17§ = null;
         super.activate();
         var _loc1_:Number = 0.2;
         for each(_loc2_ in this.hero.perkController.§_-03p§)
         {
            if(_loc2_.id == §_-d1q§.§_-B3v§)
            {
               _loc1_ += _loc2_.bonus / 100;
            }
         }
         this.§_-9n§ = this.hero.jumpVelocity * _loc1_;
         this.hero.jumpVelocity += this.§_-9n§;
         if(!this.buff)
         {
            this.buff = new §_-03i§(new HighJumpButton().upState,1,0,gls("Высокий прыжок"));
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.jumpVelocity -= this.§_-9n§;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-v2K§();
      }
   }
}

