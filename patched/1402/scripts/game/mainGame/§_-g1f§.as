package game.mainGame
{
   import §_-j4§.PortalSensorEvent;
   import §_-j4§.§_-11k§;
   
   public class §_-g1f§
   {
      
      private var §_-43n§:§_-11k§;
      
      private var §_-NE§:§_-11k§;
      
      private var §_-M2O§:§_-11k§;
      
      public function §_-g1f§()
      {
         super();
      }
      
      public function set portalA(param1:§_-11k§) : void
      {
         if(this.§_-43n§ != null)
         {
            this.§_-43n§.removeEventListener(PortalSensorEvent.CONTACT,this.§_-EO§);
            this.§_-43n§.dispose();
         }
         this.§_-43n§ = param1;
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(PortalSensorEvent.CONTACT,this.§_-EO§);
      }
      
      public function set portalB(param1:§_-11k§) : void
      {
         if(this.§_-NE§ != null)
         {
            this.§_-NE§.removeEventListener(PortalSensorEvent.CONTACT,this.§_-EO§);
            this.§_-NE§.dispose();
         }
         this.§_-NE§ = param1;
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(PortalSensorEvent.CONTACT,this.§_-EO§);
      }
      
      public function set portalC(param1:§_-11k§) : void
      {
         if(this.§_-M2O§ != null)
         {
            this.§_-M2O§.removeEventListener(PortalSensorEvent.CONTACT,this.§_-EO§);
            this.§_-M2O§.dispose();
         }
         this.§_-M2O§ = param1;
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(PortalSensorEvent.CONTACT,this.§_-EO§);
      }
      
      public function reset() : void
      {
         this.portalA = null;
         this.portalB = null;
         this.portalC = null;
      }
      
      public function §_-vp§() : void
      {
         if(this.§_-43n§ != null)
         {
            this.§_-43n§.§_-vp§();
         }
         if(this.§_-NE§ != null)
         {
            this.§_-NE§.§_-vp§();
         }
         if(this.§_-M2O§ != null)
         {
            this.§_-M2O§.§_-vp§();
         }
      }
      
      private function §_-EO§(param1:PortalSensorEvent) : void
      {
         var _loc3_:§_-11k§ = null;
         var _loc2_:§_-11k§ = param1.currentTarget as §_-11k§;
         var _loc4_:Hero = param1.hero;
         if(_loc2_ == this.§_-43n§)
         {
            _loc3_ = this.§_-M2O§ ? this.§_-M2O§ : this.§_-NE§;
         }
         else if(_loc2_ == this.§_-NE§)
         {
            _loc3_ = this.§_-M2O§ ? this.§_-M2O§ : this.§_-43n§;
         }
         else if(_loc2_ == this.§_-M2O§)
         {
            _loc3_ = Boolean(this.§_-43n§) && Boolean(this.§_-NE§) || !this.§_-43n§ && !this.§_-NE§ ? null : (this.§_-43n§ ? this.§_-43n§ : this.§_-NE§);
         }
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.teleport(_loc4_);
      }
   }
}

