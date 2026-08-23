package §_-k1z§
{
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-f1u§;
   
   public class DecorationPlasmaLamp2 extends §_-bh§
   {
      
      private var view:§_-f1u§ = null;
      
      public function DecorationPlasmaLamp2()
      {
         super(null);
         this.view = new §_-f1u§(new PlasmaLamp2());
         this.view.stop();
         this.view.y = -int(this.view.height * 0.5);
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
   }
}

