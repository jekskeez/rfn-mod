package §_-I1q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-81P§.§_-61P§;
   import §_-81P§.§_-f1D§;
   import §_-8Q§.GameBody;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-F5§.§_-Y1d§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-j2E§.§_-A11§;
   import §_-j4§.§_-Pn§;
   import flash.events.Event;
   import flash.geom.Point;
   import game.mainGame.Cast;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-p0§;
   import game.mainGame.entity.§_-sn§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import starling.core.Starling;
   import starling.textures.§_-RS§;
   
   public class §_-r2T§ extends GameBody implements §_-71b§, §_-Y1d§, §_-sn§, §_-Pn§, §_-p0§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = 1;
      
      private static const §_-j1s§:int = 100;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(9 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,10,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,true,b2Body.b2_dynamicBody);
      
      protected var §_-837§:Boolean = false;
      
      protected var §_-Q26§:Number = 100;
      
      protected var §_-C1L§:Boolean = false;
      
      protected var §_-42p§:Cast = null;
      
      protected var §_-32K§:§_-aS§ = null;
      
      protected var view:§_-aS§;
      
      protected var §_-e20§:§_-f1u§;
      
      protected var §_-W1u§:§_-11u§;
      
      private var §_-J1H§:Number;
      
      public function §_-r2T§()
      {
         super();
         this.view = new §_-aS§(new WitchBombView());
         this.view.scaleXY(0.5,0.5);
         this.view.§_-i18§();
         §_-J2J§(this.view);
         this.§_-e20§ = new §_-f1u§(new WitchBombExplodeView());
         this.§_-e20§.scaleXY(0.5,0.5);
         this.§_-e20§.visible = false;
         this.§_-e20§.stop();
         this.§_-e20§.x = -6;
         this.§_-e20§.y = -17;
         §_-J2J§(this.§_-e20§);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(this.velocity,0)));
         if(this.§_-W1u§)
         {
            §_-w10§.instance.§_-L1c§(this.§_-W1u§);
         }
         this.§_-W1u§ = §_-w10§.instance.§_-d1y§(this.effectName);
         this.§_-W1u§.view.visible = false;
         this.§_-W1u§.view.smoothing = §_-RS§.§_-ww§;
      }
      
      protected function get effectName() : String
      {
         return §_-w10§.§_-H2I§;
      }
      
      override public function dispose() : void
      {
         var _loc1_:§_-f1D§ = null;
         this.§_-42p§ = null;
         if(this.§_-32K§)
         {
            this.§_-32K§ = null;
         }
         this.view.removeFromParent();
         this.§_-e20§.stop();
         this.§_-e20§.removeFromParent(true);
         if(this.§_-W1u§)
         {
            _loc1_ = new §_-f1D§(this.§_-W1u§.view,0.2,§_-61P§.§_-fq§);
            _loc1_.§_-02Q§("alpha",0);
            _loc1_.onComplete = this.§_-L1c§;
            Starling.§_-zb§.add(_loc1_);
         }
         super.dispose();
      }
      
      private function §_-L1c§() : void
      {
         if(this.§_-W1u§)
         {
            this.§_-W1u§.stop();
            §_-w10§.instance.§_-L1c§(this.§_-W1u§);
            this.§_-W1u§ = null;
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         this.body.SetBullet(this.body.GetLinearVelocity().Length() > 100);
         if(!this.aging || this.§_-C1L§)
         {
            return;
         }
         this.§_-Q26§ -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-th§();
         }
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.lifeTime,this.velocity]);
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.lifeTime = param1[1][0];
         this.velocity = param1[1][1];
         this.playerId = param1[2][0];
      }
      
      public function get aging() : Boolean
      {
         return this.§_-837§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-837§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-Q26§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-Q26§ = param1;
      }
      
      public function set cast(param1:Cast) : void
      {
         this.§_-42p§ = param1;
      }
      
      public function §_-52N§() : void
      {
         this.§_-42p§.§_-g1h§ = 0;
      }
      
      public function §_-23C§() : void
      {
         if(!this.§_-42p§)
         {
            return;
         }
         this.§_-42p§.§_-g1h§ = NaN;
      }
      
      public function get maxVelocity() : Number
      {
         return this.velocity;
      }
      
      public function get aimCursor() : §_-aS§
      {
         if(this.§_-32K§ == null)
         {
            this.§_-32K§ = new §_-aS§(new PoiseArrow());
         }
         return this.§_-32K§;
      }
      
      public function §_-a2l§(param1:Point) : void
      {
         var _loc2_:b2Vec2 = new b2Vec2(param1.x / Game.§_-12A§,param1.y / Game.§_-12A§);
         var _loc3_:Number = Math.atan2(_loc2_.y - this.position.y,_loc2_.x - this.position.x);
         param1 = param1.subtract(new Point(this.x,this.y));
         this.§_-32K§.x = this.x;
         this.§_-32K§.y = this.y;
         this.§_-32K§.rotation = 0;
         this.§_-32K§.scaleX = 1;
         this.velocity = Math.min(int(param1.length),§_-j1s§);
         this.§_-32K§.scaleX = this.velocity / this.§_-32K§.width;
         this.§_-32K§.rotation = _loc3_ * Game.R2D;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var contact:b2Contact = param1;
         if(this.fixed || this.§_-C1L§)
         {
            return;
         }
         this.fixed = true;
         this.view.visible = false;
         this.§_-e20§.addEventListener(Event.COMPLETE,this.§_-i2Q§);
         this.§_-e20§.visible = true;
         this.§_-e20§.loop = false;
         this.§_-e20§.play();
         GameSounds.play("sheep_bomb");
         this.§_-W1u§.view.visible = true;
         this.§_-W1u§.view.§_-L2Z§ = this.x;
         this.§_-W1u§.view.§_-2F§ = this.y;
         this.§_-W1u§.start();
         try
         {
            this.§_-21H§.map.§_-n2B§.§_-J2J§(this.§_-W1u§.view);
         }
         catch(e:Error)
         {
            §_-p2U§.add("Error" + e.getStackTrace());
         }
         this.§_-M1S§();
         GameSounds.play("halloween_bomb_explode");
      }
      
      public function get velocity() : Number
      {
         return this.§_-J1H§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-J1H§ = param1;
      }
      
      protected function §_-M1S§() : void
      {
         var hero:Hero = null;
         var pos:b2Vec2 = null;
         if(Game.selfId != this.playerId)
         {
            return;
         }
         try
         {
            for each(hero in this.§_-21H§.squirrels.players)
            {
               if(hero.id != this.playerId)
               {
                  pos = this.position.Copy();
                  pos.Subtract(hero.position);
                  if(pos.Length() <= 8)
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-u22§,§_-A11§.§_-81o§,hero.id,0);
                  }
               }
            }
         }
         catch(e:Error)
         {
            §_-p2U§.add("Error" + e.getStackTrace());
         }
      }
      
      protected function §_-i2Q§(param1:Event) : void
      {
         this.aging = true;
         this.§_-e20§.removeEventListener(Event.COMPLETE,this.§_-i2Q§);
         this.§_-e20§.visible = false;
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         param1.SetEnabled(false);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}

