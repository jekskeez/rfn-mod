package tape
{
   import buttons.§_-613§;
   
   public class §_-Zw§ extends §_-L2v§
   {
      
      public function §_-Zw§()
      {
         super(16,2,25,7,3,2,50,40,false,false);
      }
      
      override public function set offset(param1:int) : void
      {
         this.§_-J1c§ = Math.max(param1,0);
         this.update();
      }
      
      override protected function §_-j2y§() : void
      {
         this.§_-T1X§ = new §_-613§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         this.buttonNext = new §_-613§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         this.§_-T1X§.x = 0;
         this.§_-T1X§.y = 40 - int(this.§_-T1X§.height * 0.5);
         this.buttonNext.x = 875;
         this.buttonNext.y = 40 - int(this.buttonNext.height * 0.5);
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
      }
   }
}

