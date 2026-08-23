package §_-8Q§
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
   import §_-TK§.§_-aS§;
   import §_-hd§.§_-01M§;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import flash.utils.setTimeout;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-Y1z§;
   import game.mainGame.entity.§_-e2t§;
   import game.mainGame.entity.§_-w1u§;
   import particles.Explode;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-w1J§ extends GameBody implements §_-e2t§, §_-Pn§, §_-w1u§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-P1l§:uint = 10;
      
      private static const §_-a2K§:Number = 0.5;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-P1l§,§_-a2K§,new b2Vec2());
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.3,0.1,0.8,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-t2E§:Array = [[-§_-P1l§,0],[0,0],[§_-P1l§,0]];
      
      private var view:§_-aS§ = null;
      
      private var destroyed:Boolean = false;
      
      public function §_-w1J§()
      {
         super();
         this.view = new §_-aS§(new GlassBalkBig());
         this.view.x = -100;
         this.view.y = -5;
         §_-J2J§(this.view);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      public function get landSound() : String
      {
         return "glass";
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
      }
      
      override public function dispose() : void
      {
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-Y1z§.§_-I2W§(§_-t2E§);
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
         if(param2.normalImpulses[0] < 350)
         {
            return;
         }
         if(!(this.§_-21H§ && this.§_-21H§.squirrels.isSynchronizing))
         {
            return;
         }
         this.destroyed = true;
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         this.§_-AI§(_loc3_.m_points[0],this.§_-21H§.gravity,param2.normalImpulses[0]);
      }
      
      private function §_-EL§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         this.view.visible = false;
         var _loc4_:§_-aS§ = §_-01M§.§_-q1k§(new GlassBalkLongPieces(),true);
         §_-J2J§(_loc4_);
         Explode.§_-t1j§(_loc4_,param1,param2,param3);
      }
      
      private function §_-AI§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         if(this.§_-21H§ is §_-62b§)
         {
            setTimeout(this.§_-th§,0,param1,param2,param3);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"destroyGlass":[this.id,[param1.x,param1.y],[param2.x,param2.y],param3]}));
         }
      }
      
      private function §_-th§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         this.§_-EL§(param1,param2,param3);
         if(!this.§_-21H§)
         {
            return;
         }
         this.§_-21H§.map.remove(this,true);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if("destroyGlass" in _loc2_)
         {
            if(_loc2_["destroyGlass"][0] != this.id)
            {
               return;
            }
            this.§_-th§(new b2Vec2(_loc2_["destroyGlass"][1][0],_loc2_["destroyGlass"][1][1]),new b2Vec2(_loc2_["destroyGlass"][2][0],_loc2_["destroyGlass"][2][1]),_loc2_["destroyGlass"][3]);
         }
      }
   }
}

