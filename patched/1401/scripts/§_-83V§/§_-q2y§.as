package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2RevoluteJoint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FilterData;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-C1l§.§_-a2§;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-83i§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import starling.display.Button;
   
   public class §_-q2y§ extends GameBody implements §_-83i§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-c1F§:Number = 10;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-V2h§:b2PolygonShape = b2PolygonShape.AsVector(§_-FA§,0);
      
      private static const §_-S17§:b2FixtureDef = new b2FixtureDef(§_-V2h§,null,0.8,0.1,2,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-E24§:b2PolygonShape = b2PolygonShape.AsVector(§_-X1s§,0);
      
      private static const §_-G29§:b2FixtureDef = new b2FixtureDef(§_-E24§,null,0.8,0.1,3,§_-52X§,§_-FN§,0);
      
      private var view:§_-h2I§ = null;
      
      private var §_-Jr§:§_-h2I§ = null;
      
      private var §_-f6§:b2Body = null;
      
      private var §_-w2l§:Boolean = false;
      
      private var §_-V2P§:Boolean = false;
      
      private var §_-53u§:Sprite = null;
      
      private var §_-XR§:§_-h2I§ = null;
      
      private var §_-yz§:int = 3000;
      
      private var §_-x1G§:int = this.§_-yz§;
      
      private var joint:b2RevoluteJoint = null;
      
      private var §_-B1r§:Number;
      
      private var §_-wK§:Number = 0;
      
      private var §_-O1c§:Button;
      
      private var §_-63V§:Button;
      
      public var bungeeLength:int = 5;
      
      public function §_-q2y§()
      {
         super();
         this.view = new §_-h2I§(new HarpoonBungeeTrunk());
         §_-83v§(this.view);
         this.§_-Jr§ = new §_-h2I§(new HarpoonBungeePillar());
         §_-83v§(this.§_-Jr§);
         this.§_-O1c§ = new Button(§_-a2§.getTexture(new HarpoonBungeeButton()));
         this.§_-O1c§.x = -this.§_-O1c§.width * 0.5;
         this.§_-O1c§.y = -this.§_-O1c§.height * 0.5;
         this.§_-O1c§.enabled = false;
         this.§_-O1c§.addEventListener(TouchEvent.§_-N1l§,this.§_-g1k§);
         §_-83v§(this.§_-O1c§);
         this.§_-63V§ = new Button(§_-a2§.getTexture(new HarpoonTrunkAim()));
         this.§_-63V§.x = 0;
         this.§_-63V§.y = 0.5;
         this.§_-63V§.touchable = true;
         this.§_-63V§.downState = §_-a2§.getTexture(new HarpoonTrunkAim());
         this.§_-63V§.useHandCursor = true;
         this.§_-63V§.addEventListener(TouchEvent.§_-N1l§,this.§_-q2R§);
         this.§_-63V§.pivotX = -41;
         this.§_-63V§.pivotY = this.§_-63V§.height * 0.5 - 0.5;
         §_-83v§(this.§_-63V§);
         this.§_-53u§ = new Sprite();
         this.§_-53u§.x = 70;
         this.§_-53u§.graphics.beginFill(0,0);
         this.§_-53u§.graphics.drawCircle(-10,0,20);
         this.§_-53u§.graphics.endFill();
         this.§_-53u§.mouseEnabled = false;
         Game.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-d2j§);
         this.§_-XR§ = new §_-h2I§(new AimCursor());
         this.§_-XR§.x = 100;
         this.§_-XR§.§_-x2x§();
         this.§_-XR§.visible = false;
         this.view.§_-83v§(this.§_-XR§);
         this.fixed = true;
         this.touchable = true;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      private static function get §_-FA§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-2.8,-2.8));
         _loc1_.push(new b2Vec2(2.6,-2.8));
         _loc1_.push(new b2Vec2(6.1,-1.8));
         _loc1_.push(new b2Vec2(2.6,-0.8));
         _loc1_.push(new b2Vec2(-2.8,-0.8));
         return _loc1_;
      }
      
      private static function get §_-X1s§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-1.9,1.4));
         _loc1_.push(new b2Vec2(0,-1.8));
         _loc1_.push(new b2Vec2(1.9,1.4));
         return _loc1_;
      }
      
      private function set §_-p2n§(param1:Number) : void
      {
         this.§_-63V§.rotation = param1 * Math.PI / 180;
      }
      
      override public function set ghost(param1:Boolean) : void
      {
         super.ghost = param1;
         if(this.§_-f6§ == null)
         {
            return;
         }
         this.§_-E1Q§(param1 ? int(this.§_-h4§) : int(this.categoriesBits));
      }
      
      override public function set ghostToObject(param1:Boolean) : void
      {
         super.ghostToObject = param1;
         if(this.§_-f6§ == null)
         {
            return;
         }
         this.§_-E1Q§(param1 ? int(this.§_-63a§) : int(this.categoriesBits));
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.§_-x1G§,this.§_-yz§,this.bungeeLength]);
         if(this.body)
         {
            _loc1_[_loc1_.length - 1].push([this.§_-B1r§,this.joint.GetLowerLimit()]);
         }
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         var _loc2_:Array = param1.pop();
         this.§_-x1G§ = _loc2_[0];
         this.§_-yz§ = _loc2_[1];
         this.bungeeLength = _loc2_[2];
         if(_loc2_.length < 4)
         {
            this.§_-B1r§ = this.angle;
            return;
         }
         this.§_-B1r§ = _loc2_[3][0];
         this.§_-wK§ = _loc2_[3][1];
      }
      
      override public function build(param1:b2World) : void
      {
         if(isNaN(this.§_-B1r§))
         {
            this.§_-B1r§ = this.angle;
         }
         if(this.body != null && this.§_-f6§ != null && this.joint != null)
         {
            super.build(param1);
            this.§_-f6§.SetPositionAndAngle(this.body.GetPosition(),this.§_-B1r§);
            this.view.rotation = this.§_-B1r§ * Game.R2D - this.rotation;
            this.§_-p2n§ = this.view.rotation;
            return;
         }
         if(this.body != null || this.§_-f6§ != null)
         {
            this.§_-p27§();
         }
         this.§_-f6§ = param1.CreateBody(§_-E2n§);
         this.§_-f6§.SetLinearDamping(1.5);
         this.§_-f6§.SetAngularDamping(1.5);
         this.§_-f6§.SetUserData(this);
         this.§_-f6§.CreateFixture(§_-S17§);
         this.§_-f6§.SetPositionAndAngle(new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§),this.§_-B1r§);
         this.view.rotation = this.§_-B1r§ * Game.R2D - this.rotation;
         this.§_-p2n§ = this.view.rotation;
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-G29§);
         this.body.SetFixedRotation(true);
         super.build(param1);
         var _loc2_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc2_.Initialize(this.body,this.§_-f6§,b2Math.AddVV(this.body.GetPosition(),this.body.GetWorldVector(new b2Vec2(0,0))));
         _loc2_.collideConnected = false;
         _loc2_.lowerAngle = this.§_-wK§;
         _loc2_.upperAngle = this.§_-wK§;
         _loc2_.enableLimit = true;
         this.joint = this.body.GetWorld().CreateJoint(_loc2_) as b2RevoluteJoint;
         if(this.ghost)
         {
            this.§_-E1Q§(this.§_-h4§);
         }
         if(this.ghostToObject)
         {
            this.§_-E1Q§(this.§_-63a§);
         }
      }
      
      private function §_-p27§() : void
      {
         var _loc1_:b2Fixture = null;
         if(Boolean(this.joint) && Boolean(this.body))
         {
            this.body.GetWorld().DestroyJoint(this.joint);
            this.joint = null;
         }
         if(this.§_-f6§)
         {
            _loc1_ = this.§_-f6§.GetFixtureList();
            while(_loc1_)
            {
               _loc1_.SetUserData(null);
               _loc1_ = _loc1_.GetNext();
            }
            this.§_-f6§.SetUserData(null);
            this.§_-f6§.GetWorld().DestroyBody(this.§_-f6§);
            this.§_-f6§ = null;
         }
         if(!this.body)
         {
            return;
         }
         _loc1_ = this.body.GetFixtureList();
         while(_loc1_)
         {
            _loc1_.SetUserData(null);
            _loc1_ = _loc1_.GetNext();
         }
         this.body.SetUserData(null);
         this.body.GetWorld().DestroyBody(this.body);
         this.body = null;
      }
      
      override public function dispose() : void
      {
         this.§_-p27§();
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-d2j§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-IN§);
         this.§_-63V§.removeEventListener(TouchEvent.§_-N1l§,this.§_-q2R§);
         this.§_-O1c§.removeEventListener(TouchEvent.§_-N1l§,this.§_-g1k§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.§_-H2D§ || !this.body)
         {
            return;
         }
         if(this.§_-x1G§ < this.§_-yz§)
         {
            this.§_-x1G§ += param1 * 1000;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(Game.selfId);
         this.§_-Zx§ = Boolean(_loc2_ && _loc2_.shaman && b2Math.SubtractVV(this.position,_loc2_.position).Length() < §_-c1F§) || this.§_-H2D§ is §_-A32§;
         this.§_-HV§ = this.§_-x1G§ >= this.§_-yz§ && this.§_-w2l§;
      }
      
      public function set shootDelay(param1:int) : void
      {
         this.§_-yz§ = param1;
         this.§_-x1G§ = param1;
      }
      
      public function get shootDelay() : int
      {
         return this.§_-yz§;
      }
      
      private function set §_-Zx§(param1:Boolean) : void
      {
         if(this.§_-w2l§ == param1)
         {
            return;
         }
         this.§_-w2l§ = param1;
         this.§_-53u§.buttonMode = param1;
         this.§_-53u§.mouseEnabled = param1;
      }
      
      private function set §_-HV§(param1:Boolean) : void
      {
         var _loc2_:Sprite = null;
         if(this.§_-V2P§ == param1)
         {
            return;
         }
         this.§_-O1c§.enabled = param1;
         this.§_-V2P§ = param1;
         this.§_-O1c§.useHandCursor = param1;
         if(param1)
         {
            _loc2_ = new Sprite();
            _loc2_.graphics.beginFill(16711680,0.3);
            _loc2_.graphics.drawCircle(this.§_-O1c§.width * 0.5,this.§_-O1c§.height * 0.5,this.§_-O1c§.height * 0.5);
            _loc2_.graphics.endFill();
            this.§_-O1c§.addChild(new §_-h2I§(_loc2_).getStarlingView());
         }
         else
         {
            while(this.§_-O1c§.numChildren > 1)
            {
               this.§_-O1c§.removeChildAt(1);
            }
         }
      }
      
      private function §_-g1k§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(this.§_-O1c§);
         if(!_loc2_ || _loc2_.§_-Q2S§ != §_-sj§.§_-ML§ || !this.§_-V2P§)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.§_-437§();
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"bungeeHarpoonShoot":[this.id]}));
         }
      }
      
      private function §_-437§() : void
      {
         this.§_-x1G§ = 0;
         if(!this.§_-H2D§ || !this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc1_:§_-81K§ = new §_-81K§();
         _loc1_.angle = this.§_-f6§.GetAngle();
         _loc1_.bungeeLength = this.bungeeLength;
         _loc1_.position = this.§_-f6§.GetWorldPoint(new b2Vec2(6,0.6));
         this.§_-H2D§.map.§_-nA§(_loc1_,true);
      }
      
      private function §_-q2R§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(this.§_-63V§);
         if(!_loc2_ || _loc2_.§_-Q2S§ != §_-sj§.§_-ML§)
         {
            return;
         }
         if(!this.body || !this.joint)
         {
            return;
         }
         this.§_-XR§.visible = true;
         this.joint.EnableLimit(false);
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-IN§);
      }
      
      private function §_-d2j§(param1:MouseEvent) : void
      {
         if(!this.body || !this.joint || !this.§_-XR§.visible)
         {
            return;
         }
         this.§_-XR§.visible = false;
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-IN§);
         this.joint.EnableLimit(true);
         if(this.§_-H2D§ is §_-A32§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"bungeeHarpoonAim":[this.id,Game.selfId,this.§_-B1r§,this.joint.GetLowerLimit()]}));
      }
      
      private function §_-IN§(param1:MouseEvent) : void
      {
         if(!this.body || !this.joint || this.§_-XR§.visible != true)
         {
            return;
         }
         var _loc2_:Number = Math.atan2(param1.stageY - this.joint.GetAnchorA().y * Game.§_-x2P§ - this.§_-H2D§.map.y,param1.stageX - this.joint.GetAnchorA().x * Game.§_-x2P§ - this.§_-H2D§.map.x);
         var _loc3_:Number = _loc2_ <= 0 ? -_loc2_ : Math.PI * 2 - _loc2_;
         var _loc4_:Number = this.angle <= 0 ? -this.angle : Math.PI * 2 - this.angle;
         if(_loc4_ < Math.PI ? _loc3_ > _loc4_ + Math.PI || _loc3_ < _loc4_ : _loc3_ > _loc4_ - Math.PI && _loc3_ < _loc4_)
         {
            return;
         }
         this.view.rotation = _loc2_ * Game.R2D - this.rotation;
         this.§_-p2n§ = this.view.rotation;
         this.§_-f6§.SetAngle(_loc2_);
         this.§_-B1r§ = _loc2_;
         var _loc5_:Number = _loc3_ > _loc4_ ? _loc4_ - _loc3_ : _loc4_ - (_loc3_ + Math.PI * 2);
         this.joint.SetLimits(_loc5_,_loc5_);
      }
      
      private function §_-E1Q§(param1:int) : void
      {
         var _loc3_:b2FilterData = null;
         var _loc2_:b2Fixture = this.§_-f6§.GetFixtureList();
         while(_loc2_)
         {
            _loc3_ = _loc2_.GetFilterData();
            _loc3_.categoryBits = param1;
            _loc2_.SetFilterData(_loc3_);
            _loc2_ = _loc2_.GetNext();
         }
      }
      
      private function §_-n0§(param1:Number, param2:Number) : void
      {
         this.§_-B1r§ = param1;
         this.joint.EnableLimit(false);
         this.view.rotation = param1 * Game.R2D - this.rotation;
         this.§_-p2n§ = this.view.rotation;
         this.§_-f6§.SetAngle(param1);
         this.joint.SetLimits(param2,param2);
         this.joint.EnableLimit(true);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if("bungeeHarpoonShoot" in _loc2_)
         {
            if(_loc2_["bungeeHarpoonShoot"][0] != this.id)
            {
               return;
            }
            this.§_-437§();
         }
         if("bungeeHarpoonAim" in _loc2_)
         {
            if(_loc2_["bungeeHarpoonAim"][0] != this.id)
            {
               return;
            }
            if(_loc2_["bungeeHarpoonAim"][1] == Game.selfId)
            {
               return;
            }
            this.§_-n0§(_loc2_["bungeeHarpoonAim"][2],_loc2_["bungeeHarpoonAim"][3]);
         }
      }
   }
}

