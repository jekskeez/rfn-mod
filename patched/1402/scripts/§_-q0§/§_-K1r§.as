package §_-q0§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-K1r§ extends Sprite implements §_-xn§, §_-F1c§, §_-l2r§, §_-H1L§
   {
      
      public var hero:Hero = null;
      
      public var activated:Boolean = false;
      
      protected var view:MovieClip = null;
      
      public function §_-K1r§(param1:Hero)
      {
         super();
         this.hero = param1;
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
      }
      
      public function get angle() : Number
      {
         return 0;
      }
      
      public function set angle(param1:Number) : void
      {
      }
      
      public function build(param1:b2World) : void
      {
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            removeChildAt(0);
         }
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
         this.hero = null;
         this.view = null;
      }
      
      public function update(param1:Number = 0) : void
      {
      }
   }
}

