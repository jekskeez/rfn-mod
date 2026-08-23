package §_-A3e§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import §_-33r§.§_-R§;
   import §_-P2b§.§_-H2N§;
   import §_-RI§.§_-d2d§;
   
   public class §_-p8§ extends §_-H2N§
   {
      
      protected var view:§_-d2d§ = null;
      
      protected var §_-W2t§:Boolean = false;
      
      public function §_-p8§(param1:Hero)
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
         this.§_-W2t§ = false;
         this.§_-Y2U§();
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
      
      protected function §_-Y2U§() : void
      {
      }
      
      protected function §_-Q2q§() : void
      {
         var _loc3_:b2Vec2 = null;
         var _loc4_:b2Vec2 = null;
         if(this.§_-W2t§)
         {
            return;
         }
         this.§_-W2t§ = true;
         var _loc1_:b2Vec2 = this.hero.position.Copy();
         _loc1_.Add(this.hero.§_-x2h§);
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
                  (_loc2_.GetUserData() as Hero).behaviourController.§_-gz§(new §_-R§(0.75));
               }
            }
            _loc2_ = _loc2_.GetNext();
         }
      }
   }
}

