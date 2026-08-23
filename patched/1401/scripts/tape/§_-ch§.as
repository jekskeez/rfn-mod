package tape
{
   import buttons.§_-wc§;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-ch§ extends §_-3l§
   {
      
      public function §_-ch§()
      {
         super(5,2,40,7,5,5,58,58);
         this.§_-D2s§(1,new Point(360,53),new Point(30,53));
      }
      
      public function §_-D2s§(param1:Number, param2:Point, param3:Point, param4:int = 0, param5:int = 0) : void
      {
         this.buttonNext.scaleX = param1;
         this.§_-Z2B§.scaleX = -param1;
         this.buttonNext.scaleY = this.§_-Z2B§.scaleY = param1;
         this.buttonNext.x = param2.x;
         this.buttonNext.y = param2.y;
         this.§_-Z2B§.x = param3.x;
         this.§_-Z2B§.y = param3.y;
         this.buttonNext.rotation = param4;
         this.§_-Z2B§.rotation = param5;
      }
      
      override protected function §_-bX§() : void
      {
         if(!this.buttonNext)
         {
            this.buttonNext = new §_-wc§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         }
         if(!this.§_-Z2B§)
         {
            this.§_-Z2B§ = new §_-wc§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         }
         this.buttonNext.addEventListener(MouseEvent.CLICK,this.§_-6C§);
         addChild(this.buttonNext);
         this.§_-Z2B§.addEventListener(MouseEvent.CLICK,this.§_-N2G§);
         addChild(this.§_-Z2B§);
      }
      
      override protected function updateButtons() : void
      {
         var _loc1_:Boolean = this.offset + §_-X2w§() < this.data.objects.length;
         var _loc2_:Boolean = this.offset > 0;
         this.buttonNext.visible = this.§_-Z2B§.visible = _loc1_ || _loc2_;
         super.updateButtons();
      }
      
      private function §_-6C§(param1:MouseEvent) : void
      {
         if(this.offset + §_-X2w§() >= this.data.objects.length)
         {
            return;
         }
         this.offset += this.§_-x16§ * this.§_-E2J§;
      }
      
      private function §_-N2G§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         this.offset -= this.§_-x16§ * this.§_-E2J§;
      }
   }
}

