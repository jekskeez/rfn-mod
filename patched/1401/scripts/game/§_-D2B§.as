package game
{
   import §_-ZS§.§_-93d§;
   
   public class §_-D2B§ extends §_-HN§
   {
      
      public function §_-D2B§()
      {
         super();
      }
      
      override public function stop() : void
      {
         if(this.§_-A38§ == null)
         {
            return;
         }
         this.§_-A38§.stop();
         §_-93d§.instance.§_-ms§(this.§_-A38§);
         this.§_-A38§ = null;
      }
   }
}

