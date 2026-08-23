package §_-33r§
{
   import §_-T1r§.§_-03i§;
   import §_-ZS§.§_-93d§;
   
   public class §_-hu§ extends §_-AP§
   {
      
      protected var buff:§_-03i§ = null;
      
      private var isSelf:Boolean = false;
      
      public function §_-hu§(param1:Number, param2:Boolean = false)
      {
         super(param1);
         this.isSelf = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            if(Game.self.modetator)
            {
               this.hero.heroView.immortal = false;
            }
            if(this.isSelf)
            {
               this.hero.disableEffect(§_-93d§.§_-MA§);
            }
            if(this.buff)
            {
               this.hero.removeBuff(this.buff);
            }
         }
         else
         {
            if(Game.self.modetator)
            {
               this.hero.heroView.immortal = true;
            }
            if(this.isSelf)
            {
               param1.applyEffect(§_-93d§.§_-MA§);
            }
            if(!this.buff)
            {
               this.buff = new §_-03i§(new IconPerkFire(),0.9,0,gls("Бессмертие после закаления огнём"),18,18);
            }
            param1.§_-Aj§(this.buff);
         }
         super.hero = param1;
      }
   }
}

