package §_-u2r§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-1§.§_-7F§;
   import §_-1§.§_-vk§;
   import §_-51g§.§_-z12§;
   import §_-83V§.GameBody;
   import §_-B1O§.§_-O1q§;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-h2I§;
   import §_-S2§.Perk;
   import flash.display.MovieClip;
   import flash.utils.setTimeout;
   import game.mainGame.§_-1s§;
   import game.mainGame.§_-jP§;
   import game.mainGame.entity.§_-p19§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-q22§ extends GameBody implements §_-jP§, §_-p19§
   {
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(15 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0,false);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-V2K§:§_-z12§ = null;
      
      private var §_-42S§:Boolean = false;
      
      private var view:MovieClip = null;
      
      private var §_-33S§:Array = null;
      
      private var hero:Hero = null;
      
      private var §_-Q2t§:Boolean = false;
      
      public var §_-I1z§:Boolean = true;
      
      public var §_-WN§:int;
      
      public function §_-q22§()
      {
         this.fixed = true;
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         this.view = this.§_-I1z§ ? new BlackMagicianCard() : new RedMagicianCard();
         §_-83v§(new §_-h2I§(this.view));
         this.body = param1.CreateBody(§_-E2n§);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(§_-03A§));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         super.build(param1);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-Q1g§]);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-Q1g§]);
         if(§_-ws§(this.view))
         {
            removeChildStarling(this.view);
         }
         if(this.§_-V2K§ == null)
         {
            return;
         }
         this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         this.§_-V2K§ = null;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId,this.§_-I1z§ ? 1 : 0,this.§_-WN§]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.playerId = param1[1][0];
         this.§_-I1z§ = param1[1][1] == 1;
         this.§_-WN§ = param1[1][2];
      }
      
      public function get sideIcon() : §_-h2I§
      {
         return new §_-1s§(§_-1s§.§_-F2F§,§_-1s§.§_-wY§);
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
      
      private function §_-5d§(param1:DetectHeroEvent) : void
      {
         if(param1.hero.id != Game.selfId && param1.hero.id > 0)
         {
            return;
         }
         if(param1.hero.isDead || param1.hero.isHare || param1.hero.shaman)
         {
            return;
         }
         if(this.§_-42S§)
         {
            return;
         }
         this.hero = param1.hero;
         this.§_-m4§();
         this.§_-42S§ = true;
      }
      
      private function §_-m4§() : void
      {
         var _loc1_:Perk = null;
         this.§_-33S§ = [];
         for each(_loc1_ in this.hero.perkController.§_-s13§)
         {
            if(!(_loc1_.active || _loc1_ is §_-vk§ || _loc1_ is §_-7F§))
            {
               this.§_-33S§.push(_loc1_.§_-i2D§);
            }
         }
         this.§_-p1c§();
         if(this.§_-33S§.length > 0)
         {
            setTimeout(this.§_-p1c§,1500);
         }
      }
      
      private function §_-p1c§() : void
      {
         var _loc1_:int = Math.random() * this.§_-33S§.length;
         if(this.§_-33S§.length == 0)
         {
            Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-WN§,this.playerId);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-WN§,this.playerId,this.§_-33S§[_loc1_]);
         }
         this.§_-33S§.splice(_loc1_,1);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[0] != this.§_-WN§)
         {
            return;
         }
         if(!("2" in param1) || param1[2] != this.playerId)
         {
            return;
         }
         if(!this.§_-H2D§)
         {
            return;
         }
         this.§_-H2D§.squirrels.get(param1[1]).heroView.§_-634§(this.view);
         if(!this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
      
      public function get spotSize() : int
      {
         return §_-O1q§.§_-c2I§;
      }
   }
}

