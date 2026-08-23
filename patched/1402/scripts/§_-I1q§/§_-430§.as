package §_-I1q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-5P§.§_-A1n§;
   import §_-5P§.§_-F2D§;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import §_-WJ§.DetectHeroEvent;
   import §_-j2H§.§_-D1T§;
   import §_-j4§.§_-43y§;
   import §_-n1h§.Perk;
   import flash.display.MovieClip;
   import flash.utils.setTimeout;
   import game.mainGame.§_-D1m§;
   import game.mainGame.§_-jC§;
   import game.mainGame.entity.§_-p2r§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-430§ extends GameBody implements §_-jC§, §_-p2r§
   {
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(15 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0,false);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-b1J§:§_-43y§ = null;
      
      private var §_-D27§:Boolean = false;
      
      private var view:MovieClip = null;
      
      private var §_-62C§:Array = null;
      
      private var hero:Hero = null;
      
      private var §_-Z2g§:Boolean = false;
      
      public var §_-2S§:Boolean = true;
      
      public var §_-o1r§:int;
      
      public function §_-430§()
      {
         this.fixed = true;
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         this.view = this.§_-2S§ ? new BlackMagicianCard() : new RedMagicianCard();
         §_-J2J§(new §_-aS§(this.view));
         this.body = param1.CreateBody(§_-41z§);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         super.build(param1);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-u22§]);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-u22§]);
         if(§_-U2E§(this.view))
         {
            removeChildStarling(this.view);
         }
         if(this.§_-b1J§ == null)
         {
            return;
         }
         this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         this.§_-b1J§ = null;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId,this.§_-2S§ ? 1 : 0,this.§_-o1r§]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.playerId = param1[1][0];
         this.§_-2S§ = param1[1][1] == 1;
         this.§_-o1r§ = param1[1][2];
      }
      
      public function get sideIcon() : §_-aS§
      {
         return new §_-D1m§(§_-D1m§.§_-S27§,§_-D1m§.§_-82E§);
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
      
      private function §_-M2L§(param1:DetectHeroEvent) : void
      {
         if(param1.hero.id != Game.selfId && param1.hero.id > 0)
         {
            return;
         }
         if(param1.hero.isDead || param1.hero.isHare || param1.hero.shaman)
         {
            return;
         }
         if(this.§_-D27§)
         {
            return;
         }
         this.hero = param1.hero;
         this.§_-Z1y§();
         this.§_-D27§ = true;
      }
      
      private function §_-Z1y§() : void
      {
         var _loc1_:Perk = null;
         this.§_-62C§ = [];
         for each(_loc1_ in this.hero.perkController.§_-rI§)
         {
            if(!(_loc1_.active || _loc1_ is §_-A1n§ || _loc1_ is §_-F2D§))
            {
               this.§_-62C§.push(_loc1_.§_-T2a§);
            }
         }
         this.§_-R24§();
         if(this.§_-62C§.length > 0)
         {
            setTimeout(this.§_-R24§,1500);
         }
      }
      
      private function §_-R24§() : void
      {
         var _loc1_:int = Math.random() * this.§_-62C§.length;
         if(this.§_-62C§.length == 0)
         {
            Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-o1r§,this.playerId);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-o1r§,this.playerId,this.§_-62C§[_loc1_]);
         }
         this.§_-62C§.splice(_loc1_,1);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[0] != this.§_-o1r§)
         {
            return;
         }
         if(!("2" in param1) || param1[2] != this.playerId)
         {
            return;
         }
         if(!this.§_-21H§)
         {
            return;
         }
         this.§_-21H§.squirrels.get(param1[1]).heroView.§_-Y15§(this.view);
         if(!this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
      
      public function get spotSize() : int
      {
         return §_-D1T§.§_-b2q§;
      }
   }
}

