package §_-8Q§
{
   import Box2D.Dynamics.b2World;
   import §_-r1M§.§_-b13§;
   import flash.display.DisplayObjectContainer;
   
   public class §_-K2j§ extends §_-B1l§
   {
      
      public function §_-K2j§(param1:DisplayObjectContainer = null)
      {
         super(new PortalB(),param1,new PortalRedPlumage());
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         var _loc2_:§_-b13§ = param1.userData.map as §_-b13§;
         if(_loc2_)
         {
            _loc2_.redShamanPortals.portalA = this.§_-b1J§;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var _loc1_:§_-b13§ = this.game ? this.game.map as §_-b13§ : null;
         if(_loc1_)
         {
            _loc1_.redShamanPortals.portalA = null;
         }
      }
   }
}

