package §_-83V§
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
   import §_-51g§.§_-22J§;
   import §_-8I§.SquirrelEvent;
   import §_-Rj§.§_-A32§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import game.mainGame.§_-V§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-71u§ extends GameBody implements §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(4 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.1,0.1,4,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var scale:Number = 1;
      
      private var view:MovieClip;
      
      private var §_-gr§:MovieClip;
      
      private var §_-Q2§:MovieClip;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-n1H§:Boolean = false;
      
      private var §_-42S§:Boolean = false;
      
      private var controller:b2ConstantAccelController;
      
      private var §_-k2P§:Boolean = true;
      
      private var §_-b1Y§:b2Fixture = null;
      
      private var §_-M1R§:Array = null;
      
      public function §_-71u§()
      {
         super();
         this.view = new SnowballAnimation();
         this.view.play();
         this.addChild(this.view);
         this.view.visible = false;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         setTimeout(this.§_-o1F§,300,param1);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body)
         {
            this.body.SetBullet(this.body.GetLinearVelocity().Length() > 30);
            if(!this.§_-k2P§ || this.body.GetLinearVelocity().Length() < 30)
            {
               this.§_-cN§();
            }
         }
      }
      
      override public function dispose() : void
      {
         this.§_-cN§();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId,this.scale]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.playerId = param1[1][0];
         this.scale = param1[1][1];
      }
      
      public function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
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
         if(_loc2_ != null && _loc2_.id == this.playerId || this.§_-n1H§)
         {
            return;
         }
         this.§_-n1H§ = true;
         if(this.view.parent)
         {
            this.view.parent.removeChild(this.view);
         }
         this.§_-gr§ = new SnowKick();
         this.§_-gr§.gotoAndPlay(0);
         this.§_-gr§.addEventListener(Event.CHANGE,this.§_-fF§);
         this.addChild(this.§_-gr§);
         if(_loc2_ == null)
         {
            this.§_-b16§();
            return;
         }
         if(_loc2_.isSelf)
         {
            this.§_-MC§(_loc2_);
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
      
      private function §_-o1F§(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.SetBullet(true);
         this.§_-b1Y§ = this.body.CreateFixture(§_-03A§);
         this.§_-b1Y§.SetUserData(this);
         super.build(param1);
         this.fixedRotation = true;
         this.§_-63R§(this.scale);
         if(!this.§_-m1I§)
         {
            this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(-50,0)));
         }
         this.view.visible = true;
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
         setTimeout(this.§_-u2o§,1000,this);
      }
      
      private function §_-u2o§(param1:§_-71u§) : void
      {
         if(param1)
         {
            param1.§_-k2P§ = false;
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
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
         var _loc3_:Hero = this.§_-H2D§.squirrels.get(_loc2_["OnSnowballs"][1]) as Hero;
         if(_loc3_ == null)
         {
            return;
         }
         this.§_-2P§(_loc3_);
      }
      
      private function §_-2P§(param1:Hero) : void
      {
         if(this.§_-M1R§ == null)
         {
            this.§_-M1R§ = [];
         }
         this.§_-Q2§ = new this.§_-M1R§[int(Math.random() * this.§_-M1R§.length)]();
         this.§_-Q2§.x = 8;
         this.§_-Q2§.y = -13;
         param1.heroView.addChild(this.§_-Q2§);
         this.§_-b16§();
         param1.addEventListener(SquirrelEvent.§_-z1B§,this.§_-C2X§);
         setTimeout(this.§_-C2X§,8 * 1000);
      }
      
      private function §_-cN§() : void
      {
         if(!this.controller)
         {
            return;
         }
         this.§_-H2D§.world.RemoveController(this.controller);
         this.controller.Clear();
         this.controller = null;
      }
      
      private function §_-C2X§(param1:SquirrelEvent = null) : void
      {
         if(param1 != null)
         {
            param1.player.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-C2X§);
         }
         if(this.§_-Q2§.parent)
         {
            this.§_-Q2§.parent.removeChild(this.§_-Q2§);
         }
      }
      
      private function §_-63R§(param1:Number) : void
      {
         var _loc2_:b2CircleShape = new b2CircleShape(3 / Game.§_-x2P§ * param1);
         this.§_-b1Y§.GetShape().Set(_loc2_);
         this.view.scaleX = this.view.scaleY = param1;
      }
      
      private function §_-MC§(param1:Hero) : void
      {
         if(!this.§_-H2D§ || param1.isDragon || param1.isHare || param1.isScrat || param1.shaman || param1.id == this.playerId)
         {
            this.§_-b16§();
            return;
         }
         if(!this.§_-42S§)
         {
            if(this.§_-H2D§ is §_-A32§)
            {
               this.§_-42S§ = true;
               this.§_-2P§(param1);
               return;
            }
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"OnSnowballs":[this.id,param1.id]}));
         }
         this.§_-42S§ = true;
      }
      
      private function §_-fF§(param1:Event) : void
      {
         this.§_-gr§.removeEventListener(Event.CHANGE,this.§_-fF§);
         if(this.§_-gr§.parent)
         {
            this.§_-gr§.parent.removeChild(this.§_-gr§);
         }
      }
      
      private function death() : void
      {
         if(this.body == null)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}

