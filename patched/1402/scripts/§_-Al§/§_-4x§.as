package §_-Al§
{
   import §_-X1k§.§_-XW§;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-4x§ extends §_-K1K§
   {
      
      private var count:uint = 0;
      
      public function §_-4x§()
      {
         super(§_-K1K§.§_-V2n§);
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-23Z§[1].addEventListener(KeyboardEvent.KEY_DOWN,this.§_-M29§);
      }
      
      override public function load(param1:*) : void
      {
         this.count = param1[0];
         this.§_-23Z§[0].text = String(this.count);
         this.§_-23Z§[1].text = §_-XW§.§_-82P§(this.count).toString();
      }
      
      override public function save() : §_-z1i§
      {
         this.count = uint(this.§_-23Z§[0].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(this.count);
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Опыт","Уровень"];
      }
      
      private function §_-M29§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         this.§_-23Z§[1].text = int(this.§_-23Z§[1].text).toString();
         this.count = §_-XW§.§_-s2h§(int(this.§_-23Z§[1].text));
         this.§_-23Z§[0].text = String(this.count);
      }
   }
}

