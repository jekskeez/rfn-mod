package §_-bN§
{
   public class §_-T1e§ extends Dialog
   {
      
      public function §_-T1e§(param1:* = null, param2:Boolean = true, param3:Boolean = true)
      {
         this.§_-01q§ = 20;
         this.§_-7N§ = 20;
         this.topOffset = 10;
         super(param1,true,param2,DialogBaseBackground,param3);
      }
      
      override protected function initClose() : void
      {
         super.initClose();
         this.§_-x2T§.x -= 3;
         this.§_-x2T§.y -= 10;
      }
   }
}

