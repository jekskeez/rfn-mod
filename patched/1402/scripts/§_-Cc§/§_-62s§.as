package §_-Cc§
{
   import §_-Vu§.§_-h25§;
   
   public class §_-62s§ extends §_-pp§
   {
      
      public function §_-62s§(param1:Number)
      {
         super(param1);
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         if(!this.hero.heroView.running)
         {
            this.hero.heroView.scratView.armature.animation.gotoAndPlay(§_-112§.§_-V2J§,-1,-1,NaN,0,§_-112§.§_-V2J§,§_-h25§.§_-fX§);
         }
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.heroView.scratView.showHearts(false);
            this.hero.heroView.scratView.armature.animation.getState(§_-112§.§_-6B§).group = null;
            this.hero.heroView.scratView.armature.animation.getState(§_-112§.§_-V2J§).group = null;
            this.hero.heroView.scratView.armature.animation.gotoAndPlay(Hero.§_-p2Z§[this.hero.heroView.scratView.state]);
            this.hero.acornShare = false;
         }
         else
         {
            param1.heroView.scratView.showHearts(true);
            param1.heroView.scratView.armature.animation.gotoAndPlay(§_-112§.§_-6B§,-1,-1,NaN,0,§_-112§.§_-6B§,§_-h25§.§_-fX§);
            param1.heroView.scratView.armature.animation.gotoAndPlay(§_-112§.§_-V2J§,-1,-1,NaN,0,§_-112§.§_-V2J§,§_-h25§.§_-fX§);
            param1.acornShare = true;
         }
         super.hero = param1;
      }
   }
}

