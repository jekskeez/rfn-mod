package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.Joints.b2JointEdge;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-z12§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-d2d§;
   import §_-Rj§.§_-A32§;
   import §_-T1r§.§_-03i§;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-Y1X§ extends GameBody
   {
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsBox(60 / Game.§_-x2P§,25 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.2,0,0,§_-52X§,§_-FN§,0,true);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_staticBody);
      
      public var boostFactor:int = 30;
      
      public var boostTime:int = 5000;
      
      private var view:§_-d2d§ = null;
      
      private var §_-V2K§:§_-z12§ = null;
      
      private var controller:b2ConstantAccelController = null;
      
      private var squirrels:Object = {};
      
      private var buff:§_-03i§ = null;
      
      private var timer:Timer = new Timer(10,100);
      
      private var §_-eL§:Array = [];
      
      public function §_-Y1X§()
      {
         super();
         this.view = new §_-d2d§(new BoostZoneImg());
         this.view.stop();
         this.view.x = -60;
         this.view.y = -25;
         §_-83v§(this.view);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc1_:Array = [];
         for(_loc2_ in this.squirrels)
         {
            _loc1_.push(_loc2_);
         }
         _loc3_ = super.§_-A1X§();
         _loc3_.push([this.boostFactor,this.boostTime,_loc1_]);
         return _loc3_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.boostFactor = param1[1][0];
         this.boostTime = param1[1][1];
         this.§_-eL§ = param1[1][2];
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc3_:Hero = null;
         var _loc4_:Number = NaN;
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(§_-03A§));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         this.view.play();
         super.build(param1);
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         param1.AddController(this.controller);
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-eL§.length)
         {
            _loc3_ = this.§_-H2D§.squirrels.get(this.§_-eL§[_loc2_]);
            if(!_loc3_ || _loc3_.isDead || _loc3_.inHollow || _loc3_.id in this.squirrels)
            {
               return;
            }
            _loc4_ = _loc3_.runSpeed * (this.boostFactor / 100);
            this.squirrels[_loc3_.id] = {"speed":_loc4_};
            _loc3_.runSpeed += _loc4_;
            _loc2_++;
         }
         this.§_-eL§.splice(0);
      }
      
      override public function dispose() : void
      {
         var _loc1_:String = null;
         this.view.removeFromParent();
         this.removeFromParent();
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         for(_loc1_ in this.squirrels)
         {
            this.§_-u1u§(int(_loc1_));
         }
         this.squirrels = null;
         if(this.controller)
         {
            this.§_-H2D§.world.RemoveController(this.controller);
            this.controller.Clear();
            this.controller = null;
         }
         super.dispose();
         if(this.§_-V2K§ == null)
         {
            return;
         }
         this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         this.§_-V2K§ = null;
      }
      
      private function §_-5d§(param1:DetectHeroEvent) : void
      {
         var _loc2_:Hero = param1.hero;
         if(_loc2_.isDead || _loc2_.inHollow)
         {
            return;
         }
         if(param1.state == DetectHeroEvent.BEGIN_CONTACT && !(_loc2_.id in this.squirrels))
         {
            this.§_-Ul§(param1.hero.id);
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
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"boostSquirrel":[this.id,param1]}));
            Hero.self.sendLocation();
         }
      }
      
      private function §_-R2c§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId || !this.§_-H2D§)
         {
            return;
         }
         this.§_-w2f§(param1);
         if(!(this.§_-H2D§ is §_-A32§))
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"resetBoostSquirrel":[this.id,param1]}));
            Hero.self.sendLocation();
         }
      }
      
      private function boostSquirrel(param1:int) : void
      {
         if(!this.§_-H2D§ || this.squirrels[param1] != null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
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
         _loc2_.§_-53N§(_loc4_);
         this.view.gotoAndPlay(0);
         setTimeout(this.§_-02a§,100,_loc2_);
         if(!_loc2_.isSelf)
         {
            return;
         }
         _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         if(!this.buff)
         {
            this.buff = new §_-03i§(new BoostZoneImg(),0.3,0.5,gls("Белка получила ускорение."));
         }
         _loc2_.§_-Aj§(this.buff,this.timer);
         this.timer.delay = this.boostTime / 100;
         this.timer.reset();
         this.timer.start();
      }
      
      private function §_-w2f§(param1:int) : void
      {
         this.§_-u1u§(param1);
         delete this.squirrels[param1];
      }
      
      private function §_-u1u§(param1:int) : void
      {
         if(!this.§_-H2D§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_ || !_loc2_.§_-k2W§ || !(_loc2_.id in this.squirrels))
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
         _loc2_.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         this.§_-R2c§(Hero.§_-74§);
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-R2c§(param1["player"]["id"]);
      }
      
      private function §_-02a§(param1:Hero) : void
      {
         if(!param1 || !param1.§_-k2W§ || !this.squirrels || !(param1.id in this.squirrels))
         {
            return;
         }
         var _loc2_:Object = this.squirrels[param1.id];
         if(!("friction" in _loc2_))
         {
            §_-TQ§.add("Error BoostZone/onBoostEnd-> no friction snapshot");
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
      
      private function §_-o2C§(param1:§_-S2I§) : void
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
            this.§_-w2f§(_loc2_["resetBoostSquirrel"][1]);
         }
      }
   }
}

