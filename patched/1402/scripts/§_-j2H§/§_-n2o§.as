package §_-j2H§
{
   import §_-TK§.§_-aS§;
   
   public class §_-n2o§ extends §_-h11§
   {
      
      public function §_-n2o§()
      {
         super();
         this.restitution = 0.1;
         this.density = 3;
      }
      
      override public function get landSound() : String
      {
         return "metal";
      }
      
      override protected function §_-Nq§() : void
      {
         this.§_-Z2d§ = new MetalBlock();
      }
      
      override protected function §_-q2X§() : void
      {
         this.icon = new §_-aS§(new MetalBlock());
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
   }
}

