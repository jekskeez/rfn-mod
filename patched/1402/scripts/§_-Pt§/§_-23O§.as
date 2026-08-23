package §_-Pt§
{
   import particles.§_-t1S§;
   
   public class §_-23O§ implements §_-g2T§
   {
      
      public function §_-23O§()
      {
         super();
      }
      
      public function apply(param1:§_-t1S§, param2:Number, param3:* = null) : void
      {
         if(param1.§_-424§)
         {
            return;
         }
         param1.velocity.x += param3.gravity.x * param2;
         param1.velocity.y += param3.gravity.y * param2;
      }
   }
}

