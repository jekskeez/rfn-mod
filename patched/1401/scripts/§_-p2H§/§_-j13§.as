package §_-p2H§
{
   import Box2D.Dynamics.b2World;
   import §_-B1O§.§_-O1q§;
   import §_-RI§.§_-d2d§;
   import game.mainGame.entity.§_-p19§;
   
   public class §_-j13§ extends §_-Q1c§ implements §_-p19§
   {
      
      private var view:§_-d2d§ = null;
      
      public function §_-j13§()
      {
         super(null);
         this.view = new §_-d2d§(new Lantern());
         this.view.x = -int(this.view.width * 0.5);
         this.view.y = -int(this.view.height * 0.5);
         this.view.stop();
         §_-83v§(this.view);
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
         return §_-O1q§.§_-1t§;
      }
   }
}

