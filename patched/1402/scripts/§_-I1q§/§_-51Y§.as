package §_-I1q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-Cc§.§_-F13§;
   import §_-Cc§.§_-I2P§;
   import §_-Cc§.§_-K2X§;
   import §_-Cc§.§_-eg§;
   import §_-Cc§.§_-kj§;
   import §_-M16§.§_-m2p§;
   import §_-TK§.§_-f1u§;
   import §_-X1k§.§_-P2x§;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-51Y§ extends GameBody
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = 1;
      
      private static const §_-k2B§:uint = 2;
      
      public static const §_-A1h§:int = 0;
      
      public static const §_-Ge§:int = 1;
      
      public static const §_-H1M§:int = 3;
      
      public static const §_-39§:int = 2;
      
      public static const §_-Y2i§:int = 4;
      
      public static const §_-91G§:Number = 12;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-k2B§,§_-k2B§,new b2Vec2());
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public static var types:Array = null;
      
      public var type:int = -1;
      
      protected var view:§_-f1u§ = null;
      
      protected var §_-oE§:§_-f1u§ = null;
      
      public function §_-51Y§()
      {
         super();
         this.fixed = true;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         this.view = new §_-f1u§(new this.imageClass());
         this.view.x = -72;
         this.view.y = -133;
         this.view.addEventListener(Event.ENTER_FRAME,this.§_-52w§);
         this.view.play();
         §_-J2J§(this.view);
      }
      
      protected function get imageClass() : Class
      {
         if(!types)
         {
            types = [BearPerkView0,BearPerkView1,BearPerkView2,BearPerkView3,BearPerkView4];
         }
         return types[this.type];
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeEventListener(Event.ENTER_FRAME,this.§_-52w§);
         }
         this.view = null;
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.type,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.type = param1[1][0];
         this.playerId = param1[1][1];
      }
      
      protected function §_-52w§(param1:Event) : void
      {
         if(!this.view)
         {
            return;
         }
         if(this.view.currentFrame < this.view.totalFrames - 1)
         {
            return;
         }
         this.view.stop();
         this.view.removeEventListener(Event.ENTER_FRAME,this.§_-52w§);
         this.view.visible = false;
         this.§_-21W§();
      }
      
      private function §_-21W§() : void
      {
         var _loc3_:Hero = null;
         var _loc4_:b2Vec2 = null;
         var _loc5_:§_-m2p§ = null;
         var _loc1_:Hero = this.§_-21H§.squirrels.get(this.playerId);
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-21H§.squirrels.players)
         {
            _loc4_ = _loc3_.position.Copy();
            _loc4_.Subtract(this.position);
            if(_loc4_.Length() > §_-91G§ || _loc4_.Length() == 0 || _loc3_.id == this.playerId || _loc3_.isDead || _loc3_.inHollow)
            {
               continue;
            }
            _loc2_++;
            switch(this.type)
            {
               case §_-39§:
                  _loc5_ = new §_-m2p§();
                  _loc5_.damping = 0.05;
                  _loc5_.frequency = 0.75;
                  _loc5_.body = this;
                  _loc5_.hero = _loc3_;
                  this.§_-21H§.map.§_-TP§(_loc5_,true);
                  break;
               case §_-Y2i§:
                  _loc3_.behaviourController.§_-W10§(new §_-I2P§(15));
                  break;
               case §_-Ge§:
                  if(_loc3_.isSquirrel)
                  {
                     _loc3_.behaviourController.§_-W10§(new §_-kj§(5,[§_-P2x§.§_-c9§],true));
                  }
                  break;
               case §_-A1h§:
                  _loc3_.behaviourController.§_-W10§(new §_-eg§(10,0.15));
                  break;
               case §_-H1M§:
                  if(_loc3_.isSelf)
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-A1F§);
                     _loc3_.§_-I1u§(Hero.§_-43e§);
                  }
            }
         }
         switch(this.type)
         {
            case §_-39§:
               this.§_-oE§ = new §_-f1u§(new HunnyStart());
               §_-J2J§(this.§_-oE§);
               if(_loc1_)
               {
                  _loc1_.behaviourController.§_-W10§(new §_-K2X§(10,8));
               }
               break;
            case §_-Y2i§:
               if(_loc1_)
               {
                  _loc1_.behaviourController.§_-W10§(new §_-F13§(15,0.2 + 0.03 * _loc2_));
               }
               break;
            case §_-Ge§:
               break;
            case §_-A1h§:
               if(_loc1_)
               {
                  _loc1_.behaviourController.§_-W10§(new §_-eg§(10,0.2 + 0.03 * _loc2_));
               }
               break;
            case §_-H1M§:
               if(Boolean(_loc1_) && _loc1_.isSelf)
               {
                  _loc1_.§_-I1u§(Hero.§_-43e§);
                  Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-A1F§);
               }
         }
      }
   }
}

