package tape
{
   import §_-r2Y§.§_-33e§;
   
   public class §_-wP§ extends §_-3l§
   {
      
      public var §_-Y1y§:§_-A3s§ = null;
      
      public var §_-43W§:Boolean = false;
      
      public function §_-wP§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         this.init();
      }
      
      protected function init() : void
      {
      }
      
      override public function setData(param1:§_-xc§) : void
      {
         if(this.data != null)
         {
            this.data.removeEventListener(§_-33e§.STICKED,this.§_-a16§);
         }
         super.setData(param1);
         this.data.addEventListener(§_-33e§.STICKED,this.§_-a16§);
      }
      
      override protected function §_-jR§(param1:int, param2:int) : void
      {
         super.§_-jR§(param1,param2);
         if(this.§_-43W§ && this.data.objects.length > param1)
         {
            this.select(this.data.objects[param1] as §_-A3s§);
         }
      }
      
      public function §_-51b§() : void
      {
         this.select(null);
      }
      
      protected function §_-a16§(param1:§_-33e§) : void
      {
         this.select(param1.element as §_-A3s§);
      }
      
      public function select(param1:§_-A3s§) : void
      {
         if(this.§_-Y1y§ != null)
         {
            this.§_-Y1y§.selected = false;
         }
         this.§_-Y1y§ = param1;
         if(this.§_-Y1y§ != null)
         {
            this.§_-Y1y§.selected = true;
         }
         this.§_-x2k§(this.§_-Y1y§);
         dispatchEvent(new §_-33e§(this.§_-Y1y§,§_-33e§.SELECTED));
      }
      
      protected function §_-x2k§(param1:§_-A3s§) : void
      {
      }
   }
}

