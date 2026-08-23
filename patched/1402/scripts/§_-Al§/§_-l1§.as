package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-y1B§;
   import §_-I18§.§_-Tw§;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-l1§ extends §_-K1K§
   {
      
      private var value:int = 0;
      
      private var §_-P1B§:§_-y1B§ = null;
      
      public function §_-l1§()
      {
         super(§_-K1K§.§_-L1b§);
      }
      
      override public function load(param1:*) : void
      {
         this.value = param1[0];
         this.§_-23Z§[0].text = this.value.toString();
      }
      
      override public function save() : §_-z1i§
      {
         this.value = int(this.§_-23Z§[0].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(this.value);
         return _loc1_;
      }
      
      override protected function init() : void
      {
         super.init();
         if(this.§_-P1B§ != null)
         {
            return;
         }
         this.§_-P1B§ = new §_-y1B§("<body><a href=\'event:#\'>Информация</a></body>",0,0,§_-A3G§.style);
         this.§_-P1B§.x = 0;
         this.§_-P1B§.y = this.§_-2H§.height;
         this.§_-P1B§.addEventListener(MouseEvent.CLICK,this.§_-F1m§);
         addChild(this.§_-P1B§);
      }
      
      private function §_-F1m§(param1:MouseEvent) : void
      {
         this.value = int(this.§_-23Z§[0].text);
         if(this.value <= 0)
         {
            return;
         }
         §_-Tw§.show(this.value);
      }
      
      override protected function get fieldList() : Array
      {
         return ["ID клана:"];
      }
   }
}

