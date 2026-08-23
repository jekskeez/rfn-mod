package §_-S2§
{
   import §_-92M§.§_-X2z§;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-Z1C§ extends §_-X2z§
   {
      
      public function §_-Z1C§(param1:int)
      {
         super(param1);
         this.§_-XW§.setStatus(this.description);
         this.§_-w7§();
         removeEventListener(MouseEvent.MOUSE_DOWN,§_-53X§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-w1R§]);
      }
      
      override public function set glow(param1:Boolean) : void
      {
      }
      
      override public function §_-P2v§(param1:Event = null) : void
      {
         if(!this.§_-425§ || !this.§_-425§.available)
         {
            return;
         }
         if(this.§_-425§.§_-03R§)
         {
            return;
         }
         if(!§_-K2G§())
         {
            return;
         }
         this.§_-425§.§_-7J§();
         if(this.§_-425§.active)
         {
            this.§_-3Q§ = true;
         }
      }
      
      override protected function §_-Tb§() : SimpleButton
      {
         return new iconClass();
      }
      
      override protected function §_-w7§() : void
      {
         super.§_-w7§();
         this.§_-vR§.radius = 39.65 * 0.5;
         this.§_-vR§.x = this.§_-vR§.radius;
         this.§_-vR§.y = this.§_-vR§.radius;
      }
      
      public function dispose() : void
      {
         this.§_-425§ = null;
         this.§_-XW§.remove();
         removeEventListener(MouseEvent.CLICK,this.§_-P2v§);
      }
      
      protected function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(this.§_-425§ == null || this.hero == null)
               {
                  return;
               }
               if(param1[0] != this.hero.id)
               {
                  return;
               }
               if(param1[1] != this.§_-425§.§_-i2D§)
               {
                  return;
               }
               this.§_-425§.§_-03R§ = false;
         }
      }
   }
}

