package §_-I1q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-WJ§.DetectHeroEvent;
   import §_-c2C§.§_-u24§;
   import §_-j2H§.§_-D1T§;
   import §_-j4§.§_-43y§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import game.mainGame.entity.§_-NA§;
   import game.mainGame.entity.§_-p2r§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-Z2G§ extends GameBody implements §_-NA§, §_-p2r§
   {
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(15 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0,false);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-b1J§:§_-43y§;
      
      protected var §_-D27§:Boolean = false;
      
      protected var view:MovieClip = null;
      
      protected var §_-63m§:MovieClip = null;
      
      protected var §_-o1r§:int;
      
      protected var §_-i1D§:int;
      
      public function §_-Z2G§()
      {
         this.view = this.animation;
         this.view.visible = false;
         addChild(this.view);
         this.§_-63m§ = this.beginAnimation;
         addChild(this.§_-63m§);
         this.fixed = true;
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         super.build(param1);
         this.§_-63m§.gotoAndPlay(0);
         this.§_-63m§.addEventListener(Event.CHANGE,this.onComplete);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-C1i§,§_-s2l§.§_-u22§]);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.playerId = param1[1][0];
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-C1i§,§_-s2l§.§_-u22§]);
         if(contains(this.view))
         {
            removeChild(this.view);
         }
         this.onComplete();
         if(this.§_-b1J§ == null)
         {
            return;
         }
         this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         this.§_-b1J§ = null;
      }
      
      protected function get animation() : MovieClip
      {
         return null;
      }
      
      protected function get beginAnimation() : MovieClip
      {
         return null;
      }
      
      protected function showAward() : void
      {
      }
      
      protected function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(param1[1] != this.§_-o1r§)
               {
                  return;
               }
               if(param1[4] != this.playerId)
               {
                  return;
               }
               if(!this.§_-21H§.squirrels.isSynchronizing)
               {
                  return;
               }
               this.§_-21H§.map.§_-Y1E§(this,true);
               break;
            case §_-s2l§.§_-u22§:
               if(param1[0] != this.§_-o1r§)
               {
                  return;
               }
               if(!("2" in param1) || param1[2] != this.playerId)
               {
                  return;
               }
               §_-u24§.sendMessage(param1[1],"",this.§_-i1D§);
               if(!this.§_-21H§)
               {
                  return;
               }
               this.showAward();
               this.§_-21H§.squirrels.get(param1[1]).heroView.§_-Y15§(new this.animation.constructor());
               if(!this.§_-21H§.squirrels.isSynchronizing)
               {
                  return;
               }
               this.§_-21H§.map.§_-Y1E§(this,true);
         }
      }
      
      private function onComplete(param1:Event = null) : void
      {
         if(this.§_-63m§.parent)
         {
            this.§_-63m§.parent.removeChild(this.§_-63m§);
         }
         this.§_-63m§.removeEventListener(Event.CHANGE,this.onComplete);
         this.view.visible = true;
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
         Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-o1r§,this.playerId);
         this.§_-D27§ = true;
      }
      
      public function get spotSize() : int
      {
         return §_-D1T§.§_-b2q§;
      }
   }
}

