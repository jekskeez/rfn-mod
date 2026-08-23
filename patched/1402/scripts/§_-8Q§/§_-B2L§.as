package §_-8Q§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-M16§.§_-gy§;
   import §_-TK§.§_-aS§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-B2L§ extends §_-gy§
   {
      
      private static const §_-y1p§:Number = 2;
      
      private var hole:HoleView = new HoleView();
      
      public function §_-B2L§(param1:§_-xn§)
      {
         super(param1,new §_-aS§(this.hole));
      }
      
      public function get arrow() : §_-aS§
      {
         return this.hole.arrow ? new §_-aS§(this.hole.arrow,true) : new §_-aS§();
      }
      
      public function get direction() : b2Vec2
      {
         return new b2Vec2(-Math.cos(this.angle),-Math.sin(this.angle));
      }
      
      public function get §_-v24§() : b2Vec2
      {
         var _loc1_:b2Vec2 = this.direction;
         _loc1_.Multiply(§_-y1p§);
         _loc1_.Add(this.position);
         return _loc1_;
      }
   }
}

