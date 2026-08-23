package §_-B1O§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-RI§.§_-h2I§;
   
   public class §_-o2p§ extends §_-A1f§
   {
      
      public function §_-o2p§()
      {
         super();
      }
      
      override public function get size() : b2Vec2
      {
         return super.size;
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         this.resize(param1.x * 5,0);
      }
      
      override protected function §_-91h§() : void
      {
         this.icon = new §_-h2I§(new SpaceShipPieceView());
      }
      
      override protected function §_-H1a§() : void
      {
         this.§_-Nw§ = new SpaceShipPieceView();
      }
      
      override protected function resize(param1:int, param2:int) : void
      {
         param1 = Math.max(§_-11C§,param1);
         this._width = param1;
         this._height = 30;
         this.draw();
      }
      
      override protected function draw() : void
      {
         this._height = 60;
         super.draw();
         this._height = 50;
      }
   }
}

