package §_-b1B§
{
   import Box2D.Dynamics.b2World;
   import §_-p1g§.§_-y2r§;
   
   public class §_-Y2L§ extends §_-K2g§
   {
      
      public function §_-Y2L§()
      {
         super(new §_-tI§(),new PortalArrowBlue(),new PortalBluePlumage());
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         var _loc2_:§_-y2r§ = param1.userData.map as §_-y2r§;
         if(_loc2_)
         {
            _loc2_.blueShamanPortals.portalC = this.§_-V2K§;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var _loc1_:§_-y2r§ = this.game ? this.game.map as §_-y2r§ : null;
         if(_loc1_)
         {
            _loc1_.blueShamanPortals.portalC = null;
         }
      }
   }
}

