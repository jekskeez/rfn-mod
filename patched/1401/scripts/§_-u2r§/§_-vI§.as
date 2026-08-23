package §_-u2r§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-b2w§;
   import §_-83V§.§_-918§;
   import §_-R1w§.DetectHeroEvent;
   
   public class §_-vI§ extends §_-918§
   {
      
      public var lifeTime:Number = 10;
      
      private var §_-01O§:Boolean = false;
      
      public function §_-vI§()
      {
         super();
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc3_:b2Vec2 = null;
         var _loc4_:b2Vec2 = null;
         var _loc5_:b2Vec2 = null;
         super.update(param1);
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(this.playerId);
         if(_loc2_ == null || _loc2_.isDead || _loc2_.inHollow || _loc2_.shaman || _loc2_.behaviourController.getState(§_-b2w§) == null)
         {
            this.lifeTime = 0;
         }
         else
         {
            _loc3_ = _loc2_.§_-s1l§.Copy();
            _loc4_ = _loc2_.§_-x2h§.Copy();
            _loc4_.Multiply(-1);
            _loc3_.Add(_loc4_);
            this.position = b2Math.AddVV(_loc2_.position,_loc3_);
            _loc5_ = _loc2_.body.GetLinearVelocity();
            if(Game.toggle)
            {
               _loc2_.body.SetLinearVelocity(new b2Vec2(_loc5_.x,0));
            }
            _loc2_.body.SetAngularVelocity(0);
            _loc2_.angle = 0;
            _loc2_.rotation = 0;
         }
         if(this.lifeTime <= 0)
         {
            this.death();
         }
         else
         {
            this.lifeTime -= param1;
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.playerId = param1[2][0];
         this.lifeTime = param1[2][1];
      }
      
      override protected function §_-5d§(param1:DetectHeroEvent) : void
      {
         var _loc2_:Hero = param1.hero;
         if(this.squirrels[_loc2_.id] != null || _loc2_.isDead || _loc2_.inHollow || this.playerId == _loc2_.id)
         {
            return;
         }
         §_-oJ§(_loc2_.id);
      }
      
      private function death() : void
      {
         if(this.§_-01O§ || !this.body)
         {
            return;
         }
         this.§_-01O§ = true;
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}

