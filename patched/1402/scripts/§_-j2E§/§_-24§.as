package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-24§ extends §_-92f§
   {
      
      public function §_-24§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "arcee";
      }
      
      override public function get totalCooldown() : Number
      {
         return 5;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.velocity = new b2Vec2();
         var _loc1_:b2Vec2 = this.hero.body.GetTransform().R.col2.Copy();
         _loc1_.Multiply(-150);
         this.hero.§_-PT§(_loc1_);
      }
   }
}

