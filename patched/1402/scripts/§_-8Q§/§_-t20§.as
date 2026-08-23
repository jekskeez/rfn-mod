package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X2V§.HollowEvent;
   import §_-c2C§.§_-u24§;
   import §_-j2H§.§_-D1T§;
   import §_-j4§.§_-43y§;
   import chat.§_-g1j§;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-D1m§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.§_-jC§;
   import game.mainGame.entity.§_-p2r§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import utils.§_-L14§;
   
   public class §_-t20§ extends GameBody implements §_-jC§, §_-F1c§, §_-p2r§
   {
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(43 * 0.5 / Game.§_-12A§,53 * 0.5 / Game.§_-12A§,new b2Vec2(42 * 0.5 / Game.§_-12A§,46 * 0.5 / Game.§_-12A§));
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0,false);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-b1J§:§_-43y§;
      
      private var §_-22B§:§_-f1u§ = new §_-f1u§(new HollowContactMovie());
      
      private var §_-S1D§:§_-f1u§ = new §_-f1u§(new HollowWow());
      
      private var §_-Y1s§:Hero;
      
      private var §_-r1V§:§_-L14§;
      
      private var §_-Z2g§:Boolean = false;
      
      private var §_-2m§:§_-aS§ = new §_-aS§(new HollowDoor());
      
      private var §_-71C§:§_-f1u§ = new §_-f1u§(new HollowEyes());
      
      protected var type:int;
      
      public var game:SquirrelGame;
      
      public function §_-t20§()
      {
         super();
         var _loc1_:§_-aS§ = new §_-aS§();
         _loc1_.x = -20;
         _loc1_.y = -20;
         _loc1_.§_-J2J§(new §_-aS§(this.hollowIcon));
         _loc1_.§_-J2J§(this.§_-71C§);
         _loc1_.§_-J2J§(this.§_-2m§);
         this.§_-2m§.x = 20;
         this.§_-2m§.y = 16;
         §_-J2J§(_loc1_);
         this.§_-71C§.§_-r2X§ = 5;
         this.§_-71C§.loop = true;
         this.§_-22B§.x = 21;
         this.§_-22B§.y = 44;
         this.§_-22B§.visible = false;
         this.§_-22B§.stop();
         this.§_-S1D§.x = -28;
         this.§_-S1D§.y = -27;
         this.§_-S1D§.loop = false;
         this.§_-S1D§.visible = false;
         this.§_-r1V§ = new §_-L14§(_loc1_,new Point());
         this.fixed = true;
      }
      
      override public function get ghost() : Boolean
      {
         return false;
      }
      
      override public function set ghost(param1:Boolean) : void
      {
         if(param1)
         {
         }
         super.ghost = false;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         §_-J2J§(this.§_-S1D§);
         §_-J2J§(this.§_-22B§);
         super.build(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-Y1s§ = null;
         if(this.§_-b1J§ == null)
         {
            return;
         }
         this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         this.§_-b1J§ = null;
         this.§_-r1V§ = null;
      }
      
      override public function update(param1:Number = 0) : void
      {
         if(Game.activated)
         {
            if(Game.state == 8)
            {
               if(Hero.self != null)
               {
                  if(!Hero.self.inHollow)
                  {
                     if(getTimer() - Game.time >= 1200)
                     {
                        this.§_-M2L§(new DetectHeroEvent(Hero.self,false));
                        Game.time = getTimer();
                     }
                  }
               }
            }
         }
         if(Game.activated)
         {
            if(!Game.toggle)
            {
               if(Hero.self != null)
               {
                  if(Game.state == 6)
                  {
                     if(this.visible)
                     {
                        §_-u24§.sendMessage(Game.selfId,"[AUTO] Дупло найдено. Телепорт в дупло.",§_-g1j§.§_-j1p§);
                        Game.target = this;
                        Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"pocketTeleport":[Hero.self.id,this.position.x,this.position.y]}));
                        Hero.self.position = this.position;
                        Hero.self.velocity = new b2Vec2();
                        Hero.self.sendLocation();
                        Game.state = 7;
                        Game.time = getTimer();
                        return;
                     }
                  }
               }
            }
         }
         if(Game.activated)
         {
            if(!Game.toggle)
            {
               if(Hero.self != null)
               {
                  if(Game.state == 6)
                  {
                     if(this.visible)
                     {
                        Game.target = this;
                        Hero.self.position = this.position;
                        Hero.self.velocity = new b2Vec2();
                        Hero.self.sendLocation();
                        Game.state = 7;
                        Game.time = getTimer();
                        return;
                     }
                  }
                  else if(Game.state == 7)
                  {
                     if(this === Game.target)
                     {
                        Hero.self.position = this.position;
                        Hero.self.velocity = new b2Vec2();
                        if(getTimer() - Game.time < 1000)
                        {
                           return;
                        }
                        Hero.self.sendLocation();
                        Game.state = 8;
                     }
                  }
                  else if(Game.state == 8)
                  {
                     if(this === Game.target)
                     {
                        Hero.self.position = this.position;
                        Hero.self.velocity = new b2Vec2();
                     }
                  }
               }
            }
         }
         super.update(param1);
         this.§_-2m§.visible = !(Hero.self && (!Hero.self.isDead && !Hero.self.isHare && Hero.self.§_-62F§ && (!Hero.self.shaman || Hero.self.team == this.type && Hero.self.shaman && !this.game.squirrels.§_-Un§())));
         if(this.§_-71C§.visible == this.§_-2m§.visible)
         {
            this.§_-71C§.visible = !this.§_-2m§.visible;
            if(this.§_-71C§.visible)
            {
               this.§_-71C§.gotoAndPlay(0);
            }
            else
            {
               this.§_-71C§.gotoAndStop(0);
            }
         }
         if(this.§_-Y1s§ == null || this.§_-Y1s§.inHollow)
         {
            return;
         }
         this.§_-Y1s§.§_-I1u§(Hero.§_-z2T§);
         this.§_-Y1s§.onHollow(this.type);
      }
      
      public function get sideIcon() : §_-aS§
      {
         return new §_-D1m§(§_-D1m§.§_-o1U§,§_-D1m§.§_-Ir§);
      }
      
      public function get showIcon() : Boolean
      {
         return true;
      }
      
      public function get §_-P2t§() : Boolean
      {
         return this.§_-Z2g§;
      }
      
      public function set §_-P2t§(param1:Boolean) : void
      {
         this.§_-Z2g§ = param1;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-53X§;
      }
      
      protected function get hollowIcon() : DisplayObject
      {
         return new Hollow();
      }
      
      protected function §_-M2L§(param1:DetectHeroEvent) : void
      {
         if(!param1.hero.§_-62F§ || param1.hero.inHollow || param1.hero.isDead || param1.state != DetectHeroEvent.BEGIN_CONTACT)
         {
            return;
         }
         if(param1.hero.isHare)
         {
            return;
         }
         if(param1.hero.shaman && this.game.squirrels.§_-Un§())
         {
            return;
         }
         this.§_-S1D§.visible = true;
         this.§_-S1D§.gotoAndPlay(0);
         if(param1.hero["id"] != Game.selfId && param1.hero["id"] > 0)
         {
            return;
         }
         this.§_-Y1s§ = param1.hero;
         this.§_-Y1s§.§_-I1u§(Hero.§_-z2T§);
         this.§_-22B§.gotoAndPlay(0);
         this.§_-22B§.visible = true;
         GameSounds.play("game_win");
         dispatchEvent(new HollowEvent(param1.hero,this.type));
      }
      
      public function get spotSize() : int
      {
         return §_-D1T§.§_-12O§;
      }
   }
}

