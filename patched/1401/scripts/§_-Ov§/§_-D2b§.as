package §_-OV§
{
   import flash.geom.Point;
   import particles.§_-13p§;
   
   public class §_-D2b§ implements §_-O1g§
   {
      
      public function §_-D2b§()
      {
         super();
      }
      
      public function apply(param1:§_-13p§, param2:Number, param3:* = null) : void
      {
         if(param1.y <= param3.height)
         {
            return;
         }
         if(!param1.§_-j2i§)
         {
            param1.§_-j2i§ = true;
            param1.velocity = new Point(0,0);
            param1.§_-o2F§ = 0;
         }
         if(!param3.useFade)
         {
            return;
         }
         param3.fadeDelay -= param2;
         if(param3.fadeDelay > 0)
         {
            return;
         }
         param1.alpha -= param3.fadeSpeed * param2;
      }
   }
}

