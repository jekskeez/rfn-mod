package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.§_-PY§;
   import game.mainGame.entity.§_-hx§;
   import game.mainGame.entity.§_-s2K§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-P2e§ extends GameBody implements §_-hx§, §_-s2K§, §_-22J§
   {
      
      private static const §_-c1F§:int = 64;
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-Z2A§:int = 20;
      
      private static const §_-SO§:b2CircleShape = new b2CircleShape(§_-c1F§ / Game.§_-x2P§);
      
      private static const §_-k2L§:b2CircleShape = new b2CircleShape(11 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-SO§,null,0.2,0,0.001,§_-52X§,§_-FN§,0,true);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      private var view:§_-d2d§ = null;
      
      private var radius:§_-h2I§ = null;
      
      private var §_-N27§:§_-PY§ = null;
      
      private var hero:Hero = null;
      
      private var §_-c3§:Number;
      
      private var §_-i2J§:b2Joint = null;
      
      private var §_-tD§:int = -1;
      
      private var §_-oV§:b2Vec2 = null;
      
      private var §_-O1A§:Hero = null;
      
      private var §_-f1f§:§_-d2d§;
      
      public function §_-P2e§()
      {
         super();
         this.view = new §_-d2d§(new HoppingImg());
         this.view.loop = true;
         this.view.y = 10;
         this.view.stop();
         §_-83v§(this.view);
         this.radius = new §_-h2I§(new PerkRadius());
         this.radius.scaleXY(§_-c1F§ * 2 / this.radius.width);
         §_-83v§(this.radius);
         this.fixed = true;
         this.§_-f1f§ = new §_-d2d§(new HoppingOnHead());
         this.§_-f1f§.gotoAndStop(1);
         this.§_-N27§ = new §_-PY§(this.§_-f1f§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         this.view.play();
         if(this.§_-oV§ == null)
         {
            this.§_-oV§ = this.position.Copy();
         }
         if(this.§_-tD§ != -1)
         {
            this.pinSquirrel(this.§_-tD§);
         }
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeFromParent();
         }
         this.view = null;
         if(this.§_-N27§)
         {
            this.§_-N27§.dispose();
         }
         this.§_-N27§ = null;
         this.§_-L1Z§();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         this.§_-O1A§ = null;
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push(this.§_-oV§ == null ? this.§_-oV§ : [this.§_-oV§.x,this.§_-oV§.y]);
         if(this.hero != null)
         {
            _loc1_.push(this.hero.id);
         }
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.§_-oV§ = param1[1] != null ? new b2Vec2(param1[1][0],param1[1][1]) : null;
         if(2 in param1)
         {
            this.§_-tD§ = param1[2];
         }
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
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("hopping") || this.hero == _loc2_ || this.§_-O1A§ == _loc2_)
         {
            return;
         }
         this.§_-oJ§(_loc2_.id);
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
      
      public function magnetize(param1:§_-g2l§) : void
      {
         if(this.hero == null)
         {
            return;
         }
         this.§_-L1Z§();
         this.fixed = true;
         setTimeout(this.§_-z2J§,0);
         this.view.visible = false;
         this.view.stop();
         this.§_-f1f§.gotoAndStop(1);
         if(Boolean(param1) && Boolean(this.§_-N27§) && Boolean(param1.parentStarling))
         {
            this.§_-N27§.show(§_-PY§.§_-9P§,this.§_-O1A§,5,param1.parentStarling.globalToLocal(param1.localToGlobal(new Point(0,-25))),new Point(),this.§_-FJ§);
         }
      }
      
      private function §_-z2J§() : void
      {
         if(this.§_-oV§ != null)
         {
            position = this.§_-oV§.Copy();
         }
      }
      
      private function §_-oJ§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.pinSquirrel(param1);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"pinSquirrel":[this.id,param1]}));
         }
      }
      
      private function pinSquirrel(param1:int) : void
      {
         if(!this.§_-H2D§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("hopping"))
         {
            return;
         }
         if(this.hero)
         {
            this.§_-L1Z§();
         }
         this.hero = _loc2_;
         this.view.stop();
         this.view.visible = false;
         this.§_-N27§.show(§_-PY§.§_-I2i§,this.hero,5,new Point(this.position.x * Game.§_-x2P§,this.position.y * Game.§_-x2P§),new Point(-5,-Hero.§_-YH§ - 10),this.§_-Ep§);
         this.§_-c3§ = this.hero.jumpVelocity * §_-Z2A§ / 100;
         this.hero.jumpVelocity -= this.§_-c3§;
         _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         _loc2_.addEventListener(Hero.§_-tl§,this.§_-jf§);
         _loc2_.addEventListener(Hero.§_-V1L§,this.§_-x1z§);
         this.body.GetFixtureList().GetShape().Set(§_-k2L§);
         this.fixed = false;
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyB = this.body;
         _loc2_.§_-K18§(_loc3_);
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2();
         _loc3_.localAnchorB = new b2Vec2();
         this.§_-i2J§ = this.body.GetWorld().CreateJoint(_loc3_);
         this.§_-i2J§.SetUserData("hopping");
      }
      
      private function §_-L1Z§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.jumpVelocity += this.§_-c3§;
         this.§_-O1A§ = this.hero;
         setTimeout(this.§_-l10§,3 * 1000);
         this.hero.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         this.hero.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         this.hero.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         this.hero.removeEventListener(Hero.§_-tl§,this.§_-jf§);
         this.hero.removeEventListener(Hero.§_-V1L§,this.§_-x1z§);
         this.hero = null;
         this.body.GetFixtureList().GetShape().Set(§_-SO§);
         if(this.§_-i2J§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-i2J§);
            this.§_-i2J§ = null;
         }
         if(this.§_-N27§)
         {
            this.§_-N27§.remove();
         }
         if(!this.view)
         {
            return;
         }
         this.view.gotoAndPlay(0);
         this.view.visible = true;
      }
      
      private function §_-l10§() : void
      {
         this.§_-O1A§ = null;
      }
      
      private function §_-FJ§() : void
      {
         setTimeout(this.§_-9w§,3 * 1000);
      }
      
      private function §_-9w§() : void
      {
         if(this.hero != null || !this.view || !this.§_-N27§)
         {
            return;
         }
         this.§_-N27§.remove();
         this.view.visible = true;
         this.view.gotoAndPlay(0);
      }
      
      private function §_-Ep§() : void
      {
         this.§_-N27§.x = -5;
         this.§_-N27§.y = -2 * Hero.§_-YH§ - 10;
         this.§_-f1f§.play();
         this.hero.heroView.§_-83v§(this.§_-N27§);
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-L1Z§();
         this.position = this.§_-oV§.Copy();
         this.fixed = true;
      }
      
      private function §_-x1z§(param1:Event) : void
      {
         this.body.GetFixtureList().GetShape().Set(new b2CircleShape(§_-c1F§ / Game.§_-x2P§ * this.hero.scale));
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if("pinSquirrel" in _loc2_)
         {
            if(_loc2_["pinSquirrel"][0] != this.id)
            {
               return;
            }
            this.pinSquirrel(_loc2_["pinSquirrel"][1]);
         }
      }
   }
}

