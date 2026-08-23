package §_-33r§
{
   import §_-68§.§_-M10§;
   import §_-P2b§.§_-73X§;
   
   public class §_-C1Y§ extends §_-AP§
   {
      
      private static const §_-y1J§:Number = 1.05;
      
      public function §_-C1Y§(param1:Number)
      {
         super(param1);
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:§_-73X§ = null;
         if(param1 == null && this.hero != null)
         {
            this.hero.runSpeed /= §_-y1J§;
         }
         else
         {
            param1.runSpeed *= §_-y1J§;
            _loc2_ = new §_-73X§(§_-M10§.§_-u§);
            _loc2_.name = §_-M10§.§_-u§;
            param1.changeView(_loc2_);
         }
         super.hero = param1;
      }
   }
}

