package §_-8Q§
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
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.§_-Z2I§;
   import game.mainGame.entity.§_-6D§;
   import game.mainGame.entity.§_-NA§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-w1r§ extends GameBody implements §_-6D§, §_-NA§, §_-Pn§
   {
      
      private static const §_-A2L§:int = 64;
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-42m§:int = 20;
      
      private static const §_-r1c§:b2CircleShape = new b2CircleShape(§_-A2L§ / Game.§_-12A§);
      
      private static const §_-F14§:b2CircleShape = new b2CircleShape(11 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-r1c§,null,0.2,0,0.001,§_-53X§,§_-C3c§,0,true);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      private var view:§_-f1u§ = null;
      
      private var radius:§_-aS§ = null;
      
      private var §_-Y1N§:§_-Z2I§ = null;
      
      private var hero:Hero = null;
      
      private var §_-H1f§:Number;
      
      private var §_-C1I§:b2Joint = null;
      
      private var §_-ua§:int = -1;
      
      private var §_-K2d§:b2Vec2 = null;
      
      private var §_-C2H§:Hero = null;
      
      private var §_-71H§:§_-f1u§;
      
      public function §_-w1r§()
      {
         super();
         this.view = new §_-f1u§(new HoppingImg());
         this.view.loop = true;
         this.view.y = 10;
         this.view.stop();
         §_-J2J§(this.view);
         this.radius = new §_-aS§(new PerkRadius());
         this.radius.scaleXY(§_-A2L§ * 2 / this.radius.width);
         §_-J2J§(this.radius);
         this.fixed = true;
         this.§_-71H§ = new §_-f1u§(new HoppingOnHead());
         this.§_-71H§.gotoAndStop(1);
         this.§_-Y1N§ = new §_-Z2I§(this.§_-71H§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         this.view.play();
         if(this.§_-K2d§ == null)
         {
            this.§_-K2d§ = this.position.Copy();
         }
         if(this.§_-ua§ != -1)
         {
            this.pinSquirrel(this.§_-ua§);
         }
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeFromParent();
         }
         this.view = null;
         if(this.§_-Y1N§)
         {
            this.§_-Y1N§.dispose();
         }
         this.§_-Y1N§ = null;
         this.§_-V14§();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         this.§_-C2H§ = null;
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push(this.§_-K2d§ == null ? this.§_-K2d§ : [this.§_-K2d§.x,this.§_-K2d§.y]);
         if(this.hero != null)
         {
            _loc1_.push(this.hero.id);
         }
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.§_-K2d§ = param1[1] != null ? new b2Vec2(param1[1][0],param1[1][1]) : null;
         if(2 in param1)
         {
            this.§_-ua§ = param1[2];
         }
      }
      
      override public function set showDebug(param1:Boolean) : void
      {
         super.showDebug = param1;
         this.radius.visible = this.§_-m2u§;
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
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("hopping") || this.hero == _loc2_ || this.§_-C2H§ == _loc2_)
         {
            return;
         }
         this.§_-Z2m§(_loc2_.id);
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
      
      public function magnetize(param1:§_-62j§) : void
      {
         if(this.hero == null)
         {
            return;
         }
         this.§_-V14§();
         this.fixed = true;
         setTimeout(this.§_-B3Q§,0);
         this.view.visible = false;
         this.view.stop();
         this.§_-71H§.gotoAndStop(1);
         if(Boolean(param1) && Boolean(this.§_-Y1N§) && Boolean(param1.parentStarling))
         {
            this.§_-Y1N§.show(§_-Z2I§.§_-d2s§,this.§_-C2H§,5,param1.parentStarling.globalToLocal(param1.localToGlobal(new Point(0,-25))),new Point(),this.§_-P2M§);
         }
      }
      
      private function §_-B3Q§() : void
      {
         if(this.§_-K2d§ != null)
         {
            position = this.§_-K2d§.Copy();
         }
      }
      
      private function §_-Z2m§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.pinSquirrel(param1);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"pinSquirrel":[this.id,param1]}));
         }
      }
      
      private function pinSquirrel(param1:int) : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("hopping"))
         {
            return;
         }
         if(this.hero)
         {
            this.§_-V14§();
         }
         this.hero = _loc2_;
         this.view.stop();
         this.view.visible = false;
         this.§_-Y1N§.show(§_-Z2I§.§_-A3A§,this.hero,5,new Point(this.position.x * Game.§_-12A§,this.position.y * Game.§_-12A§),new Point(-5,-Hero.§_-a1A§ - 10),this.§_-S1y§);
         this.§_-H1f§ = this.hero.jumpVelocity * §_-42m§ / 100;
         this.hero.jumpVelocity -= this.§_-H1f§;
         _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         _loc2_.addEventListener(Hero.§_-K1I§,this.§_-A1R§);
         _loc2_.addEventListener(Hero.§_-Dc§,this.§_-N27§);
         this.body.GetFixtureList().GetShape().Set(§_-F14§);
         this.fixed = false;
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyB = this.body;
         _loc2_.§_-ZW§(_loc3_);
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2();
         _loc3_.localAnchorB = new b2Vec2();
         this.§_-C1I§ = this.body.GetWorld().CreateJoint(_loc3_);
         this.§_-C1I§.SetUserData("hopping");
      }
      
      private function §_-V14§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.jumpVelocity += this.§_-H1f§;
         this.§_-C2H§ = this.hero;
         setTimeout(this.§_-k2E§,3 * 1000);
         this.hero.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         this.hero.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         this.hero.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         this.hero.removeEventListener(Hero.§_-K1I§,this.§_-A1R§);
         this.hero.removeEventListener(Hero.§_-Dc§,this.§_-N27§);
         this.hero = null;
         this.body.GetFixtureList().GetShape().Set(§_-r1c§);
         if(this.§_-C1I§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-C1I§);
            this.§_-C1I§ = null;
         }
         if(this.§_-Y1N§)
         {
            this.§_-Y1N§.remove();
         }
         if(!this.view)
         {
            return;
         }
         this.view.gotoAndPlay(0);
         this.view.visible = true;
      }
      
      private function §_-k2E§() : void
      {
         this.§_-C2H§ = null;
      }
      
      private function §_-P2M§() : void
      {
         setTimeout(this.§_-g1Z§,3 * 1000);
      }
      
      private function §_-g1Z§() : void
      {
         if(this.hero != null || !this.view || !this.§_-Y1N§)
         {
            return;
         }
         this.§_-Y1N§.remove();
         this.view.visible = true;
         this.view.gotoAndPlay(0);
      }
      
      private function §_-S1y§() : void
      {
         this.§_-Y1N§.x = -5;
         this.§_-Y1N§.y = -2 * Hero.§_-a1A§ - 10;
         this.§_-71H§.play();
         this.hero.heroView.§_-J2J§(this.§_-Y1N§);
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-V14§();
         this.position = this.§_-K2d§.Copy();
         this.fixed = true;
      }
      
      private function §_-N27§(param1:Event) : void
      {
         this.body.GetFixtureList().GetShape().Set(new b2CircleShape(§_-A2L§ / Game.§_-12A§ * this.hero.scale));
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
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

