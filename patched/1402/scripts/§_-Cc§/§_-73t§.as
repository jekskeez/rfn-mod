package §_-Cc§
{
   import §_-A1G§.§_-w10§;
   import §_-cm§.§_-Q2h§;
   
   public class §_-73t§ extends §_-pp§
   {
      
      protected var buff:§_-Q2h§ = null;
      
      private var isSelf:Boolean = false;
      
      public function §_-73t§(param1:Number, param2:Boolean = false)
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
               this.hero.disableEffect(§_-w10§.§_-e2i§);
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
               param1.applyEffect(§_-w10§.§_-e2i§);
            }
            if(!this.buff)
            {
               this.buff = new §_-Q2h§(new IconPerkFire(),0.9,0,gls("Бессмертие после закаления огнём"),18,18);
            }
            param1.§_-W1T§(this.buff);
         }
         super.hero = param1;
      }
   }
}

