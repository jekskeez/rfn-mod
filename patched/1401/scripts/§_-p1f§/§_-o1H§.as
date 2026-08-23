package §_-p1f§
{
   import §_-l26§.§_-z2g§;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   import utils.§_-ex§;
   
   public class §_-o1H§ extends §_-6Y§
   {
      
      private var time:int = 0;
      
      public function §_-o1H§()
      {
         super(§_-z2g§.§_-N29§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         this.time = param1[0];
         this.§_-53o§[0].text = this.time.toString();
         this.§_-53o§[1].text = §_-ex§.§_-d2X§(this.time);
      }
      
      override public function save() : §_-U1M§
      {
         this.time = int(this.§_-53o§[0].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(this.time);
         return _loc1_;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-53o§[0].addEventListener(KeyboardEvent.KEY_DOWN,this.§_-52t§);
         this.§_-53o§[1].selectable = false;
         this.§_-53o§[1].mouseEnabled = false;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Время","Окончание через"];
      }
      
      private function §_-52t§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         this.§_-53o§[1].text = §_-ex§.§_-d2X§(int(this.§_-53o§[0].text));
      }
   }
}

