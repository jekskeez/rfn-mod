package §_-B1O§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   
   public class §_-g2z§ extends §_-N2o§
   {
      
      private static const §_-F2h§:Number = 32;
      
      private static const §_-W2§:Number = 32;
      
      private static const §_-H2S§:Number = 32;
      
      public function §_-g2z§()
      {
         super(false);
         §_-71E§ -= 2;
         draw();
      }
      
      override protected function resize(param1:int, param2:int) : void
      {
         param1 = Math.max(int(param1 / §_-H2S§) * §_-H2S§,§_-F2h§ + §_-W2§);
         super.resize(param1,param2);
      }
      
      override public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      override protected function get leftClass() : Class
      {
         return IceGroundLeft;
      }
      
      override protected function get middleClass() : Class
      {
         return IceGroundMiddle;
      }
      
      override protected function get rightClass() : Class
      {
         return IceGroundRight;
      }
   }
}

