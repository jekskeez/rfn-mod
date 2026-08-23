package §_-B1O§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-8B§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-o1s§;
   import game.mainGame.entity.§_-p19§;
   import utils.§_-23z§;
   
   public class §_-rJ§ extends §_-h2I§ implements §_-63Q§, §_-03u§, §_-C2x§, §_-o1s§, §_-8B§, §_-p19§
   {
      
      protected var §_-s1D§:§_-23z§;
      
      public function §_-rJ§()
      {
         super();
         var _loc1_:§_-h2I§ = new §_-h2I§(this.shamanIcon);
         _loc1_.y = -_loc1_.height * 0.5;
         _loc1_.x = -_loc1_.width * 0.5;
         §_-83v§(_loc1_);
         this.§_-s1D§ = new §_-23z§(_loc1_,new Point());
      }
      
      override public function get rotation() : Number
      {
         return super.rotation;
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = param1;
         this.§_-s1D§.rotation = -param1;
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.visible = param1;
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
         this.visible = false;
      }
      
      public function §_-A1X§() : *
      {
         return [this.position.x,this.position.y];
      }
      
      public function §_-41M§(param1:*) : void
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
         this.§_-s1D§ = null;
      }
      
      protected function get shamanIcon() : DisplayObject
      {
         return new ShamanIcon();
      }
      
      public function get spotSize() : int
      {
         return §_-O1q§.§_-43D§;
      }
   }
}

