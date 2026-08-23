package §_-8Q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-X2V§.SquirrelEvent;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import game.mainGame.§_-q2c§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-61H§ extends GameBody implements §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(4 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.1,0.1,4,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var scale:Number = 1;
      
      private var view:MovieClip;
      
      private var §_-Q3§:MovieClip;
      
      private var §_-m1§:MovieClip;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-g2v§:Boolean = false;
      
      private var §_-D27§:Boolean = false;
      
      private var controller:b2ConstantAccelController;
      
      private var §_-52A§:Boolean = true;
      
      private var §_-s2i§:b2Fixture = null;
      
      private var §_-Zk§:Array = null;
      
      public function §_-61H§()
      {
         super();
         this.view = new SnowballAnimation();
         this.view.play();
         this.addChild(this.view);
         this.view.visible = false;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function build(param1:b2World) : void
      {
         setTimeout(this.§_-Z22§,300,param1);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body)
         {
            this.body.SetBullet(this.body.GetLinearVelocity().Length() > 30);
            if(!this.§_-52A§ || this.body.GetLinearVelocity().Length() < 30)
            {
               this.§_-oG§();
            }
         }
      }
      
      override public function dispose() : void
      {
         this.§_-oG§();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId,this.scale]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.playerId = param1[1][0];
         this.scale = param1[1][1];
      }
      
      public function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         setTimeout(this.death,1 * 1000);
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData() as Hero;
         }
         else if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData() as Hero;
         }
         if(_loc2_ != null && _loc2_.id == this.playerId || this.§_-g2v§)
         {
            return;
         }
         this.§_-g2v§ = true;
         if(this.view.parent)
         {
            this.view.parent.removeChild(this.view);
         }
         this.§_-Q3§ = new SnowKick();
         this.§_-Q3§.gotoAndPlay(0);
         this.§_-Q3§.addEventListener(Event.CHANGE,this.§_-Gv§);
         this.addChild(this.§_-Q3§);
         if(_loc2_ == null)
         {
            this.§_-th§();
            return;
         }
         if(_loc2_.isSelf)
         {
            this.§_-x2S§(_loc2_);
         }
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc3_ = param1.GetFixtureA().GetBody().GetUserData() as Hero;
         }
         else if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData() as Hero;
         }
         param1.SetEnabled(!(_loc3_ != null && _loc3_.id == this.playerId));
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-Z22§(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.SetBullet(true);
         this.§_-s2i§ = this.body.CreateFixture(§_-ql§);
         this.§_-s2i§.SetUserData(this);
         super.build(param1);
         this.fixedRotation = true;
         this.§_-932§(this.scale);
         if(!this.§_-32u§)
         {
            this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(-50,0)));
         }
         this.view.visible = true;
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
         setTimeout(this.§_-e1b§,1000,this);
      }
      
      private function §_-e1b§(param1:§_-61H§) : void
      {
         if(param1)
         {
            param1.§_-52A§ = false;
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if(!("OnSnowballs" in _loc2_))
         {
            return;
         }
         if(_loc2_["OnSnowballs"][0] != this.id)
         {
            return;
         }
         var _loc3_:Hero = this.§_-21H§.squirrels.get(_loc2_["OnSnowballs"][1]) as Hero;
         if(_loc3_ == null)
         {
            return;
         }
         this.§_-EH§(_loc3_);
      }
      
      private function §_-EH§(param1:Hero) : void
      {
         if(this.§_-Zk§ == null)
         {
            this.§_-Zk§ = [];
         }
         this.§_-m1§ = new this.§_-Zk§[int(Math.random() * this.§_-Zk§.length)]();
         this.§_-m1§.x = 8;
         this.§_-m1§.y = -13;
         param1.heroView.addChild(this.§_-m1§);
         this.§_-th§();
         param1.addEventListener(SquirrelEvent.§_-E25§,this.§_-f2u§);
         setTimeout(this.§_-f2u§,8 * 1000);
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
      
      private function §_-f2u§(param1:SquirrelEvent = null) : void
      {
         if(param1 != null)
         {
            param1.player.removeEventListener(SquirrelEvent.§_-E25§,this.§_-f2u§);
         }
         if(this.§_-m1§.parent)
         {
            this.§_-m1§.parent.removeChild(this.§_-m1§);
         }
      }
      
      private function §_-932§(param1:Number) : void
      {
         var _loc2_:b2CircleShape = new b2CircleShape(3 / Game.§_-12A§ * param1);
         this.§_-s2i§.GetShape().Set(_loc2_);
         this.view.scaleX = this.view.scaleY = param1;
      }
      
      private function §_-x2S§(param1:Hero) : void
      {
         if(!this.§_-21H§ || param1.isDragon || param1.isHare || param1.isScrat || param1.shaman || param1.id == this.playerId)
         {
            this.§_-th§();
            return;
         }
         if(!this.§_-D27§)
         {
            if(this.§_-21H§ is §_-62b§)
            {
               this.§_-D27§ = true;
               this.§_-EH§(param1);
               return;
            }
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"OnSnowballs":[this.id,param1.id]}));
         }
         this.§_-D27§ = true;
      }
      
      private function §_-Gv§(param1:Event) : void
      {
         this.§_-Q3§.removeEventListener(Event.CHANGE,this.§_-Gv§);
         if(this.§_-Q3§.parent)
         {
            this.§_-Q3§.parent.removeChild(this.§_-Q3§);
         }
      }
      
      private function death() : void
      {
         if(this.body == null)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}

