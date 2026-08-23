package §_-Yb§
{
   import §_-D1c§.§_-N2T§;
   import §_-D1c§.§_-c1n§;
   import flash.events.Event;
   
   public class §_-n1u§ extends §_-h10§
   {
      
      private var §_-TD§:§_-N2T§ = null;
      
      private var §_-H2e§:§_-N2T§ = null;
      
      private var §_-53S§:§_-N2T§ = null;
      
      private var §_-B2d§:§_-N2T§ = null;
      
      public function §_-n1u§()
      {
         super();
         this.§_-TD§ = new §_-N2T§(gls("Призрачный {0}","(ghost)"),"ghost");
         this.§_-TD§.addEventListener(Event.CHANGE,this.§_-VE§);
         §_-XG§(this.§_-TD§);
         this.§_-H2e§ = new §_-N2T§(gls("Призрачный к объектам {0}","(ghostToObject)"),"ghostToObject");
         this.§_-H2e§.addEventListener(Event.CHANGE,this.§_-A1I§);
         §_-XG§(this.§_-H2e§);
         this.§_-53S§ = new §_-N2T§(gls("Фиксированый {0}","(fixed)"),"fixed");
         this.§_-53S§.addEventListener(Event.CHANGE,this.§_-Kf§);
         §_-XG§(this.§_-53S§);
         this.§_-B2d§ = new §_-N2T§(gls("Фиксированый угол {0}","(fixedRotation)"),"fixedRotation");
         this.§_-B2d§.addEventListener(Event.CHANGE,this.§_-P1s§);
         §_-XG§(this.§_-B2d§);
         §_-XG§(new §_-c1n§(gls("Скорость {0}","(speed)"),"speed"));
      }
      
      override public function get height() : Number
      {
         return super.§_-7e§;
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
      }
      
      private function §_-VE§(param1:Event) : void
      {
         if(!this.inspectObject["ghostToObject"])
         {
            return;
         }
         this.inspectObject["ghostToObject"] = false;
         this.§_-H2e§.inspectObject = this.inspectObject;
      }
      
      private function §_-A1I§(param1:Event) : void
      {
         if(!this.inspectObject["ghost"])
         {
            return;
         }
         this.inspectObject["ghost"] = false;
         this.§_-TD§.inspectObject = this.inspectObject;
      }
      
      private function §_-Kf§(param1:Event) : void
      {
         if(!this.inspectObject["fixedRotation"])
         {
            return;
         }
         this.inspectObject["fixedRotation"] = false;
         this.§_-B2d§.inspectObject = this.inspectObject;
      }
      
      private function §_-P1s§(param1:Event) : void
      {
         if(!this.inspectObject["fixed"])
         {
            return;
         }
         this.inspectObject["fixed"] = false;
         this.§_-53S§.inspectObject = this.inspectObject;
      }
   }
}

