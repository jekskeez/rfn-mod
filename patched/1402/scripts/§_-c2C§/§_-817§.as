package §_-c2C§
{
   import §_-f1T§.Event;
   import §_-f1T§.§_-K1M§;
   import starling.core.Starling;
   import starling.display.Sprite;
   
   public class §_-817§ extends Sprite
   {
      
      private static var _instance:§_-817§;
      
      private static var §_-Q2H§:Boolean;
      
      private static var §_-l1h§:int;
      
      private static var §_-o29§:Sprite = new Sprite();
      
      private static var §_-lS§:Sprite = new Sprite();
      
      private static var §_-U1i§:Sprite = new Sprite();
      
      public function §_-817§()
      {
         super();
         §_-i18§();
         _instance = this;
         _instance.addChild(§_-o29§);
         _instance.addChild(§_-lS§);
         _instance.addChild(§_-U1i§);
         §_-p2U§.add("driver info",Starling.§_-n1s§.context.driverInfo);
         §_-p2U§.add("hardwareAccelerationEnable: ",§_-jY§);
         addEventListener(Event.ENTER_FRAME,this.§_-62S§);
         if(§_-jY§)
         {
            Analytics.§_-3o§();
         }
      }
      
      public static function get §_-jY§() : Boolean
      {
         return Starling.§_-n1s§.context.driverInfo.indexOf("Software") == -1;
      }
      
      public static function get instance() : §_-817§
      {
         return _instance;
      }
      
      public static function set §_-R1J§(param1:Boolean) : void
      {
         §_-Q2H§ = param1;
         §_-p1Y§();
      }
      
      public static function §_-l2x§() : void
      {
         ++§_-l1h§;
         §_-p1Y§();
      }
      
      public static function §_-SF§() : void
      {
         if(§_-l1h§ > 0)
         {
            --§_-l1h§;
         }
         §_-p1Y§();
      }
      
      private static function §_-p1Y§() : void
      {
         var _loc1_:Boolean = §_-Q2H§ || §_-l1h§ > 0;
         if(Boolean(Game.starling) && Boolean(Game.starling.stage))
         {
            Game.starling.stage.touchable = !_loc1_;
         }
         if(instance)
         {
            instance.touchable = !_loc1_;
         }
      }
      
      public static function get §_-Z2U§() : Sprite
      {
         return §_-o29§;
      }
      
      public static function get §_-X2a§() : Sprite
      {
         return §_-lS§;
      }
      
      public static function get §_-C1N§() : Sprite
      {
         return §_-U1i§;
      }
      
      private function §_-62S§(param1:§_-K1M§) : void
      {
         §_-Mf§.§_-62S§(param1.§_-ID§);
      }
   }
}

