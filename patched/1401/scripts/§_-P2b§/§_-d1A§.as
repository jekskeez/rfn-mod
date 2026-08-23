package §_-P2b§
{
   import §_-I10§.§_-g2W§;
   
   public class §_-d1A§ extends §_-d1L§
   {
      
      public function §_-d1A§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "transform";
      }
      
      override protected function §_-V2U§() : void
      {
         if(Boolean(this.§_-Lg§) && Boolean(this.§_-iW§) && Boolean(this.§_-M2I§))
         {
            return;
         }
         if(Boolean(this.hero.player) && Boolean("worn_packages" in this.hero.player) && (this.hero.player["worn_packages"] as Array).indexOf(§_-g2W§.§_-v1G§) != -1)
         {
            this.§_-Lg§ = new ArceeTransformIn();
            this.§_-iW§ = new ArceeTransformOut();
            this.§_-M2I§ = new ArceeTransformStand();
         }
         else
         {
            this.§_-Lg§ = new BumblebeeTransformIn();
            this.§_-iW§ = new BumblebeeTransformOut();
            this.§_-M2I§ = new BumblebeeTransformStand();
         }
      }
   }
}

