package §_-33r§
{
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   
   public class §_-VV§ extends §_-AP§
   {
      
      public static const §_-q2T§:Number = 15;
      
      public static const §_-AT§:Number = 15;
      
      private var §_-b2R§:Boolean = false;
      
      private var §_-h2K§:Number = 0;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-VV§(param1:Number, param2:Boolean)
      {
         super(param1);
         this.§_-b2R§ = param2;
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         this.hero.moveLeft(this.§_-b2R§);
         this.hero.moveRight(!this.§_-b2R§);
         if(this.§_-h2K§ >= §_-AT§)
         {
            return;
         }
         var _loc2_:Number = param1 * §_-q2T§;
         this.hero.runSpeed += _loc2_;
         this.§_-h2K§ += _loc2_;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed -= this.§_-h2K§;
            this.hero.moveLeft(false);
            this.hero.moveRight(false);
            this.hero.disableEffect(§_-93d§.§_-237§);
            this.§_-A38§ = null;
         }
         else
         {
            this.§_-A38§ = param1.applyEffect(§_-93d§.§_-237§);
         }
         super.hero = param1;
      }
   }
}

