package §_-8Q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-22D§.TweenMax;
   import §_-Cc§.§_-I2P§;
   import §_-WJ§.DetectHeroEvent;
   import §_-j2E§.§_-A11§;
   import §_-j4§.§_-43y§;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-EY§ extends GameBody
   {
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(140 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0,false);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-b1J§:§_-43y§;
      
      private var activated:Boolean = false;
      
      private var view:MovieClip = new RemboMine();
      
      public function §_-EY§()
      {
         this.view.gotoAndStop(0);
         addChild(this.view);
         this.fixed = true;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         super.build(param1);
         this.view.addEventListener("Explode",this.§_-i2Q§);
         this.view.addEventListener(Event.CHANGE,this.onComplete);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(contains(this.view))
         {
            removeChild(this.view);
         }
         this.view.removeEventListener("Explode",this.§_-i2Q§);
         this.view.removeEventListener(Event.CHANGE,this.onComplete);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
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
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.playerId = param1[1][0];
      }
      
      private function §_-M2L§(param1:DetectHeroEvent) : void
      {
         if(!this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         if(param1.hero.isDead || param1.hero.isHare || param1.hero.shaman || param1.hero.inHollow)
         {
            return;
         }
         if(param1.hero.perkController.§_-S1Q§(§_-A11§.§_-6s§) == -1)
         {
            return;
         }
         if(!this.activated)
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"bomb":[this.playerId]}));
         }
         this.activated = true;
      }
      
      private function §_-i2Q§(param1:Event) : void
      {
         this.view.stop();
         this.view.removeEventListener("Explode",this.§_-i2Q§);
         this.§_-V1e§();
      }
      
      private function onComplete(param1:Event) : void
      {
         this.view.visible = false;
         this.view.removeEventListener(Event.CHANGE,this.onComplete);
         if(!this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var whiteScreen:Shape = null;
         var id:int = 0;
         var hero:Hero = null;
         var packet:§_-s2l§ = param1;
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
            if(!this.§_-21H§ || !this.§_-21H§.squirrels)
            {
               return;
            }
            this.view.gotoAndPlay(61);
            whiteScreen = new Shape();
            whiteScreen.graphics.beginFill(16777215,0.5);
            whiteScreen.graphics.drawRect(0,0,§_-Zy§.§_-21V§,§_-Zy§.§_-02T§);
            whiteScreen.graphics.endFill();
            this.§_-21H§.addChild(whiteScreen);
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
               hero = this.§_-21H§.squirrels.get(id);
               if(!(hero.isDead || hero.isHare || hero.shaman || hero.isDragon || hero.isScrat))
               {
                  hero.behaviourController.§_-W10§(new §_-I2P§(10));
               }
            }
         }
      }
      
      private function §_-V1e§() : void
      {
         var _loc2_:Hero = null;
         if(!this.§_-21H§ || !this.§_-21H§.squirrels || !this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc1_:Array = [];
         GameSounds.play("bomb");
         for each(_loc2_ in this.§_-b1J§.§_-5O§)
         {
            if(!(_loc2_.isDead || _loc2_.isHare || _loc2_.shaman || _loc2_.isDragon || _loc2_.isScrat))
            {
               if(_loc2_.perkController.§_-S1Q§(§_-A11§.§_-6s§) == -1)
               {
                  _loc1_.push(_loc2_.id);
               }
            }
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"contused":[this.playerId,_loc1_]}));
      }
   }
}

