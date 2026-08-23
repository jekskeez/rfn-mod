package §_-Cc§
{
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-cm§.§_-Q2h§;
   
   public class §_-F13§ extends §_-pp§
   {
      
      protected var buff:§_-Q2h§ = null;
      
      protected var §_-d1c§:Boolean = true;
      
      protected var §_-X11§:Number = 0;
      
      protected var bonus:Number = 0;
      
      protected var §_-8x§:Boolean = false;
      
      protected var §_-W1u§:§_-11u§;
      
      public function §_-F13§(param1:Number, param2:Number, param3:Boolean = true)
      {
         super(param1);
         this.bonus = param2;
         this.§_-d1c§ = param3;
      }
      
      public function set active(param1:Boolean) : void
      {
         if(param1 == this.§_-8x§)
         {
            return;
         }
         this.§_-8x§ = param1;
         if(param1)
         {
            this.§_-W1u§ = this.hero.applyEffect(§_-w10§.§_-92K§);
         }
         else
         {
            this.hero.disableEffect(§_-w10§.§_-92K§);
            this.§_-W1u§ = null;
         }
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.swimFactor -= this.§_-X11§;
            if(this.§_-d1c§)
            {
               this.hero.removeBuff(this.buff);
            }
            this.active = false;
         }
         else
         {
            this.§_-X11§ = param1.swimFactor * this.bonus;
            param1.swimFactor += this.§_-X11§;
            if(!this.buff)
            {
               this.buff = new §_-Q2h§(new IconPerkAquaMan(),0.9,0,gls("Увеличение скорости в воде"),18,18);
            }
            if(this.§_-d1c§)
            {
               param1.§_-W1T§(this.buff);
            }
         }
         super.hero = param1;
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         this.active = this.hero.swim;
      }
   }
}

