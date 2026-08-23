package §_-92Z§
{
   import §_-z2l§.§_-3c§;
   import flash.display.Sprite;
   import views.§_-i2V§;
   
   public class §_-v1R§ extends §_-3c§
   {
      
      private var §_-DB§:§_-i2V§ = null;
      
      private var §_-KU§:Sprite = null;
      
      public function §_-v1R§()
      {
         super();
      }
      
      override protected function §_-72W§() : void
      {
         this.background = new GoldenCupDailyRepost();
         this.§_-DB§ = new §_-i2V§();
         this.§_-DB§.§_-M1s§();
         this.§_-DB§.x = (this.background.width - this.§_-DB§.width) * 0.5 - 40;
         this.§_-DB§.y = (this.background.height - this.§_-DB§.height) * 0.5;
         this.§_-KU§ = new LeprechaunCap();
         this.§_-KU§.x = (this.background.width - this.§_-KU§.width) * 0.5 + 70;
         this.§_-KU§.y = this.§_-DB§.y - 20;
         this.§_-KU§.scaleX = this.§_-KU§.scaleY = 0.8;
         this.caption = gls("Богатства Лепрекона стали моими!");
         super.§_-72W§();
         addChild(this.§_-KU§);
         addChild(this.§_-DB§);
      }
      
      override public function get id() : int
      {
         return 1;
      }
   }
}

