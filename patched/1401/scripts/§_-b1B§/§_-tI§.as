package §_-b1B§
{
   import Box2D.Dynamics.b2World;
   
   public class §_-tI§ extends §_-K2g§
   {
      
      public function §_-tI§()
      {
         super(new PortalGreenImg(),new PortalArrowBlue());
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         param1.userData.map.portals.portalC = this.§_-V2K§;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.game)
         {
            this.game.map.portals.portalC = null;
         }
      }
   }
}

