package §_-Pt§
{
   import flash.geom.Point;
   import particles.§_-t1S§;
   
   public class §_-9Z§ implements §_-g2T§
   {
      
      public function §_-9Z§()
      {
         super();
      }
      
      public function apply(param1:§_-t1S§, param2:Number, param3:* = null) : void
      {
         if(param1.y <= param3.height)
         {
            return;
         }
         if(!param1.§_-424§)
         {
            param1.§_-424§ = true;
            param1.velocity = new Point(0,0);
            param1.§_-W2X§ = 0;
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

