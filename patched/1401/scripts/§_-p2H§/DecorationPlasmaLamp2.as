package §_-p2H§
{
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-d2d§;
   
   public class DecorationPlasmaLamp2 extends §_-Q1c§
   {
      
      private var view:§_-d2d§ = null;
      
      public function DecorationPlasmaLamp2()
      {
         super(null);
         this.view = new §_-d2d§(new PlasmaLamp2());
         this.view.stop();
         this.view.y = -int(this.view.height * 0.5);
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
   }
}

