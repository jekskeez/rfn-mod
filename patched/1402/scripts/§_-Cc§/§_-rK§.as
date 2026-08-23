package §_-Cc§
{
   import §_-cm§.§_-Q2h§;
   
   public class §_-rK§ extends §_-pp§
   {
      
      protected var §_-X11§:Number = 0;
      
      protected var bonus:Number = 0;
      
      protected var buff:§_-Q2h§ = null;
      
      public function §_-rK§(param1:Number, param2:Number)
      {
         super(param1);
         this.bonus = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed -= this.§_-X11§;
            this.hero.removeBuff(this.buff);
         }
         else
         {
            this.§_-X11§ = param1.runSpeed * this.bonus;
            param1.runSpeed += this.§_-X11§;
            if(!this.buff)
            {
               this.buff = new §_-Q2h§(new HighSpeedButton().upState,1,0,gls("Скорость увеличена"));
            }
            param1.§_-W1T§(this.buff);
         }
         super.hero = param1;
      }
   }
}

