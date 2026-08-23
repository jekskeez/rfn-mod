package §_-j2H§
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
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import §_-td§.§_-vO§;
   import flash.display.Shape;
   import flash.events.Event;
   import game.mainGame.§_-Q2d§;
   import game.mainGame.§_-d7§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.§_-s1V§;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-p1Z§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class Sensor extends GameBody implements §_-Pn§, §_-41O§, §_-Q2d§, §_-d7§, §_-p1Z§
   {
      
      private static const §_-CT§:int = §_-q2c§.§_-Dx§ | §_-q2c§.§_-Wp§;
      
      private static const §_-81p§:int = §_-q2c§.§_-rT§ | §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§;
      
      public var enabled:Boolean = true;
      
      public var onBeginEnabled:Boolean = true;
      
      public var onEndEnabled:Boolean = true;
      
      public var beginContactScript:String = "";
      
      public var endContactScript:String = "";
      
      public var activateOnHero:Boolean = true;
      
      public var activateOnObject:Boolean = true;
      
      public var haxeScript:Boolean = false;
      
      protected var §_-13n§:Boolean = false;
      
      protected var §_-M5§:Boolean = false;
      
      private var §_-y1d§:b2Vec2 = new b2Vec2(40 / Game.§_-12A§,40 / Game.§_-12A§);
      
      private var world:b2World;
      
      private var §_-018§:Array = [];
      
      private var §_-v9§:int = 0;
      
      private var §_-fA§:Boolean = false;
      
      private var §_-a1§:Object = {};
      
      public function Sensor()
      {
         super();
         this.size = this.size;
         this.fixed = true;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         this.draw();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(new b2BodyDef(false,false,b2Body.b2_dynamicBody));
         if(this.rect)
         {
            this.body.CreateFixture(new b2FixtureDef(b2PolygonShape.AsOrientedBox(this.size.x * 0.5,this.size.y * 0.5,new b2Vec2()),this,0,0,0.1,§_-CT§,§_-81p§,0));
         }
         else
         {
            this.body.CreateFixture(new b2FixtureDef(new b2CircleShape(this.§_-y1d§.x * 0.5),this,0,0,0.1,§_-CT§,§_-81p§,0));
         }
         super.build(param1);
         this.world = param1;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.beginContactScript,this.endContactScript,[this.size.x,this.size.y],this.enabled,this.activateOnHero,this.activateOnObject,this.onBeginEnabled,this.onEndEnabled,this.haxeScript]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         var _loc2_:Array = param1[GameBody.§_-W1F§(param1) ? 3 : 1];
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
         while(this.§_-018§.length > 0)
         {
            _loc2_ = this.§_-018§.shift();
            this.§_-43w§(_loc2_[0],_loc2_[1],Boolean(_loc2_[2]));
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
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         this.world = null;
      }
      
      public function §_-43w§(param1:String, param2:*, param3:Boolean = false) : void
      {
         var _loc4_:Object = null;
         if(!(this.§_-21H§ is §_-vO§) || param3)
         {
            if(param1 == this.beginContactScript && this.contactsCount == 1 || param1 == this.beginContactScript && (this.contactsCount > 0 || param3) && !this.§_-fA§ || param1 == this.endContactScript && this.contactsCount == 0 || !this.§_-M5§)
            {
               this.§_-21H§.scriptUtils.execute(param1,this,{"detectedObject":param2},this.haxeScript ? §_-s1V§.HAXE_SCRIPT : §_-s1V§.LUA_SCRIPT);
               this.§_-fA§ = param1 == this.beginContactScript;
            }
         }
         else
         {
            _loc4_ = {"Sensor":[this.id,param2 ? param2.id : -1,param2 is Hero,param1 == this.beginContactScript ? 0 : 1]};
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify(_loc4_));
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
            (_loc2_ as Hero).addEventListener(Hero.§_-h1i§,this.§_-tw§);
            (_loc2_ as Hero).addEventListener(Hero.§_-K1I§,this.onRemove);
         }
         if(!this.enabled || !this.onBeginEnabled)
         {
            return;
         }
         if(!this.activateOnHero && _loc2_ is Hero || !this.activateOnObject && _loc2_ is GameBody || _loc2_ == null)
         {
            return;
         }
         if(_loc2_ is Hero && !(_loc2_ as Hero).§_-Q2z§)
         {
            return;
         }
         if(!(_loc2_ is Hero) && (!this.§_-21H§ || !this.§_-21H§.scriptUtils || !this.§_-21H§.scriptUtils.§_-v1f§))
         {
            return;
         }
         ++this.contactsCount;
         this.§_-T1W§(_loc2_);
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
            (_loc2_ as Hero).removeEventListener(Hero.§_-h1i§,this.§_-tw§);
            (_loc2_ as Hero).removeEventListener(Hero.§_-K1I§,this.onRemove);
            if(_loc2_.id > 0 && (!(_loc2_.id in this.§_-a1§) || this.§_-a1§[_loc2_.id] != 1))
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
         if(_loc2_ is Hero && !(_loc2_ as Hero).§_-Q2z§)
         {
            return;
         }
         if(!(_loc2_ is Hero) && !this.§_-21H§.scriptUtils.§_-v1f§)
         {
            return;
         }
         --this.contactsCount;
         this.§_-TZ§(_loc2_);
      }
      
      public function §_-u2W§() : Number
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
         return this.§_-y1d§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         if(!this.rect)
         {
            param1.x = param1.y = Math.max(param1.x,param1.y);
         }
         param1.x = Math.max(param1.x,0);
         param1.y = Math.max(param1.y,0);
         this.§_-y1d§ = param1;
         this.draw();
      }
      
      public function get rect() : Boolean
      {
         return this.§_-13n§;
      }
      
      public function set rect(param1:Boolean) : void
      {
         this.§_-13n§ = param1;
         this.draw();
      }
      
      public function get contactsCount() : int
      {
         return this.§_-v9§;
      }
      
      public function set contactsCount(param1:int) : void
      {
         this.§_-v9§ = param1;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-CT§;
      }
      
      protected function §_-T1W§(param1:*, param2:Boolean = false) : void
      {
         if(param1 is Hero)
         {
            this.§_-a1§[param1.id] = 1;
         }
         this.§_-uX§(this.beginContactScript,param1,param2);
      }
      
      protected function §_-TZ§(param1:*, param2:Boolean = false) : void
      {
         if(param1 is Hero)
         {
            this.§_-a1§[param1.id] = 0;
         }
         this.§_-uX§(this.endContactScript,param1,param2);
      }
      
      protected function draw() : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0,true);
         }
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.clear();
         _loc1_.graphics.lineStyle(1,0,0.5);
         _loc1_.graphics.beginFill(16777215,0.5);
         if(this.rect)
         {
            _loc1_.graphics.drawRect(-(this.§_-y1d§.x * 0.5) * Game.§_-12A§,-(this.§_-y1d§.y * 0.5) * Game.§_-12A§,this.§_-y1d§.x * Game.§_-12A§,this.§_-y1d§.y * Game.§_-12A§);
         }
         else
         {
            _loc1_.graphics.drawCircle(0,0,this.§_-y1d§.x * 0.5 * Game.§_-12A§);
         }
         _loc1_.graphics.endFill();
         §_-J2J§(new §_-aS§(_loc1_,true));
      }
      
      private function §_-uX§(param1:String, param2:*, param3:Boolean = false) : void
      {
         this.§_-018§.push([param1,param2,param3]);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
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
         var _loc6_:Function = _loc3_[3] == 0 ? this.§_-T1W§ : this.§_-TZ§;
         if(param1[0] != Game.selfId)
         {
            this.contactsCount += _loc3_[3] == 0 ? 1 : -1;
         }
         _loc6_(_loc5_ ? this.§_-21H§.squirrels.get(_loc4_) : this.§_-21H§.map.getObject(_loc4_),true);
      }
      
      private function §_-tw§(param1:Event) : void
      {
         var _loc2_:Hero = param1.currentTarget as Hero;
         _loc2_.removeEventListener(Hero.§_-h1i§,this.§_-tw§);
         if(_loc2_.id > 0 && (!(_loc2_.id in this.§_-a1§) || this.§_-a1§[_loc2_.id] != 1))
         {
            return;
         }
         if(!this.activateOnHero)
         {
            return;
         }
         if(!(_loc2_ as Hero).§_-Q2z§)
         {
            return;
         }
         --this.contactsCount;
         this.§_-TZ§(_loc2_);
      }
      
      private function onRemove(param1:Event) : void
      {
         var _loc2_:Hero = param1.currentTarget as Hero;
         _loc2_.removeEventListener(Hero.§_-K1I§,this.onRemove);
         if(_loc2_.id > 0 && (!(_loc2_.id in this.§_-a1§) || this.§_-a1§[_loc2_.id] != 1))
         {
            return;
         }
         if(!this.activateOnHero)
         {
            return;
         }
         --this.contactsCount;
         this.§_-TZ§(_loc2_,true);
      }
   }
}

