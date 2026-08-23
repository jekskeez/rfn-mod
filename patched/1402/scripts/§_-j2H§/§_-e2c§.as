package §_-j2H§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import §_-TK§.§_-aS§;
   import §_-hd§.§_-01M§;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-w1u§;
   import particles.Explode;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-e2c§ extends §_-h11§ implements §_-Pn§, §_-w1u§
   {
      
      private var destroyed:Boolean = false;
      
      public function §_-e2c§()
      {
         super();
         this.friction = 0.3;
         this.density = 0.8;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function get landSound() : String
      {
         return "glass";
      }
      
      override public function dispose() : void
      {
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
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
         if(!(this.§_-21H§ && this.§_-21H§.squirrels.isSynchronizing))
         {
            return;
         }
         this.destroyed = true;
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         this.§_-AI§(_loc3_.m_points[0],this.§_-21H§.gravity,param2.normalImpulses[0]);
      }
      
      override protected function §_-Nq§() : void
      {
         this.§_-Z2d§ = new GlassBlock();
      }
      
      override protected function §_-q2X§() : void
      {
         this.icon = new §_-aS§(new GlassBlock());
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
      
      private function §_-EL§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         var _loc6_:int = 0;
         var _loc7_:§_-aS§ = null;
         var _loc4_:§_-aS§ = new §_-aS§();
         var _loc5_:int = 0;
         while(_loc5_ < _width / this.§_-J2H§)
         {
            _loc6_ = 0;
            while(_loc6_ < _height / this.§_-V1Q§)
            {
               _loc7_ = §_-01M§.§_-q1k§(new GlassBlockPieces(),true);
               _loc7_.x += _loc5_ * this.§_-J2H§;
               _loc7_.y += _loc6_ * this.§_-V1Q§;
               _loc4_.§_-J2J§(_loc7_);
               _loc6_++;
            }
            _loc5_++;
         }
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

