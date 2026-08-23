package §_-C3e§
{
   import flash.events.MouseEvent;
   
   public class §_-03e§ extends §_-X15§
   {
      
      private static var _instance:§_-03e§ = null;
      
      private var §_-VR§:int = 0;
      
      public function §_-03e§()
      {
         super();
      }
      
      public static function get instance() : §_-03e§
      {
         if(!_instance)
         {
            _instance = new §_-03e§();
         }
         return _instance;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         §_-01Y§.§_-l2K§(this.§_-j2O§);
      }
      
      public function set §_-un§(param1:int) : void
      {
         this.§_-VR§ = param1;
         this.text = gls("ПОТОРОПИСЬ, ОСТАЛОСЬ {0} сек.",this.§_-VR§);
         §_-01Y§.§_-c9§(this.§_-j2O§);
      }
      
      private function §_-j2O§() : void
      {
         --this.§_-VR§;
         this.text = gls("ПОТОРОПИСЬ, ОСТАЛОСЬ {0} сек.",this.§_-VR§);
      }
   }
}

