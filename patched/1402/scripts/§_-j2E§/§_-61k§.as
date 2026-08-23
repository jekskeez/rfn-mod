package §_-j2E§
{
   import §_-X1k§.§_-P2x§;
   
   public class §_-61k§ extends §_-L2m§
   {
      
      public function §_-61k§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "transform";
      }
      
      override protected function §_-o2x§() : void
      {
         if(Boolean(this.§_-N1l§) && Boolean(this.§_-F19§) && Boolean(this.§_-P2c§))
         {
            return;
         }
         if(Boolean(this.hero.player) && Boolean("worn_packages" in this.hero.player) && (this.hero.player["worn_packages"] as Array).indexOf(§_-P2x§.§_-px§) != -1)
         {
            this.§_-N1l§ = new ArceeTransformIn();
            this.§_-F19§ = new ArceeTransformOut();
            this.§_-P2c§ = new ArceeTransformStand();
         }
         else
         {
            this.§_-N1l§ = new BumblebeeTransformIn();
            this.§_-F19§ = new BumblebeeTransformOut();
            this.§_-P2c§ = new BumblebeeTransformStand();
         }
      }
   }
}

