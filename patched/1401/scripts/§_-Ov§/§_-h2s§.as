package §_-OV§
{
   import particles.§_-13p§;
   
   public class §_-h2s§ implements §_-O1g§
   {
      
      public function §_-h2s§()
      {
         super();
      }
      
      public function apply(param1:§_-13p§, param2:Number, param3:* = null) : void
      {
         if(param1.§_-j2i§)
         {
            return;
         }
         param1.velocity.x += param3.gravity.x * param2;
         param1.velocity.y += param3.gravity.y * param2;
      }
   }
}

