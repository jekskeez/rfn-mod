package §_-83V§
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
   import §_-51g§.§_-22J§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import §_-T2y§.§_-s1i§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-P23§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import starling.core.Starling;
   import utils.§_-23z§;
   
   public class §_-x1j§ extends GameBody implements §_-22J§, §_-P23§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const SHAPE1:b2CircleShape = new b2CircleShape(44 / Game.§_-x2P§);
      
      private static const SHAPE2:b2PolygonShape = b2PolygonShape.AsOrientedBox(33 / Game.§_-x2P§,11 / Game.§_-x2P§,new b2Vec2(0,40 / Game.§_-x2P§));
      
      private static const FIXTURE_DEF1:b2FixtureDef = new b2FixtureDef(SHAPE1,null,0.8,0.1,2,§_-52X§,§_-FN§,0);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,0.8,0.1,5,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-d2d§ = null;
      
      private var squirrels:Object = {};
      
      private var arrow:§_-h2I§ = null;
      
      private var §_-s1D§:§_-23z§ = null;
      
      private var §_-fN§:Boolean = false;
      
      public var effectTime:Number = 5000;
      
      public var discMotorSpeed:Number = 15;
      
      public function §_-x1j§()
      {
         super();
         this.view = new §_-d2d§(new CentrifugeImg());
         this.view.loop = true;
         this.view.stop();
         §_-83v§(this.view);
         this.arrow = new §_-h2I§(new CentrifugeArrow(),true);
         this.arrow.§_-Je§ = true;
         §_-83v§(this.arrow);
         this.§_-s1D§ = new §_-23z§(this.arrow,new Point());
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
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
            this.§_-k2j§(int(_loc1_));
         }
         this.§_-73Q§();
         §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
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
            _loc4_ = this.§_-H2D§.squirrels.get(int(_loc3_));
            if(!(!(Boolean(_loc4_) && !_loc4_.isDead && !_loc4_.inHollow) || !_loc4_.§_-SR§))
            {
               _loc4_.angle += 1;
               _loc2_ = true;
            }
         }
         this.view.§_-o1b§ = _loc2_ ? int(Game.stage.frameRate * 3) : int(Game.stage.frameRate);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.fireAngle,this.effectTime,this.discMotorSpeed]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.fireAngle = param1[1][0];
         this.effectTime = param1[1][1];
         this.discMotorSpeed = param1[1][2];
      }
      
      override public function set showDebug(param1:Boolean) : void
      {
         super.showDebug = param1;
         this.arrow.visible = this.§_-C1B§;
         if(this.§_-C1B§)
         {
            §_-s1i§.instance.addEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         }
         else
         {
            §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
            this.§_-73Q§();
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
      
      public function get fireAngle() : Number
      {
         return (this.arrow.rotation + this.rotation) * Game.D2R;
      }
      
      public function set fireAngle(param1:Number) : void
      {
         this.§_-s1D§.rotation = param1 * Game.R2D - this.rotation;
      }
      
      private function §_-oJ§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         this.pinSquirrel(param1);
         if(!(this.§_-H2D§ is §_-A32§))
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"pinSquirrel":[this.id,param1]}));
         }
      }
      
      private function §_-Ul§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         this.boostSquirrel(param1);
         if(!(this.§_-H2D§ is §_-A32§))
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"centrifugeSquirrel":[this.id,param1]}));
         }
      }
      
      private function pinSquirrel(param1:int) : void
      {
         if(!this.§_-H2D§ || this.squirrels[param1] != null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.§_-SR§)
         {
            return;
         }
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyA = this.body;
         _loc2_.§_-K18§(_loc3_,false);
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2();
         _loc3_.localAnchorB = new b2Vec2();
         _loc3_.enableLimit = false;
         this.squirrels[_loc2_.id] = this.body.GetWorld().CreateJoint(_loc3_);
         _loc2_.isStopped = true;
         _loc2_.§_-SR§ = true;
         _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         _loc2_.dispatchEvent(new Event(Hero.§_-g1O§));
         _loc2_.dispatchEvent(new Event(Hero.§_-n2S§));
         setTimeout(this.§_-Ul§,600,_loc2_.id);
      }
      
      private function boostSquirrel(param1:int) : void
      {
         if(!this.§_-H2D§ || this.squirrels[param1] == null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!(_loc2_ && _loc2_.§_-k2W§))
         {
            this.§_-w2f§(param1);
            return;
         }
         this.§_-k2j§(param1);
         setTimeout(this.§_-w2f§,1000,param1);
         if(!(this.§_-H2D§ && this.§_-H2D§.squirrels.isSynchronizing))
         {
            return;
         }
         var _loc3_:§_-02m§ = new §_-02m§();
         _loc3_.hero = _loc2_;
         _loc3_.lifeTime = this.effectTime;
         _loc3_.§_-hy§ = new b2Vec2(Math.cos(this.fireAngle),Math.sin(this.fireAngle));
         _loc3_.position = this.body.GetWorldCenter().Copy();
         var _loc4_:b2Vec2 = _loc3_.§_-hy§.Copy();
         _loc4_.Multiply(5);
         _loc4_.Add(_loc3_.position);
         _loc3_.position = _loc4_;
         _loc3_.motorSpeed = this.discMotorSpeed;
         _loc2_.game.map.§_-nA§(_loc3_,true);
      }
      
      private function §_-k2j§(param1:int) : void
      {
         this.body.GetWorld().DestroyJoint(this.squirrels[param1] as b2Joint);
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.§_-SR§ = false;
         _loc2_.isStopped = false;
         _loc2_.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
      }
      
      private function §_-w2f§(param1:int) : void
      {
         if(this.squirrels == null)
         {
            return;
         }
         this.squirrels[param1] = null;
         delete this.squirrels[param1];
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-k2j§(param1["player"]["id"]);
         this.§_-w2f§(param1["player"]["id"]);
      }
      
      public function §_-H1E§(param1:Point) : Boolean
      {
         return this.§_-C1B§ && Boolean(this.arrow.§_-iu§(param1,false));
      }
      
      public function get §_-Vq§() : Boolean
      {
         return this.§_-fN§;
      }
      
      private function §_-K1G§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage);
         if(!_loc2_)
         {
            this.§_-73Q§();
            return;
         }
         if(_loc2_.§_-Q2S§ == §_-sj§.§_-ML§ && Boolean(this.arrow.§_-iu§(_loc2_.§_-l29§(§_-s1i§.instance),false)))
         {
            this.§_-fN§ = true;
            Game.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-73Q§,false,0,true);
            param1.stopPropagation();
            return;
         }
         if(!this.§_-fN§)
         {
            return;
         }
         if(_loc2_.§_-Q2S§ == §_-sj§.§_-i23§ || _loc2_.§_-Q2S§ == §_-sj§.§_-X2J§)
         {
            this.§_-we§(_loc2_.§_-n2h§,_loc2_.§_-Zv§);
         }
         else if(_loc2_.§_-Q2S§ == §_-sj§.§_-L23§)
         {
            this.§_-73Q§();
         }
      }
      
      private function §_-73Q§(param1:MouseEvent = null) : void
      {
         this.§_-fN§ = false;
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-73Q§,true);
      }
      
      private function §_-we§(param1:Number, param2:Number) : void
      {
         var _loc3_:Point = this.localToGlobal(new Point());
         var _loc4_:Number = Math.atan2(param2 - _loc3_.y,param1 - _loc3_.x);
         var _loc5_:Number = _loc4_ <= 0 ? -_loc4_ : Math.PI * 2 - _loc4_;
         var _loc6_:Number = this.angle <= 0 ? -this.angle : Math.PI * 2 - this.angle;
         if(_loc6_ < Math.PI ? _loc5_ > _loc6_ + Math.PI || _loc5_ < _loc6_ : _loc5_ > _loc6_ - Math.PI && _loc5_ < _loc6_)
         {
            return;
         }
         this.§_-s1D§.rotation = _loc4_ * Game.R2D - this.rotation;
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

