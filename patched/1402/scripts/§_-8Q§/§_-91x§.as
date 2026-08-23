package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.Joints.b2JointEdge;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-f1u§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-cm§.§_-Q2h§;
   import §_-j4§.§_-43y§;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-91x§ extends GameBody
   {
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsBox(60 / Game.§_-12A§,25 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.2,0,0,§_-53X§,§_-C3c§,0,true);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_staticBody);
      
      public var boostFactor:int = 30;
      
      public var boostTime:int = 5000;
      
      private var view:§_-f1u§ = null;
      
      private var §_-b1J§:§_-43y§ = null;
      
      private var controller:b2ConstantAccelController = null;
      
      private var squirrels:Object = {};
      
      private var buff:§_-Q2h§ = null;
      
      private var timer:Timer = new Timer(10,100);
      
      private var §_-K20§:Array = [];
      
      public function §_-91x§()
      {
         super();
         this.view = new §_-f1u§(new BoostZoneImg());
         this.view.stop();
         this.view.x = -60;
         this.view.y = -25;
         §_-J2J§(this.view);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc1_:Array = [];
         for(_loc2_ in this.squirrels)
         {
            _loc1_.push(_loc2_);
         }
         _loc3_ = super.§_-m1Y§();
         _loc3_.push([this.boostFactor,this.boostTime,_loc1_]);
         return _loc3_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.boostFactor = param1[1][0];
         this.boostTime = param1[1][1];
         this.§_-K20§ = param1[1][2];
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc3_:Hero = null;
         var _loc4_:Number = NaN;
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         this.view.play();
         super.build(param1);
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         param1.AddController(this.controller);
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-K20§.length)
         {
            _loc3_ = this.§_-21H§.squirrels.get(this.§_-K20§[_loc2_]);
            if(!_loc3_ || _loc3_.isDead || _loc3_.inHollow || _loc3_.id in this.squirrels)
            {
               return;
            }
            _loc4_ = _loc3_.runSpeed * (this.boostFactor / 100);
            this.squirrels[_loc3_.id] = {"speed":_loc4_};
            _loc3_.runSpeed += _loc4_;
            _loc2_++;
         }
         this.§_-K20§.splice(0);
      }
      
      override public function dispose() : void
      {
         var _loc1_:String = null;
         this.view.removeFromParent();
         this.removeFromParent();
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         for(_loc1_ in this.squirrels)
         {
            this.§_-42n§(int(_loc1_));
         }
         this.squirrels = null;
         if(this.controller)
         {
            this.§_-21H§.world.RemoveController(this.controller);
            this.controller.Clear();
            this.controller = null;
         }
         super.dispose();
         if(this.§_-b1J§ == null)
         {
            return;
         }
         this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         this.§_-b1J§ = null;
      }
      
      private function §_-M2L§(param1:DetectHeroEvent) : void
      {
         var _loc2_:Hero = param1.hero;
         if(_loc2_.isDead || _loc2_.inHollow)
         {
            return;
         }
         if(param1.state == DetectHeroEvent.BEGIN_CONTACT && !(_loc2_.id in this.squirrels))
         {
            this.§_-Xs§(param1.hero.id);
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
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"boostSquirrel":[this.id,param1]}));
            Hero.self.sendLocation();
         }
      }
      
      private function §_-e18§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId || !this.§_-21H§)
         {
            return;
         }
         this.§_-u1L§(param1);
         if(!(this.§_-21H§ is §_-62b§))
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"resetBoostSquirrel":[this.id,param1]}));
            Hero.self.sendLocation();
         }
      }
      
      private function boostSquirrel(param1:int) : void
      {
         if(!this.§_-21H§ || this.squirrels[param1] != null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.id in this.squirrels)
         {
            return;
         }
         var _loc3_:Number = _loc2_.runSpeed * (this.boostFactor / 100);
         this.squirrels[_loc2_.id] = {
            "speed":_loc3_,
            "friction":_loc2_.friction
         };
         _loc2_.runSpeed += _loc3_;
         _loc2_.velocity = new b2Vec2();
         _loc2_.isStopped = true;
         _loc2_.friction = 1;
         this.controller.AddBody(_loc2_.body);
         var _loc4_:b2Vec2 = this.body.GetTransform().R.col1.Copy();
         var _loc5_:Number = _loc2_.mass;
         var _loc6_:b2JointEdge = _loc2_.body.GetJointList();
         while(_loc6_)
         {
            if(_loc6_.joint.GetBodyA().GetUserData() == _loc2_)
            {
               _loc5_ += _loc6_.joint.GetBodyA().GetMass() * 10;
            }
            if(_loc6_.joint.GetBodyB().GetUserData() == _loc2_)
            {
               _loc5_ += _loc6_.joint.GetBodyB().GetMass() * 10;
            }
            _loc6_ = _loc6_.next;
         }
         _loc4_.Multiply(_loc5_ * 50 * (1 + this.boostFactor / 100));
         _loc2_.§_-PT§(_loc4_);
         this.view.gotoAndPlay(0);
         setTimeout(this.§_-z17§,100,_loc2_);
         if(!_loc2_.isSelf)
         {
            return;
         }
         _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new BoostZoneImg(),0.3,0.5,gls("Белка получила ускорение."));
         }
         _loc2_.§_-W1T§(this.buff,this.timer);
         this.timer.delay = this.boostTime / 100;
         this.timer.reset();
         this.timer.start();
      }
      
      private function §_-u1L§(param1:int) : void
      {
         this.§_-42n§(param1);
         delete this.squirrels[param1];
      }
      
      private function §_-42n§(param1:int) : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || !_loc2_.§_-K13§ || !(_loc2_.id in this.squirrels))
         {
            return;
         }
         _loc2_.isStopped = false;
         _loc2_.runSpeed -= this.squirrels[_loc2_.id]["speed"];
         if("friction" in this.squirrels[_loc2_.id])
         {
            if(Boolean(this.controller) && Boolean(_loc2_.body))
            {
               this.controller.RemoveBody(_loc2_.body);
            }
            _loc2_.friction = this.squirrels[_loc2_.id];
            delete this.squirrels[_loc2_.id]["friction"];
         }
         if(!_loc2_.isSelf)
         {
            return;
         }
         if(this.timer.running)
         {
            this.timer.reset();
            _loc2_.removeBuff(this.buff,this.timer);
         }
         _loc2_.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         this.§_-e18§(Hero.§_-M1O§);
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-e18§(param1["player"]["id"]);
      }
      
      private function §_-z17§(param1:Hero) : void
      {
         if(!param1 || !param1.§_-K13§ || !this.squirrels || !(param1.id in this.squirrels))
         {
            return;
         }
         var _loc2_:Object = this.squirrels[param1.id];
         if(!("friction" in _loc2_))
         {
            §_-p2U§.add("Error BoostZone/onBoostEnd-> no friction snapshot");
            return;
         }
         param1.isStopped = false;
         param1.friction = _loc2_["friction"];
         if(param1.body)
         {
            this.controller.RemoveBody(param1.body);
         }
         delete _loc2_["friction"];
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if("boostSquirrel" in _loc2_)
         {
            if(_loc2_["boostSquirrel"][0] != this.id)
            {
               return;
            }
            if(_loc2_["boostSquirrel"][1] == Game.selfId)
            {
               return;
            }
            this.boostSquirrel(_loc2_["boostSquirrel"][1]);
         }
         if("resetBoostSquirrel" in _loc2_)
         {
            if(_loc2_["resetBoostSquirrel"][0] != this.id)
            {
               return;
            }
            if(_loc2_["resetBoostSquirrel"][1] == Game.selfId)
            {
               return;
            }
            this.§_-u1L§(_loc2_["resetBoostSquirrel"][1]);
         }
      }
   }
}

