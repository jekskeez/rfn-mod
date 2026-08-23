package §_-k1z§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-N1R§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-bh§ extends §_-aS§ implements §_-xn§, §_-3l§, §_-l2r§, §_-N1R§
   {
      
      public function §_-bh§(param1:Class = null, param2:int = 0)
      {
         var _loc3_:§_-aS§ = null;
         super();
         if(param1)
         {
            _loc3_ = new §_-aS§(new param1());
            _loc3_.§_-i18§();
            _loc3_.y = -_loc3_.height * 0.5 + param2;
            §_-J2J§(_loc3_);
         }
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
         return this.rotation * Game.D2R;
      }
      
      public function set angle(param1:Number) : void
      {
         this.rotation = param1 / Game.D2R;
      }
      
      public function get §_-N2C§() : Boolean
      {
         return this.scaleX > 0;
      }
      
      public function set §_-N2C§(param1:Boolean) : void
      {
         this.scaleX = Math.abs(this.scaleX) * (param1 ? 1 : -1);
      }
      
      public function build(param1:b2World) : void
      {
      }
      
      public function §_-m1Y§() : *
      {
         return [[this.position.x,this.position.y],this.angle,this.§_-N2C§];
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.angle = param1[1];
         if(param1.length < 3)
         {
            return;
         }
         this.§_-N2C§ = Boolean(param1[2]);
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            this.§_-av§(0,true);
         }
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
         this.removeFromParent(true);
      }
   }
}

