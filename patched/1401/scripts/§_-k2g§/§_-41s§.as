package §_-k2g§
{
   import §_-t2Y§.§_-H1W§;
   import flash.display.Sprite;
   import views.§_-3c§;
   
   public class §_-41s§ extends §_-H1W§
   {
      
      private var §_-J2g§:§_-3c§ = null;
      
      private var §_-L1Q§:Sprite = null;
      
      public function §_-41s§()
      {
         super();
      }
      
      override protected function §_-h1d§() : void
      {
         this.background = new GoldenCupDailyRepost();
         this.§_-J2g§ = new §_-3c§();
         this.§_-J2g§.§_-l1c§();
         this.§_-J2g§.x = (this.background.width - this.§_-J2g§.width) * 0.5 - 40;
         this.§_-J2g§.y = (this.background.height - this.§_-J2g§.height) * 0.5;
         this.§_-L1Q§ = new LeprechaunCap();
         this.§_-L1Q§.x = (this.background.width - this.§_-L1Q§.width) * 0.5 + 70;
         this.§_-L1Q§.y = this.§_-J2g§.y - 20;
         this.§_-L1Q§.scaleX = this.§_-L1Q§.scaleY = 0.8;
         this.caption = gls("Богатства Лепрекона стали моими!");
         super.§_-h1d§();
         addChild(this.§_-L1Q§);
         addChild(this.§_-J2g§);
      }
      
      override public function get id() : int
      {
         return 1;
      }
   }
}

