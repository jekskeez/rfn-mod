package §_-X1Q§
{
   import §_-1§.§_-K19§;
   import §_-1§.§_-tY§;
   import §_-92M§.§_-X2z§;
   import §_-S2§.Perk;
   import §_-e1G§.§_-N2L§;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-x1Z§;
   
   public class §_-zr§ extends §_-X2z§
   {
      
      private var §_-k1z§:AnimGlowGreenPerk = null;
      
      public function §_-zr§(param1:int)
      {
         super(param1);
         this.§_-M22§.visible = true;
         this.§_-M22§.§_-A3§ = [];
         this.§_-M22§.color = 0;
         (this.§_-XW§ as §_-N2L§).setPosition(0,0);
         (this.§_-XW§ as §_-N2L§).§_-b2m§([this.§_-M22§]);
         this.§_-k1z§ = new AnimGlowGreenPerk();
         this.§_-k1z§.x = 18;
         this.§_-k1z§.y = 17;
         this.§_-k1z§.play();
         addChild(this.§_-k1z§);
      }
      
      override public function get iconClass() : Class
      {
         return §_-tY§.§_-D2L§(this.id);
      }
      
      override public function clone() : §_-X2z§
      {
         var _loc1_:§_-zr§ = new §_-zr§(this.id);
         _loc1_.hero = this.hero;
         return _loc1_;
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-K19§ = null;
         if(!§_-qu§(param1))
         {
            return;
         }
         for each(_loc2_ in param1.perkController.§_-s13§)
         {
            if(_loc2_.§_-i2D§ == this.id)
            {
               this.§_-425§ = _loc2_;
               this.cost = this.§_-Ll§;
               this.§_-425§.addEventListener(Perk.§_-RK§,§_-Dh§);
            }
         }
         §_-Dh§();
         this.§_-l13§();
      }
      
      override public function §_-P2v§(param1:Event = null) : void
      {
         if(!this.§_-K2G§())
         {
            return;
         }
         if(!§_-41x§())
         {
            if(this.cost == 0 && this.id == §_-tY§.§_-Yi§)
            {
               Connection.§_-Li§(§_-h2B§.§_-03G§,§_-S2I§.§_-ry§);
            }
            else
            {
               this.§_-425§.§_-7J§();
            }
         }
         if(this.§_-425§.active)
         {
            this.§_-3Q§ = true;
         }
      }
      
      override public function get description() : String
      {
         return "<b>«" + §_-tY§.getName(this.id) + "»</b>\n" + §_-tY§.§_-l7§(this.id);
      }
      
      public function get perk() : Class
      {
         return §_-tY§.§_-xZ§(this.id);
      }
      
      override protected function §_-l13§() : void
      {
         var _loc1_:Array = [];
         this.§_-k1z§.visible = this.glow;
         if(this.§_-3Q§)
         {
            _loc1_ = _loc1_.concat(§_-x1Z§.§_-c2G§);
         }
         this.button.filters = _loc1_;
      }
      
      override protected function §_-K2G§() : Boolean
      {
         return super.§_-K2G§();
      }
      
      override protected function §_-bZ§() : void
      {
      }
   }
}

