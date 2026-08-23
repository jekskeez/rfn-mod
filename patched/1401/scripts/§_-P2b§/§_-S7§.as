package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-b2w§;
   
   public class §_-S7§ extends §_-H2N§
   {
      
      private static const §_-a2H§:Number = 2.5;
      
      private var §_-92n§:Number;
      
      private var §_-r2Z§:§_-b2w§;
      
      public function §_-S7§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-VU§;
         this.§_-r2Z§ = new §_-b2w§(0);
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get activeTime() : Number
      {
         return 2;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         this.hero.behaviourController.§_-gz§(this.§_-r2Z§);
         this.§_-92n§ = this.hero.runSpeed * 0.5;
         this.hero.runSpeed -= this.§_-92n§;
         this.hero.changeView(new BansheeMagicView());
         var _loc1_:b2Vec2 = this.hero.body.GetLinearVelocity();
         _loc1_.y = 0;
         if(_loc1_.Length() > §_-a2H§)
         {
            _loc1_.Normalize();
            _loc1_.x *= §_-a2H§;
            _loc1_.y *= §_-a2H§;
         }
         this.hero.body.SetLinearVelocity(_loc1_);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.hero.behaviourController.removeState(this.§_-r2Z§);
         this.hero.runSpeed += this.§_-92n§;
         this.hero.changeView();
      }
   }
}

