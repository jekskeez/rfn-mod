package §_-k1z§
{
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-f1u§;
   
   public class DecorationPlasmaLamp1 extends §_-bh§
   {
      
      private var view:§_-f1u§ = null;
      
      public function DecorationPlasmaLamp1()
      {
         super(null);
         this.view = new §_-f1u§(new PlasmaLamp1());
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
   }
}

