package tape
{
   import buttons.§_-wc§;
   
   public class §_-k14§ extends §_-3l§
   {
      
      public function §_-k14§()
      {
         super(16,2,25,7,3,2,50,40,false,false);
      }
      
      override public function set offset(param1:int) : void
      {
         this.§_-H2O§ = Math.max(param1,0);
         this.update();
      }
      
      override protected function §_-bX§() : void
      {
         this.§_-Z2B§ = new §_-wc§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         this.buttonNext = new §_-wc§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         this.§_-Z2B§.x = 0;
         this.§_-Z2B§.y = 40 - int(this.§_-Z2B§.height * 0.5);
         this.buttonNext.x = 875;
         this.buttonNext.y = 40 - int(this.buttonNext.height * 0.5);
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
   }
}

