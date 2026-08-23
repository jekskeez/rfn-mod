package §_-j2H§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2ContactImpulse;
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import utils.§_-iZ§;
   import views.§_-22C§;
   
   public class §_-tY§ extends §_-01b§ implements §_-Pn§
   {
      
      public function §_-tY§()
      {
         super();
      }
      
      override public function get landSound() : String
      {
         return "land_lava";
      }
      
      override protected function §_-q2X§() : void
      {
         this.icon = new §_-aS§(new Lava());
      }
      
      override protected function §_-Nq§() : void
      {
         this.§_-Z2d§ = new Lava();
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         var _loc4_:b2Vec2 = _loc3_.m_normal.Copy();
         if(param1.GetFixtureA().GetUserData() == this)
         {
            this.§_-l2S§(param1.GetFixtureB().GetBody(),_loc4_,_loc3_.m_points[0]);
         }
         else
         {
            _loc4_.NegativeSelf();
            this.§_-l2S§(param1.GetFixtureA().GetBody(),_loc4_,_loc3_.m_points[1]);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-l2S§(param1:b2Body, param2:b2Vec2, param3:b2Vec2) : void
      {
         if(!(param1.GetUserData() is Hero))
         {
            return;
         }
         if(param3.x == 0 && param3.y == 0)
         {
            return;
         }
         var _loc4_:b2Vec2 = param1.GetLinearVelocity();
         if(b2Math.Dot(_loc4_,param2) < 0)
         {
            return;
         }
         param2.Multiply(20);
         _loc4_.Add(param2);
         param1.SetLinearVelocity(_loc4_);
         var _loc5_:§_-22C§ = new §_-22C§(§_-iZ§.getAngle(new Point(),new Point(param2.x,param2.y)) - 90,90);
         _loc5_.x = param3.x * Game.§_-12A§;
         _loc5_.y = param3.y * Game.§_-12A§;
         _loc5_.scaleX = 0.5;
         _loc5_.scaleY = 0.5;
         this.addChild(_loc5_);
         if(this.body.GetWorld().userData as SquirrelGame != null && (this.body.GetWorld().userData as SquirrelGame).map != null)
         {
            (this.body.GetWorld().userData as SquirrelGame).map.addChild(_loc5_);
         }
      }
   }
}

