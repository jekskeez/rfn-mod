package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Joints.b2JointEdge;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import game.mainGame.entity.§_-hx§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-g2l§ extends GameBody implements §_-22J§
   {
      
      private static const §_-c1F§:int = 64;
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(§_-c1F§ / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.2,0,0.001,§_-52X§,§_-FN§,0,true);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      private var view:§_-d2d§ = null;
      
      private var radius:§_-h2I§ = null;
      
      public function §_-g2l§()
      {
         super();
         this.view = new §_-d2d§(new MagnetImg());
         this.view.loop = true;
         this.view.stop();
         this.view.y = this.view.height * 0.5;
         §_-83v§(this.view);
         this.radius = new §_-h2I§(new PerkRadius());
         this.radius.scaleXY(§_-c1F§ * 2 / this.radius.height);
         §_-83v§(this.radius);
         this.fixed = true;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         this.view.play();
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeFromParent();
         }
         this.view = null;
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
      }
      
      override public function set showDebug(param1:Boolean) : void
      {
         super.showDebug = param1;
         this.radius.visible = this.§_-C1B§;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData();
         }
         if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow)
         {
            return;
         }
         var _loc3_:Array = [];
         var _loc4_:b2JointEdge = _loc2_.body.GetJointList();
         while(_loc4_)
         {
            if(_loc4_.joint.GetBodyA().GetUserData() is §_-hx§)
            {
               _loc3_.push([_loc2_.id,(_loc4_.joint.GetBodyA().GetUserData() as GameBody).id]);
            }
            else if(_loc4_.joint.GetBodyB().GetUserData() is §_-hx§)
            {
               _loc3_.push([_loc2_.id,(_loc4_.joint.GetBodyB().GetUserData() as GameBody).id]);
            }
            _loc4_ = _loc4_.next;
         }
         var _loc5_:* = int(_loc3_.length - 1);
         while(_loc5_ >= 0)
         {
            this.§_-7f§(_loc3_[_loc5_][0],_loc3_[_loc5_][1]);
            _loc5_--;
         }
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-7f§(param1:int, param2:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.magnetize(param2);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"magnetize":[this.id,param2]}));
         }
      }
      
      private function magnetize(param1:int) : void
      {
         if(this.§_-H2D§ == null)
         {
            return;
         }
         var _loc2_:§_-hx§ = this.§_-H2D§.map.getObject(param1) as §_-hx§;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.magnetize(this);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if("magnetize" in _loc2_)
         {
            if(_loc2_["magnetize"][0] != this.id)
            {
               return;
            }
            if(_loc2_["magnetize"][1])
            {
               this.magnetize(_loc2_["magnetize"][1]);
            }
         }
      }
   }
}

