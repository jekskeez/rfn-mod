package §_-Al§
{
   import §_-E1v§.§_-w1k§;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   import utils.§_-B1d§;
   
   public class §_-MC§ extends §_-K1K§
   {
      
      private var time:int = 0;
      
      public function §_-MC§()
      {
         super(§_-w1k§.§_-x1i§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.time = param1[0];
         this.§_-23Z§[0].text = this.time.toString();
         this.§_-23Z§[1].text = §_-B1d§.§_-g2n§(this.time);
      }
      
      override public function save() : §_-z1i§
      {
         this.time = int(this.§_-23Z§[0].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(this.time);
         return _loc1_;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-23Z§[0].addEventListener(KeyboardEvent.KEY_DOWN,this.§_-M29§);
         this.§_-23Z§[1].selectable = false;
         this.§_-23Z§[1].mouseEnabled = false;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Время","Окончание через"];
      }
      
      private function §_-M29§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         this.§_-23Z§[1].text = §_-B1d§.§_-g2n§(int(this.§_-23Z§[0].text));
      }
   }
}

