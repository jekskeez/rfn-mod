package §_-I1q§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.§_-r2V§;
   import §_-Cc§.§_-f6§;
   import §_-WJ§.DetectHeroEvent;
   
   public class §_-rB§ extends §_-r2V§
   {
      
      public var lifeTime:Number = 10;
      
      private var §_-C1L§:Boolean = false;
      
      public function §_-rB§()
      {
         super();
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc3_:b2Vec2 = null;
         var _loc4_:b2Vec2 = null;
         var _loc5_:b2Vec2 = null;
         super.update(param1);
         var _loc2_:Hero = this.§_-21H§.squirrels.get(this.playerId);
         if(_loc2_ == null || _loc2_.isDead || _loc2_.inHollow || _loc2_.shaman || _loc2_.behaviourController.getState(§_-f6§) == null)
         {
            this.lifeTime = 0;
         }
         else
         {
            _loc3_ = _loc2_.§_-11E§.Copy();
            _loc4_ = _loc2_.§_-d2u§.Copy();
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
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.playerId = param1[2][0];
         this.lifeTime = param1[2][1];
      }
      
      override protected function §_-M2L§(param1:DetectHeroEvent) : void
      {
         var _loc2_:Hero = param1.hero;
         if(this.squirrels[_loc2_.id] != null || _loc2_.isDead || _loc2_.inHollow || this.playerId == _loc2_.id)
         {
            return;
         }
         §_-Z2m§(_loc2_.id);
      }
      
      private function death() : void
      {
         if(this.§_-C1L§ || !this.body)
         {
            return;
         }
         this.§_-C1L§ = true;
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}

