package game.mainGame
{
   import §_-51g§.PortalSensorEvent;
   import §_-51g§.§_-41b§;
   
   public class §_-R2L§
   {
      
      private var §_-v2c§:§_-41b§;
      
      private var §_-o16§:§_-41b§;
      
      private var §_-83F§:§_-41b§;
      
      public function §_-R2L§()
      {
         super();
      }
      
      public function set portalA(param1:§_-41b§) : void
      {
         if(this.§_-v2c§ != null)
         {
            this.§_-v2c§.removeEventListener(PortalSensorEvent.CONTACT,this.§_-x2o§);
            this.§_-v2c§.dispose();
         }
         this.§_-v2c§ = param1;
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(PortalSensorEvent.CONTACT,this.§_-x2o§);
      }
      
      public function set portalB(param1:§_-41b§) : void
      {
         if(this.§_-o16§ != null)
         {
            this.§_-o16§.removeEventListener(PortalSensorEvent.CONTACT,this.§_-x2o§);
            this.§_-o16§.dispose();
         }
         this.§_-o16§ = param1;
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(PortalSensorEvent.CONTACT,this.§_-x2o§);
      }
      
      public function set portalC(param1:§_-41b§) : void
      {
         if(this.§_-83F§ != null)
         {
            this.§_-83F§.removeEventListener(PortalSensorEvent.CONTACT,this.§_-x2o§);
            this.§_-83F§.dispose();
         }
         this.§_-83F§ = param1;
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(PortalSensorEvent.CONTACT,this.§_-x2o§);
      }
      
      public function reset() : void
      {
         this.portalA = null;
         this.portalB = null;
         this.portalC = null;
      }
      
      public function §_-3s§() : void
      {
         if(this.§_-v2c§ != null)
         {
            this.§_-v2c§.§_-3s§();
         }
         if(this.§_-o16§ != null)
         {
            this.§_-o16§.§_-3s§();
         }
         if(this.§_-83F§ != null)
         {
            this.§_-83F§.§_-3s§();
         }
      }
      
      private function §_-x2o§(param1:PortalSensorEvent) : void
      {
         var _loc3_:§_-41b§ = null;
         var _loc2_:§_-41b§ = param1.currentTarget as §_-41b§;
         var _loc4_:Hero = param1.hero;
         if(_loc2_ == this.§_-v2c§)
         {
            _loc3_ = this.§_-83F§ ? this.§_-83F§ : this.§_-o16§;
         }
         else if(_loc2_ == this.§_-o16§)
         {
            _loc3_ = this.§_-83F§ ? this.§_-83F§ : this.§_-v2c§;
         }
         else if(_loc2_ == this.§_-83F§)
         {
            _loc3_ = Boolean(this.§_-v2c§) && Boolean(this.§_-o16§) || !this.§_-v2c§ && !this.§_-o16§ ? null : (this.§_-v2c§ ? this.§_-v2c§ : this.§_-o16§);
         }
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.teleport(_loc4_);
      }
   }
}

