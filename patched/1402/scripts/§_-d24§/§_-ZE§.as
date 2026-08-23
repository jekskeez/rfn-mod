package §_-d24§
{
   import §_-42I§.§_-11n§;
   import §_-42I§.§_-i22§;
   import flash.events.Event;
   
   public class §_-ZE§ extends §_-eA§
   {
      
      private var §_-031§:§_-i22§ = null;
      
      private var §_-Ll§:§_-i22§ = null;
      
      private var §_-rf§:§_-i22§ = null;
      
      private var §_-Ov§:§_-i22§ = null;
      
      public function §_-ZE§()
      {
         super();
         this.§_-031§ = new §_-i22§(gls("Призрачный {0}","(ghost)"),"ghost");
         this.§_-031§.addEventListener(Event.CHANGE,this.§_-nt§);
         §_-X2r§(this.§_-031§);
         this.§_-Ll§ = new §_-i22§(gls("Призрачный к объектам {0}","(ghostToObject)"),"ghostToObject");
         this.§_-Ll§.addEventListener(Event.CHANGE,this.§_-73b§);
         §_-X2r§(this.§_-Ll§);
         this.§_-rf§ = new §_-i22§(gls("Фиксированый {0}","(fixed)"),"fixed");
         this.§_-rf§.addEventListener(Event.CHANGE,this.§_-oQ§);
         §_-X2r§(this.§_-rf§);
         this.§_-Ov§ = new §_-i22§(gls("Фиксированый угол {0}","(fixedRotation)"),"fixedRotation");
         this.§_-Ov§.addEventListener(Event.CHANGE,this.§_-j1K§);
         §_-X2r§(this.§_-Ov§);
         §_-X2r§(new §_-11n§(gls("Скорость {0}","(speed)"),"speed"));
      }
      
      override public function get height() : Number
      {
         return super.§_-52t§;
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
      }
      
      private function §_-nt§(param1:Event) : void
      {
         if(!this.inspectObject["ghostToObject"])
         {
            return;
         }
         this.inspectObject["ghostToObject"] = false;
         this.§_-Ll§.inspectObject = this.inspectObject;
      }
      
      private function §_-73b§(param1:Event) : void
      {
         if(!this.inspectObject["ghost"])
         {
            return;
         }
         this.inspectObject["ghost"] = false;
         this.§_-031§.inspectObject = this.inspectObject;
      }
      
      private function §_-oQ§(param1:Event) : void
      {
         if(!this.inspectObject["fixedRotation"])
         {
            return;
         }
         this.inspectObject["fixedRotation"] = false;
         this.§_-Ov§.inspectObject = this.inspectObject;
      }
      
      private function §_-j1K§(param1:Event) : void
      {
         if(!this.inspectObject["fixed"])
         {
            return;
         }
         this.inspectObject["fixed"] = false;
         this.§_-rf§.inspectObject = this.inspectObject;
      }
   }
}

