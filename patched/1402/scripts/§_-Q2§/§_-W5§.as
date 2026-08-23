package §_-Q2§
{
   import Box2D.Dynamics.b2World;
   
   public class §_-W5§ extends §_-Y2o§
   {
      
      public function §_-W5§()
      {
         super(new PortalGreenImg(),new PortalArrowBlue());
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         param1.userData.map.portals.portalC = this.§_-b1J§;
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

