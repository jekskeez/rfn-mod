package tape
{
   import buttons.§_-613§;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-11R§ extends §_-L2v§
   {
      
      public function §_-11R§()
      {
         super(5,2,40,7,5,5,58,58);
         this.§_-E1Z§(1,new Point(360,53),new Point(30,53));
      }
      
      public function §_-E1Z§(param1:Number, param2:Point, param3:Point, param4:int = 0, param5:int = 0) : void
      {
         this.buttonNext.scaleX = param1;
         this.§_-T1X§.scaleX = -param1;
         this.buttonNext.scaleY = this.§_-T1X§.scaleY = param1;
         this.buttonNext.x = param2.x;
         this.buttonNext.y = param2.y;
         this.§_-T1X§.x = param3.x;
         this.§_-T1X§.y = param3.y;
         this.buttonNext.rotation = param4;
         this.§_-T1X§.rotation = param5;
      }
      
      override protected function §_-j2y§() : void
      {
         if(!this.buttonNext)
         {
            this.buttonNext = new §_-613§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         }
         if(!this.§_-T1X§)
         {
            this.§_-T1X§ = new §_-613§(new ButtonRewindRight(),new ButtonRewindRightInactive());
         }
         this.buttonNext.addEventListener(MouseEvent.CLICK,this.§_-M12§);
         addChild(this.buttonNext);
         this.§_-T1X§.addEventListener(MouseEvent.CLICK,this.§_-SO§);
         addChild(this.§_-T1X§);
      }
      
      override protected function updateButtons() : void
      {
         var _loc1_:Boolean = this.offset + §_-p2w§() < this.data.objects.length;
         var _loc2_:Boolean = this.offset > 0;
         this.buttonNext.visible = this.§_-T1X§.visible = _loc1_ || _loc2_;
         super.updateButtons();
      }
      
      private function §_-M12§(param1:MouseEvent) : void
      {
         if(this.offset + §_-p2w§() >= this.data.objects.length)
         {
            return;
         }
         this.offset += this.§_-w1q§ * this.§_-A1Z§;
      }
      
      private function §_-SO§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         this.offset -= this.§_-w1q§ * this.§_-A1Z§;
      }
   }
}

