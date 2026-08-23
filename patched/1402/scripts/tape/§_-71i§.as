package tape
{
   import buttons.§_-613§;
   
   public class §_-71i§ extends §_-L2v§
   {
      
      public function §_-71i§(param1:int, param2:int, param3:int, param4:int, param5:Boolean)
      {
         super(param1,param2,param3,param4,-42,-28,95 - 2,69,false,param5);
      }
      
      override public function set offset(param1:int) : void
      {
         this.§_-J1c§ = Math.max(param1,0);
         this.update();
      }
      
      override protected function §_-j2y§() : void
      {
         if(this.§_-T1X§ == null)
         {
            this.§_-T1X§ = new §_-613§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         }
         if(this.buttonNext == null)
         {
            this.buttonNext = new §_-613§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         }
         this.§_-T1X§.x = 2;
         this.§_-T1X§.y = int(((this.offsetY + this.§_-g6§) * this.§_-w1q§ - this.buttonNext.height) * 0.5) + this.§_-y2b§;
         this.buttonNext.x = (this.offsetX + this.§_-13r§) * this.§_-A1Z§ - this.offsetX - 2;
         this.buttonNext.y = int(((this.offsetY + this.§_-g6§) * this.§_-w1q§ - this.buttonNext.height) * 0.5) + this.§_-y2b§;
         super.§_-j2y§();
      }
      
      override protected function update() : void
      {
         super.update();
         if(this.data == null)
         {
            return;
         }
         this.buttonNext.visible = this.data.objects.length > this.§_-w1q§ * this.§_-A1Z§;
         this.§_-T1X§.visible = this.data.objects.length > this.§_-w1q§ * this.§_-A1Z§;
         if(this.offset == 0 || this.§_-T1X§.visible)
         {
            return;
         }
         this.offset = 0;
      }
   }
}

