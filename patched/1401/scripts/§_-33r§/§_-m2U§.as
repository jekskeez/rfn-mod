package §_-33r§
{
   import §_-T1r§.§_-03i§;
   
   public class §_-m2U§ extends §_-AP§
   {
      
      protected var §_-h2K§:Number = 0;
      
      protected var bonus:Number = 0;
      
      protected var buff:§_-03i§ = null;
      
      public function §_-m2U§(param1:Number, param2:Number)
      {
         super(param1);
         this.bonus = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed -= this.§_-h2K§;
            this.hero.removeBuff(this.buff);
         }
         else
         {
            this.§_-h2K§ = param1.runSpeed * this.bonus;
            param1.runSpeed += this.§_-h2K§;
            if(!this.buff)
            {
               this.buff = new §_-03i§(new HighSpeedButton().upState,1,0,gls("Скорость увеличена"));
            }
            param1.§_-Aj§(this.buff);
         }
         super.hero = param1;
      }
   }
}

