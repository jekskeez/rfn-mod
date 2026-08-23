package §_-33r§
{
   import §_-N14§.§_-i2C§;
   
   public class §_-kC§ extends §_-AP§
   {
      
      public function §_-kC§(param1:Number)
      {
         super(param1);
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         if(!this.hero.heroView.running)
         {
            this.hero.heroView.scratView.armature.animation.gotoAndPlay(§_-YF§.§_-hg§,-1,-1,NaN,0,§_-YF§.§_-hg§,§_-i2C§.§_-511§);
         }
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.heroView.scratView.showHearts(false);
            this.hero.heroView.scratView.armature.animation.getState(§_-YF§.§_-22H§).group = null;
            this.hero.heroView.scratView.armature.animation.getState(§_-YF§.§_-hg§).group = null;
            this.hero.heroView.scratView.armature.animation.gotoAndPlay(Hero.§_-E1k§[this.hero.heroView.scratView.state]);
            this.hero.acornShare = false;
         }
         else
         {
            param1.heroView.scratView.showHearts(true);
            param1.heroView.scratView.armature.animation.gotoAndPlay(§_-YF§.§_-22H§,-1,-1,NaN,0,§_-YF§.§_-22H§,§_-i2C§.§_-511§);
            param1.heroView.scratView.armature.animation.gotoAndPlay(§_-YF§.§_-hg§,-1,-1,NaN,0,§_-YF§.§_-hg§,§_-i2C§.§_-511§);
            param1.acornShare = true;
         }
         super.hero = param1;
      }
   }
}

