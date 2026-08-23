package §_-83V§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2JointEdge;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2FilterData;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-C1m§.§_-P1B§;
   import §_-Rn§.§_-I2G§;
   import §_-Rn§.§_-f1U§;
   import §_-Y22§.§_-C2x§;
   import flash.filters.GlowFilter;
   import flash.utils.getTimer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-8B§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.§_-V§;
   import game.mainGame.§_-w2F§;
   import game.mainGame.entity.§_-63Q§;
   
   public class GameBody extends §_-R2Z§ implements §_-Tm§, §_-C2x§, §_-63Q§, §_-03u§, §_-8B§
   {
      
      public static const §_-E20§:Number = 0.5;
      
      public static const §_-b2e§:Array = [new GlowFilter(65535,1,10,10,1,1,true,true)];
      
      public static const §_-yO§:Array = [new GlowFilter(41215,1,30,30,100,1,true,true)];
      
      public var §_-123§:int = -1;
      
      public var playerId:int = -1;
      
      public var §_-B3D§:Number = 0;
      
      protected var §_-H2D§:SquirrelGame = null;
      
      protected var §_-m1I§:Boolean = false;
      
      private var §_-C2C§:Boolean = false;
      
      private var §_-l16§:Boolean = false;
      
      private var §_-v2o§:Boolean = false;
      
      private var §_-c5§:Boolean;
      
      private var §_-Hi§:Number = 1;
      
      private var §_-jb§:b2Vec2 = new b2Vec2();
      
      private var §_-ga§:Number = 0;
      
      private var §_-8c§:b2Body = null;
      
      private var joint:b2Joint = null;
      
      private var §_-u2w§:Boolean = false;
      
      private var §_-S1P§:§_-P1B§;
      
      public function GameBody(param1:b2Body = null)
      {
         super();
         this.body = param1;
      }
      
      public static function §_-u1P§(param1:*) : Boolean
      {
         return param1[0] is Array && param1[0].length == 2;
      }
      
      override public function §_-r11§(param1:Vector.<§_-63Q§>) : void
      {
         §_-M1A§();
         super.§_-r11§(param1);
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         §_-w2c§();
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = param1;
         §_-w2c§();
      }
      
      public function get §_-u1M§() : Boolean
      {
         return this.§_-123§ != -1;
      }
      
      public function get syncObject() : §_-P1B§
      {
         return this.§_-S1P§;
      }
      
      public function set syncObject(param1:§_-P1B§) : void
      {
         this.§_-S1P§ = param1;
      }
      
      public function get body() : b2Body
      {
         return this.§_-8c§;
      }
      
      public function set body(param1:b2Body) : void
      {
         this.§_-8c§ = param1;
         if(this.§_-8c§ == null)
         {
            return;
         }
         this.§_-8c§.SetUserData(this);
      }
      
      public function get ghost() : Boolean
      {
         return this.§_-C2C§;
      }
      
      public function set ghost(param1:Boolean) : void
      {
         if(this.§_-C2C§ == param1)
         {
            return;
         }
         this.§_-C2C§ = param1;
         if(param1 && this.ghostToObject)
         {
            this.ghostToObject = false;
         }
         this.§_-01q§(this.ghost ? §_-b2e§ : []);
         if(this.body == null)
         {
            return;
         }
         this.§_-i1x§(this.§_-C2C§ ? int(this.§_-h4§) : int(this.categoriesBits));
      }
      
      public function get ghostToObject() : Boolean
      {
         return this.§_-l16§;
      }
      
      public function set ghostToObject(param1:Boolean) : void
      {
         if(this.§_-l16§ == param1)
         {
            return;
         }
         this.§_-l16§ = param1;
         if(param1 && this.ghost)
         {
            this.ghost = false;
         }
         if(this.§_-C1B§)
         {
            this.§_-01q§(this.ghostToObject ? §_-yO§ : []);
         }
         if(this.body == null)
         {
            return;
         }
         this.§_-i1x§(this.§_-C2C§ ? int(this.§_-63a§) : int(this.categoriesBits));
      }
      
      public function get fixedRotation() : Boolean
      {
         return this.§_-v2o§;
      }
      
      public function set fixedRotation(param1:Boolean) : void
      {
         if(this.fixed && param1)
         {
            this.fixed = false;
         }
         this.§_-v2o§ = param1;
         if(this.body)
         {
            this.body.SetFixedRotation(param1);
         }
      }
      
      public function get speed() : Number
      {
         return this.§_-Hi§;
      }
      
      public function set speed(param1:Number) : void
      {
         this.§_-Hi§ = Math.abs(param1);
      }
      
      public function §_-01q§(param1:Array) : void
      {
         if(!param1)
         {
         }
         if(this is §_-I2G§)
         {
            return;
         }
         if(this.alpha > 0)
         {
            this.alpha = this.§_-C2C§ ? §_-E20§ : 1;
         }
      }
      
      public function build(param1:b2World) : void
      {
         this.§_-B3D§ = getTimer();
         §_-TQ§.add("GameBody.build " + this,this.parentStarling,this.§_-B3D§);
         this.showDebug = false;
         this.§_-H2D§ = param1.userData as SquirrelGame;
         this.body.SetPositionAndAngle(new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§),this.rotation * Game.D2R);
         this.§_-8c§.SetFixedRotation(this.fixedRotation);
         this.§_-Xh§();
         this.linearVelocity = this.§_-jb§;
         this.angularVelocity = this.§_-ga§;
         this.§_-gs§();
         if(this.ghost)
         {
            this.§_-i1x§(this.§_-h4§);
            this.§_-01q§(§_-b2e§);
         }
         if(this.ghostToObject)
         {
            this.§_-i1x§(this.§_-63a§);
         }
      }
      
      public function set fixed(param1:Boolean) : void
      {
         if(this.§_-c5§ == param1)
         {
            return;
         }
         if(this.fixedRotation && param1)
         {
            this.fixedRotation = false;
         }
         this.§_-c5§ = param1;
         this.§_-Xh§();
      }
      
      public function get fixed() : Boolean
      {
         var _loc1_:b2JointEdge = null;
         var _loc2_:* = undefined;
         var _loc3_:§_-f1U§ = null;
         if(Boolean(this.body) && !this.§_-c5§)
         {
            _loc1_ = this.body.GetJointList();
            _loc2_ = null;
            _loc3_ = null;
            while(_loc1_)
            {
               _loc2_ = _loc1_.joint.GetUserData();
               if(_loc2_ is §_-f1U§)
               {
                  _loc3_ = _loc2_ as §_-f1U§;
                  if(_loc3_.toWorld && _loc3_.limited && _loc3_.maxLimit == _loc3_.minLimit)
                  {
                     return true;
                  }
               }
               _loc1_ = _loc1_.next;
            }
         }
         return this.§_-c5§;
      }
      
      public function get id() : int
      {
         if(this.§_-H2D§ == null || this.§_-H2D§.map == null)
         {
            return -1;
         }
         return this.§_-H2D§.map.§_-F2W§(this);
      }
      
      public function dispose() : void
      {
         var fixture:b2Fixture = null;
         try
         {
            this.syncObject = null;
            while(this.numChildren > 0)
            {
               §_-n2T§(0);
            }
            this.§_-H2D§ = null;
            this.removeFromParent();
            if(this.body == null)
            {
               return;
            }
            if(!this.§_-c5§)
            {
               §_-w2F§.§_-41c§(this.body);
            }
            if(this.§_-c5§ && Boolean(this.joint))
            {
               this.§_-g2X§();
            }
            fixture = this.body.GetFixtureList();
            while(fixture)
            {
               fixture.SetUserData(null);
               fixture = fixture.GetNext();
            }
            this.body.SetUserData(null);
            this.body.GetWorld().DestroyBody(this.body);
            this.body = null;
         }
         catch(e:Error)
         {
            §_-TQ§.add("GameBody dispose error:",e.message);
         }
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.§_-C1B§ = param1;
         this.§_-c14§.visible = this.§_-C1B§;
         §_-w2c§();
         if(this.ghostToObject)
         {
            this.§_-01q§(param1 ? §_-yO§ : []);
         }
      }
      
      public function get position() : b2Vec2
      {
         if(this.body == null)
         {
            return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
         }
         return this.body.GetPosition();
      }
      
      public function set position(param1:b2Vec2) : void
      {
         if(this.body == null)
         {
            this.x = param1.x * Game.§_-x2P§;
            this.y = param1.y * Game.§_-x2P§;
            return;
         }
         var _loc2_:Boolean = false;
         if(this.fixed && Boolean(this.joint))
         {
            _loc2_ = true;
            this.§_-g2X§();
         }
         this.body.SetPosition(param1);
         this.§_-A18§();
         if(_loc2_)
         {
            this.§_-U12§();
         }
      }
      
      override public function set alpha(param1:Number) : void
      {
         if(this.§_-C2C§)
         {
            param1 = Math.min(§_-E20§,param1);
         }
         super.alpha = param1;
      }
      
      public function set angle(param1:Number) : void
      {
         if(this.body == null)
         {
            this.rotation = param1 / Game.D2R;
            return;
         }
         this.body.SetAngle(param1);
         this.§_-A18§();
         §_-w2c§();
      }
      
      public function get angle() : Number
      {
         if(this.body == null)
         {
            return this.rotation * Game.D2R;
         }
         return this.body.GetAngle();
      }
      
      public function get linearVelocity() : b2Vec2
      {
         if(this.body == null)
         {
            return this.§_-jb§;
         }
         return this.body.GetLinearVelocity();
      }
      
      public function set linearVelocity(param1:b2Vec2) : void
      {
         if(this.body == null)
         {
            this.§_-jb§ = param1;
            this.§_-m1I§ = true;
            return;
         }
         this.body.SetLinearVelocity(param1);
      }
      
      public function get angularVelocity() : Number
      {
         if(this.body == null)
         {
            return this.§_-ga§;
         }
         return this.body.GetAngularVelocity();
      }
      
      public function set angularVelocity(param1:Number) : void
      {
         if(this.body == null)
         {
            this.§_-ga§ = param1;
            this.§_-m1I§ = true;
            return;
         }
         this.body.SetAngularVelocity(param1);
      }
      
      public function update(param1:Number = 0) : void
      {
         if(this.body == null)
         {
            return;
         }
         if(Boolean(this.body.IsAwake()) && this.visible && Boolean(this.body.IsActive()))
         {
            this.§_-A18§();
         }
         this.body.SetActive(this.body.GetPosition().y < 150);
      }
      
      public function §_-A18§() : void
      {
         if(this.body == null)
         {
            return;
         }
         var _loc1_:b2Vec2 = this.body.GetPosition();
         this.x = _loc1_.x * Game.§_-x2P§;
         this.y = _loc1_.y * Game.§_-x2P§;
         this.rotation = this.body.GetAngle() * Game.R2D;
      }
      
      public function §_-A1X§() : *
      {
         var _loc1_:Array = [];
         var _loc2_:String = this.body != null || this.§_-m1I§ ? "1" : "0";
         _loc1_.push([[this.position.x,this.position.y],this.angle,this.ghost,this.fixed,this.fixedRotation,[this.linearVelocity.x,this.linearVelocity.y],this.angularVelocity,_loc2_,this.speed,this.ghostToObject]);
         return _loc1_;
      }
      
      public function §_-41M§(param1:*) : void
      {
         if(!param1)
         {
            return;
         }
         if(GameBody.§_-u1P§(param1))
         {
            this.position = new b2Vec2(param1[0][0],param1[0][1]);
            this.angle = param1[1];
            this.ghost = Boolean(param1[2]);
            return;
         }
         this.position = new b2Vec2(param1[0][0][0],param1[0][0][1]);
         this.angle = param1[0][1];
         this.ghost = Boolean(param1[0][2]);
         this.fixed = Boolean(param1[0][3]);
         this.fixedRotation = Boolean(param1[0][4]);
         if(param1[0].length < 6)
         {
            return;
         }
         this.§_-jb§ = new b2Vec2(param1[0][5][0],param1[0][5][1]);
         this.§_-ga§ = param1[0][6];
         this.§_-m1I§ = param1[0][7] == "1";
         if(param1[0].length < 9)
         {
            return;
         }
         this.speed = param1[0][8];
         if(param1[0].length < 10)
         {
            return;
         }
         this.ghostToObject = Boolean(param1[0][9]);
      }
      
      protected function get categoriesBits() : uint
      {
         return §_-V§.§_-j1I§;
      }
      
      protected function get §_-h4§() : uint
      {
         return §_-V§.§_-9H§;
      }
      
      protected function get §_-63a§() : uint
      {
         return §_-V§.§_-31M§;
      }
      
      private function §_-Xh§() : void
      {
         if(!this.body)
         {
            return;
         }
         if(!this.joint)
         {
            if(!this.§_-c5§)
            {
               §_-w2F§.§_-aE§(this.body);
               return;
            }
            §_-w2F§.§_-41c§(this.body);
            this.§_-U12§();
         }
         else
         {
            if(this.§_-c5§)
            {
               return;
            }
            §_-w2F§.§_-aE§(this.body);
            this.§_-g2X§();
         }
      }
      
      private function §_-U12§() : void
      {
         var _loc1_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc1_.Initialize(this.body.GetWorld().GetGroundBody(),this.body,this.body.GetPosition());
         _loc1_.enableLimit = true;
         _loc1_.lowerAngle = 0;
         _loc1_.upperAngle = 0;
         this.joint = this.body.GetWorld().CreateJoint(_loc1_);
      }
      
      private function §_-g2X§() : void
      {
         this.body.GetWorld().DestroyJoint(this.joint);
         this.joint = null;
      }
      
      private function §_-gs§() : void
      {
         if(this.§_-u2w§)
         {
            return;
         }
         if(isNaN(this.body.GetPosition().x) || isNaN(this.body.GetPosition().y) || isNaN(this.body.GetAngle()) || isNaN(this.body.GetLinearVelocity().x) || isNaN(this.body.GetLinearVelocity().y) || isNaN(this.body.GetAngularVelocity()))
         {
            §_-k2X§.§_-fm§(new Error("!!!NaN!!! " + this,666));
            §_-TQ§.add("Error NaN " + JSON.stringify(this.body));
            this.§_-H2D§.onError();
            this.§_-u2w§ = true;
         }
      }
      
      private function §_-i1x§(param1:int) : void
      {
         var _loc3_:b2FilterData = null;
         var _loc2_:b2Fixture = this.body.GetFixtureList();
         while(_loc2_)
         {
            _loc3_ = _loc2_.GetFilterData();
            _loc3_.categoryBits = param1;
            _loc2_.SetFilterData(_loc3_);
            _loc2_ = _loc2_.GetNext();
         }
      }
   }
}

