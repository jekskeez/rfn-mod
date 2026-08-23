package §_-j1y§
{
   import §_-HG§.§_-w2L§;
   import §_-X1k§.§_-4v§;
   import §_-n1h§.Perk;
   import §_-o10§.§_-p1B§;
   import §_-o10§.§_-pl§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-13p§ extends §_-w2L§
   {
      
      private var §_-U2C§:Boolean = false;
      
      private var §_-d1X§:String = "";
      
      public function §_-13p§(param1:int)
      {
         super(param1);
         this.button.scaleX = this.button.scaleY = 0.7;
         this.§_-p1o§.visible = false;
         this.§_-J1y§();
         this.§_-B3N§();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-C1i§,§_-s2l§.§_-p1K§]);
      }
      
      override public function get iconClass() : Class
      {
         return §_-pl§.§_-e1H§(this.id);
      }
      
      override public function get description() : String
      {
         return "<b>«" + §_-pl§.perkData[this.id]["name"] + "»</b>\n" + this.§_-d1X§;
      }
      
      override public function clone() : §_-w2L§
      {
         var _loc1_:§_-13p§ = new §_-13p§(this.id);
         _loc1_.hero = this.hero;
         return _loc1_;
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-p1B§ = null;
         if(!§_-3M§(param1))
         {
            return;
         }
         this.§_-U2C§ = false;
         for each(_loc2_ in param1.perkController.§_-ov§)
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
         this.§_-P2K§.§_-V1z§();
         this.§_-F1Y§ = this.§_-P2K§.§_-B3M§ || this.§_-P2K§.active && !(this.§_-P2K§.switchable && this.§_-P2K§.canTurnOff);
         this.glow = this.§_-P2K§.active;
      }
      
      public function dispose() : void
      {
         this.§_-P2K§ = null;
         this.§_-oj§.remove();
         removeEventListener(MouseEvent.CLICK,this.§_-H1h§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-C1i§,§_-s2l§.§_-p1K§]);
      }
      
      public function §_-J1y§() : void
      {
         var _loc1_:Array = §_-4v§.skills;
         this.§_-d1X§ = "";
         var _loc2_:int = 0;
         var _loc3_:int = int(_loc1_.length);
         while(_loc2_ < _loc3_)
         {
            if(_loc1_[_loc2_][0] == this.id)
            {
               this.§_-d1X§ = §_-pl§.§_-O2e§(this.id,§_-pl§.§_-zl§,[_loc1_[_loc2_][1],§_-4v§.§_-R2G§(_loc1_[_loc2_][1],_loc1_[_loc2_][2])]);
               break;
            }
            _loc2_++;
         }
         if(this.§_-d1X§ == "")
         {
            this.§_-d1X§ = §_-pl§.§_-O2e§(this.id,§_-pl§.§_-61Z§,[0,0]);
         }
         if(this.§_-P2K§)
         {
            §_-A2n§();
         }
         else
         {
            this.§_-oj§.setStatus(this.description);
         }
      }
      
      override protected function §_-B3N§() : void
      {
         super.§_-B3N§();
         this.§_-Vi§.radius = 18;
         this.§_-Vi§.x = this.§_-Vi§.radius;
         this.§_-Vi§.y = this.§_-Vi§.radius;
      }
      
      protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
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
               _loc2_ = this.§_-P2K§.§_-T2a§;
               if(param1[1] != _loc2_)
               {
                  return;
               }
               this.§_-P2K§.§_-B3M§ = false;
               §_-A2n§();
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

