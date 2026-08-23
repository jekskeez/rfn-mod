package §_-p1f§
{
   import §_-I10§.§_-My§;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-R1H§ extends §_-6Y§
   {
      
      private var count:uint = 0;
      
      public function §_-R1H§()
      {
         super(§_-6Y§.§_-P13§);
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-53o§[1].addEventListener(KeyboardEvent.KEY_DOWN,this.§_-52t§);
      }
      
      override public function load(param1:*) : void
      {
         this.count = param1[0];
         this.§_-53o§[0].text = String(this.count);
         this.§_-53o§[1].text = §_-My§.§_-A1x§(this.count).toString();
      }
      
      override public function save() : §_-U1M§
      {
         this.count = uint(this.§_-53o§[0].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(this.count);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Опыт","Уровень"];
      }
      
      private function §_-52t§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         this.§_-53o§[1].text = int(this.§_-53o§[1].text).toString();
         this.count = §_-My§.§_-Vi§(int(this.§_-53o§[1].text));
         this.§_-53o§[0].text = String(this.count);
      }
   }
}

