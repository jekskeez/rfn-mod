package §_-T2y§
{
   import §_-K2c§.Event;
   import §_-K2c§.§_-zT§;
   import starling.core.Starling;
   import starling.display.Sprite;
   
   public class §_-s1i§ extends Sprite
   {
      
      private static var _instance:§_-s1i§;
      
      private static var §_-G1n§:Boolean;
      
      private static var §_-P27§:int;
      
      private static var §_-v16§:Sprite = new Sprite();
      
      private static var §_-V1d§:Sprite = new Sprite();
      
      private static var §_-j2n§:Sprite = new Sprite();
      
      public function §_-s1i§()
      {
         super();
         §_-x2x§();
         _instance = this;
         _instance.addChild(§_-v16§);
         _instance.addChild(§_-V1d§);
         _instance.addChild(§_-j2n§);
         §_-TQ§.add("driver info",Starling.§_-y1l§.context.driverInfo);
         §_-TQ§.add("hardwareAccelerationEnable: ",§_-U25§);
         addEventListener(Event.ENTER_FRAME,this.§_-Jz§);
         if(§_-U25§)
         {
            Analytics.§_-21T§();
         }
      }
      
      public static function get §_-U25§() : Boolean
      {
         return Starling.§_-y1l§.context.driverInfo.indexOf("Software") == -1;
      }
      
      public static function get instance() : §_-s1i§
      {
         return _instance;
      }
      
      public static function set §_-i2A§(param1:Boolean) : void
      {
         §_-G1n§ = param1;
         §_-Vh§();
      }
      
      public static function §_-I0§() : void
      {
         ++§_-P27§;
         §_-Vh§();
      }
      
      public static function §_-EL§() : void
      {
         if(§_-P27§ > 0)
         {
            --§_-P27§;
         }
         §_-Vh§();
      }
      
      private static function §_-Vh§() : void
      {
         var _loc1_:Boolean = §_-G1n§ || §_-P27§ > 0;
         if(Boolean(Game.starling) && Boolean(Game.starling.stage))
         {
            Game.starling.stage.touchable = !_loc1_;
         }
         if(instance)
         {
            instance.touchable = !_loc1_;
         }
      }
      
      public static function get §_-z2D§() : Sprite
      {
         return §_-v16§;
      }
      
      public static function get §_-831§() : Sprite
      {
         return §_-V1d§;
      }
      
      public static function get §_-62c§() : Sprite
      {
         return §_-j2n§;
      }
      
      private function §_-Jz§(param1:§_-zT§) : void
      {
         §_-t1V§.§_-Jz§(param1.§_-g1p§);
      }
   }
}

