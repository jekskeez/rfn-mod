package §_-B1O§
{
   import §_-RI§.§_-h2I§;
   
   public class §_-s2C§ extends §_-41L§
   {
      
      public function §_-s2C§()
      {
         super();
         this.restitution = 0.1;
         this.density = 3;
      }
      
      override public function get landSound() : String
      {
         return "metal";
      }
      
      override protected function §_-H1a§() : void
      {
         this.§_-Nw§ = new MetalBlock();
      }
      
      override protected function §_-91h§() : void
      {
         this.icon = new §_-h2I§(new MetalBlock());
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
   }
}

