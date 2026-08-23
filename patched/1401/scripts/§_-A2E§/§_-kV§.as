package §_-A2E§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-Y22§.§_-C2x§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-kV§ extends Sprite implements §_-63Q§, §_-Tm§, §_-C2x§, §_-H1F§
   {
      
      public var hero:Hero = null;
      
      public var activated:Boolean = false;
      
      protected var view:MovieClip = null;
      
      public function §_-kV§(param1:Hero)
      {
         super();
         this.hero = param1;
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
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

