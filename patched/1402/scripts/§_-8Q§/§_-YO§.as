package §_-8Q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.Shapes.b2PolygonShape;
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
   import §_-c2C§.§_-817§;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-9z§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import starling.core.Starling;
   import utils.§_-L14§;
   
   public class §_-YO§ extends GameBody implements §_-Pn§, §_-9z§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const SHAPE1:b2CircleShape = new b2CircleShape(44 / Game.§_-12A§);
      
      private static const SHAPE2:b2PolygonShape = b2PolygonShape.AsOrientedBox(33 / Game.§_-12A§,11 / Game.§_-12A§,new b2Vec2(0,40 / Game.§_-12A§));
      
      private static const FIXTURE_DEF1:b2FixtureDef = new b2FixtureDef(SHAPE1,null,0.8,0.1,2,§_-53X§,§_-C3c§,0);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,0.8,0.1,5,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-f1u§ = null;
      
      private var squirrels:Object = {};
      
      private var arrow:§_-aS§ = null;
      
      private var §_-r1V§:§_-L14§ = null;
      
      private var §_-H2x§:Boolean = false;
      
      public var effectTime:Number = 5000;
      
      public var discMotorSpeed:Number = 15;
      
      public function §_-YO§()
      {
         super();
         this.view = new §_-f1u§(new CentrifugeImg());
         this.view.loop = true;
         this.view.stop();
         §_-J2J§(this.view);
         this.arrow = new §_-aS§(new CentrifugeArrow(),true);
         this.arrow.§_-r2a§ = true;
         §_-J2J§(this.arrow);
         this.§_-r1V§ = new §_-L14§(this.arrow,new Point());
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(FIXTURE_DEF2);
         this.body.CreateFixture(FIXTURE_DEF1).SetUserData(this);
         super.build(param1);
         this.view.gotoAndPlay(0);
      }
      
      override public function dispose() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.squirrels)
         {
            this.§_-R12§(int(_loc1_));
         }
         this.§_-Q§();
         §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         if(this.view)
         {
            this.view.removeFromParent();
         }
         this.view = null;
         this.squirrels = null;
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc3_:String = null;
         var _loc4_:Hero = null;
         if(this.body == null)
         {
            return;
         }
         super.update(param1);
         var _loc2_:Boolean = false;
         for(_loc3_ in this.squirrels)
         {
            _loc4_ = this.§_-21H§.squirrels.get(int(_loc3_));
            if(!(!(Boolean(_loc4_) && !_loc4_.isDead && !_loc4_.inHollow) || !_loc4_.§_-Kv§))
            {
               _loc4_.angle += 1;
               _loc2_ = true;
            }
         }
         this.view.§_-r2X§ = _loc2_ ? int(Game.stage.frameRate * 3) : int(Game.stage.frameRate);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.fireAngle,this.effectTime,this.discMotorSpeed]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.fireAngle = param1[1][0];
         this.effectTime = param1[1][1];
         this.discMotorSpeed = param1[1][2];
      }
      
      override public function set showDebug(param1:Boolean) : void
      {
         super.showDebug = param1;
         this.arrow.visible = this.§_-m2u§;
         if(this.§_-m2u§)
         {
            §_-817§.instance.addEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         }
         else
         {
            §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
            this.§_-Q§();
         }
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:* = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData();
         }
         if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(!(_loc2_ is Hero))
         {
            return;
         }
         if(Boolean(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.isDragon || _loc2_.isHare) || Boolean(this.squirrels[_loc2_.id] != null) || Boolean(_loc2_.hasJoints("centrifugeDisc")))
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
      
      public function get fireAngle() : Number
      {
         return (this.arrow.rotation + this.rotation) * Game.D2R;
      }
      
      public function set fireAngle(param1:Number) : void
      {
         this.§_-r1V§.rotation = param1 * Game.R2D - this.rotation;
      }
      
      private function §_-Z2m§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         this.pinSquirrel(param1);
         if(!(this.§_-21H§ is §_-62b§))
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"pinSquirrel":[this.id,param1]}));
         }
      }
      
      private function §_-Xs§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         this.boostSquirrel(param1);
         if(!(this.§_-21H§ is §_-62b§))
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"centrifugeSquirrel":[this.id,param1]}));
         }
      }
      
      private function pinSquirrel(param1:int) : void
      {
         if(!this.§_-21H§ || this.squirrels[param1] != null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.§_-Kv§)
         {
            return;
         }
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyA = this.body;
         _loc2_.§_-ZW§(_loc3_,false);
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2();
         _loc3_.localAnchorB = new b2Vec2();
         _loc3_.enableLimit = false;
         this.squirrels[_loc2_.id] = this.body.GetWorld().CreateJoint(_loc3_);
         _loc2_.isStopped = true;
         _loc2_.§_-Kv§ = true;
         _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         _loc2_.dispatchEvent(new Event(Hero.§_-N2i§));
         _loc2_.dispatchEvent(new Event(Hero.§_-J2F§));
         setTimeout(this.§_-Xs§,600,_loc2_.id);
      }
      
      private function boostSquirrel(param1:int) : void
      {
         if(!this.§_-21H§ || this.squirrels[param1] == null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!(_loc2_ && _loc2_.§_-K13§))
         {
            this.§_-u1L§(param1);
            return;
         }
         this.§_-R12§(param1);
         setTimeout(this.§_-u1L§,1000,param1);
         if(!(this.§_-21H§ && this.§_-21H§.squirrels.isSynchronizing))
         {
            return;
         }
         var _loc3_:§_-t2d§ = new §_-t2d§();
         _loc3_.hero = _loc2_;
         _loc3_.lifeTime = this.effectTime;
         _loc3_.§_-n2a§ = new b2Vec2(Math.cos(this.fireAngle),Math.sin(this.fireAngle));
         _loc3_.position = this.body.GetWorldCenter().Copy();
         var _loc4_:b2Vec2 = _loc3_.§_-n2a§.Copy();
         _loc4_.Multiply(5);
         _loc4_.Add(_loc3_.position);
         _loc3_.position = _loc4_;
         _loc3_.motorSpeed = this.discMotorSpeed;
         _loc2_.game.map.§_-TP§(_loc3_,true);
      }
      
      private function §_-R12§(param1:int) : void
      {
         this.body.GetWorld().DestroyJoint(this.squirrels[param1] as b2Joint);
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.§_-Kv§ = false;
         _loc2_.isStopped = false;
         _loc2_.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
      }
      
      private function §_-u1L§(param1:int) : void
      {
         if(this.squirrels == null)
         {
            return;
         }
         this.squirrels[param1] = null;
         delete this.squirrels[param1];
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-R12§(param1["player"]["id"]);
         this.§_-u1L§(param1["player"]["id"]);
      }
      
      public function §_-qI§(param1:Point) : Boolean
      {
         return this.§_-m2u§ && Boolean(this.arrow.§_-31u§(param1,false));
      }
      
      public function get §_-T1E§() : Boolean
      {
         return this.§_-H2x§;
      }
      
      private function §_-w1m§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage);
         if(!_loc2_)
         {
            this.§_-Q§();
            return;
         }
         if(_loc2_.§_-iR§ == §_-01Z§.§_-N1v§ && Boolean(this.arrow.§_-31u§(_loc2_.§_-13l§(§_-817§.instance),false)))
         {
            this.§_-H2x§ = true;
            Game.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-Q§,false,0,true);
            param1.stopPropagation();
            return;
         }
         if(!this.§_-H2x§)
         {
            return;
         }
         if(_loc2_.§_-iR§ == §_-01Z§.§_-kg§ || _loc2_.§_-iR§ == §_-01Z§.§_-zX§)
         {
            this.§_-WU§(_loc2_.§_-ca§,_loc2_.§_-n2z§);
         }
         else if(_loc2_.§_-iR§ == §_-01Z§.§_-1Z§)
         {
            this.§_-Q§();
         }
      }
      
      private function §_-Q§(param1:MouseEvent = null) : void
      {
         this.§_-H2x§ = false;
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Q§,true);
      }
      
      private function §_-WU§(param1:Number, param2:Number) : void
      {
         var _loc3_:Point = this.localToGlobal(new Point());
         var _loc4_:Number = Math.atan2(param2 - _loc3_.y,param1 - _loc3_.x);
         var _loc5_:Number = _loc4_ <= 0 ? -_loc4_ : Math.PI * 2 - _loc4_;
         var _loc6_:Number = this.angle <= 0 ? -this.angle : Math.PI * 2 - this.angle;
         if(_loc6_ < Math.PI ? _loc5_ > _loc6_ + Math.PI || _loc5_ < _loc6_ : _loc5_ > _loc6_ - Math.PI && _loc5_ < _loc6_)
         {
            return;
         }
         this.§_-r1V§.rotation = _loc4_ * Game.R2D - this.rotation;
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
            if(_loc2_["pinSquirrel"][1] == Game.selfId)
            {
               return;
            }
            this.pinSquirrel(_loc2_["pinSquirrel"][1]);
         }
         if("centrifugeSquirrel" in _loc2_)
         {
            if(_loc2_["centrifugeSquirrel"][0] != this.id)
            {
               return;
            }
            if(_loc2_["centrifugeSquirrel"][1] == Game.selfId)
            {
               return;
            }
            this.boostSquirrel(_loc2_["centrifugeSquirrel"][1]);
         }
      }
   }
}

