package tape
{
   import §_-a11§.§_-h2m§;
   
   public class §_-o2N§ extends §_-h2f§
   {
      
      public function §_-o2N§(param1:Class = null)
      {
         super(param1);
      }
      
      override public function addObject(param1:§_-QN§) : void
      {
         super.addObject(param1);
         if(param1 is §_-2n§)
         {
            param1.addEventListener(§_-h2m§.STICKED,this.§_-F1J§);
         }
      }
      
      override public function §_-L1M§(param1:§_-QN§, param2:int = 0) : void
      {
         super.§_-L1M§(param1,param2);
         if(param1 is §_-2n§)
         {
            param1.addEventListener(§_-h2m§.STICKED,this.§_-F1J§);
         }
      }
      
      override public function §_-LF§(param1:§_-QN§) : void
      {
         super.§_-LF§(param1);
         if(param1 is §_-2n§)
         {
            param1.addEventListener(§_-h2m§.STICKED,this.§_-F1J§);
         }
      }
      
      protected function §_-F1J§(param1:§_-h2m§) : void
      {
         dispatchEvent(new §_-h2m§(param1.element,§_-h2m§.STICKED));
      }
   }
}

