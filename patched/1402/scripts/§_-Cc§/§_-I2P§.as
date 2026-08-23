package §_-Cc§
{
   import §_-cm§.§_-Q2h§;
   import flash.display.MovieClip;
   
   public class §_-I2P§ extends §_-pp§
   {
      
      protected var buff:§_-Q2h§ = null;
      
      protected var animation:MovieClip = null;
      
      public function §_-I2P§(param1:Number)
      {
         super(param1);
         this.animation = new PerkKickMovie();
         this.animation.y = -60;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            if(this.hero.heroView.contains(this.animation))
            {
               this.hero.heroView.removeChild(this.animation);
            }
            this.hero.viewChanged = false;
            this.hero.removeBuff(this.buff);
         }
         else
         {
            param1.heroView.addChild(this.animation);
            if(!this.buff)
            {
               this.buff = new §_-Q2h§(new IconPerkStun(),0.9,0,gls("Дезориентация"),18,18);
            }
            param1.§_-W1T§(this.buff);
         }
         super.hero = param1;
      }
   }
}

