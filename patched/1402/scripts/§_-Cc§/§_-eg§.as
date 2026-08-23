package §_-Cc§
{
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   
   public class §_-eg§ extends §_-rK§
   {
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-eg§(param1:Number, param2:Number)
      {
         super(param1,param2);
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.disableEffect(§_-w10§.§_-u2i§);
            this.§_-W1u§ = null;
         }
         else
         {
            this.§_-W1u§ = param1.applyEffect(§_-w10§.§_-u2i§);
         }
         super.hero = param1;
      }
   }
}

