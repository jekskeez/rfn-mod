package §_-Cc§
{
   import §_-X1k§.§_-P2x§;
   import §_-cm§.§_-Q2h§;
   
   public class §_-bj§ extends §_-pp§
   {
      
      protected var §_-X11§:Number = 0;
      
      protected var §_-H1f§:Number = 0;
      
      protected var bonus:Number = 0;
      
      protected var buff:§_-Q2h§ = null;
      
      public function §_-bj§(param1:Number, param2:Number)
      {
         super(param1);
         this.bonus = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.heroView.setClothing(this.hero.player["worn_packages"],this.hero.player["worn_accessories"]);
            this.hero.runSpeed -= this.§_-X11§;
            this.hero.jumpVelocity -= this.§_-H1f§;
            this.hero.removeBuff(this.buff);
         }
         else
         {
            param1.heroView.setClothing([§_-P2x§.§_-U1K§],[§_-P2x§.§_-D2V§]);
            this.§_-X11§ = param1.runSpeed * this.bonus;
            this.§_-H1f§ = param1.jumpVelocity * this.bonus;
            param1.runSpeed += this.§_-X11§;
            param1.jumpVelocity += this.§_-H1f§;
            if(!this.buff)
            {
               this.buff = new §_-Q2h§(new IconPerkWednesdayGirl(),0.9,0,gls("Скорость бега и высота прыжка увеличены"),18,18);
            }
            param1.§_-W1T§(this.buff);
         }
         super.hero = param1;
      }
   }
}

