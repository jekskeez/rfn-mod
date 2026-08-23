package §_-33r§
{
   import §_-I10§.§_-g2W§;
   import §_-T1r§.§_-03i§;
   
   public class §_-Ah§ extends §_-AP§
   {
      
      protected var §_-h2K§:Number = 0;
      
      protected var §_-c3§:Number = 0;
      
      protected var bonus:Number = 0;
      
      protected var buff:§_-03i§ = null;
      
      public function §_-Ah§(param1:Number, param2:Number)
      {
         super(param1);
         this.bonus = param2;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.heroView.setClothing(this.hero.player["worn_packages"],this.hero.player["worn_accessories"]);
            this.hero.runSpeed -= this.§_-h2K§;
            this.hero.jumpVelocity -= this.§_-c3§;
            this.hero.removeBuff(this.buff);
         }
         else
         {
            param1.heroView.setClothing([§_-g2W§.§_-k7§],[§_-g2W§.§_-N2l§]);
            this.§_-h2K§ = param1.runSpeed * this.bonus;
            this.§_-c3§ = param1.jumpVelocity * this.bonus;
            param1.runSpeed += this.§_-h2K§;
            param1.jumpVelocity += this.§_-c3§;
            if(!this.buff)
            {
               this.buff = new §_-03i§(new IconPerkWednesdayGirl(),0.9,0,gls("Скорость бега и высота прыжка увеличены"),18,18);
            }
            param1.§_-Aj§(this.buff);
         }
         super.hero = param1;
      }
   }
}

