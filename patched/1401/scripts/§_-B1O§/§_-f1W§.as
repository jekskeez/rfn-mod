package §_-B1O§
{
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import §_-b1B§.§_-gf§;
   
   public class §_-f1W§ extends §_-gf§
   {
      
      private var §_-CG§:§_-93d§;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-f1W§()
      {
         super();
         this.view.y -= 10;
         this.§_-CG§ = §_-93d§.instance;
         this.§_-A38§ = this.§_-CG§.§_-23j§(§_-93d§.§_-t2b§);
         this.§_-A38§.view.visible = true;
         this.§_-A38§.view.rotation = 90 * Game.D2R;
         this.§_-A38§.view.y = -15;
         this.§_-A38§.start();
         §_-83v§(this.§_-A38§.view);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(Boolean(this.§_-A38§) && Boolean(this.§_-CG§))
         {
            this.§_-A38§.stop();
            this.§_-CG§.§_-ms§(this.§_-A38§);
            this.§_-A38§ = null;
         }
      }
      
      override protected function get imageClass() : Class
      {
         return OneWayWildBalkImg;
      }
   }
}

