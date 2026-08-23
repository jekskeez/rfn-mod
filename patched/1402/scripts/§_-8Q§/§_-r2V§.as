package §_-8Q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-f1u§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-j4§.§_-43y§;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-NA§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-ke§;
   
   public class §_-r2V§ extends GameBody implements §_-NA§
   {
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-a2d§:int = 3000;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(40 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.2,0,0.1,§_-53X§,§_-C3c§,0,true);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_staticBody);
      
      private static const §_-02L§:Array = [-45,0,45];
      
      public var power:Number = 150;
      
      protected var squirrels:Dictionary = new Dictionary();
      
      private var view:§_-f1u§ = null;
      
      private var §_-b1J§:§_-43y§ = null;
      
      public function §_-r2V§()
      {
         super();
         this.view = new §_-f1u§(new TornadoView());
         this.view.loop = true;
         §_-J2J§(this.view);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.§_-21H§ = param1.userData as SquirrelGame;
         this.body = param1.CreateBody(§_-41z§);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         super.build(param1);
         this.view.play();
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.squirrels)
         {
            this.§_-R12§(_loc1_);
         }
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
         if(this.§_-b1J§ == null)
         {
            return;
         }
         this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         this.§_-b1J§ = null;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.power]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.power = param1[1][0];
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Hero = null;
         if(this.body == null)
         {
            return;
         }
         super.update(param1);
         for(_loc2_ in this.squirrels)
         {
            _loc3_ = this.§_-21H§.squirrels.get(_loc2_);
            if(Boolean(_loc3_) && Boolean(!_loc3_.isDead) && !_loc3_.inHollow)
            {
               if(_loc3_.§_-Kv§)
               {
                  _loc3_.angle += 1;
               }
            }
         }
      }
      
      protected function §_-M2L§(param1:DetectHeroEvent) : void
      {
         var _loc2_:Hero = param1.hero;
         if(this.squirrels[_loc2_.id] != null || _loc2_.isDead || _loc2_.inHollow)
         {
            return;
         }
         this.§_-Z2m§(_loc2_.id);
      }
      
      protected function §_-Z2m§(param1:int) : void
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
      
      private function §_-Kp§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.fireSquirrel(param1,§_-ke§.§_-D1d§(0,§_-02L§.length - 1));
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"fireSquirrel":[this.id,param1,§_-ke§.§_-D1d§(0,§_-02L§.length - 1)]}));
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
         this.squirrels[_loc2_.id] = this.body.GetWorld().CreateJoint(_loc3_);
         _loc2_.dispatchEvent(new Event(Hero.§_-N2i§));
         _loc2_.dispatchEvent(new Event(Hero.§_-J2F§));
         _loc2_.isStopped = true;
         _loc2_.§_-Kv§ = true;
         _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         setTimeout(this.§_-Kp§,500,_loc2_.id);
      }
      
      private function fireSquirrel(param1:int, param2:int) : void
      {
         if(!this.§_-21H§ || this.squirrels[param1] == null)
         {
            return;
         }
         var _loc3_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc3_ || !_loc3_.§_-K13§)
         {
            this.§_-u1L§(param1);
            return;
         }
         this.§_-R12§(param1,true,param2);
         setTimeout(this.§_-u1L§,§_-a2d§,param1);
      }
      
      private function §_-u1L§(param1:int) : void
      {
         this.squirrels[param1] = null;
         delete this.squirrels[param1];
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-R12§(param1["player"]["id"]);
         this.§_-u1L§(param1["player"]["id"]);
      }
      
      private function §_-R12§(param1:int, param2:Boolean = false, param3:int = 0) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:b2Vec2 = null;
         this.body.GetWorld().DestroyJoint(this.squirrels[param1] as b2Joint);
         var _loc4_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc4_)
         {
            return;
         }
         if(param2)
         {
            _loc5_ = this.rotation + §_-02L§[param3];
            _loc4_.angle = (_loc5_ < 0 ? 360 - Math.abs(_loc5_) : _loc5_) * Game.D2R;
            _loc6_ = _loc4_.§_-d2u§.Copy();
            _loc6_.Multiply(-_loc4_.mass * this.power);
            _loc4_.§_-PT§(_loc6_);
         }
         _loc4_.§_-Kv§ = false;
         _loc4_.isStopped = false;
         _loc4_.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc4_.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc4_.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if("fireSquirrel" in _loc2_)
         {
            if(_loc2_["fireSquirrel"][0] != this.id)
            {
               return;
            }
            this.fireSquirrel(_loc2_["fireSquirrel"][1],_loc2_["fireSquirrel"][2]);
         }
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

