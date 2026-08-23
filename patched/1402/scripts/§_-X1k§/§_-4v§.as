package §_-X1k§
{
   import §_-Q2E§.§_-03V§;
   import §_-Q2E§.§_-J15§;
   import §_-Q2E§.§_-gj§;
   import §_-Q2E§.§_-w12§;
   import §_-S1w§.§_-O2N§;
   import §_-bN§.Dialog;
   import §_-bN§.DialogRepost;
   import §_-bN§.§_-Fk§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-o10§.§_-pl§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-j2O§;
   
   public class §_-4v§
   {
      
      public static const §_-YD§:int = 100;
      
      public static const §_-lb§:int = 10;
      
      public static const §_-bn§:int = 0;
      
      public static const §_-B3d§:int = 1;
      
      public static const §_-s1k§:int = 2;
      
      public static const §_-631§:int = 3;
      
      public static const §_-v1K§:int = 6;
      
      public static const §_-za§:Array = [gls("Наставник"),gls("Вожак"),gls("Творец")];
      
      public static const §_-i1G§:Array = [ShamanLevelUp0,ShamanLevelUp1,ShamanLevelUp2,ShamanLevelUp3,ShamanLevelUp4,ShamanLevelUp5,ShamanLevelUp6,ShamanLevelUp7,ShamanLevelUp8,ShamanLevelUp9];
      
      public static const §_-XV§:Array = [[§_-pl§.§_-C2i§,§_-pl§.§_-O2x§,§_-pl§.§_-e11§,§_-pl§.§_-C2N§,§_-pl§.§_-W1k§,§_-pl§.§_-43u§,§_-pl§.§_-iP§,§_-pl§.§_-r2D§,§_-pl§.§_-ct§,§_-pl§.§_-V16§,§_-pl§.§_-32J§,§_-pl§.§_-Tx§,§_-pl§.§_-12T§,§_-pl§.§_-q2s§,§_-pl§.§_-UC§,§_-pl§.§_-63j§,§_-pl§.§_-J1x§],[§_-pl§.§_-u2t§,§_-pl§.§_-n14§,§_-pl§.§_-C25§,§_-pl§.§_-a2Y§,§_-pl§.§_-Yx§,§_-pl§.§_-g2K§,§_-pl§.§_-o26§,§_-pl§.§_-52I§,§_-pl§.§_-e2l§,§_-pl§.§_-01V§,§_-pl§.§_-py§,§_-pl§.§_-21N§,§_-pl§.§_-A2H§,§_-pl§.§_-K2J§,§_-pl§.§_-p1d§,§_-pl§.§_-x1e§,§_-pl§.§_-rQ§],[§_-pl§.§_-Z1C§,§_-pl§.§_-62n§,§_-pl§.§_-Yf§,§_-pl§.§_-PS§,§_-pl§.§_-u2N§,§_-pl§.§_-q1x§,§_-pl§.§_-8F§,§_-pl§.§_-A2x§,§_-pl§.§_-g1K§,§_-pl§.§_-E1y§,§_-pl§.§_-e2z§,§_-pl§.§_-M2H§,§_-pl§.§_-B3i§,§_-pl§.§_-219§,§_-pl§.§_-Q1n§,§_-pl§.§_-83o§,§_-pl§.§_-O2y§]];
      
      public static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      private static var §_-C2k§:int = -1;
      
      private static var §_-L1x§:int = 0;
      
      private static var §_-s1n§:int = 0;
      
      private static var §_-53H§:Array = [];
      
      private static var §_-tQ§:int = §_-631§;
      
      private static var §_-51M§:Array = [];
      
      private static var §_-q2n§:Array = [0,0,0];
      
      private static var §_-2V§:Array = [0,0,0];
      
      private static var §_-b1S§:Boolean = false;
      
      private static var callback:Function = null;
      
      private static var §_-93T§:Array = [];
      
      private static var §_-dQ§:Dialog = null;
      
      private static var §_-r1J§:Dialog = null;
      
      private static var §_-gH§:Dialog = null;
      
      private static var §_-A1K§:Dialog = null;
      
      private static var §_-K2P§:Dialog = null;
      
      private static var §_-01e§:int = §_-631§;
      
      private static var §_-H24§:int = -1;
      
      public function §_-4v§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-QS§,§_-s2l§.§_-B3H§,§_-s2l§.BUY]);
      }
      
      public static function get §_-H2W§() : int
      {
         return §_-C2k§;
      }
      
      public static function get experience() : int
      {
         return §_-L1x§;
      }
      
      public static function get §_-12z§() : int
      {
         return §_-s1n§;
      }
      
      public static function get §_-71M§() : int
      {
         return §_-tQ§;
      }
      
      public static function get skills() : Array
      {
         return §_-51M§;
      }
      
      public static function §_-82P§(param1:int) : int
      {
         var _loc2_:Array = §_-93H§.§_-g13§;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(param1 < _loc2_[_loc3_])
            {
               return _loc3_ + 1;
            }
            _loc3_++;
         }
         return §_-93H§.§_-f2W§ + 1;
      }
      
      public static function get(param1:int) : int
      {
         return §_-93H§.§_-g13§[param1 - 1];
      }
      
      public static function §_-Q2y§(param1:int) : int
      {
         var _loc2_:int = §_-82P§(param1);
         if(_loc2_ > §_-93H§.§_-f2W§)
         {
            return 0;
         }
         return §_-93H§.§_-g13§[_loc2_ - 1] - param1;
      }
      
      public static function §_-d1J§() : void
      {
         while(§_-93T§.length > 0)
         {
            showDialog(§_-93T§.pop());
         }
      }
      
      public static function §_-019§(param1:int) : void
      {
         if(§_-uR§.§_-41k§ || §_-t2c§.active is §_-u24§)
         {
            §_-93T§.push(param1);
         }
         else
         {
            showDialog(param1);
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.SHAMAN_LEVEL_CHANGED,{"value":param1}));
      }
      
      public static function §_-p21§(param1:int) : Boolean
      {
         return §_-53H§.indexOf(param1) != -1;
      }
      
      public static function §_-A3U§(param1:int) : int
      {
         return §_-s1n§ - (param1 == §_-631§ ? 0 : §_-q2n§[param1]);
      }
      
      public static function §_-53u§(param1:int, param2:int) : int
      {
         return §_-P18§(param2) - (§_-q2n§[param1] + §_-2V§[param1]);
      }
      
      public static function §_-9d§(param1:int, param2:int, param3:int) : void
      {
         §_-q2n§[param1] = param2;
         §_-2V§[param1] = param3;
      }
      
      public static function get §_-71p§() : Boolean
      {
         return §_-b1S§;
      }
      
      public static function set §_-71p§(param1:Boolean) : void
      {
         §_-b1S§ = param1;
      }
      
      public static function §_-R2G§(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         switch(param1)
         {
            case 0:
               _loc3_ = 0;
               break;
            case 1:
            case 2:
               _loc3_ = 2;
               break;
            case 3:
               _loc3_ = 3;
         }
         return Math.min(_loc3_,param2);
      }
      
      public static function §_-Oe§(param1:int) : void
      {
         if(!§_-A1K§)
         {
            §_-A1K§ = new §_-J15§();
         }
         (§_-A1K§ as §_-J15§).branch = param1;
         §_-A1K§.show();
      }
      
      public static function §_-M2h§() : void
      {
         if(!§_-r1J§)
         {
            §_-r1J§ = new §_-w12§();
         }
         §_-r1J§.show();
      }
      
      public static function §_-51Z§(param1:int) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-t2J§,param1);
      }
      
      public static function §_-WI§(param1:int, param2:int, param3:int = 0) : void
      {
         var _loc4_:int = 0;
         if(§_-tQ§ == §_-4v§.§_-631§)
         {
            _loc4_ = 0;
            while(_loc4_ < §_-4v§.§_-XV§.length)
            {
               if(§_-4v§.§_-XV§[_loc4_].indexOf(param1) != -1)
               {
                  §_-01e§ = _loc4_;
                  §_-H24§ = param1;
                  if(§_-gH§)
                  {
                     §_-gH§.hide();
                  }
                  §_-gH§ = new §_-Fk§(gls("Изучение навыка"),gls("Ты собираешься выучить 1-й уровень навыка «{0}», после чего тебе будет доступна только профессия «{1}».\n\nДругие профессии будут недоступны. Чтобы выучить навыки новой профессии, нужно её купить и создать дополнительный набор навыков. Все перья будут доступны для изучения навыков новой профессии.",§_-pl§.perkData[§_-H24§]["name"],§_-za§[§_-01e§]),true,§_-02h§,430,new TextFormat(§_-i5§.§_-c10§,14,2039583));
                  §_-gH§.show();
                  return;
               }
               _loc4_++;
            }
         }
         if(param2 < 3)
         {
            Connection.§_-e2T§(§_-u1O§.§_-k1q§,param1);
         }
         else if(!§_-4v§.§_-71p§)
         {
            if(!§_-K2P§)
            {
               §_-K2P§ = new §_-03V§();
            }
            (§_-K2P§ as §_-03V§).§_-ok§ = param1;
            (§_-K2P§ as §_-03V§).cost = param3;
            §_-K2P§.show();
         }
         else
         {
            Game.§_-u2z§(§_-u1O§.§_-O1W§,param3,0,Game.selfId,param1);
         }
      }
      
      public static function §_-B1h§(param1:§_-O2N§) : void
      {
         if(!§_-dQ§)
         {
            §_-dQ§ = new §_-gj§();
         }
         (§_-dQ§ as §_-gj§).§_-E2I§(param1);
      }
      
      public static function §_-MH§() : void
      {
         if(!§_-dQ§)
         {
            return;
         }
         (§_-dQ§ as §_-gj§).§_-k1M§();
      }
      
      public static function set §_-82T§(param1:Function) : void
      {
         callback = param1;
      }
      
      public static function §_-R2u§(param1:int) : String
      {
         switch(param1)
         {
            case §_-bn§:
               return gls("<body><span class=\'bold\'>Профессия «Наставник»</span>\nЭта профессия позволяет шаману оказывать прямое воздействие на белок.</body");
            case §_-B3d§:
               return gls("<body><span class=\'bold\'>Профессия «Вожак»</span>\nЭта профессия усиливает шамана с помощью дополнительных навыков.</body");
            case §_-s1k§:
               return gls("<body><span class=\'bold\'>Профессия «Творец»</span>\nЭта профессия даёт шаману навыки для воздействия на физические объекты.</body");
            default:
               return "";
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
      
      private static function showDialog(param1:int) : void
      {
         new DialogRepost(§_-j2O§.WALL_SHAMAN_EXP,param1).show();
      }
      
      private static function §_-02h§() : void
      {
         if(§_-01e§ == §_-4v§.§_-631§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-t2J§,§_-01e§);
         Connection.§_-e2T§(§_-u1O§.§_-k1q§,§_-H24§);
      }
      
      private static function §_-P18§(param1:int) : int
      {
         if(param1 == 0)
         {
            return 0;
         }
         if(param1 < 4)
         {
            return 2;
         }
         if(param1 < 7)
         {
            return 6;
         }
         if(param1 < 10)
         {
            return 12;
         }
         if(param1 < 13)
         {
            return 21;
         }
         if(param1 < 16)
         {
            return 30;
         }
         return 33;
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         switch(param1.type)
         {
            case §_-s2l§.§_-QS§:
               §_-L1x§ = param1[0];
               break;
            case §_-s2l§.§_-B3H§:
               if(§_-tQ§ != §_-631§ && §_-tQ§ != param1[4] && Boolean(§_-dQ§))
               {
                  §_-dQ§.hide();
               }
               if(§_-r1J§)
               {
                  §_-r1J§.hide();
               }
               if(§_-A1K§)
               {
                  §_-A1K§.hide();
               }
               _loc2_ = param1[0] + 1;
               if(_loc2_ > §_-C2k§ && §_-C2k§ != -1)
               {
                  §_-019§(§_-C2k§ + 1);
               }
               §_-C2k§ = _loc2_;
               §_-L1x§ = param1[1];
               §_-s1n§ = param1[2];
               §_-53H§ = [];
               if(param1[3] & 1)
               {
                  §_-53H§.push(§_-bn§);
               }
               if(param1[3] & 2)
               {
                  §_-53H§.push(§_-B3d§);
               }
               if(param1[3] & 4)
               {
                  §_-53H§.push(§_-s1k§);
               }
               §_-tQ§ = param1[4];
               §_-51M§.splice(0);
               _loc3_ = param1[5];
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  §_-51M§.push([_loc3_[_loc4_],_loc3_[_loc4_ + 1],_loc3_[_loc4_ + 2]]);
                  _loc4_ += 3;
               }
               if(callback != null)
               {
                  callback();
               }
               break;
            case §_-s2l§.BUY:
               if(param1[0] != §_-s2l§.§_-v1E§ || param1[1] != Game.selfId)
               {
                  break;
               }
               if(param1[2] == §_-u1O§.§_-fm§ && Boolean(§_-dQ§))
               {
                  §_-dQ§.hide();
               }
         }
      }
   }
}

