package tape
{
   import buttons.§_-613§;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   public class §_-J2Y§ extends §_-L2v§
   {
      
      private static const §_-p1C§:int = 1;
      
      public function §_-J2Y§()
      {
         super(3,1,0,0,8,0,86,76,false,false);
      }
      
      override protected function §_-j2y§() : void
      {
         if(this.§_-T1X§ == null)
         {
            this.§_-T1X§ = new §_-613§(new PrivateRoomButtonUp(),new SimpleButton());
         }
         if(this.buttonNext == null)
         {
            this.buttonNext = new §_-613§(new PrivateRoomButtonDown(),new SimpleButton());
         }
         this.§_-T1X§.x = -10;
         this.§_-T1X§.y = (76 - this.§_-T1X§.height) * 0.5;
         this.buttonNext.x = 322;
         this.buttonNext.y = this.§_-T1X§.y;
         this.§_-T1X§.addEventListener(MouseEvent.CLICK,this.§_-SO§);
         this.buttonNext.addEventListener(MouseEvent.CLICK,this.§_-M12§);
         addChild(this.§_-T1X§);
         addChild(this.buttonNext);
      }
      
      private function §_-M12§(param1:MouseEvent) : void
      {
         if(this.offset + §_-p2w§() >= this.data.objects.length)
         {
            return;
         }
         this.offset += §_-p1C§;
      }
      
      private function §_-SO§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         this.offset -= §_-p1C§;
      }
      
      public function §_-M28§() : void
      {
         super.update();
      }
   }
}

