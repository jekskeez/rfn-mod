package §_-B1O§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-RI§.§_-h2I§;
   
   public class §_-41L§ extends §_-A1f§
   {
      
      private static const §_-Y2T§:int = 64;
      
      private static const §_-J2Y§:int = 32;
      
      public function §_-41L§()
      {
         super();
      }
      
      override public function get size() : b2Vec2
      {
         return super.size;
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         param1.x -= param1.x % (this.§_-a2v§ / Game.§_-x2P§);
         param1.y -= param1.y % (this.§_-D1g§ / Game.§_-x2P§);
         super.size = param1;
      }
      
      override protected function §_-H1a§() : void
      {
         this.§_-Nw§ = new Block();
      }
      
      override protected function §_-91h§() : void
      {
         this.icon = new §_-h2I§(new Block());
      }
      
      override protected function draw() : void
      {
         this._width -= _width % this.§_-a2v§;
         this._height -= _height % this.§_-D1g§;
         this._width = Math.max(_width,this.§_-a2v§);
         this._height = Math.max(_height,this.§_-D1g§);
         super.draw();
      }
      
      protected function get §_-a2v§() : int
      {
         return §_-Y2T§;
      }
      
      protected function get §_-D1g§() : int
      {
         return §_-J2Y§;
      }
   }
}

