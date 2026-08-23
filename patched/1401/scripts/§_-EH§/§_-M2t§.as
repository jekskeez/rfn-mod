package §_-EH§
{
   import §_-92M§.§_-X2z§;
   import §_-I10§.§_-ct§;
   import §_-S2§.Perk;
   import §_-vK§.§_-QC§;
   import §_-vK§.§_-qC§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-M2t§ extends §_-X2z§
   {
      
      private var §_-53Q§:Boolean = false;
      
      private var §_-02o§:String = "";
      
      public function §_-M2t§(param1:int)
      {
         super(param1);
         this.button.scaleX = this.button.scaleY = 0.7;
         this.§_-M22§.visible = false;
         this.§_-011§();
         this.§_-w7§();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-w1R§,§_-S2I§.§_-W1O§]);
      }
      
      override public function get iconClass() : Class
      {
         return §_-QC§.§_-41g§(this.id);
      }
      
      override public function get description() : String
      {
         return "<b>«" + §_-QC§.perkData[this.id]["name"] + "»</b>\n" + this.§_-02o§;
      }
      
      override public function clone() : §_-X2z§
      {
         var _loc1_:§_-M2t§ = new §_-M2t§(this.id);
         _loc1_.hero = this.hero;
         return _loc1_;
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-qC§ = null;
         if(!§_-qu§(param1))
         {
            return;
         }
         this.§_-53Q§ = false;
         for each(_loc2_ in param1.perkController.§_-515§)
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
         this.§_-425§.§_-7J§();
         this.§_-3Q§ = this.§_-425§.§_-03R§ || this.§_-425§.active && !(this.§_-425§.switchable && this.§_-425§.canTurnOff);
         this.glow = this.§_-425§.active;
      }
      
      public function dispose() : void
      {
         this.§_-425§ = null;
         this.§_-XW§.remove();
         removeEventListener(MouseEvent.CLICK,this.§_-P2v§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-w1R§,§_-S2I§.§_-W1O§]);
      }
      
      public function §_-011§() : void
      {
         var _loc1_:Array = §_-ct§.skills;
         this.§_-02o§ = "";
         var _loc2_:int = 0;
         var _loc3_:int = int(_loc1_.length);
         while(_loc2_ < _loc3_)
         {
            if(_loc1_[_loc2_][0] == this.id)
            {
               this.§_-02o§ = §_-QC§.§_-03v§(this.id,§_-QC§.§_-W2r§,[_loc1_[_loc2_][1],§_-ct§.§_-w2d§(_loc1_[_loc2_][1],_loc1_[_loc2_][2])]);
               break;
            }
            _loc2_++;
         }
         if(this.§_-02o§ == "")
         {
            this.§_-02o§ = §_-QC§.§_-03v§(this.id,§_-QC§.§_-l11§,[0,0]);
         }
         if(this.§_-425§)
         {
            §_-Dh§();
         }
         else
         {
            this.§_-XW§.setStatus(this.description);
         }
      }
      
      override protected function §_-w7§() : void
      {
         super.§_-w7§();
         this.§_-vR§.radius = 18;
         this.§_-vR§.x = this.§_-vR§.radius;
         this.§_-vR§.y = this.§_-vR§.radius;
      }
      
      protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
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
               _loc2_ = this.§_-425§.§_-i2D§;
               if(param1[1] != _loc2_)
               {
                  return;
               }
               this.§_-425§.§_-03R§ = false;
               §_-Dh§();
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

