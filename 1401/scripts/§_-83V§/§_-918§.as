package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
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
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-s2K§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-Eg§;
   
   public class §_-918§ extends GameBody implements §_-s2K§
   {
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-s1W§:int = 3000;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(40 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.2,0,0.1,§_-52X§,§_-FN§,0,true);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_staticBody);
      
      private static const §_-02v§:Array = [-45,0,45];
      
      public var power:Number = 150;
      
      protected var squirrels:Dictionary = new Dictionary();
      
      private var view:§_-d2d§ = null;
      
      private var §_-V2K§:§_-z12§ = null;
      
      public function §_-918§()
      {
         super();
         this.view = new §_-d2d§(new TornadoView());
         this.view.loop = true;
         §_-83v§(this.view);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.§_-H2D§ = param1.userData as SquirrelGame;
         this.body = param1.CreateBody(§_-E2n§);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(§_-03A§));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         super.build(param1);
         this.view.play();
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.squirrels)
         {
            this.§_-k2j§(_loc1_);
         }
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
         if(this.§_-V2K§ == null)
         {
            return;
         }
         this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         this.§_-V2K§ = null;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.power]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
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
            _loc3_ = this.§_-H2D§.squirrels.get(_loc2_);
            if(Boolean(_loc3_) && Boolean(!_loc3_.isDead) && !_loc3_.inHollow)
            {
               if(_loc3_.§_-SR§)
               {
                  _loc3_.angle += 1;
               }
            }
         }
      }
      
      protected function §_-5d§(param1:DetectHeroEvent) : void
      {
         var _loc2_:Hero = param1.hero;
         if(this.squirrels[_loc2_.id] != null || _loc2_.isDead || _loc2_.inHollow)
         {
            return;
         }
         this.§_-oJ§(_loc2_.id);
      }
      
      protected function §_-oJ§(param1:int) : void
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
      
      private function §_-Ev§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.fireSquirrel(param1,§_-Eg§.§_-j1G§(0,§_-02v§.length - 1));
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"fireSquirrel":[this.id,param1,§_-Eg§.§_-j1G§(0,§_-02v§.length - 1)]}));
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
         this.squirrels[_loc2_.id] = this.body.GetWorld().CreateJoint(_loc3_);
         _loc2_.dispatchEvent(new Event(Hero.§_-g1O§));
         _loc2_.dispatchEvent(new Event(Hero.§_-n2S§));
         _loc2_.isStopped = true;
         _loc2_.§_-SR§ = true;
         _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         setTimeout(this.§_-Ev§,500,_loc2_.id);
      }
      
      private function fireSquirrel(param1:int, param2:int) : void
      {
         if(!this.§_-H2D§ || this.squirrels[param1] == null)
         {
            return;
         }
         var _loc3_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc3_ || !_loc3_.§_-k2W§)
         {
            this.§_-w2f§(param1);
            return;
         }
         this.§_-k2j§(param1,true,param2);
         setTimeout(this.§_-w2f§,§_-s1W§,param1);
      }
      
      private function §_-w2f§(param1:int) : void
      {
         this.squirrels[param1] = null;
         delete this.squirrels[param1];
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-k2j§(param1["player"]["id"]);
         this.§_-w2f§(param1["player"]["id"]);
      }
      
      private function §_-k2j§(param1:int, param2:Boolean = false, param3:int = 0) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:b2Vec2 = null;
         this.body.GetWorld().DestroyJoint(this.squirrels[param1] as b2Joint);
         var _loc4_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc4_)
         {
            return;
         }
         if(param2)
         {
            _loc5_ = this.rotation + §_-02v§[param3];
            _loc4_.angle = (_loc5_ < 0 ? 360 - Math.abs(_loc5_) : _loc5_) * Game.D2R;
            _loc6_ = _loc4_.§_-x2h§.Copy();
            _loc6_.Multiply(-_loc4_.mass * this.power);
            _loc4_.§_-53N§(_loc6_);
         }
         _loc4_.§_-SR§ = false;
         _loc4_.isStopped = false;
         _loc4_.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc4_.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc4_.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
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

