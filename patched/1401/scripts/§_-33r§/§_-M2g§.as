package §_-33r§
{
   import §_-T1r§.§_-03i§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   
   public class §_-M2g§ extends §_-AP§
   {
      
      protected var buff:§_-03i§ = null;
      
      protected var §_-i2w§:Boolean = true;
      
      protected var §_-h2K§:Number = 0;
      
      protected var bonus:Number = 0;
      
      protected var §_-c1w§:Boolean = false;
      
      protected var §_-A38§:§_-f1G§;
      
      public function §_-M2g§(param1:Number, param2:Number, param3:Boolean = true)
      {
         super(param1);
         this.bonus = param2;
         this.§_-i2w§ = param3;
      }
      
      public function set active(param1:Boolean) : void
      {
         if(param1 == this.§_-c1w§)
         {
            return;
         }
         this.§_-c1w§ = param1;
         if(param1)
         {
            this.§_-A38§ = this.hero.applyEffect(§_-93d§.§_-dG§);
         }
         else
         {
            this.hero.disableEffect(§_-93d§.§_-dG§);
            this.§_-A38§ = null;
         }
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.swimFactor -= this.§_-h2K§;
            if(this.§_-i2w§)
            {
               this.hero.removeBuff(this.buff);
            }
            this.active = false;
         }
         else
         {
            this.§_-h2K§ = param1.swimFactor * this.bonus;
            param1.swimFactor += this.§_-h2K§;
            if(!this.buff)
            {
               this.buff = new §_-03i§(new IconPerkAquaMan(),0.9,0,gls("Увеличение скорости в воде"),18,18);
            }
            if(this.§_-i2w§)
            {
               param1.§_-Aj§(this.buff);
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

