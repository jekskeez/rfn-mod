package §_-B1O§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import §_-51g§.§_-22J§;
   import §_-C1l§.§_-a2§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-YY§;
   import particles.Explode;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-A19§ extends §_-41L§ implements §_-22J§, §_-YY§
   {
      
      private var destroyed:Boolean = false;
      
      public function §_-A19§()
      {
         super();
         this.friction = 0.3;
         this.density = 0.8;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function get landSound() : String
      {
         return "glass";
      }
      
      override public function dispose() : void
      {
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
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
         if(param2.normalImpulses[0] < 1500)
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
      
      override protected function §_-H1a§() : void
      {
         this.§_-Nw§ = new GlassBlock();
      }
      
      override protected function §_-91h§() : void
      {
         this.icon = new §_-h2I§(new GlassBlock());
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
      
      private function §_-Y2E§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         var _loc6_:int = 0;
         var _loc7_:§_-h2I§ = null;
         var _loc4_:§_-h2I§ = new §_-h2I§();
         var _loc5_:int = 0;
         while(_loc5_ < _width / this.§_-a2v§)
         {
            _loc6_ = 0;
            while(_loc6_ < _height / this.§_-D1g§)
            {
               _loc7_ = §_-a2§.§_-ZE§(new GlassBlockPieces(),true);
               _loc7_.x += _loc5_ * this.§_-a2v§;
               _loc7_.y += _loc6_ * this.§_-D1g§;
               _loc4_.§_-83v§(_loc7_);
               _loc6_++;
            }
            _loc5_++;
         }
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

