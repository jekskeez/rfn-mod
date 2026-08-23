package
{
   import §_-S1n§.§_-kr§;
   import buttons.§_-c6§;
   import flash.display.StageDisplayState;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import game.mainGame.GameMap;
   import mx.events.ResizeEvent;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import starling.core.Starling;
   import utils.§_-12w§;
   
   public class §_-73Q§
   {
      
      public static const §_-J1D§:String = "changeFullScreen";
      
      private static const §_-jx§:EventDispatcher = new EventDispatcher();
      
      private static var §_-X1p§:Boolean = false;
      
      private static var §_-p1R§:Boolean = false;
      
      private static var §_-q2e§:Boolean = false;
      
      public function §_-73Q§()
      {
         super();
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function get §_-R1R§() : Boolean
      {
         return §_-q2e§;
      }
      
      public static function set §_-R1R§(param1:Boolean) : void
      {
         var value:Boolean = param1;
         if(§_-q2e§ == value)
         {
            return;
         }
         §_-q2e§ = value;
         if(value)
         {
            try
            {
               Game.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
               return;
            }
            catch(e:Error)
            {
               §_-q2e§ = false;
               §_-p1R§ = false;
            }
         }
         try
         {
            Game.stage.displayState = StageDisplayState.NORMAL;
         }
         catch(e:Error)
         {
            §_-p2U§.add("set fullScreen: " + e.message);
         }
      }
      
      public static function get available() : Boolean
      {
         if(§_-X1p§)
         {
            return §_-p1R§;
         }
         var _loc1_:Object = §_-12w§.§_-x1n§;
         §_-p1R§ = _loc1_["major"] > 11 || _loc1_["major"] == 11 && _loc1_["minor"] >= 3;
         §_-X1p§ = true;
         return §_-p1R§;
      }
      
      public static function init() : void
      {
         §_-uR§.§_-E2k§();
         §_-Zn§();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,§_-73S§);
         Game.stage.addEventListener(ResizeEvent.RESIZE,§_-71P§);
      }
      
      public static function §_-ng§() : §_-c6§
      {
         var _loc1_:ButtonFullscreenHeaderOn = new ButtonFullscreenHeaderOn();
         _loc1_.addEventListener(MouseEvent.CLICK,§_-L1y§);
         new §_-kr§(_loc1_,gls("Перейти в полноэкранный режим"));
         var _loc2_:ButtonFullscreenHeaderOff = new ButtonFullscreenHeaderOff();
         _loc2_.addEventListener(MouseEvent.CLICK,§_-U1§);
         new §_-kr§(_loc2_,gls("Выйти из полноэкранного режима"));
         var _loc3_:§_-c6§ = new §_-c6§(_loc1_,_loc2_,§_-73Q§.§_-R1R§);
         _loc3_.visible = false;
         _loc3_.enabled(available);
         return _loc3_;
      }
      
      private static function §_-Zn§() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         Game.§_-q1L§.x = 0;
         Game.§_-q1L§.y = 0;
         Game.§_-q1L§.mask = null;
         if(§_-Zy§.§_-e2k§)
         {
            _loc1_ = Math.min(Game.stage.stageWidth / §_-Zy§.§_-21V§,Game.stage.stageHeight / §_-Zy§.§_-02T§);
            _loc2_ = Game.stage.stageWidth / _loc1_;
            _loc3_ = Game.stage.stageHeight / _loc1_;
            GameMap.§_-O19§ = _loc2_;
            GameMap.§_-Gd§ = _loc3_;
            Starling.§_-n1s§.§_-33S§ = new Rectangle(0,0,Game.stage.stageWidth,Game.stage.stageHeight);
            Starling.§_-n1s§.stage.stageWidth = _loc2_;
            Starling.§_-n1s§.stage.stageHeight = _loc3_;
            Game.§_-q1L§.scaleX = Game.§_-q1L§.scaleY = _loc1_;
            Game.§_-q1L§.x = 0;
            Game.§_-q1L§.y = 0;
         }
         else
         {
            GameMap.§_-O19§ = Game.stage.stageWidth;
            GameMap.§_-Gd§ = Game.stage.stageHeight;
            Starling.§_-n1s§.§_-33S§ = new Rectangle(0,0,Game.stage.stageWidth,Game.stage.stageHeight);
            Starling.§_-n1s§.stage.stageWidth = Game.stage.stageWidth;
            Starling.§_-n1s§.stage.stageHeight = Game.stage.stageHeight;
            Game.§_-q1L§.x = 0;
            Game.§_-q1L§.y = 0;
         }
      }
      
      private static function §_-71P§(param1:Event = null) : void
      {
         §_-Zn§();
         §_-q2e§ = Game.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE;
         §_-jx§.dispatchEvent(new Event(§_-J1D§));
      }
      
      private static function §_-73S§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.F || !param1.ctrlKey)
         {
            return;
         }
         if(available)
         {
            §_-R1R§ = !§_-R1R§;
         }
      }
      
      private static function §_-L1y§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§);
         Analytics.§_-R1R§();
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-H2C§);
         §_-R1R§ = true;
      }
      
      private static function §_-U1§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§);
         §_-R1R§ = false;
      }
   }
}

