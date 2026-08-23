package tape
{
   import buttons.§_-wc§;
   
   public class §_-Mt§ extends §_-3l§
   {
      
      public function §_-Mt§(param1:int, param2:int, param3:int, param4:int, param5:Boolean)
      {
         super(param1,param2,param3,param4,-42,-28,95 - 2,69,false,param5);
      }
      
      override public function set offset(param1:int) : void
      {
         this.§_-H2O§ = Math.max(param1,0);
         this.update();
      }
      
      override protected function §_-bX§() : void
      {
         if(this.§_-Z2B§ == null)
         {
            this.§_-Z2B§ = new §_-wc§(new ButtonRewindLeft(),new ButtonRewindLeftInactive());
         }
         if(this.buttonNext == null)
         {
            this.buttonNext = new §_-wc§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         }
         this.§_-Z2B§.x = 2;
         this.§_-Z2B§.y = int(((this.offsetY + this.§_-c28§) * this.§_-x16§ - this.buttonNext.height) * 0.5) + this.§_-xx§;
         this.buttonNext.x = (this.offsetX + this.§_-i2s§) * this.§_-E2J§ - this.offsetX - 2;
         this.buttonNext.y = int(((this.offsetY + this.§_-c28§) * this.§_-x16§ - this.buttonNext.height) * 0.5) + this.§_-xx§;
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
         if(this.offset == 0 || this.§_-Z2B§.visible)
         {
            return;
         }
         this.offset = 0;
      }
   }
}

