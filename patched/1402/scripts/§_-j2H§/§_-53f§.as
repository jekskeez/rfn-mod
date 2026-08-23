package §_-j2H§
{
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-Q2§.§_-N1y§;
   
   public class §_-53f§ extends §_-N1y§
   {
      
      private var §_-Mj§:§_-w10§;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-53f§()
      {
         super();
         this.view.y -= 10;
         this.§_-Mj§ = §_-w10§.instance;
         this.§_-W1u§ = this.§_-Mj§.§_-d1y§(§_-w10§.§_-f2E§);
         this.§_-W1u§.view.visible = true;
         this.§_-W1u§.view.rotation = 90 * Game.D2R;
         this.§_-W1u§.view.y = -15;
         this.§_-W1u§.start();
         §_-J2J§(this.§_-W1u§.view);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(Boolean(this.§_-W1u§) && Boolean(this.§_-Mj§))
         {
            this.§_-W1u§.stop();
            this.§_-Mj§.§_-L1c§(this.§_-W1u§);
            this.§_-W1u§ = null;
         }
      }
      
      override protected function get imageClass() : Class
      {
         return OneWayWildBalkImg;
      }
   }
}

