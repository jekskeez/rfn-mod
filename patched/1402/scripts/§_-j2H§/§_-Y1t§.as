package §_-j2H§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import flash.display.BitmapData;
   import game.mainGame.entity.§_-l1V§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-Y1t§ extends §_-aS§ implements §_-l2r§, §_-xn§, §_-l1V§
   {
      
      private var §_-f2a§:§_-E2J§;
      
      public function §_-Y1t§()
      {
         super();
         this.§_-P2S§();
      }
      
      public function §_-I2Q§(param1:*) : void
      {
         this.dispose();
         if(param1 is §_-E2J§)
         {
            (param1 as §_-E2J§).§_-P20§(this);
            this.§_-f2a§ = param1 as §_-E2J§;
         }
      }
      
      public function dispose() : void
      {
         this.removeFromParent(true);
         this.§_-f2a§ = null;
      }
      
      public function get position() : b2Vec2
      {
         return null;
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
      }
      
      public function §_-e14§() : BitmapData
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
      
      protected function §_-P2S§() : void
      {
      }
   }
}

