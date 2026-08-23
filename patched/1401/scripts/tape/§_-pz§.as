package tape
{
   import §_-I10§.§_-f22§;
   import buttons.§_-wc§;
   import events.GameEvent;
   
   public class §_-pz§ extends §_-3l§
   {
      
      public static const §_-Ec§:int = 10;
      
      private var §_-VT§:§_-d2§;
      
      public function §_-pz§()
      {
         super(10,1,44,-3,7,2,75,60,false,false);
         this.§_-VT§ = new §_-d2§();
         setData(this.§_-VT§);
         §_-f22§.addEventListener(GameEvent.INTERIOR_CHANGE,this.§_-oZ§);
      }
      
      override public function set offset(param1:int) : void
      {
         this.§_-H2O§ = param1;
         if(this.data != null)
         {
            this.§_-H2O§ = Math.min(this.§_-H2O§,this.data.objects.length - §_-Ec§);
         }
         this.§_-H2O§ = Math.max(this.§_-H2O§,0);
         this.update();
      }
      
      override protected function §_-bX§() : void
      {
         this.§_-Z2B§ = new §_-wc§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         this.§_-F1m§ = new §_-wc§(new ButtonRewindLeftDouble(),new ButtonRewindLeftDoubleInactive());
         this.buttonNext = new §_-wc§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         this.§_-s19§ = new §_-wc§(new ButtonRewindRightDouble(),new ButtonRewindRightDoubleInactive());
         this.§_-Z2B§.setState(true);
         this.§_-F1m§.setState(true);
         this.buttonNext.setState(true);
         this.§_-s19§.setState(true);
         this.§_-Z2B§.x = 10;
         this.§_-Z2B§.y = 7;
         this.§_-F1m§.x = 10;
         this.§_-F1m§.y = 38;
         this.buttonNext.x = 862;
         this.buttonNext.y = 7;
         this.§_-s19§.x = 862;
         this.§_-s19§.y = 38;
         super.§_-bX§();
      }
      
      override protected function update() : void
      {
         super.update();
         if(this.data == null)
         {
            return;
         }
         this.buttonNext.visible = this.data.objects.length > this.§_-x16§ * this.§_-E2J§;
         this.§_-Z2B§.visible = this.data.objects.length > this.§_-x16§ * this.§_-E2J§;
      }
      
      private function §_-oZ§(param1:GameEvent = null) : void
      {
         this.update();
      }
   }
}

