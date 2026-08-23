package §_-j2H§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   
   public class §_-Tu§ extends §_-T2i§
   {
      
      private static const §_-uP§:Number = 32;
      
      private static const §_-v4§:Number = 32;
      
      private static const §_-Z19§:Number = 32;
      
      public function §_-Tu§()
      {
         super(false);
         §_-J1Q§ -= 2;
         draw();
      }
      
      override protected function resize(param1:int, param2:int) : void
      {
         param1 = Math.max(int(param1 / §_-Z19§) * §_-Z19§,§_-uP§ + §_-v4§);
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

