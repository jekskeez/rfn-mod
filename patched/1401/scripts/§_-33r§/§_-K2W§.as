package §_-33r§
{
   import §_-T1r§.§_-03i§;
   
   public class §_-K2W§ extends §_-AP§
   {
      
      protected var §_-h2K§:Number = 0;
      
      protected var §_-c3§:Number = 0;
      
      protected var bonus:Number = 0;
      
      protected var buff:§_-03i§ = null;
      
      public function §_-K2W§(param1:Number, param2:Number)
      {
         super(param1);
         this.bonus = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed -= this.§_-h2K§;
            this.hero.jumpVelocity -= this.§_-c3§;
            this.hero.removeBuff(this.buff);
         }
         else
         {
            this.§_-h2K§ = param1.runSpeed * (this.bonus / 100);
            this.§_-c3§ = param1.jumpVelocity * (this.bonus / 100);
            param1.runSpeed += this.§_-h2K§;
            param1.jumpVelocity += this.§_-c3§;
            this.buff = new §_-03i§(new PerkShamanButton13().upState,0.7,0.5,gls("Скорость перемещения и высота прыжка друга шамана увеличены на {0}%.",this.bonus));
            param1.§_-Aj§(this.buff);
         }
         super.hero = param1;
      }
   }
}

