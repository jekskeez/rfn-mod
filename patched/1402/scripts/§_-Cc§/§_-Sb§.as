package §_-Cc§
{
   import §_-cm§.§_-Q2h§;
   
   public class §_-Sb§ extends §_-pp§
   {
      
      protected var §_-X11§:Number = 0;
      
      protected var §_-H1f§:Number = 0;
      
      protected var bonus:Number = 0;
      
      protected var buff:§_-Q2h§ = null;
      
      public function §_-Sb§(param1:Number, param2:Number)
      {
         super(param1);
         this.bonus = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed -= this.§_-X11§;
            this.hero.jumpVelocity -= this.§_-H1f§;
            this.hero.removeBuff(this.buff);
         }
         else
         {
            this.§_-X11§ = param1.runSpeed * (this.bonus / 100);
            this.§_-H1f§ = param1.jumpVelocity * (this.bonus / 100);
            param1.runSpeed += this.§_-X11§;
            param1.jumpVelocity += this.§_-H1f§;
            this.buff = new §_-Q2h§(new PerkShamanButton13().upState,0.7,0.5,gls("Скорость перемещения и высота прыжка друга шамана увеличены на {0}%.",this.bonus));
            param1.§_-W1T§(this.buff);
         }
         super.hero = param1;
      }
   }
}

