package tape
{
   import §_-X1k§.§_-I2l§;
   import buttons.§_-613§;
   import events.GameEvent;
   
   public class §_-p2a§ extends §_-L2v§
   {
      
      public static const §_-J2A§:int = 10;
      
      private var §_-bW§:§_-L2a§;
      
      public function §_-p2a§()
      {
         super(10,1,44,-3,7,2,75,60,false,false);
         this.§_-bW§ = new §_-L2a§();
         setData(this.§_-bW§);
         §_-I2l§.addEventListener(GameEvent.INTERIOR_CHANGE,this.§_-U1J§);
      }
      
      override public function set offset(param1:int) : void
      {
         this.§_-J1c§ = param1;
         if(this.data != null)
         {
            this.§_-J1c§ = Math.min(this.§_-J1c§,this.data.objects.length - §_-J2A§);
         }
         this.§_-J1c§ = Math.max(this.§_-J1c§,0);
         this.update();
      }
      
      override protected function §_-j2y§() : void
      {
         this.§_-T1X§ = new §_-613§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         this.§_-42u§ = new §_-613§(new ButtonRewindLeftDouble(),new ButtonRewindLeftDoubleInactive());
         this.buttonNext = new §_-613§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         this.§_-025§ = new §_-613§(new ButtonRewindRightDouble(),new ButtonRewindRightDoubleInactive());
         this.§_-T1X§.setState(true);
         this.§_-42u§.setState(true);
         this.buttonNext.setState(true);
         this.§_-025§.setState(true);
         this.§_-T1X§.x = 10;
         this.§_-T1X§.y = 7;
         this.§_-42u§.x = 10;
         this.§_-42u§.y = 38;
         this.buttonNext.x = 862;
         this.buttonNext.y = 7;
         this.§_-025§.x = 862;
         this.§_-025§.y = 38;
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
      
      private function §_-U1J§(param1:GameEvent = null) : void
      {
         this.update();
      }
   }
}

