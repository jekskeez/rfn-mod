package §_-B1O§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import flash.display.BitmapData;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-u2S§;
   
   public class §_-K2R§ extends §_-h2I§ implements §_-C2x§, §_-63Q§, §_-u2S§
   {
      
      private var §_-a1J§:§_-l2J§;
      
      public function §_-K2R§()
      {
         super();
         this.§_-c2m§();
      }
      
      public function §_-l2s§(param1:*) : void
      {
         this.dispose();
         if(param1 is §_-l2J§)
         {
            (param1 as §_-l2J§).§_-sH§(this);
            this.§_-a1J§ = param1 as §_-l2J§;
         }
      }
      
      public function dispose() : void
      {
         this.removeFromParent(true);
         this.§_-a1J§ = null;
      }
      
      public function get position() : b2Vec2
      {
         return null;
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
      }
      
      public function §_-81e§() : BitmapData
      {
         return null;
      }
      
      public function set angle(param1:Number) : void
      {
      }
      
      public function build(param1:b2World) : void
      {
      }
      
      public function get angle() : Number
      {
         return NaN;
      }
      
      protected function §_-c2m§() : void
      {
      }
   }
}

