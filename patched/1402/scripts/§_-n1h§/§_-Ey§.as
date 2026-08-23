package §_-n1h§
{
   import §_-HG§.§_-w2L§;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-Ey§ extends §_-w2L§
   {
      
      public function §_-Ey§(param1:int)
      {
         super(param1);
         this.§_-oj§.setStatus(this.description);
         this.§_-B3N§();
         removeEventListener(MouseEvent.MOUSE_DOWN,§_-H2§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-C1i§]);
      }
      
      override public function set glow(param1:Boolean) : void
      {
      }
      
      override public function §_-H1h§(param1:Event = null) : void
      {
         if(!this.§_-P2K§ || !this.§_-P2K§.available)
         {
            return;
         }
         if(this.§_-P2K§.§_-B3M§)
         {
            return;
         }
         if(!§_-c2w§())
         {
            return;
         }
         this.§_-P2K§.§_-V1z§();
         if(this.§_-P2K§.active)
         {
            this.§_-F1Y§ = true;
         }
      }
      
      override protected function §_-F18§() : SimpleButton
      {
         return new iconClass();
      }
      
      override protected function §_-B3N§() : void
      {
         super.§_-B3N§();
         this.§_-Vi§.radius = 39.65 * 0.5;
         this.§_-Vi§.x = this.§_-Vi§.radius;
         this.§_-Vi§.y = this.§_-Vi§.radius;
      }
      
      public function dispose() : void
      {
         this.§_-P2K§ = null;
         this.§_-oj§.remove();
         removeEventListener(MouseEvent.CLICK,this.§_-H1h§);
      }
      
      protected function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(this.§_-P2K§ == null || this.hero == null)
               {
                  return;
               }
               if(param1[0] != this.hero.id)
               {
                  return;
               }
               if(param1[1] != this.§_-P2K§.§_-T2a§)
               {
                  return;
               }
               this.§_-P2K§.§_-B3M§ = false;
         }
      }
   }
}

