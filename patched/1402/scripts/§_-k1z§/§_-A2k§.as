package §_-k1z§
{
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-f1u§;
   import §_-j2H§.§_-D1T§;
   import game.mainGame.entity.§_-p2r§;
   
   public class §_-A2k§ extends §_-bh§ implements §_-p2r§
   {
      
      private var view:§_-f1u§ = null;
      
      public function §_-A2k§()
      {
         super(null);
         this.view = new §_-f1u§(new Lantern());
         this.view.x = -int(this.view.width * 0.5);
         this.view.y = -int(this.view.height * 0.5);
         this.view.stop();
         §_-J2J§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         this.view.play();
      }
      
      override public function dispose() : void
      {
         this.view.removeFromParent();
         super.dispose();
      }
      
      public function get spotSize() : int
      {
         return §_-D1T§.§_-P25§;
      }
   }
}

