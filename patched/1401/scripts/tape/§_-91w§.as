package tape
{
   import §_-r2Y§.§_-33e§;
   
   public class §_-91w§ extends §_-xc§
   {
      
      public function §_-91w§(param1:Class = null)
      {
         super(param1);
      }
      
      override public function addObject(param1:§_-K2k§) : void
      {
         super.addObject(param1);
         if(param1 is §_-A3s§)
         {
            param1.addEventListener(§_-33e§.STICKED,this.§_-K1s§);
         }
      }
      
      override public function §_-v1z§(param1:§_-K2k§, param2:int = 0) : void
      {
         super.§_-v1z§(param1,param2);
         if(param1 is §_-A3s§)
         {
            param1.addEventListener(§_-33e§.STICKED,this.§_-K1s§);
         }
      }
      
      override public function §_-yA§(param1:§_-K2k§) : void
      {
         super.§_-yA§(param1);
         if(param1 is §_-A3s§)
         {
            param1.addEventListener(§_-33e§.STICKED,this.§_-K1s§);
         }
      }
      
      protected function §_-K1s§(param1:§_-33e§) : void
      {
         dispatchEvent(new §_-33e§(param1.element,§_-33e§.STICKED));
      }
   }
}

