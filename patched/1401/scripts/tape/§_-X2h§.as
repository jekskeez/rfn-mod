package tape
{
   import buttons.§_-wc§;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   public class §_-X2h§ extends §_-3l§
   {
      
      private static const §_-t2J§:int = 1;
      
      public function §_-X2h§()
      {
         super(3,1,0,0,8,0,86,76,false,false);
      }
      
      override protected function §_-bX§() : void
      {
         if(this.§_-Z2B§ == null)
         {
            this.§_-Z2B§ = new §_-wc§(new PrivateRoomButtonUp(),new SimpleButton());
         }
         if(this.buttonNext == null)
         {
            this.buttonNext = new §_-wc§(new PrivateRoomButtonDown(),new SimpleButton());
         }
         this.§_-Z2B§.x = -10;
         this.§_-Z2B§.y = (76 - this.§_-Z2B§.height) * 0.5;
         this.buttonNext.x = 322;
         this.buttonNext.y = this.§_-Z2B§.y;
         this.§_-Z2B§.addEventListener(MouseEvent.CLICK,this.§_-N2G§);
         this.buttonNext.addEventListener(MouseEvent.CLICK,this.§_-6C§);
         addChild(this.§_-Z2B§);
         addChild(this.buttonNext);
      }
      
      private function §_-6C§(param1:MouseEvent) : void
      {
         if(this.offset + §_-X2w§() >= this.data.objects.length)
         {
            return;
         }
         this.offset += §_-t2J§;
      }
      
      private function §_-N2G§(param1:MouseEvent) : void
      {
         if(this.offset == 0)
         {
            return;
         }
         this.offset -= §_-t2J§;
      }
      
      public function §_-Fr§() : void
      {
         super.update();
      }
   }
}

