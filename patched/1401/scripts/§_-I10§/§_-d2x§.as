package §_-I10§
{
   import §_-68§.§_-EI§;
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-w17§;
   import §_-e2w§.§_-1W§;
   import §_-k1c§.§_-f1q§;
   import com.api.Player;
   import com.api.Services;
   import com.api.SettingsExistsEvent;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import views.§_-5b§;
   
   public class §_-d2x§
   {
      
      private static var §_-FT§:Array = [];
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function §_-d2x§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-P13§]);
         if("exp" in Game.self)
         {
            §_-u1o§.dispatchEvent(new GameEvent(GameEvent.EXPERIENCE_CHANGED,{
               "value":§_-s2O§,
               "delta":0,
               "reason":0
            }));
         }
         else
         {
            Game.self.addEventListener(§_-hF§.§_-sK§,§_-rF§);
         }
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function get §_-z2o§() : int
      {
         return Game.self["level"];
      }
      
      public static function get §_-s2O§() : int
      {
         return Game.self["exp"];
      }
      
      public static function §_-Yp§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-FT§.length)
         {
            showDialog(§_-FT§[_loc1_]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < §_-FT§.length)
         {
            §_-FT§.pop();
            _loc1_++;
         }
         §_-FT§.splice(0);
      }
      
      public static function §_-N1h§(param1:int) : void
      {
         var _loc2_:int = §_-My§.§_-A1x§(param1);
         var _loc3_:int = int(Game.self["level"]);
         §_-5K§.§_-a2t§(_loc2_);
         if(_loc2_ == §_-My§.§_-U1R§)
         {
            §_-5b§.§_-RC§();
         }
         if(_loc2_ == §_-q1p§.§_-l29§(§_-q1p§.§_-sL§).level && §_-71o§.active is §_-92z§)
         {
            Connection.§_-Li§(§_-h2B§.§_-n1x§);
            §_-92z§.§_-H2p§();
         }
         if(_loc2_ >= Game.§_-P2z§)
         {
            if(§_-Q2v§.§_-S2y§(§_-Q2v§.§_-YJ§) && §_-71o§.active is §_-92z§)
            {
               Connection.§_-Li§(§_-h2B§.§_-n1x§);
               §_-92z§.§_-H2p§();
            }
         }
         if(§_-k2X§.§_-P21§ || §_-71o§.active is §_-92z§ || §_-71o§.active is §_-w17§)
         {
            §_-FT§.push(param1);
         }
         else
         {
            showDialog(param1);
         }
         Game.self["level"] = _loc2_;
         §_-1W§.update();
         var _loc4_:int = _loc3_;
         while(_loc4_ < _loc2_)
         {
            §_-u1o§.dispatchEvent(new GameEvent(GameEvent.LEVEL_CHANGED,{"value":_loc4_ + 1}));
            _loc4_++;
         }
      }
      
      public static function get §_-e9§() : int
      {
         var _loc1_:int = §_-My§.§_-A1x§(§_-s2O§);
         if(_loc1_ >= §_-My§.§_-F2b§)
         {
            return 0;
         }
         return §_-My§.§_-Vi§(_loc1_ + 1) - §_-s2O§;
      }
      
      private static function showDialog(param1:int) : void
      {
         var level:int = 0;
         var exp:int = param1;
         level = §_-My§.§_-A1x§(exp);
         requestLeftMenu(level);
         §_-EI§.load(function():void
         {
            new §_-f1q§(level).show();
         },true);
      }
      
      private static function requestLeftMenu(param1:int) : void
      {
         if(param1 < Game.§_-CY§)
         {
            return;
         }
         if(param1 % 2 != 0)
         {
            return;
         }
         Services.addEventListener(SettingsExistsEvent.LEFT_MENU,§_-93I§);
         Services.requestLeftMenu(true);
      }
      
      private static function §_-93I§(param1:SettingsExistsEvent) : void
      {
         if(!param1.isExists)
         {
            return;
         }
         Services.requestLeftMenu(false);
      }
      
      private static function §_-rF§(param1:Player) : void
      {
         param1.removeEventListener(§_-rF§);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.EXPERIENCE_CHANGED,{
            "value":§_-s2O§,
            "delta":0,
            "reason":0
         }));
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = §_-s2O§;
         Game.self["exp"] = param1[0];
         if(§_-My§.§_-1P§(_loc2_,§_-s2O§))
         {
            §_-N1h§(§_-s2O§);
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.EXPERIENCE_CHANGED,{
            "value":§_-s2O§,
            "delta":§_-s2O§ - _loc2_,
            "reason":param1[1]
         }));
      }
   }
}

