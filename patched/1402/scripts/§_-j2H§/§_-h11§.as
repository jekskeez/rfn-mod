package §_-j2H§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-TK§.§_-aS§;
   
   public class §_-h11§ extends §_-01b§
   {
      
      private static const §_-hh§:int = 64;
      
      private static const §_-uD§:int = 32;
      
      public function §_-h11§()
      {
         super();
      }
      
      override public function get size() : b2Vec2
      {
         return super.size;
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         param1.x -= param1.x % (this.§_-J2H§ / Game.§_-12A§);
         param1.y -= param1.y % (this.§_-V1Q§ / Game.§_-12A§);
         super.size = param1;
      }
      
      override protected function §_-Nq§() : void
      {
         this.§_-Z2d§ = new Block();
      }
      
      override protected function §_-q2X§() : void
      {
         this.icon = new §_-aS§(new Block());
      }
      
      override protected function draw() : void
      {
         this._width -= _width % this.§_-J2H§;
         this._height -= _height % this.§_-V1Q§;
         this._width = Math.max(_width,this.§_-J2H§);
         this._height = Math.max(_height,this.§_-V1Q§);
         super.draw();
      }
      
      protected function get §_-J2H§() : int
      {
         return §_-hh§;
      }
      
      protected function get §_-V1Q§() : int
      {
         return §_-uD§;
      }
   }
}

