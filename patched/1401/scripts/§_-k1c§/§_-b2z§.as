package §_-k1c§
{
   public class §_-b2z§ extends Dialog
   {
      
      public function §_-b2z§(param1:* = null, param2:Boolean = true, param3:Boolean = true)
      {
         this.§_-R1Y§ = 20;
         this.§_-4n§ = 20;
         this.topOffset = 10;
         super(param1,true,param2,DialogBaseBackground,param3);
      }
      
      override protected function initClose() : void
      {
         super.initClose();
         this.§_-O2e§.x -= 3;
         this.§_-O2e§.y -= 10;
      }
   }
}

