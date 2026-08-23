package §_-33r§
{
   import §_-T1r§.§_-03i§;
   import flash.display.MovieClip;
   
   public class §_-q1d§ extends §_-AP§
   {
      
      protected var buff:§_-03i§ = null;
      
      protected var animation:MovieClip = null;
      
      public function §_-q1d§(param1:Number)
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
               this.buff = new §_-03i§(new IconPerkStun(),0.9,0,gls("Дезориентация"),18,18);
            }
            param1.§_-Aj§(this.buff);
         }
         super.hero = param1;
      }
   }
}

