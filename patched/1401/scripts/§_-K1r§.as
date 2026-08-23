package
{
   import §_-e1G§.§_-Hb§;
   import buttons.§_-p1R§;
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
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import starling.core.Starling;
   import utils.§_-N1w§;
   
   public class §_-K1r§
   {
      
      public static const §_-n2V§:String = "changeFullScreen";
      
      private static const §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private static var §_-zm§:Boolean = false;
      
      private static var §_-Z1i§:Boolean = false;
      
      private static var §_-b9§:Boolean = false;
      
      public function §_-K1r§()
      {
         super();
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function get §_-O1P§() : Boolean
      {
         return §_-b9§;
      }
      
      public static function set §_-O1P§(param1:Boolean) : void
      {
         var value:Boolean = param1;
         if(§_-b9§ == value)
         {
            return;
         }
         §_-b9§ = value;
         if(value)
         {
            try
            {
               Game.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
               return;
            }
            catch(e:Error)
            {
               §_-b9§ = false;
               §_-Z1i§ = false;
            }
         }
         try
         {
            Game.stage.displayState = StageDisplayState.NORMAL;
         }
         catch(e:Error)
         {
            §_-TQ§.add("set fullScreen: " + e.message);
         }
      }
      
      public static function get available() : Boolean
      {
         if(§_-zm§)
         {
            return §_-Z1i§;
         }
         var _loc1_:Object = §_-N1w§.§_-L1o§;
         §_-Z1i§ = _loc1_["major"] > 11 || _loc1_["major"] == 11 && _loc1_["minor"] >= 3;
         §_-zm§ = true;
         return §_-Z1i§;
      }
      
      public static function init() : void
      {
         §_-k2X§.§_-335§();
         §_-OQ§();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,§_-O2u§);
         Game.stage.addEventListener(ResizeEvent.RESIZE,§_-g18§);
      }
      
      public static function §_-Ih§() : §_-p1R§
      {
         var _loc1_:ButtonFullscreenHeaderOn = new ButtonFullscreenHeaderOn();
         _loc1_.addEventListener(MouseEvent.CLICK,§_-4q§);
         new §_-Hb§(_loc1_,gls("Перейти в полноэкранный режим"));
         var _loc2_:ButtonFullscreenHeaderOff = new ButtonFullscreenHeaderOff();
         _loc2_.addEventListener(MouseEvent.CLICK,§_-R2w§);
         new §_-Hb§(_loc2_,gls("Выйти из полноэкранного режима"));
         var _loc3_:§_-p1R§ = new §_-p1R§(_loc1_,_loc2_,§_-K1r§.§_-O1P§);
         _loc3_.visible = false;
         _loc3_.enabled(available);
         return _loc3_;
      }
      
      private static function §_-OQ§() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         Game.§_-d2t§.x = 0;
         Game.§_-d2t§.y = 0;
         Game.§_-d2t§.mask = null;
         if(§_-a9§.§_-O1z§)
         {
            _loc1_ = Math.min(Game.stage.stageWidth / §_-a9§.§_-9o§,Game.stage.stageHeight / §_-a9§.§_-31m§);
            _loc2_ = Game.stage.stageWidth / _loc1_;
            _loc3_ = Game.stage.stageHeight / _loc1_;
            GameMap.§_-q1n§ = _loc2_;
            GameMap.§_-P1Q§ = _loc3_;
            Starling.§_-y1l§.§_-B9§ = new Rectangle(0,0,Game.stage.stageWidth,Game.stage.stageHeight);
            Starling.§_-y1l§.stage.stageWidth = _loc2_;
            Starling.§_-y1l§.stage.stageHeight = _loc3_;
            Game.§_-d2t§.scaleX = Game.§_-d2t§.scaleY = _loc1_;
            Game.§_-d2t§.x = 0;
            Game.§_-d2t§.y = 0;
         }
         else
         {
            GameMap.§_-q1n§ = Game.stage.stageWidth;
            GameMap.§_-P1Q§ = Game.stage.stageHeight;
            Starling.§_-y1l§.§_-B9§ = new Rectangle(0,0,Game.stage.stageWidth,Game.stage.stageHeight);
            Starling.§_-y1l§.stage.stageWidth = Game.stage.stageWidth;
            Starling.§_-y1l§.stage.stageHeight = Game.stage.stageHeight;
            Game.§_-d2t§.x = 0;
            Game.§_-d2t§.y = 0;
         }
      }
      
      private static function §_-g18§(param1:Event = null) : void
      {
         §_-OQ§();
         §_-b9§ = Game.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE;
         §_-u1o§.dispatchEvent(new Event(§_-n2V§));
      }
      
      private static function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.F || !param1.ctrlKey)
         {
            return;
         }
         if(available)
         {
            §_-O1P§ = !§_-O1P§;
         }
      }
      
      private static function §_-4q§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§);
         Analytics.§_-O1P§();
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-W1D§);
         §_-O1P§ = true;
      }
      
      private static function §_-R2w§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§);
         §_-O1P§ = false;
      }
   }
}

