package §_-83V§
{
   import Box2D.Dynamics.b2World;
   import §_-p1g§.§_-y2r§;
   import flash.display.DisplayObjectContainer;
   
   public class §_-tT§ extends §_-k2I§
   {
      
      public function §_-tT§(param1:DisplayObjectContainer = null)
      {
         super(new PortalA(),param1,new PortalBluePlumage());
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         var _loc2_:§_-y2r§ = param1.userData.map as §_-y2r§;
         if(_loc2_)
         {
            _loc2_.blueShamanPortals.portalB = this.§_-V2K§;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var _loc1_:§_-y2r§ = this.game ? this.game.map as §_-y2r§ : null;
         if(_loc1_)
         {
            _loc1_.blueShamanPortals.portalB = null;
         }
      }
   }
}

