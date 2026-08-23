package §_-p1f§
{
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-i1J§;
   import §_-xm§.§_-n1a§;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-y1O§ extends §_-6Y§
   {
      
      private var value:int = 0;
      
      private var §_-h2y§:§_-i1J§ = null;
      
      public function §_-y1O§()
      {
         super(§_-6Y§.§_-329§);
      }
      
      override public function load(param1:*) : void
      {
         this.value = param1[0];
         this.§_-53o§[0].text = this.value.toString();
      }
      
      override public function save() : §_-U1M§
      {
         this.value = int(this.§_-53o§[0].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(this.value);
         return _loc1_;
      }
      
      override protected function init() : void
      {
         super.init();
         if(this.§_-h2y§ != null)
         {
            return;
         }
         this.§_-h2y§ = new §_-i1J§("<body><a href=\'event:#\'>Информация</a></body>",0,0,§_-32A§.style);
         this.§_-h2y§.x = 0;
         this.§_-h2y§.y = this.§_-HL§.height;
         this.§_-h2y§.addEventListener(MouseEvent.CLICK,this.§_-W2b§);
         addChild(this.§_-h2y§);
      }
      
      private function §_-W2b§(param1:MouseEvent) : void
      {
         this.value = int(this.§_-53o§[0].text);
         if(this.value <= 0)
         {
            return;
         }
         §_-n1a§.show(this.value);
      }
      
      override protected function get fieldList() : Array
      {
         return ["ID клана:"];
      }
   }
}

