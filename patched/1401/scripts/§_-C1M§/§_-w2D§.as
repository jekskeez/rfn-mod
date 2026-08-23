package §_-C1m§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-w2D§ implements §_-d29§
   {
      
      private var §_-4A§:int;
      
      private var _position:b2Vec2;
      
      private var §_-s2g§:b2Vec2;
      
      private var §_-D2f§:Number;
      
      private var §_-13J§:Number;
      
      private var §_-D2i§:int = 0;
      
      public function §_-w2D§(param1:Array, param2:int = 0)
      {
         super();
         this.§_-4A§ = param1[0];
         this._position = new b2Vec2(param1[1],param1[2]);
         this.§_-D2f§ = param1[3];
         this.§_-s2g§ = new b2Vec2(param1[4],param1[5]);
         this.§_-13J§ = param1[6];
         this.§_-D2i§ = param2;
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-4A§ = param1;
      }
      
      public function get position() : b2Vec2
      {
         return this._position;
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this._position = param1;
      }
      
      public function get angle() : Number
      {
         return this.§_-D2f§;
      }
      
      public function set angle(param1:Number) : void
      {
         this.§_-D2f§ = param1;
      }
      
      public function get linearVelocity() : b2Vec2
      {
         return this.§_-s2g§;
      }
      
      public function set linearVelocity(param1:b2Vec2) : void
      {
         this.§_-s2g§ = param1;
      }
      
      public function get angularVelocity() : Number
      {
         return this.§_-13J§;
      }
      
      public function set angularVelocity(param1:Number) : void
      {
         this.§_-13J§ = param1;
      }
      
      public function get personalId() : int
      {
         return this.§_-D2i§;
      }
      
      public function dispose() : void
      {
      }
   }
}

