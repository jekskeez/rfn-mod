package §_-g2C§
{
   import §_-61C§.§_-a2p§;
   import §_-HG§.§_-51v§;
   import §_-HG§.§_-w2L§;
   import §_-X1k§.§_-hO§;
   import §_-bN§.§_-Z1o§;
   import §_-j2E§.§_-92f§;
   import §_-j2E§.§_-A11§;
   import §_-n1h§.Perk;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-P1O§ extends §_-w2L§
   {
      
      protected var §_-G1B§:Boolean = true;
      
      public function §_-P1O§(param1:int)
      {
         super(param1);
         this.button.scaleX = this.button.scaleY = 0.8;
         this.§_-oj§.setStatus(gls("<B>«{0}»</B>\n{1}",§_-A11§.getName(this.id),§_-A11§.§_-ya§(this.id)));
         this.§_-p1o§.visible = this.cost > 0 && !this.§_-G1B§;
         this.§_-B3N§();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-C1i§,§_-s2l§.§_-p1K§]);
      }
      
      override public function get iconOffset() : Point
      {
         return new Point(20,20);
      }
      
      override public function get iconClass() : Class
      {
         return §_-A11§.§_-92G§(this.id);
      }
      
      override public function clone() : §_-w2L§
      {
         var _loc1_:§_-P1O§ = new §_-P1O§(this.id);
         _loc1_.hero = this.hero;
         return _loc1_;
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-92f§ = null;
         if(!§_-3M§(param1))
         {
            return;
         }
         for each(_loc2_ in param1.perkController.perksClothes)
         {
            if(_loc2_.§_-T2a§ == this.id)
            {
               this.§_-P2K§ = _loc2_;
               this.§_-P2K§.§_-B3M§ = false;
               this.§_-P2K§.addEventListener(Perk.§_-E1b§,§_-A2n§);
               §_-A2n§();
               return;
            }
         }
         this.§_-F1Y§ = true;
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
         if(!this.§_-U2g§())
         {
            if(this.hero)
            {
               this.hero.sendLocation();
            }
            this.§_-P2K§.§_-V1z§();
         }
         if(this.§_-P2K§.active || !§_-hO§.§_-42d§(this.cost))
         {
            this.§_-F1Y§ = true;
         }
         this.glow = this.§_-P2K§.active;
      }
      
      override public function get description() : String
      {
         return "<b>«" + §_-A11§.getName(this.id) + "»</b>\n" + §_-A11§.§_-ya§(this.id);
      }
      
      public function dispose() : void
      {
         this.§_-P2K§ = null;
         this.§_-oj§.remove();
         removeEventListener(MouseEvent.CLICK,this.§_-H1h§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-C1i§,§_-s2l§.§_-p1K§]);
      }
      
      public function set §_-5n§(param1:Boolean) : void
      {
         if(this.§_-G1B§ == param1)
         {
            return;
         }
         this.§_-G1B§ = param1;
         this.§_-p1o§.visible = this.cost > 0 && !this.§_-G1B§;
      }
      
      override protected function §_-k2j§() : §_-51v§
      {
         this.§_-p1o§ = new §_-51v§(ImageIconMana,0.7);
         this.§_-p1o§.x = 18;
         this.§_-p1o§.y = 39;
         this.§_-p1o§.§_-U4§ = [];
         this.§_-p1o§.color = 0;
         return this.§_-p1o§;
      }
      
      override protected function §_-B3N§() : void
      {
         super.§_-B3N§();
         this.§_-Vi§.radius = 20;
         this.§_-Vi§.scaleX = this.§_-Vi§.scaleY = 0.8;
         this.§_-Vi§.x = this.§_-Vi§.radius;
         this.§_-Vi§.y = this.§_-Vi§.radius;
      }
      
      override protected function §_-U2g§() : Boolean
      {
         if(!§_-42d§ && !this.§_-P2K§.active && !this.§_-G1B§)
         {
            §_-Z1o§.show();
            return true;
         }
         return false;
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
               if(this.§_-G1B§ && param1[2] == §_-s2l§.§_-x2Y§ && this.§_-bD§ > 0)
               {
                  §_-a2p§.§_-LJ§(false);
               }
               break;
            case §_-s2l§.§_-p1K§:
               if(param1[0] == §_-s2l§.ROUND_START)
               {
                  §_-A2n§();
               }
         }
      }
   }
}

