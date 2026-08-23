package §_-8Q§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2JointEdge;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2FilterData;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import §_-M16§.§_-U1I§;
   import §_-M16§.§_-X1G§;
   import §_-h2P§.§_-4c§;
   import flash.filters.GlowFilter;
   import flash.utils.getTimer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.§_-Q2d§;
   import game.mainGame.§_-n2T§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-xn§;
   
   public class GameBody extends §_-A§ implements §_-F1c§, §_-l2r§, §_-xn§, §_-3l§, §_-Q2d§
   {
      
      public static const §_-2u§:Number = 0.5;
      
      public static const §_-8Z§:Array = [new GlowFilter(65535,1,10,10,1,1,true,true)];
      
      public static const §_-7g§:Array = [new GlowFilter(41215,1,30,30,100,1,true,true)];
      
      public var §_-t2F§:int = -1;
      
      public var playerId:int = -1;
      
      public var §_-G10§:Number = 0;
      
      protected var §_-21H§:SquirrelGame = null;
      
      protected var §_-32u§:Boolean = false;
      
      private var §_-g1O§:Boolean = false;
      
      private var §_-R21§:Boolean = false;
      
      private var §_-rW§:Boolean = false;
      
      private var §_-O1K§:Boolean;
      
      private var §_-r1P§:Number = 1;
      
      private var §_-r23§:b2Vec2 = new b2Vec2();
      
      private var §_-d1b§:Number = 0;
      
      private var §_-U2I§:b2Body = null;
      
      private var joint:b2Joint = null;
      
      private var §_-O1X§:Boolean = false;
      
      private var §_-pu§:§_-4c§;
      
      public function GameBody(param1:b2Body = null)
      {
         super();
         this.body = param1;
      }
      
      public static function §_-W1F§(param1:*) : Boolean
      {
         return param1[0] is Array && param1[0].length == 2;
      }
      
      override public function §_-zq§(param1:Vector.<§_-xn§>) : void
      {
         §_-Z4§();
         super.§_-zq§(param1);
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         §_-A2O§();
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = param1;
         §_-A2O§();
      }
      
      public function get §_-124§() : Boolean
      {
         return this.§_-t2F§ != -1;
      }
      
      public function get syncObject() : §_-4c§
      {
         return this.§_-pu§;
      }
      
      public function set syncObject(param1:§_-4c§) : void
      {
         this.§_-pu§ = param1;
      }
      
      public function get body() : b2Body
      {
         return this.§_-U2I§;
      }
      
      public function set body(param1:b2Body) : void
      {
         this.§_-U2I§ = param1;
         if(this.§_-U2I§ == null)
         {
            return;
         }
         this.§_-U2I§.SetUserData(this);
      }
      
      public function get ghost() : Boolean
      {
         return this.§_-g1O§;
      }
      
      public function set ghost(param1:Boolean) : void
      {
         if(this.§_-g1O§ == param1)
         {
            return;
         }
         this.§_-g1O§ = param1;
         if(param1 && this.ghostToObject)
         {
            this.ghostToObject = false;
         }
         this.§_-C2Q§(this.ghost ? §_-8Z§ : []);
         if(this.body == null)
         {
            return;
         }
         this.§_-e12§(this.§_-g1O§ ? int(this.§_-B1n§) : int(this.categoriesBits));
      }
      
      public function get ghostToObject() : Boolean
      {
         return this.§_-R21§;
      }
      
      public function set ghostToObject(param1:Boolean) : void
      {
         if(this.§_-R21§ == param1)
         {
            return;
         }
         this.§_-R21§ = param1;
         if(param1 && this.ghost)
         {
            this.ghost = false;
         }
         if(this.§_-m2u§)
         {
            this.§_-C2Q§(this.ghostToObject ? §_-7g§ : []);
         }
         if(this.body == null)
         {
            return;
         }
         this.§_-e12§(this.§_-g1O§ ? int(this.§_-L1C§) : int(this.categoriesBits));
      }
      
      public function get fixedRotation() : Boolean
      {
         return this.§_-rW§;
      }
      
      public function set fixedRotation(param1:Boolean) : void
      {
         if(this.fixed && param1)
         {
            this.fixed = false;
         }
         this.§_-rW§ = param1;
         if(this.body)
         {
            this.body.SetFixedRotation(param1);
         }
      }
      
      public function get speed() : Number
      {
         return this.§_-r1P§;
      }
      
      public function set speed(param1:Number) : void
      {
         this.§_-r1P§ = Math.abs(param1);
      }
      
      public function §_-C2Q§(param1:Array) : void
      {
         if(!param1)
         {
         }
         if(this is §_-U1I§)
         {
            return;
         }
         if(this.alpha > 0)
         {
            this.alpha = this.§_-g1O§ ? §_-2u§ : 1;
         }
      }
      
      public function build(param1:b2World) : void
      {
         this.§_-G10§ = getTimer();
         §_-p2U§.add("GameBody.build " + this,this.parentStarling,this.§_-G10§);
         this.showDebug = false;
         this.§_-21H§ = param1.userData as SquirrelGame;
         this.body.SetPositionAndAngle(new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§),this.rotation * Game.D2R);
         this.§_-U2I§.SetFixedRotation(this.fixedRotation);
         this.§_-135§();
         this.linearVelocity = this.§_-r23§;
         this.angularVelocity = this.§_-d1b§;
         this.§_-o1z§();
         if(this.ghost)
         {
            this.§_-e12§(this.§_-B1n§);
            this.§_-C2Q§(§_-8Z§);
         }
         if(this.ghostToObject)
         {
            this.§_-e12§(this.§_-L1C§);
         }
      }
      
      public function set fixed(param1:Boolean) : void
      {
         if(this.§_-O1K§ == param1)
         {
            return;
         }
         if(this.fixedRotation && param1)
         {
            this.fixedRotation = false;
         }
         this.§_-O1K§ = param1;
         this.§_-135§();
      }
      
      public function get fixed() : Boolean
      {
         var _loc1_:b2JointEdge = null;
         var _loc2_:* = undefined;
         var _loc3_:§_-X1G§ = null;
         if(Boolean(this.body) && !this.§_-O1K§)
         {
            _loc1_ = this.body.GetJointList();
            _loc2_ = null;
            _loc3_ = null;
            while(_loc1_)
            {
               _loc2_ = _loc1_.joint.GetUserData();
               if(_loc2_ is §_-X1G§)
               {
                  _loc3_ = _loc2_ as §_-X1G§;
                  if(_loc3_.toWorld && _loc3_.limited && _loc3_.maxLimit == _loc3_.minLimit)
                  {
                     return true;
                  }
               }
               _loc1_ = _loc1_.next;
            }
         }
         return this.§_-O1K§;
      }
      
      public function get id() : int
      {
         if(this.§_-21H§ == null || this.§_-21H§.map == null)
         {
            return -1;
         }
         return this.§_-21H§.map.§_-923§(this);
      }
      
      public function dispose() : void
      {
         var fixture:b2Fixture = null;
         try
         {
            this.syncObject = null;
            while(this.numChildren > 0)
            {
               §_-av§(0);
            }
            this.§_-21H§ = null;
            this.removeFromParent();
            if(this.body == null)
            {
               return;
            }
            if(!this.§_-O1K§)
            {
               §_-n2T§.§_-L4§(this.body);
            }
            if(this.§_-O1K§ && Boolean(this.joint))
            {
               this.§_-FQ§();
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
            §_-p2U§.add("GameBody dispose error:",e.message);
         }
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.§_-m2u§ = param1;
         this.§_-91F§.visible = this.§_-m2u§;
         §_-A2O§();
         if(this.ghostToObject)
         {
            this.§_-C2Q§(param1 ? §_-7g§ : []);
         }
      }
      
      public function get position() : b2Vec2
      {
         if(this.body == null)
         {
            return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
         }
         return this.body.GetPosition();
      }
      
      public function set position(param1:b2Vec2) : void
      {
         if(this.body == null)
         {
            this.x = param1.x * Game.§_-12A§;
            this.y = param1.y * Game.§_-12A§;
            return;
         }
         var _loc2_:Boolean = false;
         if(this.fixed && Boolean(this.joint))
         {
            _loc2_ = true;
            this.§_-FQ§();
         }
         this.body.SetPosition(param1);
         this.§_-N§();
         if(_loc2_)
         {
            this.§_-pR§();
         }
      }
      
      override public function set alpha(param1:Number) : void
      {
         if(this.§_-g1O§)
         {
            param1 = Math.min(§_-2u§,param1);
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
         this.§_-N§();
         §_-A2O§();
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
            return this.§_-r23§;
         }
         return this.body.GetLinearVelocity();
      }
      
      public function set linearVelocity(param1:b2Vec2) : void
      {
         if(this.body == null)
         {
            this.§_-r23§ = param1;
            this.§_-32u§ = true;
            return;
         }
         this.body.SetLinearVelocity(param1);
      }
      
      public function get angularVelocity() : Number
      {
         if(this.body == null)
         {
            return this.§_-d1b§;
         }
         return this.body.GetAngularVelocity();
      }
      
      public function set angularVelocity(param1:Number) : void
      {
         if(this.body == null)
         {
            this.§_-d1b§ = param1;
            this.§_-32u§ = true;
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
            this.§_-N§();
         }
         this.body.SetActive(this.body.GetPosition().y < 150);
      }
      
      public function §_-N§() : void
      {
         if(this.body == null)
         {
            return;
         }
         var _loc1_:b2Vec2 = this.body.GetPosition();
         this.x = _loc1_.x * Game.§_-12A§;
         this.y = _loc1_.y * Game.§_-12A§;
         this.rotation = this.body.GetAngle() * Game.R2D;
      }
      
      public function §_-m1Y§() : *
      {
         var _loc1_:Array = [];
         var _loc2_:String = this.body != null || this.§_-32u§ ? "1" : "0";
         _loc1_.push([[this.position.x,this.position.y],this.angle,this.ghost,this.fixed,this.fixedRotation,[this.linearVelocity.x,this.linearVelocity.y],this.angularVelocity,_loc2_,this.speed,this.ghostToObject]);
         return _loc1_;
      }
      
      public function §_-o2I§(param1:*) : void
      {
         if(!param1)
         {
            return;
         }
         if(GameBody.§_-W1F§(param1))
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
         this.§_-r23§ = new b2Vec2(param1[0][5][0],param1[0][5][1]);
         this.§_-d1b§ = param1[0][6];
         this.§_-32u§ = param1[0][7] == "1";
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
         return §_-q2c§.§_-wI§;
      }
      
      protected function get §_-B1n§() : uint
      {
         return §_-q2c§.§_-Dx§;
      }
      
      protected function get §_-L1C§() : uint
      {
         return §_-q2c§.§_-ti§;
      }
      
      private function §_-135§() : void
      {
         if(!this.body)
         {
            return;
         }
         if(!this.joint)
         {
            if(!this.§_-O1K§)
            {
               §_-n2T§.§_-U2D§(this.body);
               return;
            }
            §_-n2T§.§_-L4§(this.body);
            this.§_-pR§();
         }
         else
         {
            if(this.§_-O1K§)
            {
               return;
            }
            §_-n2T§.§_-U2D§(this.body);
            this.§_-FQ§();
         }
      }
      
      private function §_-pR§() : void
      {
         var _loc1_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc1_.Initialize(this.body.GetWorld().GetGroundBody(),this.body,this.body.GetPosition());
         _loc1_.enableLimit = true;
         _loc1_.lowerAngle = 0;
         _loc1_.upperAngle = 0;
         this.joint = this.body.GetWorld().CreateJoint(_loc1_);
      }
      
      private function §_-FQ§() : void
      {
         this.body.GetWorld().DestroyJoint(this.joint);
         this.joint = null;
      }
      
      private function §_-o1z§() : void
      {
         if(this.§_-O1X§)
         {
            return;
         }
         if(isNaN(this.body.GetPosition().x) || isNaN(this.body.GetPosition().y) || isNaN(this.body.GetAngle()) || isNaN(this.body.GetLinearVelocity().x) || isNaN(this.body.GetLinearVelocity().y) || isNaN(this.body.GetAngularVelocity()))
         {
            §_-uR§.§_-P1h§(new Error("!!!NaN!!! " + this,666));
            §_-p2U§.add("Error NaN " + JSON.stringify(this.body));
            this.§_-21H§.onError();
            this.§_-O1X§ = true;
         }
      }
      
      private function §_-e12§(param1:int) : void
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

