package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-z12§;
   import §_-8I§.HollowEvent;
   import §_-B1O§.§_-O1q§;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-1s§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.§_-jP§;
   import game.mainGame.entity.§_-p19§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import utils.§_-23z§;
   
   public class §_-Q1J§ extends GameBody implements §_-jP§, §_-Tm§, §_-p19§
   {
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(43 * 0.5 / Game.§_-x2P§,53 * 0.5 / Game.§_-x2P§,new b2Vec2(42 * 0.5 / Game.§_-x2P§,46 * 0.5 / Game.§_-x2P§));
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0,false);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-V2K§:§_-z12§;
      
      private var §_-n11§:§_-d2d§ = new §_-d2d§(new HollowContactMovie());
      
      private var §_-Q8§:§_-d2d§ = new §_-d2d§(new HollowWow());
      
      private var §_-q2k§:Hero;
      
      private var §_-s1D§:§_-23z§;
      
      private var §_-Q2t§:Boolean = false;
      
      private var §_-42R§:§_-h2I§ = new §_-h2I§(new HollowDoor());
      
      private var §_-i1B§:§_-d2d§ = new §_-d2d§(new HollowEyes());
      
      protected var type:int;
      
      public var game:SquirrelGame;
      
      public function §_-Q1J§()
      {
         super();
         var _loc1_:§_-h2I§ = new §_-h2I§();
         _loc1_.x = -20;
         _loc1_.y = -20;
         _loc1_.§_-83v§(new §_-h2I§(this.hollowIcon));
         _loc1_.§_-83v§(this.§_-i1B§);
         _loc1_.§_-83v§(this.§_-42R§);
         this.§_-42R§.x = 20;
         this.§_-42R§.y = 16;
         §_-83v§(_loc1_);
         this.§_-i1B§.§_-o1b§ = 5;
         this.§_-i1B§.loop = true;
         this.§_-n11§.x = 21;
         this.§_-n11§.y = 44;
         this.§_-n11§.visible = false;
         this.§_-n11§.stop();
         this.§_-Q8§.x = -28;
         this.§_-Q8§.y = -27;
         this.§_-Q8§.loop = false;
         this.§_-Q8§.visible = false;
         this.§_-s1D§ = new §_-23z§(_loc1_,new Point());
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
         this.body = param1.CreateBody(§_-E2n§);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(§_-03A§));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         §_-83v§(this.§_-Q8§);
         §_-83v§(this.§_-n11§);
         super.build(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-q2k§ = null;
         if(this.§_-V2K§ == null)
         {
            return;
         }
         this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         this.§_-V2K§ = null;
         this.§_-s1D§ = null;
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
                        this.§_-5d§(new DetectHeroEvent(Hero.self,false));
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
                        §_-92z§.sendMessage(Game.selfId,"[AUTO] Дупло найдено. Телепорт в дупло.",§_-A1n§.§_-N1c§);
                        Game.target = this;
                        Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"pocketTeleport":[Hero.self.id,this.position.x,this.position.y]}));
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
         this.§_-42R§.visible = !(Hero.self && (!Hero.self.isDead && !Hero.self.isHare && Hero.self.§_-426§ && (!Hero.self.shaman || Hero.self.team == this.type && Hero.self.shaman && !this.game.squirrels.§_-TV§())));
         if(this.§_-i1B§.visible == this.§_-42R§.visible)
         {
            this.§_-i1B§.visible = !this.§_-42R§.visible;
            if(this.§_-i1B§.visible)
            {
               this.§_-i1B§.gotoAndPlay(0);
            }
            else
            {
               this.§_-i1B§.gotoAndStop(0);
            }
         }
         if(this.§_-q2k§ == null || this.§_-q2k§.inHollow)
         {
            return;
         }
         this.§_-q2k§.§_-4j§(Hero.§_-VP§);
         this.§_-q2k§.onHollow(this.type);
      }
      
      public function get sideIcon() : §_-h2I§
      {
         return new §_-1s§(§_-1s§.§_-I2j§,§_-1s§.§_-vB§);
      }
      
      public function get showIcon() : Boolean
      {
         return true;
      }
      
      public function get §_-Rc§() : Boolean
      {
         return this.§_-Q2t§;
      }
      
      public function set §_-Rc§(param1:Boolean) : void
      {
         this.§_-Q2t§ = param1;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-52X§;
      }
      
      protected function get hollowIcon() : DisplayObject
      {
         return new Hollow();
      }
      
      protected function §_-5d§(param1:DetectHeroEvent) : void
      {
         if(!param1.hero.§_-426§ || param1.hero.inHollow || param1.hero.isDead || param1.state != DetectHeroEvent.BEGIN_CONTACT)
         {
            return;
         }
         if(param1.hero.isHare)
         {
            return;
         }
         if(param1.hero.shaman && this.game.squirrels.§_-TV§())
         {
            return;
         }
         this.§_-Q8§.visible = true;
         this.§_-Q8§.gotoAndPlay(0);
         if(param1.hero["id"] != Game.selfId && param1.hero["id"] > 0)
         {
            return;
         }
         this.§_-q2k§ = param1.hero;
         this.§_-q2k§.§_-4j§(Hero.§_-VP§);
         this.§_-n11§.gotoAndPlay(0);
         this.§_-n11§.visible = true;
         GameSounds.play("game_win");
         dispatchEvent(new HollowEvent(param1.hero,this.type));
      }
      
      public function get spotSize() : int
      {
         return §_-O1q§.§_-43D§;
      }
   }
}

