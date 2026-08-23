package §_-B1O§
{
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-s2K§;
   
   public class §_-eD§ extends §_-QT§ implements §_-s2K§
   {
      
      public function §_-eD§()
      {
         super();
      }
      
      override protected function draw() : void
      {
         super.draw();
         this.§_-93z§.alpha = 0.5;
      }
      
      override protected function get maskBits() : uint
      {
         return §_-V§.§_-qV§;
      }
      
      override protected function get categories() : uint
      {
         return §_-V§.§_-tL§;
      }
   }
}

