package §_-83V§
{
   import Box2D.Dynamics.b2World;
   import flash.display.DisplayObjectContainer;
   
   public class PortalRed extends §_-k2I§
   {
      
      public function PortalRed(param1:DisplayObjectContainer = null)
      {
         super(new PortalA(),param1);
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         param1.userData.map.portals.portalB = this.§_-V2K§;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.game)
         {
            this.game.map.portals.portalB = null;
         }
      }
   }
}

