package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-f6§;
   
   public class §_-4C§ extends §_-92f§
   {
      
      private static const §_-q1t§:Number = 2.5;
      
      private var §_-R1j§:Number;
      
      private var §_-ET§:§_-f6§;
      
      public function §_-4C§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-7d§;
         this.§_-ET§ = new §_-f6§(0);
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
         this.hero.behaviourController.§_-W10§(this.§_-ET§);
         this.§_-R1j§ = this.hero.runSpeed * 0.5;
         this.hero.runSpeed -= this.§_-R1j§;
         this.hero.changeView(new BansheeMagicView());
         var _loc1_:b2Vec2 = this.hero.body.GetLinearVelocity();
         _loc1_.y = 0;
         if(_loc1_.Length() > §_-q1t§)
         {
            _loc1_.Normalize();
            _loc1_.x *= §_-q1t§;
            _loc1_.y *= §_-q1t§;
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
         this.hero.behaviourController.removeState(this.§_-ET§);
         this.hero.runSpeed += this.§_-R1j§;
         this.hero.changeView();
      }
   }
}

