package §_-83V§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-RI§.§_-h2I§;
   import §_-Rn§.§_-dv§;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-pM§ extends §_-dv§
   {
      
      private static const §_-b2P§:Number = 2;
      
      private var hole:HoleView = new HoleView();
      
      public function §_-pM§(param1:§_-63Q§)
      {
         super(param1,new §_-h2I§(this.hole));
      }
      
      public function get arrow() : §_-h2I§
      {
         return this.hole.arrow ? new §_-h2I§(this.hole.arrow,true) : new §_-h2I§();
      }
      
      public function get direction() : b2Vec2
      {
         return new b2Vec2(-Math.cos(this.angle),-Math.sin(this.angle));
      }
      
      public function get §_-a18§() : b2Vec2
      {
         var _loc1_:b2Vec2 = this.direction;
         _loc1_.Multiply(§_-b2P§);
         _loc1_.Add(this.position);
         return _loc1_;
      }
   }
}

