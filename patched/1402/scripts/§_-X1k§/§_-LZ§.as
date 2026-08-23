package §_-X1k§
{
   import §_-J1i§.§_-W1v§;
   import §_-bN§.§_-nx§;
   import §_-c2C§.§_-fx§;
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-s2e§.§_-U2d§;
   import com.api.Player;
   import com.api.Services;
   import com.api.SettingsExistsEvent;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import views.§_-y27§;
   
   public class §_-LZ§
   {
      
      private static var §_-93T§:Array = [];
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function §_-LZ§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-V2n§]);
         if("exp" in Game.self)
         {
            §_-jx§.dispatchEvent(new GameEvent(GameEvent.EXPERIENCE_CHANGED,{
               "value":§_-v1§,
               "delta":0,
               "reason":0
            }));
         }
         else
         {
            Game.self.addEventListener(§_-Y2E§.§_-T5§,§_-K16§);
         }
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function get §_-mA§() : int
      {
         return Game.self["level"];
      }
      
      public static function get §_-v1§() : int
      {
         return Game.self["exp"];
      }
      
      public static function §_-d1J§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-93T§.length)
         {
            showDialog(§_-93T§[_loc1_]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < §_-93T§.length)
         {
            §_-93T§.pop();
            _loc1_++;
         }
         §_-93T§.splice(0);
      }
      
      public static function §_-1L§(param1:int) : void
      {
         var _loc2_:int = §_-XW§.§_-82P§(param1);
         var _loc3_:int = int(Game.self["level"]);
         §_-si§.§_-eV§(_loc2_);
         if(_loc2_ == §_-XW§.§_-I1V§)
         {
            §_-y27§.§_-i1S§();
         }
         if(_loc2_ == §_-at§.§_-13l§(§_-at§.§_-D18§).level && §_-t2c§.active is §_-u24§)
         {
            Connection.§_-e2T§(§_-u1O§.§_-M15§);
            §_-u24§.§_-b1g§();
         }
         if(_loc2_ >= Game.§_-da§)
         {
            if(§_-Ac§.§_-91§(§_-Ac§.§_-A2D§) && §_-t2c§.active is §_-u24§)
            {
               Connection.§_-e2T§(§_-u1O§.§_-M15§);
               §_-u24§.§_-b1g§();
            }
         }
         if(§_-uR§.§_-41k§ || §_-t2c§.active is §_-u24§ || §_-t2c§.active is §_-fx§)
         {
            §_-93T§.push(param1);
         }
         else
         {
            showDialog(param1);
         }
         Game.self["level"] = _loc2_;
         §_-W1v§.update();
         var _loc4_:int = _loc3_;
         while(_loc4_ < _loc2_)
         {
            §_-jx§.dispatchEvent(new GameEvent(GameEvent.LEVEL_CHANGED,{"value":_loc4_ + 1}));
            _loc4_++;
         }
      }
      
      public static function get §_-02R§() : int
      {
         var _loc1_:int = §_-XW§.§_-82P§(§_-v1§);
         if(_loc1_ >= §_-XW§.§_-wC§)
         {
            return 0;
         }
         return §_-XW§.§_-s2h§(_loc1_ + 1) - §_-v1§;
      }
      
      private static function showDialog(param1:int) : void
      {
         var level:int = 0;
         var exp:int = param1;
         level = §_-XW§.§_-82P§(exp);
         requestLeftMenu(level);
         §_-U2d§.load(function():void
         {
            new §_-nx§(level).show();
         },true);
      }
      
      private static function requestLeftMenu(param1:int) : void
      {
         if(param1 < Game.§_-h2M§)
         {
            return;
         }
         if(param1 % 2 != 0)
         {
            return;
         }
         Services.addEventListener(SettingsExistsEvent.LEFT_MENU,§_-n6§);
         Services.requestLeftMenu(true);
      }
      
      private static function §_-n6§(param1:SettingsExistsEvent) : void
      {
         if(!param1.isExists)
         {
            return;
         }
         Services.requestLeftMenu(false);
      }
      
      private static function §_-K16§(param1:Player) : void
      {
         param1.removeEventListener(§_-K16§);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.EXPERIENCE_CHANGED,{
            "value":§_-v1§,
            "delta":0,
            "reason":0
         }));
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = §_-v1§;
         Game.self["exp"] = param1[0];
         if(§_-XW§.§_-UG§(_loc2_,§_-v1§))
         {
            §_-1L§(§_-v1§);
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.EXPERIENCE_CHANGED,{
            "value":§_-v1§,
            "delta":§_-v1§ - _loc2_,
            "reason":param1[1]
         }));
      }
   }
}

