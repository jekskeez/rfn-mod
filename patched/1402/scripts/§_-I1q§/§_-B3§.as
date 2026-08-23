package §_-I1q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.Joints.b2RevoluteJoint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import §_-td§.§_-vO§;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-Y1z§;
   import game.mainGame.entity.§_-e2t§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-iZ§;
   
   public class §_-B3§ extends GameBody implements §_-e2t§, §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(6 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,0.5,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-t2E§:Array = [[0,0]];
      
      private var joint:b2RevoluteJoint;
      
      private var view:§_-aS§;
      
      private var §_-oE§:§_-aS§;
      
      private var active:Boolean = true;
      
      private var §_-D27§:Boolean = false;
      
      private var §_-52A§:Boolean = true;
      
      private var §_-h1x§:b2Vec2;
      
      private var controller:b2ConstantAccelController;
      
      public function §_-B3§()
      {
         super();
         this.view = new §_-aS§(new GumInAir());
         this.view.visible = false;
         §_-J2J§(this.view);
         this.§_-oE§ = new §_-aS§(new GumSticked());
         §_-J2J§(this.§_-oE§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         this.body.SetBullet(true);
         super.build(param1);
         if(!this.§_-32u§)
         {
            this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(-50,0)));
         }
         this.view.visible = true;
         this.§_-oE§.visible = false;
         this.§_-h1x§ = this.position.Copy();
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
         setTimeout(this.§_-e1b§,2000,this);
      }
      
      override public function get position() : b2Vec2
      {
         return super.position;
      }
      
      override public function set position(param1:b2Vec2) : void
      {
         super.position = param1;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body)
         {
            this.body.SetBullet(this.body.GetLinearVelocity().Length() > 10);
            if(!this.§_-52A§ || this.body.GetLinearVelocity().Length() < 10)
            {
               this.§_-oG§();
            }
            this.§_-zw§();
         }
      }
      
      override public function dispose() : void
      {
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         this.§_-oG§();
         this.§_-61r§();
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         if(param1 is Object || param1 is Array)
         {
            super.§_-o2I§(param1);
            this.playerId = param1[1][0];
         }
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:b2Body = param1.GetFixtureA().GetBody().GetUserData() == this ? param1.GetFixtureB().GetBody() : param1.GetFixtureA().GetBody();
         if(_loc2_.GetUserData() is §_-B3§)
         {
            return;
         }
         if(_loc2_.GetUserData() is Hero)
         {
            if((_loc2_.GetUserData() as Hero).isSelf && !(_loc2_.GetUserData() as Hero).isHare && !(_loc2_.GetUserData() as Hero).isDead && !(_loc2_.GetUserData() as Hero).inHollow)
            {
               setTimeout(this.infect,1,_loc2_.GetUserData() as Hero);
            }
            return;
         }
         this.§_-d2x§(param1);
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:b2Body = param1.GetFixtureA().GetBody().GetUserData() == this ? param1.GetFixtureB().GetBody() : param1.GetFixtureA().GetBody();
         if(_loc3_.GetUserData() is Hero || _loc3_.GetUserData() is §_-B3§)
         {
            param1.SetEnabled(false);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-e1b§(param1:§_-B3§) : void
      {
         if(param1)
         {
            param1.§_-52A§ = false;
         }
      }
      
      private function §_-zw§() : void
      {
         if(!this.joint)
         {
            return;
         }
         if(b2Math.SubtractVV(this.joint.GetAnchorA(),this.joint.GetAnchorB()).Length() > 1)
         {
            this.§_-61r§();
         }
      }
      
      private function §_-d2x§(param1:b2Contact) : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         if(this.joint)
         {
            return;
         }
         var _loc2_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc2_);
         var _loc3_:Point = new Point(_loc2_.m_normal.x,_loc2_.m_normal.y);
         if(param1.GetFixtureA().GetBody().GetUserData() == this)
         {
            _loc3_.x = -_loc3_.x;
            _loc3_.y = -_loc3_.y;
         }
         this.§_-oE§.rotation = §_-iZ§.getAngle(new Point(),_loc3_) - this.rotation + 90;
         var _loc4_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc4_.Initialize(param1.GetFixtureA().GetBody(),param1.GetFixtureB().GetBody(),this.position);
         _loc4_.collideConnected = false;
         _loc4_.enableLimit = true;
         _loc4_.upperAngle = 0;
         _loc4_.lowerAngle = 0;
         this.joint = this.§_-21H§.world.CreateJoint(_loc4_) as b2RevoluteJoint;
         this.§_-oE§.visible = true;
         this.view.visible = false;
         this.§_-52A§ = false;
      }
      
      private function §_-61r§() : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         if(!this.joint)
         {
            return;
         }
         this.§_-21H§.world.DestroyJoint(this.joint);
         this.joint = null;
         this.§_-oE§.visible = false;
         this.view.visible = true;
      }
      
      private function infect(param1:Hero, param2:Boolean = false) : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         if(param1.§_-s23§)
         {
            return;
         }
         if(!this.active)
         {
            return;
         }
         if(param1.game is §_-vO§ && !param2)
         {
            if(!this.§_-D27§)
            {
               Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"Gummed":[this.id,param1.id,this.playerId]}));
               if(this.playerId == Game.selfId)
               {
                  Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-IU§,1);
               }
            }
            this.§_-D27§ = true;
            return;
         }
         param1.§_-s23§ = true;
         this.active = false;
         if(param1.isSelf)
         {
            this.§_-21H§.map.§_-Y1E§(this,true);
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(!this.active)
         {
            return;
         }
         var _loc2_:Object = param1[1];
         if(!("Gummed" in _loc2_))
         {
            return;
         }
         if(_loc2_["Gummed"][0] != this.id)
         {
            return;
         }
         this.infect(this.§_-21H§.squirrels.get(_loc2_["Gummed"][1]),true);
         if(_loc2_["Gummed"][2] == Game.selfId)
         {
            Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-IU§,1);
         }
      }
      
      private function §_-oG§() : void
      {
         if(!this.controller)
         {
            return;
         }
         this.§_-21H§.world.RemoveController(this.controller);
         this.controller.Clear();
         this.controller = null;
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-Y1z§.§_-I2W§(§_-t2E§);
      }
   }
}

