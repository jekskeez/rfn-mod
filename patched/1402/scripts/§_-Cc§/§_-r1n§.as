package §_-Cc§
{
   import §_-j2E§.§_-W2i§;
   import §_-s2e§.§_-O1h§;
   
   public class §_-r1n§ extends §_-pp§
   {
      
      private static const §_-D26§:Number = 1.05;
      
      public function §_-r1n§(param1:Number)
      {
         super(param1);
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-W2i§ = null;
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed /= §_-D26§;
         }
         else
         {
            param1.runSpeed *= §_-D26§;
            _loc2_ = new §_-W2i§(§_-O1h§.§_-U2G§);
            _loc2_.name = §_-O1h§.§_-U2G§;
            param1.changeView(_loc2_);
         }
         super.hero = param1;
      }
   }
}

