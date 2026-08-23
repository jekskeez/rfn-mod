package §_-B1O§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-83V§.GameBody;
   import §_-A2x§.§_-Ar§;
   import §_-RI§.§_-h2I§;
   import flash.display.Shape;
   import flash.events.Event;
   import game.mainGame.§_-8B§;
   import game.mainGame.§_-V§;
   import game.mainGame.§_-W1B§;
   import game.mainGame.§_-s2a§;
   import game.mainGame.entity.§_-R2m§;
   import game.mainGame.entity.§_-o1s§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class Sensor extends GameBody implements §_-22J§, §_-R2m§, §_-8B§, §_-W1B§, §_-o1s§
   {
      
      private static const §_-L2Q§:int = §_-V§.§_-9H§ | §_-V§.§_-tL§;
      
      private static const §_-zX§:int = §_-V§.§_-qV§ | §_-V§.§_-j1I§ | §_-V§.§_-9H§;
      
      public var enabled:Boolean = true;
      
      public var onBeginEnabled:Boolean = true;
      
      public var onEndEnabled:Boolean = true;
      
      public var beginContactScript:String = "";
      
      public var endContactScript:String = "";
      
      public var activateOnHero:Boolean = true;
      
      public var activateOnObject:Boolean = true;
      
      public var haxeScript:Boolean = false;
      
      protected var §_-C2l§:Boolean = false;
      
      protected var §_-87§:Boolean = false;
      
      private var §_-s1Y§:b2Vec2 = new b2Vec2(40 / Game.§_-x2P§,40 / Game.§_-x2P§);
      
      private var world:b2World;
      
      private var §_-z1X§:Array = [];
      
      private var §_-Sn§:int = 0;
      
      private var §_-82j§:Boolean = false;
      
      private var §_-eK§:Object = {};
      
      public function Sensor()
      {
         super();
         this.size = this.size;
         this.fixed = true;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         this.draw();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(new b2BodyDef(false,false,b2Body.b2_dynamicBody));
         if(this.rect)
         {
            this.body.CreateFixture(new b2FixtureDef(b2PolygonShape.AsOrientedBox(this.size.x * 0.5,this.size.y * 0.5,new b2Vec2()),this,0,0,0.1,§_-L2Q§,§_-zX§,0));
         }
         else
         {
            this.body.CreateFixture(new b2FixtureDef(new b2CircleShape(this.§_-s1Y§.x * 0.5),this,0,0,0.1,§_-L2Q§,§_-zX§,0));
         }
         super.build(param1);
         this.world = param1;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.beginContactScript,this.endContactScript,[this.size.x,this.size.y],this.enabled,this.activateOnHero,this.activateOnObject,this.onBeginEnabled,this.onEndEnabled,this.haxeScript]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         var _loc2_:Array = param1[GameBody.§_-u1P§(param1) ? 3 : 1];
         this.beginContactScript = _loc2_[0];
         this.endContactScript = _loc2_[1];
         this.size = new b2Vec2(_loc2_[2][0],_loc2_[2][1]);
         this.enabled = Boolean(_loc2_[3]);
         this.activateOnHero = Boolean(_loc2_[4]);
         this.activateOnObject = Boolean(_loc2_[5]);
         if(!(6 in _loc2_))
         {
            return;
         }
         this.onBeginEnabled = Boolean(_loc2_[6]);
         this.onEndEnabled = Boolean(_loc2_[7]);
         if(!(8 in _loc2_))
         {
            return;
         }
         this.haxeScript = Boolean(_loc2_[8]);
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:Array = null;
         super.update(param1);
         while(this.§_-z1X§.length > 0)
         {
            _loc2_ = this.§_-z1X§.shift();
            this.§_-l1j§(_loc2_[0],_loc2_[1],Boolean(_loc2_[2]));
         }
      }
      
      override public function set showDebug(param1:Boolean) : void
      {
         if(!Game.toggle)
         {
            super.showDebug = true;
            this.visible = true;
            return;
         }
         super.showDebug = param1;
         this.visible = param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         this.world = null;
      }
      
      public function §_-l1j§(param1:String, param2:*, param3:Boolean = false) : void
      {
         var _loc4_:Object = null;
         if(!(this.§_-H2D§ is §_-Ar§) || param3)
         {
            if(param1 == this.beginContactScript && this.contactsCount == 1 || param1 == this.beginContactScript && (this.contactsCount > 0 || param3) && !this.§_-82j§ || param1 == this.endContactScript && this.contactsCount == 0 || !this.§_-87§)
            {
               this.§_-H2D§.scriptUtils.execute(param1,this,{"detectedObject":param2},this.haxeScript ? §_-s2a§.HAXE_SCRIPT : §_-s2a§.LUA_SCRIPT);
               this.§_-82j§ = param1 == this.beginContactScript;
            }
         }
         else
         {
            _loc4_ = {"Sensor":[this.id,param2 ? param2.id : -1,param2 is Hero,param1 == this.beginContactScript ? 0 : 1]};
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify(_loc4_));
         }
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:* = undefined;
         if(param1.GetFixtureA().GetUserData() == this)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         else
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData();
         }
         if(_loc2_ is Hero)
         {
            (_loc2_ as Hero).addEventListener(Hero.§_-Uq§,this.§_-RB§);
            (_loc2_ as Hero).addEventListener(Hero.§_-tl§,this.onRemove);
         }
         if(!this.enabled || !this.onBeginEnabled)
         {
            return;
         }
         if(!this.activateOnHero && _loc2_ is Hero || !this.activateOnObject && _loc2_ is GameBody || _loc2_ == null)
         {
            return;
         }
         if(_loc2_ is Hero && !(_loc2_ as Hero).§_-w1K§)
         {
            return;
         }
         if(!(_loc2_ is Hero) && (!this.§_-H2D§ || !this.§_-H2D§.scriptUtils || !this.§_-H2D§.scriptUtils.§_-Q6§))
         {
            return;
         }
         ++this.contactsCount;
         this.§_-S2K§(_loc2_);
      }
      
      public function endContact(param1:b2Contact) : void
      {
         var _loc2_:* = undefined;
         if(param1.GetFixtureA().GetUserData() == this)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         else
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData();
         }
         if(_loc2_ is Hero)
         {
            (_loc2_ as Hero).removeEventListener(Hero.§_-Uq§,this.§_-RB§);
            (_loc2_ as Hero).removeEventListener(Hero.§_-tl§,this.onRemove);
            if(_loc2_.id > 0 && (!(_loc2_.id in this.§_-eK§) || this.§_-eK§[_loc2_.id] != 1))
            {
               return;
            }
         }
         if(!this.enabled || !this.onEndEnabled)
         {
            return;
         }
         if(!this.activateOnHero && _loc2_ is Hero || !this.activateOnObject && (_loc2_ is GameBody || _loc2_ == null))
         {
            return;
         }
         if(_loc2_ is Hero && !(_loc2_ as Hero).§_-w1K§)
         {
            return;
         }
         if(!(_loc2_ is Hero) && !this.§_-H2D§.scriptUtils.§_-Q6§)
         {
            return;
         }
         --this.contactsCount;
         this.§_-bY§(_loc2_);
      }
      
      public function §_-q§() : Number
      {
         return 0.1 * (int(this.onEndEnabled) + int(this.onBeginEnabled));
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         param1.SetEnabled(false);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function get size() : b2Vec2
      {
         return this.§_-s1Y§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         if(!this.rect)
         {
            param1.x = param1.y = Math.max(param1.x,param1.y);
         }
         param1.x = Math.max(param1.x,0);
         param1.y = Math.max(param1.y,0);
         this.§_-s1Y§ = param1;
         this.draw();
      }
      
      public function get rect() : Boolean
      {
         return this.§_-C2l§;
      }
      
      public function set rect(param1:Boolean) : void
      {
         this.§_-C2l§ = param1;
         this.draw();
      }
      
      public function get contactsCount() : int
      {
         return this.§_-Sn§;
      }
      
      public function set contactsCount(param1:int) : void
      {
         this.§_-Sn§ = param1;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-L2Q§;
      }
      
      protected function §_-S2K§(param1:*, param2:Boolean = false) : void
      {
         if(param1 is Hero)
         {
            this.§_-eK§[param1.id] = 1;
         }
         this.§_-n1F§(this.beginContactScript,param1,param2);
      }
      
      protected function §_-bY§(param1:*, param2:Boolean = false) : void
      {
         if(param1 is Hero)
         {
            this.§_-eK§[param1.id] = 0;
         }
         this.§_-n1F§(this.endContactScript,param1,param2);
      }
      
      protected function draw() : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0,true);
         }
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.clear();
         _loc1_.graphics.lineStyle(1,0,0.5);
         _loc1_.graphics.beginFill(16777215,0.5);
         if(this.rect)
         {
            _loc1_.graphics.drawRect(-(this.§_-s1Y§.x * 0.5) * Game.§_-x2P§,-(this.§_-s1Y§.y * 0.5) * Game.§_-x2P§,this.§_-s1Y§.x * Game.§_-x2P§,this.§_-s1Y§.y * Game.§_-x2P§);
         }
         else
         {
            _loc1_.graphics.drawCircle(0,0,this.§_-s1Y§.x * 0.5 * Game.§_-x2P§);
         }
         _loc1_.graphics.endFill();
         §_-83v§(new §_-h2I§(_loc1_,true));
      }
      
      private function §_-n1F§(param1:String, param2:*, param3:Boolean = false) : void
      {
         this.§_-z1X§.push([param1,param2,param3]);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if(!("Sensor" in _loc2_))
         {
            return;
         }
         var _loc3_:Array = _loc2_["Sensor"];
         if(_loc3_[0] != this.id)
         {
            return;
         }
         var _loc4_:int = int(_loc3_[1]);
         var _loc5_:Boolean = Boolean(_loc3_[2]);
         var _loc6_:Function = _loc3_[3] == 0 ? this.§_-S2K§ : this.§_-bY§;
         if(param1[0] != Game.selfId)
         {
            this.contactsCount += _loc3_[3] == 0 ? 1 : -1;
         }
         _loc6_(_loc5_ ? this.§_-H2D§.squirrels.get(_loc4_) : this.§_-H2D§.map.getObject(_loc4_),true);
      }
      
      private function §_-RB§(param1:Event) : void
      {
         var _loc2_:Hero = param1.currentTarget as Hero;
         _loc2_.removeEventListener(Hero.§_-Uq§,this.§_-RB§);
         if(_loc2_.id > 0 && (!(_loc2_.id in this.§_-eK§) || this.§_-eK§[_loc2_.id] != 1))
         {
            return;
         }
         if(!this.activateOnHero)
         {
            return;
         }
         if(!(_loc2_ as Hero).§_-w1K§)
         {
            return;
         }
         --this.contactsCount;
         this.§_-bY§(_loc2_);
      }
      
      private function onRemove(param1:Event) : void
      {
         var _loc2_:Hero = param1.currentTarget as Hero;
         _loc2_.removeEventListener(Hero.§_-tl§,this.onRemove);
         if(_loc2_.id > 0 && (!(_loc2_.id in this.§_-eK§) || this.§_-eK§[_loc2_.id] != 1))
         {
            return;
         }
         if(!this.activateOnHero)
         {
            return;
         }
         --this.contactsCount;
         this.§_-bY§(_loc2_,true);
      }
   }
}

