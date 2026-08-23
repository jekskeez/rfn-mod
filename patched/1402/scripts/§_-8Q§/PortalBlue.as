package §_-8Q§
{
   import Box2D.Dynamics.b2World;
   import flash.display.DisplayObjectContainer;
   
   public class PortalBlue extends §_-B1l§
   {
      
      public function PortalBlue(param1:DisplayObjectContainer = null)
      {
         super(new PortalB(),param1);
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         param1.userData.map.portals.portalA = this.§_-b1J§;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.game)
         {
            this.game.map.portals.portalA = null;
         }
      }
   }
}

