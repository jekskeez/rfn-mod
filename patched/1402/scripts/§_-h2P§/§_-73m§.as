package §_-h2P§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-73m§ implements §_-sE§
   {
      
      private var §_-n2x§:int;
      
      private var _position:b2Vec2;
      
      private var §_-m2x§:b2Vec2;
      
      private var §_-h1k§:Number;
      
      private var §_-MP§:Number;
      
      private var §_-438§:int = 0;
      
      public function §_-73m§(param1:Array, param2:int = 0)
      {
         super();
         this.§_-n2x§ = param1[0];
         this._position = new b2Vec2(param1[1],param1[2]);
         this.§_-h1k§ = param1[3];
         this.§_-m2x§ = new b2Vec2(param1[4],param1[5]);
         this.§_-MP§ = param1[6];
         this.§_-438§ = param2;
      }
      
      public function get id() : int
      {
         return this.§_-n2x§;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-n2x§ = param1;
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
         return this.§_-h1k§;
      }
      
      public function set angle(param1:Number) : void
      {
         this.§_-h1k§ = param1;
      }
      
      public function get linearVelocity() : b2Vec2
      {
         return this.§_-m2x§;
      }
      
      public function set linearVelocity(param1:b2Vec2) : void
      {
         this.§_-m2x§ = param1;
      }
      
      public function get angularVelocity() : Number
      {
         return this.§_-MP§;
      }
      
      public function set angularVelocity(param1:Number) : void
      {
         this.§_-MP§ = param1;
      }
      
      public function get personalId() : int
      {
         return this.§_-438§;
      }
      
      public function dispose() : void
      {
      }
   }
}

