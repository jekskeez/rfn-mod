package tape
{
   import §_-r2Y§.TapeDataEvent;
   
   public class §_-W18§ extends §_-3l§
   {
      
      private var §_-q2C§:MoviePreload;
      
      private var mini:Boolean = false;
      
      public function §_-W18§(param1:Boolean = false)
      {
         this.mini = param1;
         super(param1 ? 5 : 2,param1 ? 1 : 4,0,0,param1 ? 0 : 20,20,param1 ? 60 : 258,50);
         setData(new §_-gE§(param1));
         this.data.addEventListener(TapeDataEvent.UPDATE,this.§_-B3I§);
         if(this.mini)
         {
            this.data.addEventListener(TapeDataEvent.UPDATE,this.onUpdate);
         }
         this.§_-q2C§ = new MoviePreload();
         this.§_-q2C§.scaleX = this.§_-q2C§.scaleY = 2;
         this.§_-q2C§.x = 230;
         this.§_-q2C§.y = 100;
         if(!this.mini)
         {
            addChild(this.§_-q2C§);
         }
      }
      
      public function §_-Lj§() : Array
      {
         return this.§_-m2j§.§_-Lj§();
      }
      
      public function §_-WG§() : void
      {
         this.§_-m2j§.§_-WG§();
      }
      
      private function get §_-m2j§() : §_-gE§
      {
         return this.data as §_-gE§;
      }
      
      private function onUpdate(param1:TapeDataEvent) : void
      {
         this.x = (5 - this.data.objects.length) * 30;
      }
      
      private function §_-B3I§(param1:TapeDataEvent) : void
      {
         this.data.removeEventListener(TapeDataEvent.UPDATE,this.§_-B3I§);
         this.§_-q2C§.visible = false;
      }
      
      override protected function §_-bX§() : void
      {
      }
      
      override protected function updateButtons() : void
      {
      }
   }
}

