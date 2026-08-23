package §_-jC§
{
   import §_-92M§.§_-01u§;
   import §_-92M§.§_-X2z§;
   import §_-I10§.§_-Z1F§;
   import §_-P2b§.§_-6L§;
   import §_-P2b§.§_-H2N§;
   import §_-S1D§.§_-O1M§;
   import §_-S2§.Perk;
   import §_-k1c§.§_-92s§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-a11§ extends §_-X2z§
   {
      
      protected var §_-53D§:Boolean = true;
      
      public function §_-a11§(param1:int)
      {
         super(param1);
         this.button.scaleX = this.button.scaleY = 0.8;
         this.§_-XW§.setStatus(gls("<B>«{0}»</B>\n{1}",§_-6L§.getName(this.id),§_-6L§.§_-l7§(this.id)));
         this.§_-M22§.visible = this.cost > 0 && !this.§_-53D§;
         this.§_-w7§();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-w1R§,§_-S2I§.§_-W1O§]);
      }
      
      override public function get iconOffset() : Point
      {
         return new Point(20,20);
      }
      
      override public function get iconClass() : Class
      {
         return §_-6L§.§_-D2L§(this.id);
      }
      
      override public function clone() : §_-X2z§
      {
         var _loc1_:§_-a11§ = new §_-a11§(this.id);
         _loc1_.hero = this.hero;
         return _loc1_;
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-H2N§ = null;
         if(!§_-qu§(param1))
         {
            return;
         }
         for each(_loc2_ in param1.perkController.perksClothes)
         {
            if(_loc2_.§_-i2D§ == this.id)
            {
               this.§_-425§ = _loc2_;
               this.§_-425§.§_-03R§ = false;
               this.§_-425§.addEventListener(Perk.§_-RK§,§_-Dh§);
               §_-Dh§();
               return;
            }
         }
         this.§_-3Q§ = true;
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
         if(!this.§_-41x§())
         {
            if(this.hero)
            {
               this.hero.sendLocation();
            }
            this.§_-425§.§_-7J§();
         }
         if(this.§_-425§.active || !§_-Z1F§.§_-k1w§(this.cost))
         {
            this.§_-3Q§ = true;
         }
         this.glow = this.§_-425§.active;
      }
      
      override public function get description() : String
      {
         return "<b>«" + §_-6L§.getName(this.id) + "»</b>\n" + §_-6L§.§_-l7§(this.id);
      }
      
      public function dispose() : void
      {
         this.§_-425§ = null;
         this.§_-XW§.remove();
         removeEventListener(MouseEvent.CLICK,this.§_-P2v§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-w1R§,§_-S2I§.§_-W1O§]);
      }
      
      public function set §_-IR§(param1:Boolean) : void
      {
         if(this.§_-53D§ == param1)
         {
            return;
         }
         this.§_-53D§ = param1;
         this.§_-M22§.visible = this.cost > 0 && !this.§_-53D§;
      }
      
      override protected function §_-y2l§() : §_-01u§
      {
         this.§_-M22§ = new §_-01u§(ImageIconMana,0.7);
         this.§_-M22§.x = 18;
         this.§_-M22§.y = 39;
         this.§_-M22§.§_-A3§ = [];
         this.§_-M22§.color = 0;
         return this.§_-M22§;
      }
      
      override protected function §_-w7§() : void
      {
         super.§_-w7§();
         this.§_-vR§.radius = 20;
         this.§_-vR§.scaleX = this.§_-vR§.scaleY = 0.8;
         this.§_-vR§.x = this.§_-vR§.radius;
         this.§_-vR§.y = this.§_-vR§.radius;
      }
      
      override protected function §_-41x§() : Boolean
      {
         if(!§_-k1w§ && !this.§_-425§.active && !this.§_-53D§)
         {
            §_-92s§.show();
            return true;
         }
         return false;
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
               if(this.§_-53D§ && param1[2] == §_-S2I§.§_-EY§ && this.§_-Ll§ > 0)
               {
                  §_-O1M§.§_-X1N§(false);
               }
               break;
            case §_-S2I§.§_-W1O§:
               if(param1[0] == §_-S2I§.ROUND_START)
               {
                  §_-Dh§();
               }
         }
      }
   }
}

