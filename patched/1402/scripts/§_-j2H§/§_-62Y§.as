package §_-j2H§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-Q2d§;
   import game.mainGame.entity.§_-p1Z§;
   import game.mainGame.entity.§_-p2r§;
   import game.mainGame.entity.§_-xn§;
   import utils.§_-L14§;
   
   public class §_-62Y§ extends §_-aS§ implements §_-xn§, §_-3l§, §_-l2r§, §_-p1Z§, §_-Q2d§, §_-p2r§
   {
      
      protected var §_-r1V§:§_-L14§;
      
      public function §_-62Y§()
      {
         super();
         var _loc1_:§_-aS§ = new §_-aS§(this.shamanIcon);
         _loc1_.y = -_loc1_.height * 0.5;
         _loc1_.x = -_loc1_.width * 0.5;
         §_-J2J§(_loc1_);
         this.§_-r1V§ = new §_-L14§(_loc1_,new Point());
      }
      
      override public function get rotation() : Number
      {
         return super.rotation;
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = param1;
         this.§_-r1V§.rotation = -param1;
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.visible = param1;
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
         this.visible = false;
      }
      
      public function §_-m1Y§() : *
      {
         return [this.position.x,this.position.y];
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0],param1[1]);
      }
      
      public function dispose() : void
      {
         if(this.parentStarling != null)
         {
            this.parentStarling.removeChildStarling(this);
         }
         this.removeFromParent(true);
         this.§_-r1V§ = null;
      }
      
      protected function get shamanIcon() : DisplayObject
      {
         return new ShamanIcon();
      }
      
      public function get spotSize() : int
      {
         return §_-D1T§.§_-12O§;
      }
   }
}

