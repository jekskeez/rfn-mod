package §_-92r§
{
   import flash.events.MouseEvent;
   
   public class §_-B3Y§ extends §_-d1V§
   {
      
      private static var _instance:§_-B3Y§ = null;
      
      private var §_-e6§:int = 0;
      
      public function §_-B3Y§()
      {
         super();
      }
      
      public static function get instance() : §_-B3Y§
      {
         if(!_instance)
         {
            _instance = new §_-B3Y§();
         }
         return _instance;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         §_-p1V§.§_-B3x§(this.§_-x5§);
      }
      
      public function set §_-lQ§(param1:int) : void
      {
         this.§_-e6§ = param1;
         this.text = gls("ПОТОРОПИСЬ, ОСТАЛОСЬ {0} сек.",this.§_-e6§);
         §_-p1V§.§_-63T§(this.§_-x5§);
      }
      
      private function §_-x5§() : void
      {
         --this.§_-e6§;
         this.text = gls("ПОТОРОПИСЬ, ОСТАЛОСЬ {0} сек.",this.§_-e6§);
      }
   }
}

