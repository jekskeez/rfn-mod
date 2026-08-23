package §_-8Q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-j4§.§_-43y§;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import game.mainGame.§_-q2c§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-IE§ extends GameBody
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-Z1b§:Number = 0.1;
      
      private static const §_-93w§:int = 1000;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsVector(§_-M1z§,0);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,2,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-aS§ = null;
      
      private var §_-n2L§:§_-aS§ = null;
      
      private var §_-e2v§:Number = 20;
      
      private var §_-b1J§:§_-43y§ = null;
      
      private var squirrels:Array = [];
      
      private var §_-I1t§:Number = 0;
      
      private var §_-t27§:Hero = null;
      
      private var §_-r2U§:Number = 0;
      
      public var power:Number = 200;
      
      public var active:Boolean = true;
      
      public var selfDirection:Boolean = true;
      
      public function §_-IE§()
      {
         super();
         this.view = new §_-aS§(new HomingGunImg());
         §_-J2J§(this.view);
         this.§_-n2L§ = new §_-aS§(new PerkRadius());
         this.§_-r2U§ = this.§_-n2L§.width;
         §_-J2J§(this.§_-n2L§);
         this.radius = 200;
         this.fixed = true;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      private static function get §_-M1z§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(0.4,-1.2));
         _loc1_.push(new b2Vec2(2.2,-1.2));
         _loc1_.push(new b2Vec2(4,-0.9));
         _loc1_.push(new b2Vec2(4,0.9));
         _loc1_.push(new b2Vec2(2.2,1.2));
         _loc1_.push(new b2Vec2(0.4,1.2));
         _loc1_.push(new b2Vec2(-1,0));
         return _loc1_;
      }
      
      override public function set showDebug(param1:Boolean) : void
      {
         super.showDebug = param1;
         this.§_-n2L§.visible = this.§_-m2u§;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         super.build(param1);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(new b2FixtureDef(new b2CircleShape(this.radius / Game.§_-12A§),null,0.8,0.1,2,§_-q2c§.§_-Wp§,§_-q2c§.§_-rT§,0,true)));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = int(this.squirrels.length - 1);
         while(_loc1_ >= 0)
         {
            this.§_-u1L§(this.squirrels[_loc1_]);
            _loc1_--;
         }
         this.squirrels = null;
         if(this.§_-b1J§)
         {
            this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         }
         this.§_-b1J§ = null;
         this.§_-t27§ = null;
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.radius,this.power,this.active,this.§_-I1t§,this.selfDirection]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.radius = param1[1][0];
         this.power = param1[1][1];
         this.active = Boolean(param1[1][2]);
         this.§_-I1t§ = param1[1][3];
         if(4 in param1[1])
         {
            this.selfDirection = param1[1][4];
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body == null)
         {
            return;
         }
         if(this.§_-I1t§ > 0)
         {
            this.§_-I1t§ -= param1 * 1000;
            return;
         }
         if(!this.active)
         {
            return;
         }
         if(this.squirrels.length == 0)
         {
            return;
         }
         if(this.§_-t27§ != null)
         {
            return;
         }
         var _loc2_:Hero = this.squirrels[0];
         if(_loc2_ == null || _loc2_.isDead || _loc2_.inHollow)
         {
            return;
         }
         var _loc3_:Number = Math.atan2(_loc2_.position.y - this.position.y,_loc2_.position.x - this.position.x);
         var _loc4_:Number = _loc3_ - this.angle;
         if(Math.abs(_loc4_) > Math.PI)
         {
            _loc4_ += Math.PI * 2 * (_loc3_ <= 0 ? 1 : -1);
         }
         if(Math.abs(_loc4_) < §_-Z1b§)
         {
            this.§_-t27§ = _loc2_;
            this.§_-E2§(_loc2_.id);
            return;
         }
         if(!this.selfDirection)
         {
            return;
         }
         this.fixed = false;
         this.angle += (_loc4_ > 0 ? 1 : -1) * §_-Z1b§;
         this.fixed = true;
      }
      
      public function set radius(param1:Number) : void
      {
         this.§_-e2v§ = param1 / Game.§_-12A§;
         this.§_-n2L§.scaleXY(param1 * 2 / this.§_-r2U§);
      }
      
      public function get radius() : Number
      {
         return this.§_-e2v§ * Game.§_-12A§;
      }
      
      private function §_-E2§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.§_-1s§(this.angle);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"cannonShoot":[this.id,this.angle]}));
         }
      }
      
      private function §_-1s§(param1:Number) : void
      {
         this.fixed = false;
         this.angle = param1;
         this.fixed = true;
         this.§_-I1t§ = §_-93w§;
         this.§_-t27§ = null;
         if(Boolean(this.§_-21H§) && !this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc2_:§_-n1v§ = new §_-n1v§();
         _loc2_.angle = param1;
         _loc2_.position = this.body.GetWorldPoint(new b2Vec2(6,0));
         _loc2_.velocity = this.power;
         this.§_-21H§.map.§_-TP§(_loc2_,true);
      }
      
      private function §_-M2L§(param1:DetectHeroEvent) : void
      {
         var _loc2_:Hero = param1.hero;
         if(_loc2_.inHollow)
         {
            return;
         }
         var _loc3_:int = this.squirrels.indexOf(_loc2_);
         if(param1.state == DetectHeroEvent.BEGIN_CONTACT && _loc3_ == -1)
         {
            this.squirrels.push(_loc2_);
            _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
            _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
            _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         }
         else if(param1.state == DetectHeroEvent.END_CONTACT)
         {
            this.§_-u1L§(_loc2_);
         }
      }
      
      private function §_-u1L§(param1:Hero) : void
      {
         var _loc2_:int = this.squirrels.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         this.squirrels.splice(_loc2_,1);
         param1.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         param1.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         param1.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-u1L§(param1["player"]);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if("cannonShoot" in _loc2_)
         {
            if(_loc2_["cannonShoot"][0] != this.id)
            {
               return;
            }
            this.§_-1s§(_loc2_["cannonShoot"][1]);
         }
      }
   }
}

