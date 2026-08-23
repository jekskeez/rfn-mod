package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-C1l§.§_-a2§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import flash.utils.setTimeout;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-21e§;
   import game.mainGame.entity.§_-YY§;
   import game.mainGame.entity.§_-f2A§;
   import particles.Explode;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-jh§ extends GameBody implements §_-21e§, §_-22J§, §_-YY§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-Y1b§:uint = 5;
      
      private static const §_-Ly§:Number = 0.5;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-Y1b§,§_-Ly§,new b2Vec2());
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.3,0.1,0.8,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-u2I§:Array = [[-§_-Y1b§,0],[0,0],[§_-Y1b§,0]];
      
      private var view:§_-h2I§ = null;
      
      private var destroyed:Boolean = false;
      
      public function §_-jh§()
      {
         super();
         this.view = new §_-h2I§(new GlassBalkSmall());
         this.view.x = -50;
         this.view.y = -5;
         §_-83v§(this.view);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      public function get landSound() : String
      {
         return "glass";
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
      }
      
      override public function dispose() : void
      {
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-f2A§.§_-61A§(§_-u2I§);
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         if(this.destroyed)
         {
            return;
         }
         if(param2.normalImpulses[0] < 150)
         {
            return;
         }
         if(!(this.§_-H2D§ && this.§_-H2D§.squirrels.isSynchronizing))
         {
            return;
         }
         this.destroyed = true;
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         this.§_-i9§(_loc3_.m_points[0],this.§_-H2D§.gravity,param2.normalImpulses[0]);
      }
      
      private function §_-Y2E§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         this.view.visible = false;
         var _loc4_:§_-h2I§ = §_-a2§.§_-ZE§(new GlassBalkPieces(),true);
         §_-83v§(_loc4_);
         Explode.§_-v2F§(_loc4_,param1,param2,param3);
      }
      
      private function §_-i9§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         if(this.§_-H2D§ is §_-A32§)
         {
            setTimeout(this.§_-b16§,0,param1,param2,param3);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"destroyGlass":[this.id,[param1.x,param1.y],[param2.x,param2.y],param3]}));
         }
      }
      
      private function §_-b16§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         this.§_-Y2E§(param1,param2,param3);
         if(!this.§_-H2D§)
         {
            return;
         }
         this.§_-H2D§.map.remove(this,true);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if("destroyGlass" in _loc2_)
         {
            if(_loc2_["destroyGlass"][0] != this.id)
            {
               return;
            }
            this.§_-b16§(new b2Vec2(_loc2_["destroyGlass"][1][0],_loc2_["destroyGlass"][1][1]),new b2Vec2(_loc2_["destroyGlass"][2][0],_loc2_["destroyGlass"][2][1]),_loc2_["destroyGlass"][3]);
         }
      }
   }
}

