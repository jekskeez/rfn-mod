package §_-p2L§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import §_-Cc§.§_-F1B§;
   import §_-TK§.§_-f1u§;
   import §_-j2E§.§_-92f§;
   
   public class §_-m15§ extends §_-92f§
   {
      
      protected var view:§_-f1u§ = null;
      
      protected var §_-gX§:Boolean = false;
      
      public function §_-m15§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-gX§ = false;
         this.§_-o2B§();
      }
      
      protected function get power() : Number
      {
         return 0;
      }
      
      protected function get radius() : Number
      {
         return 0;
      }
      
      override public function get switchable() : Boolean
      {
         return false;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !(this.view && this.view.isPlaying);
      }
      
      protected function §_-o2B§() : void
      {
      }
      
      protected function §_-O10§() : void
      {
         var _loc3_:b2Vec2 = null;
         var _loc4_:b2Vec2 = null;
         if(this.§_-gX§)
         {
            return;
         }
         this.§_-gX§ = true;
         var _loc1_:b2Vec2 = this.hero.position.Copy();
         _loc1_.Add(this.hero.§_-d2u§);
         var _loc2_:b2Body = this.hero.game.world.GetBodyList();
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.GetPosition().Copy();
            _loc3_.Subtract(_loc1_);
            if(!(_loc3_.Length() > this.radius || _loc3_.Length() == 0 || _loc2_.GetUserData() == this.hero))
            {
               _loc4_ = new b2Vec2(this.power * (_loc3_.x / _loc3_.Length()),this.power * (_loc3_.y / _loc3_.Length()));
               _loc2_.SetAwake(true);
               _loc2_.SetLinearVelocity(_loc4_);
               if(_loc2_.GetUserData() is Hero)
               {
                  (_loc2_.GetUserData() as Hero).behaviourController.§_-W10§(new §_-F1B§(0.75));
               }
            }
            _loc2_ = _loc2_.GetNext();
         }
      }
   }
}

