package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-Y18§ extends §_-92f§
   {
      
      private static const §_-T26§:Number = 15;
      
      public function §_-Y18§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-N2T§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function activate() : void
      {
         super.activate();
         var _loc1_:b2Vec2 = new b2Vec2((this.hero.heroView.direction ? -1 : 1) * §_-T26§,0);
         _loc1_.MulM(this.hero.body.GetTransform().R);
         _loc1_.Add(this.hero.position.Copy());
         this.hero.§_-r1C§(_loc1_);
      }
   }
}

