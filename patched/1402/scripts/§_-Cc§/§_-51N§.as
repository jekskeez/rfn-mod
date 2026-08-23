package §_-Cc§
{
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   
   public class §_-51N§ extends §_-pp§
   {
      
      public static const §_-7R§:Number = 15;
      
      public static const §_-vH§:Number = 15;
      
      private var §_-t1e§:Boolean = false;
      
      private var §_-X11§:Number = 0;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-51N§(param1:Number, param2:Boolean)
      {
         super(param1);
         this.§_-t1e§ = param2;
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         this.hero.moveLeft(this.§_-t1e§);
         this.hero.moveRight(!this.§_-t1e§);
         if(this.§_-X11§ >= §_-vH§)
         {
            return;
         }
         var _loc2_:Number = param1 * §_-7R§;
         this.hero.runSpeed += _loc2_;
         this.§_-X11§ += _loc2_;
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed -= this.§_-X11§;
            this.hero.moveLeft(false);
            this.hero.moveRight(false);
            this.hero.disableEffect(§_-w10§.§_-51i§);
            this.§_-W1u§ = null;
         }
         else
         {
            this.§_-W1u§ = param1.applyEffect(§_-w10§.§_-51i§);
         }
         super.hero = param1;
      }
   }
}

