package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-v2R§ extends §_-H2N§
   {
      
      public function §_-v2R§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "arcee";
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
         this.hero.§_-53N§(_loc1_);
      }
   }
}

