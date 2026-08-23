package §_-p2H§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-sd§;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-Q1c§ extends §_-h2I§ implements §_-63Q§, §_-03u§, §_-C2x§, §_-sd§
   {
      
      public function §_-Q1c§(param1:Class = null, param2:int = 0)
      {
         var _loc3_:§_-h2I§ = null;
         super();
         if(param1)
         {
            _loc3_ = new §_-h2I§(new param1());
            _loc3_.§_-x2x§();
            _loc3_.y = -_loc3_.height * 0.5 + param2;
            §_-83v§(_loc3_);
         }
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
         return this.rotation * Game.D2R;
      }
      
      public function set angle(param1:Number) : void
      {
         this.rotation = param1 / Game.D2R;
      }
      
      public function get §_-9y§() : Boolean
      {
         return this.scaleX > 0;
      }
      
      public function set §_-9y§(param1:Boolean) : void
      {
         this.scaleX = Math.abs(this.scaleX) * (param1 ? 1 : -1);
      }
      
      public function build(param1:b2World) : void
      {
      }
      
      public function §_-A1X§() : *
      {
         return [[this.position.x,this.position.y],this.angle,this.§_-9y§];
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.angle = param1[1];
         if(param1.length < 3)
         {
            return;
         }
         this.§_-9y§ = Boolean(param1[2]);
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0,true);
         }
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
         this.removeFromParent(true);
      }
   }
}

