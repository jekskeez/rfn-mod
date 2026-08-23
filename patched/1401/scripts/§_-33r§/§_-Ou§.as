package §_-33r§
{
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   
   public class §_-Ou§ extends §_-m2U§
   {
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-Ou§(param1:Number, param2:Number)
      {
         super(param1,param2);
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.disableEffect(§_-93d§.§_-c1W§);
            this.§_-A38§ = null;
         }
         else
         {
            this.§_-A38§ = param1.applyEffect(§_-93d§.§_-c1W§);
         }
         super.hero = param1;
      }
   }
}

