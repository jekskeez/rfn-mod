package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-33r§.§_-q1d§;
   import §_-42B§.TweenMax;
   import §_-51g§.§_-z12§;
   import §_-P2b§.§_-6L§;
   import §_-R1w§.DetectHeroEvent;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-NU§ extends GameBody
   {
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(140 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0,false);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-V2K§:§_-z12§;
      
      private var activated:Boolean = false;
      
      private var view:MovieClip = new RemboMine();
      
      public function §_-NU§()
      {
         this.view.gotoAndStop(0);
         addChild(this.view);
         this.fixed = true;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(§_-03A§));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         super.build(param1);
         this.view.addEventListener("Explode",this.§_-a1U§);
         this.view.addEventListener(Event.CHANGE,this.onComplete);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(contains(this.view))
         {
            removeChild(this.view);
         }
         this.view.removeEventListener("Explode",this.§_-a1U§);
         this.view.removeEventListener(Event.CHANGE,this.onComplete);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
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
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.playerId = param1[1][0];
      }
      
      private function §_-5d§(param1:DetectHeroEvent) : void
      {
         if(!this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         if(param1.hero.isDead || param1.hero.isHare || param1.hero.shaman || param1.hero.inHollow)
         {
            return;
         }
         if(param1.hero.perkController.§_-e4§(§_-6L§.§_-D21§) == -1)
         {
            return;
         }
         if(!this.activated)
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"bomb":[this.playerId]}));
         }
         this.activated = true;
      }
      
      private function §_-a1U§(param1:Event) : void
      {
         this.view.stop();
         this.view.removeEventListener("Explode",this.§_-a1U§);
         this.§_-K2K§();
      }
      
      private function onComplete(param1:Event) : void
      {
         this.view.visible = false;
         this.view.removeEventListener(Event.CHANGE,this.onComplete);
         if(!this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var whiteScreen:Shape = null;
         var id:int = 0;
         var hero:Hero = null;
         var packet:§_-S2I§ = param1;
         var data:Object = packet[1];
         if("bomb" in data)
         {
            if(data["bomb"][0] != this.playerId)
            {
               return;
            }
            this.view.gotoAndPlay(1);
         }
         else if("contused" in data)
         {
            if(data["contused"][0] != this.playerId)
            {
               return;
            }
            if(!this.§_-H2D§ || !this.§_-H2D§.squirrels)
            {
               return;
            }
            this.view.gotoAndPlay(61);
            whiteScreen = new Shape();
            whiteScreen.graphics.beginFill(16777215,0.5);
            whiteScreen.graphics.drawRect(0,0,§_-a9§.§_-9o§,§_-a9§.§_-31m§);
            whiteScreen.graphics.endFill();
            this.§_-H2D§.addChild(whiteScreen);
            TweenMax.to(whiteScreen,0.6,{
               "delay":0.2,
               "alpha":0,
               "onComplete":function():void
               {
                  if(whiteScreen.parent == null)
                  {
                     return;
                  }
                  if(!whiteScreen.parent.contains(whiteScreen))
                  {
                     return;
                  }
                  whiteScreen.parent.removeChild(whiteScreen);
               }
            });
            for each(id in data["contused"][1])
            {
               hero = this.§_-H2D§.squirrels.get(id);
               if(!(hero.isDead || hero.isHare || hero.shaman || hero.isDragon || hero.isScrat))
               {
                  hero.behaviourController.§_-gz§(new §_-q1d§(10));
               }
            }
         }
      }
      
      private function §_-K2K§() : void
      {
         var _loc2_:Hero = null;
         if(!this.§_-H2D§ || !this.§_-H2D§.squirrels || !this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc1_:Array = [];
         GameSounds.play("bomb");
         for each(_loc2_ in this.§_-V2K§.§_-61I§)
         {
            if(!(_loc2_.isDead || _loc2_.isHare || _loc2_.shaman || _loc2_.isDragon || _loc2_.isScrat))
            {
               if(_loc2_.perkController.§_-e4§(§_-6L§.§_-D21§) == -1)
               {
                  _loc1_.push(_loc2_.id);
               }
            }
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"contused":[this.playerId,_loc1_]}));
      }
   }
}

