package tape
{
   import §_-a11§.§_-h2m§;
   
   public class §_-S1M§ extends §_-L2v§
   {
      
      public var §_-02G§:§_-2n§ = null;
      
      public var §_-F2l§:Boolean = false;
      
      public function §_-S1M§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         this.init();
      }
      
      protected function init() : void
      {
      }
      
      override public function setData(param1:§_-h2f§) : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(§_-h2m§.STICKED,this.§_-X1z§);
         }
         super.setData(param1);
         this.data.addEventListener(§_-h2m§.STICKED,this.§_-X1z§);
      }
      
      override protected function §_-P13§(param1:int, param2:int) : void
      {
         super.§_-P13§(param1,param2);
         if(this.§_-F2l§ && this.data.objects.length > param1)
         {
            this.select(this.data.objects[param1] as §_-2n§);
         }
      }
      
      public function §_-W2w§() : void
      {
         this.select(null);
      }
      
      protected function §_-X1z§(param1:§_-h2m§) : void
      {
         this.select(param1.element as §_-2n§);
      }
      
      public function select(param1:§_-2n§) : void
      {
         if(this.§_-02G§ != null)
         {
            this.§_-02G§.selected = false;
         }
         this.§_-02G§ = param1;
         if(this.§_-02G§ != null)
         {
            this.§_-02G§.selected = true;
         }
         this.§_-11q§(this.§_-02G§);
         dispatchEvent(new §_-h2m§(this.§_-02G§,§_-h2m§.SELECTED));
      }
      
      protected function §_-11q§(param1:§_-2n§) : void
      {
      }
   }
}

