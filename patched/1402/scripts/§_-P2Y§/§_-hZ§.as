package §_-P2Y§
{
   import §_-5P§.§_-H2l§;
   import §_-5P§.§_-Z1f§;
   import §_-HG§.§_-w2L§;
   import §_-S1n§.§_-K1y§;
   import §_-n1h§.Perk;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-y1l§;
   
   public class §_-hZ§ extends §_-w2L§
   {
      
      private var §_-p7§:AnimGlowGreenPerk = null;
      
      public function §_-hZ§(param1:int)
      {
         super(param1);
         this.§_-p1o§.visible = true;
         this.§_-p1o§.§_-U4§ = [];
         this.§_-p1o§.color = 0;
         (this.§_-oj§ as §_-K1y§).setPosition(0,0);
         (this.§_-oj§ as §_-K1y§).§_-qL§([this.§_-p1o§]);
         this.§_-p7§ = new AnimGlowGreenPerk();
         this.§_-p7§.x = 18;
         this.§_-p7§.y = 17;
         this.§_-p7§.play();
         addChild(this.§_-p7§);
      }
      
      override public function get iconClass() : Class
      {
         return §_-Z1f§.§_-92G§(this.id);
      }
      
      override public function clone() : §_-w2L§
      {
         var _loc1_:§_-hZ§ = new §_-hZ§(this.id);
         _loc1_.hero = this.hero;
         return _loc1_;
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-H2l§ = null;
         if(!§_-3M§(param1))
         {
            return;
         }
         for each(_loc2_ in param1.perkController.§_-rI§)
         {
            if(_loc2_.§_-T2a§ == this.id)
            {
               this.§_-P2K§ = _loc2_;
               this.cost = this.§_-bD§;
               this.§_-P2K§.addEventListener(Perk.§_-E1b§,§_-A2n§);
            }
         }
         §_-A2n§();
         this.§_-ZU§();
      }
      
      override public function §_-H1h§(param1:Event = null) : void
      {
         if(!this.§_-c2w§())
         {
            return;
         }
         if(!§_-U2g§())
         {
            if(this.cost == 0 && this.id == §_-Z1f§.§_-q1E§)
            {
               Connection.§_-e2T§(§_-u1O§.§_-N1Y§,§_-s2l§.§_-33E§);
            }
            else
            {
               this.§_-P2K§.§_-V1z§();
            }
         }
         if(this.§_-P2K§.active)
         {
            this.§_-F1Y§ = true;
         }
      }
      
      override public function get description() : String
      {
         return "<b>«" + §_-Z1f§.getName(this.id) + "»</b>\n" + §_-Z1f§.§_-ya§(this.id);
      }
      
      public function get perk() : Class
      {
         return §_-Z1f§.§_-vW§(this.id);
      }
      
      override protected function §_-ZU§() : void
      {
         var _loc1_:Array = [];
         this.§_-p7§.visible = this.glow;
         if(this.§_-F1Y§)
         {
            _loc1_ = _loc1_.concat(§_-y1l§.§_-Tk§);
         }
         this.button.filters = _loc1_;
      }
      
      override protected function §_-c2w§() : Boolean
      {
         return super.§_-c2w§();
      }
      
      override protected function §_-b2z§() : void
      {
      }
   }
}

