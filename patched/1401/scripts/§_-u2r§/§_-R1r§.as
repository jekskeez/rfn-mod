package §_-u2r§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-z12§;
   import §_-83V§.GameBody;
   import §_-B1O§.§_-O1q§;
   import §_-R1w§.DetectHeroEvent;
   import §_-T2y§.§_-92z§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import game.mainGame.entity.§_-p19§;
   import game.mainGame.entity.§_-s2K§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-R1r§ extends GameBody implements §_-s2K§, §_-p19§
   {
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(15 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0,false);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-V2K§:§_-z12§;
      
      protected var §_-42S§:Boolean = false;
      
      protected var view:MovieClip = null;
      
      protected var §_-xn§:MovieClip = null;
      
      protected var §_-WN§:int;
      
      protected var §_-pV§:int;
      
      public function §_-R1r§()
      {
         this.view = this.animation;
         this.view.visible = false;
         addChild(this.view);
         this.§_-xn§ = this.beginAnimation;
         addChild(this.§_-xn§);
         this.fixed = true;
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(§_-03A§));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         super.build(param1);
         this.§_-xn§.gotoAndPlay(0);
         this.§_-xn§.addEventListener(Event.CHANGE,this.onComplete);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-w1R§,§_-S2I§.§_-Q1g§]);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.playerId = param1[1][0];
      }
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-w1R§,§_-S2I§.§_-Q1g§]);
         if(contains(this.view))
         {
            removeChild(this.view);
         }
         this.onComplete();
         if(this.§_-V2K§ == null)
         {
            return;
         }
         this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         this.§_-V2K§ = null;
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
      
      protected function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[1] != this.§_-WN§)
               {
                  return;
               }
               if(param1[4] != this.playerId)
               {
                  return;
               }
               if(!this.§_-H2D§.squirrels.isSynchronizing)
               {
                  return;
               }
               this.§_-H2D§.map.§_-Qc§(this,true);
               break;
            case §_-S2I§.§_-Q1g§:
               if(param1[0] != this.§_-WN§)
               {
                  return;
               }
               if(!("2" in param1) || param1[2] != this.playerId)
               {
                  return;
               }
               §_-92z§.sendMessage(param1[1],"",this.§_-pV§);
               if(!this.§_-H2D§)
               {
                  return;
               }
               this.showAward();
               this.§_-H2D§.squirrels.get(param1[1]).heroView.§_-634§(new this.animation.constructor());
               if(!this.§_-H2D§.squirrels.isSynchronizing)
               {
                  return;
               }
               this.§_-H2D§.map.§_-Qc§(this,true);
         }
      }
      
      private function onComplete(param1:Event = null) : void
      {
         if(this.§_-xn§.parent)
         {
            this.§_-xn§.parent.removeChild(this.§_-xn§);
         }
         this.§_-xn§.removeEventListener(Event.CHANGE,this.onComplete);
         this.view.visible = true;
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
         Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-WN§,this.playerId);
         this.§_-42S§ = true;
      }
      
      public function get spotSize() : int
      {
         return §_-O1q§.§_-c2I§;
      }
   }
}

