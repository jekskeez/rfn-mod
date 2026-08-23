package §_-8Q§
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
   import §_-TK§.§_-aS§;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import §_-hd§.§_-01M§;
   import §_-l2u§.§_-62b§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-Yv§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import starling.display.Button;
   
   public class §_-y1c§ extends GameBody implements §_-Yv§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-A2L§:Number = 10;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-N24§:b2PolygonShape = b2PolygonShape.AsVector(§_-13W§,0);
      
      private static const §_-5Z§:b2FixtureDef = new b2FixtureDef(§_-N24§,null,0.8,0.1,2,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-12u§:b2PolygonShape = b2PolygonShape.AsVector(§_-FA§,0);
      
      private static const §_-R2T§:b2FixtureDef = new b2FixtureDef(§_-12u§,null,0.8,0.1,3,§_-53X§,§_-C3c§,0);
      
      private var view:§_-aS§ = null;
      
      private var §_-01B§:§_-aS§ = null;
      
      private var §_-P1x§:b2Body = null;
      
      private var §_-L2x§:Boolean = false;
      
      private var §_-S2T§:Boolean = false;
      
      private var §_-21D§:Sprite = null;
      
      private var §_-f2y§:§_-aS§ = null;
      
      private var §_-72w§:int = 3000;
      
      private var §_-t2n§:int = this.§_-72w§;
      
      private var joint:b2RevoluteJoint = null;
      
      private var §_-Y1H§:Number;
      
      private var §_-73D§:Number = 0;
      
      private var §_-hA§:Button;
      
      private var §_-Dj§:Button;
      
      public var bungeeLength:int = 5;
      
      public function §_-y1c§()
      {
         super();
         this.view = new §_-aS§(new HarpoonBungeeTrunk());
         §_-J2J§(this.view);
         this.§_-01B§ = new §_-aS§(new HarpoonBungeePillar());
         §_-J2J§(this.§_-01B§);
         this.§_-hA§ = new Button(§_-01M§.getTexture(new HarpoonBungeeButton()));
         this.§_-hA§.x = -this.§_-hA§.width * 0.5;
         this.§_-hA§.y = -this.§_-hA§.height * 0.5;
         this.§_-hA§.enabled = false;
         this.§_-hA§.addEventListener(TouchEvent.§_-qu§,this.§_-E2§);
         §_-J2J§(this.§_-hA§);
         this.§_-Dj§ = new Button(§_-01M§.getTexture(new HarpoonTrunkAim()));
         this.§_-Dj§.x = 0;
         this.§_-Dj§.y = 0.5;
         this.§_-Dj§.touchable = true;
         this.§_-Dj§.downState = §_-01M§.getTexture(new HarpoonTrunkAim());
         this.§_-Dj§.useHandCursor = true;
         this.§_-Dj§.addEventListener(TouchEvent.§_-qu§,this.§_-K2F§);
         this.§_-Dj§.pivotX = -41;
         this.§_-Dj§.pivotY = this.§_-Dj§.height * 0.5 - 0.5;
         §_-J2J§(this.§_-Dj§);
         this.§_-21D§ = new Sprite();
         this.§_-21D§.x = 70;
         this.§_-21D§.graphics.beginFill(0,0);
         this.§_-21D§.graphics.drawCircle(-10,0,20);
         this.§_-21D§.graphics.endFill();
         this.§_-21D§.mouseEnabled = false;
         Game.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-A28§);
         this.§_-f2y§ = new §_-aS§(new AimCursor());
         this.§_-f2y§.x = 100;
         this.§_-f2y§.§_-i18§();
         this.§_-f2y§.visible = false;
         this.view.§_-J2J§(this.§_-f2y§);
         this.fixed = true;
         this.touchable = true;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      private static function get §_-13W§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-2.8,-2.8));
         _loc1_.push(new b2Vec2(2.6,-2.8));
         _loc1_.push(new b2Vec2(6.1,-1.8));
         _loc1_.push(new b2Vec2(2.6,-0.8));
         _loc1_.push(new b2Vec2(-2.8,-0.8));
         return _loc1_;
      }
      
      private static function get §_-FA§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-1.9,1.4));
         _loc1_.push(new b2Vec2(0,-1.8));
         _loc1_.push(new b2Vec2(1.9,1.4));
         return _loc1_;
      }
      
      private function set §_-rb§(param1:Number) : void
      {
         this.§_-Dj§.rotation = param1 * Math.PI / 180;
      }
      
      override public function set ghost(param1:Boolean) : void
      {
         super.ghost = param1;
         if(this.§_-P1x§ == null)
         {
            return;
         }
         this.§_-814§(param1 ? int(this.§_-B1n§) : int(this.categoriesBits));
      }
      
      override public function set ghostToObject(param1:Boolean) : void
      {
         super.ghostToObject = param1;
         if(this.§_-P1x§ == null)
         {
            return;
         }
         this.§_-814§(param1 ? int(this.§_-L1C§) : int(this.categoriesBits));
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.§_-t2n§,this.§_-72w§,this.bungeeLength]);
         if(this.body)
         {
            _loc1_[_loc1_.length - 1].push([this.§_-Y1H§,this.joint.GetLowerLimit()]);
         }
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         var _loc2_:Array = param1.pop();
         this.§_-t2n§ = _loc2_[0];
         this.§_-72w§ = _loc2_[1];
         this.bungeeLength = _loc2_[2];
         if(_loc2_.length < 4)
         {
            this.§_-Y1H§ = this.angle;
            return;
         }
         this.§_-Y1H§ = _loc2_[3][0];
         this.§_-73D§ = _loc2_[3][1];
      }
      
      override public function build(param1:b2World) : void
      {
         if(isNaN(this.§_-Y1H§))
         {
            this.§_-Y1H§ = this.angle;
         }
         if(this.body != null && this.§_-P1x§ != null && this.joint != null)
         {
            super.build(param1);
            this.§_-P1x§.SetPositionAndAngle(this.body.GetPosition(),this.§_-Y1H§);
            this.view.rotation = this.§_-Y1H§ * Game.R2D - this.rotation;
            this.§_-rb§ = this.view.rotation;
            return;
         }
         if(this.body != null || this.§_-P1x§ != null)
         {
            this.§_-x1I§();
         }
         this.§_-P1x§ = param1.CreateBody(§_-41z§);
         this.§_-P1x§.SetLinearDamping(1.5);
         this.§_-P1x§.SetAngularDamping(1.5);
         this.§_-P1x§.SetUserData(this);
         this.§_-P1x§.CreateFixture(§_-5Z§);
         this.§_-P1x§.SetPositionAndAngle(new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§),this.§_-Y1H§);
         this.view.rotation = this.§_-Y1H§ * Game.R2D - this.rotation;
         this.§_-rb§ = this.view.rotation;
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-R2T§);
         this.body.SetFixedRotation(true);
         super.build(param1);
         var _loc2_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc2_.Initialize(this.body,this.§_-P1x§,b2Math.AddVV(this.body.GetPosition(),this.body.GetWorldVector(new b2Vec2(0,0))));
         _loc2_.collideConnected = false;
         _loc2_.lowerAngle = this.§_-73D§;
         _loc2_.upperAngle = this.§_-73D§;
         _loc2_.enableLimit = true;
         this.joint = this.body.GetWorld().CreateJoint(_loc2_) as b2RevoluteJoint;
         if(this.ghost)
         {
            this.§_-814§(this.§_-B1n§);
         }
         if(this.ghostToObject)
         {
            this.§_-814§(this.§_-L1C§);
         }
      }
      
      private function §_-x1I§() : void
      {
         var _loc1_:b2Fixture = null;
         if(Boolean(this.joint) && Boolean(this.body))
         {
            this.body.GetWorld().DestroyJoint(this.joint);
            this.joint = null;
         }
         if(this.§_-P1x§)
         {
            _loc1_ = this.§_-P1x§.GetFixtureList();
            while(_loc1_)
            {
               _loc1_.SetUserData(null);
               _loc1_ = _loc1_.GetNext();
            }
            this.§_-P1x§.SetUserData(null);
            this.§_-P1x§.GetWorld().DestroyBody(this.§_-P1x§);
            this.§_-P1x§ = null;
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
         this.§_-x1I§();
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-A28§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-81B§);
         this.§_-Dj§.removeEventListener(TouchEvent.§_-qu§,this.§_-K2F§);
         this.§_-hA§.removeEventListener(TouchEvent.§_-qu§,this.§_-E2§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.§_-21H§ || !this.body)
         {
            return;
         }
         if(this.§_-t2n§ < this.§_-72w§)
         {
            this.§_-t2n§ += param1 * 1000;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(Game.selfId);
         this.§_-m1s§ = Boolean(_loc2_ && _loc2_.shaman && b2Math.SubtractVV(this.position,_loc2_.position).Length() < §_-A2L§) || this.§_-21H§ is §_-62b§;
         this.§_-i2D§ = this.§_-t2n§ >= this.§_-72w§ && this.§_-L2x§;
      }
      
      public function set shootDelay(param1:int) : void
      {
         this.§_-72w§ = param1;
         this.§_-t2n§ = param1;
      }
      
      public function get shootDelay() : int
      {
         return this.§_-72w§;
      }
      
      private function set §_-m1s§(param1:Boolean) : void
      {
         if(this.§_-L2x§ == param1)
         {
            return;
         }
         this.§_-L2x§ = param1;
         this.§_-21D§.buttonMode = param1;
         this.§_-21D§.mouseEnabled = param1;
      }
      
      private function set §_-i2D§(param1:Boolean) : void
      {
         var _loc2_:Sprite = null;
         if(this.§_-S2T§ == param1)
         {
            return;
         }
         this.§_-hA§.enabled = param1;
         this.§_-S2T§ = param1;
         this.§_-hA§.useHandCursor = param1;
         if(param1)
         {
            _loc2_ = new Sprite();
            _loc2_.graphics.beginFill(16711680,0.3);
            _loc2_.graphics.drawCircle(this.§_-hA§.width * 0.5,this.§_-hA§.height * 0.5,this.§_-hA§.height * 0.5);
            _loc2_.graphics.endFill();
            this.§_-hA§.addChild(new §_-aS§(_loc2_).getStarlingView());
         }
         else
         {
            while(this.§_-hA§.numChildren > 1)
            {
               this.§_-hA§.removeChildAt(1);
            }
         }
      }
      
      private function §_-E2§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(this.§_-hA§);
         if(!_loc2_ || _loc2_.§_-iR§ != §_-01Z§.§_-N1v§ || !this.§_-S2T§)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.§_-1s§();
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"bungeeHarpoonShoot":[this.id]}));
         }
      }
      
      private function §_-1s§() : void
      {
         this.§_-t2n§ = 0;
         if(!this.§_-21H§ || !this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc1_:§_-42y§ = new §_-42y§();
         _loc1_.angle = this.§_-P1x§.GetAngle();
         _loc1_.bungeeLength = this.bungeeLength;
         _loc1_.position = this.§_-P1x§.GetWorldPoint(new b2Vec2(6,0.6));
         this.§_-21H§.map.§_-TP§(_loc1_,true);
      }
      
      private function §_-K2F§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(this.§_-Dj§);
         if(!_loc2_ || _loc2_.§_-iR§ != §_-01Z§.§_-N1v§)
         {
            return;
         }
         if(!this.body || !this.joint)
         {
            return;
         }
         this.§_-f2y§.visible = true;
         this.joint.EnableLimit(false);
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-81B§);
      }
      
      private function §_-A28§(param1:MouseEvent) : void
      {
         if(!this.body || !this.joint || !this.§_-f2y§.visible)
         {
            return;
         }
         this.§_-f2y§.visible = false;
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-81B§);
         this.joint.EnableLimit(true);
         if(this.§_-21H§ is §_-62b§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"bungeeHarpoonAim":[this.id,Game.selfId,this.§_-Y1H§,this.joint.GetLowerLimit()]}));
      }
      
      private function §_-81B§(param1:MouseEvent) : void
      {
         if(!this.body || !this.joint || this.§_-f2y§.visible != true)
         {
            return;
         }
         var _loc2_:Number = Math.atan2(param1.stageY - this.joint.GetAnchorA().y * Game.§_-12A§ - this.§_-21H§.map.y,param1.stageX - this.joint.GetAnchorA().x * Game.§_-12A§ - this.§_-21H§.map.x);
         var _loc3_:Number = _loc2_ <= 0 ? -_loc2_ : Math.PI * 2 - _loc2_;
         var _loc4_:Number = this.angle <= 0 ? -this.angle : Math.PI * 2 - this.angle;
         if(_loc4_ < Math.PI ? _loc3_ > _loc4_ + Math.PI || _loc3_ < _loc4_ : _loc3_ > _loc4_ - Math.PI && _loc3_ < _loc4_)
         {
            return;
         }
         this.view.rotation = _loc2_ * Game.R2D - this.rotation;
         this.§_-rb§ = this.view.rotation;
         this.§_-P1x§.SetAngle(_loc2_);
         this.§_-Y1H§ = _loc2_;
         var _loc5_:Number = _loc3_ > _loc4_ ? _loc4_ - _loc3_ : _loc4_ - (_loc3_ + Math.PI * 2);
         this.joint.SetLimits(_loc5_,_loc5_);
      }
      
      private function §_-814§(param1:int) : void
      {
         var _loc3_:b2FilterData = null;
         var _loc2_:b2Fixture = this.§_-P1x§.GetFixtureList();
         while(_loc2_)
         {
            _loc3_ = _loc2_.GetFilterData();
            _loc3_.categoryBits = param1;
            _loc2_.SetFilterData(_loc3_);
            _loc2_ = _loc2_.GetNext();
         }
      }
      
      private function §_-A2Z§(param1:Number, param2:Number) : void
      {
         this.§_-Y1H§ = param1;
         this.joint.EnableLimit(false);
         this.view.rotation = param1 * Game.R2D - this.rotation;
         this.§_-rb§ = this.view.rotation;
         this.§_-P1x§.SetAngle(param1);
         this.joint.SetLimits(param2,param2);
         this.joint.EnableLimit(true);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if("bungeeHarpoonShoot" in _loc2_)
         {
            if(_loc2_["bungeeHarpoonShoot"][0] != this.id)
            {
               return;
            }
            this.§_-1s§();
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
            this.§_-A2Z§(_loc2_["bungeeHarpoonAim"][2],_loc2_["bungeeHarpoonAim"][3]);
         }
      }
   }
}

