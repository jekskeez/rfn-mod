package tape
{
   import §_-a11§.TapeDataEvent;
   
   public class §_-73X§ extends §_-L2v§
   {
      
      private var §_-i2S§:MoviePreload;
      
      private var mini:Boolean = false;
      
      public function §_-73X§(param1:Boolean = false)
      {
         this.mini = param1;
         super(param1 ? 5 : 2,param1 ? 1 : 4,0,0,param1 ? 0 : 20,20,param1 ? 60 : 258,50);
         setData(new §_-jt§(param1));
         this.data.addEventListener(TapeDataEvent.UPDATE,this.§_-W8§);
         if(this.mini)
         {
            this.data.addEventListener(TapeDataEvent.UPDATE,this.onUpdate);
         }
         this.§_-i2S§ = new MoviePreload();
         this.§_-i2S§.scaleX = this.§_-i2S§.scaleY = 2;
         this.§_-i2S§.x = 230;
         this.§_-i2S§.y = 100;
         if(!this.mini)
         {
            addChild(this.§_-i2S§);
         }
      }
      
      public function §_-D1G§() : Array
      {
         return this.§_-Ij§.§_-D1G§();
      }
      
      public function §_-W1L§() : void
      {
         this.§_-Ij§.§_-W1L§();
      }
      
      private function get §_-Ij§() : §_-jt§
      {
         return this.data as §_-jt§;
      }
      
      private function onUpdate(param1:TapeDataEvent) : void
      {
         this.x = (5 - this.data.objects.length) * 30;
      }
      
      private function §_-W8§(param1:TapeDataEvent) : void
      {
         this.data.removeEventListener(TapeDataEvent.UPDATE,this.§_-W8§);
         this.§_-i2S§.visible = false;
      }
      
      override protected function §_-j2y§() : void
      {
      }
      
      override protected function updateButtons() : void
      {
      }
   }
}

