package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-D1U§ extends §_-H2N§
   {
      
      private static const §_-O2E§:Number = 15;
      
      public function §_-D1U§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-Y1q§;
         this.§_-mw§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function activate() : void
      {
         super.activate();
         var _loc1_:b2Vec2 = new b2Vec2((this.hero.heroView.direction ? -1 : 1) * §_-O2E§,0);
         _loc1_.MulM(this.hero.body.GetTransform().R);
         _loc1_.Add(this.hero.position.Copy());
         this.hero.§_-s1§(_loc1_);
      }
   }
}

