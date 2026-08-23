package §_-I10§
{
   import §_-CF§.§_-G1v§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-X2O§.§_-6Z§;
   import §_-X2O§.§_-8V§;
   import §_-X2O§.§_-c1E§;
   import §_-X2O§.§_-nx§;
   import §_-k1c§.Dialog;
   import §_-k1c§.DialogRepost;
   import §_-k1c§.§_-Q13§;
   import §_-vK§.§_-QC§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-73l§;
   
   public class §_-ct§
   {
      
      public static const §_-i§:int = 100;
      
      public static const §_-b1e§:int = 10;
      
      public static const §_-Te§:int = 0;
      
      public static const §_-e2p§:int = 1;
      
      public static const §_-pO§:int = 2;
      
      public static const §_-F2j§:int = 3;
      
      public static const §_-f1D§:int = 6;
      
      public static const §_-t1c§:Array = [gls("Наставник"),gls("Вожак"),gls("Творец")];
      
      public static const §_-41F§:Array = [ShamanLevelUp0,ShamanLevelUp1,ShamanLevelUp2,ShamanLevelUp3,ShamanLevelUp4,ShamanLevelUp5,ShamanLevelUp6,ShamanLevelUp7,ShamanLevelUp8,ShamanLevelUp9];
      
      public static const §_-i1§:Array = [[§_-QC§.§_-9V§,§_-QC§.§_-A2J§,§_-QC§.§_-51S§,§_-QC§.§_-419§,§_-QC§.§_-o1X§,§_-QC§.§_-t§,§_-QC§.§_-5A§,§_-QC§.§_-uK§,§_-QC§.§_-i14§,§_-QC§.§_-52x§,§_-QC§.§_-E1d§,§_-QC§.§_-N4§,§_-QC§.§_-i2L§,§_-QC§.§_-C7§,§_-QC§.§_-uy§,§_-QC§.§_-d1§,§_-QC§.§_-11H§],[§_-QC§.§_-22p§,§_-QC§.§_-j1l§,§_-QC§.§_-22s§,§_-QC§.§_-i1I§,§_-QC§.§_-8R§,§_-QC§.§_-d2J§,§_-QC§.§_-33a§,§_-QC§.§_-v1l§,§_-QC§.§_-82p§,§_-QC§.§_-mg§,§_-QC§.§_-F1S§,§_-QC§.§_-oS§,§_-QC§.§_-01S§,§_-QC§.§_-M1H§,§_-QC§.§_-u1I§,§_-QC§.§_-B1u§,§_-QC§.§_-a1c§],[§_-QC§.§_-N2s§,§_-QC§.§_-CX§,§_-QC§.§_-Kh§,§_-QC§.§_-82B§,§_-QC§.§_-Xs§,§_-QC§.§_-a1o§,§_-QC§.§_-l1z§,§_-QC§.§_-Au§,§_-QC§.§_-a2F§,§_-QC§.§_-k1B§,§_-QC§.§_-93§,§_-QC§.§_-y1Q§,§_-QC§.§_-53z§,§_-QC§.§_-Q1U§,§_-QC§.§_-g23§,§_-QC§.§_-A2A§,§_-QC§.§_-r1s§]];
      
      public static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private static var §_-E1§:int = -1;
      
      private static var §_-d2Q§:int = 0;
      
      private static var §_-j2A§:int = 0;
      
      private static var §_-E17§:Array = [];
      
      private static var §_-Ek§:int = §_-F2j§;
      
      private static var §_-5R§:Array = [];
      
      private static var §_-vd§:Array = [0,0,0];
      
      private static var §_-XM§:Array = [0,0,0];
      
      private static var §_-W1K§:Boolean = false;
      
      private static var callback:Function = null;
      
      private static var §_-FT§:Array = [];
      
      private static var §_-z1p§:Dialog = null;
      
      private static var §_-t1a§:Dialog = null;
      
      private static var §_-221§:Dialog = null;
      
      private static var §_-U6§:Dialog = null;
      
      private static var §_-x2p§:Dialog = null;
      
      private static var §_-VS§:int = §_-F2j§;
      
      private static var §_-A3W§:int = -1;
      
      public function §_-ct§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-cb§,§_-S2I§.§_-Kd§,§_-S2I§.BUY]);
      }
      
      public static function get §_-AL§() : int
      {
         return §_-E1§;
      }
      
      public static function get experience() : int
      {
         return §_-d2Q§;
      }
      
      public static function get §_-s25§() : int
      {
         return §_-j2A§;
      }
      
      public static function get §_-m1k§() : int
      {
         return §_-Ek§;
      }
      
      public static function get skills() : Array
      {
         return §_-5R§;
      }
      
      public static function §_-A1x§(param1:int) : int
      {
         var _loc2_:Array = §_-8S§.§_-TO§;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(param1 < _loc2_[_loc3_])
            {
               return _loc3_ + 1;
            }
            _loc3_++;
         }
         return §_-8S§.§_-P2m§ + 1;
      }
      
      public static function get(param1:int) : int
      {
         return §_-8S§.§_-TO§[param1 - 1];
      }
      
      public static function §_-7p§(param1:int) : int
      {
         var _loc2_:int = §_-A1x§(param1);
         if(_loc2_ > §_-8S§.§_-P2m§)
         {
            return 0;
         }
         return §_-8S§.§_-TO§[_loc2_ - 1] - param1;
      }
      
      public static function §_-Yp§() : void
      {
         while(§_-FT§.length > 0)
         {
            showDialog(§_-FT§.pop());
         }
      }
      
      public static function §_-X6§(param1:int) : void
      {
         if(§_-k2X§.§_-P21§ || §_-71o§.active is §_-92z§)
         {
            §_-FT§.push(param1);
         }
         else
         {
            showDialog(param1);
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.SHAMAN_LEVEL_CHANGED,{"value":param1}));
      }
      
      public static function §_-Z1E§(param1:int) : Boolean
      {
         return §_-E17§.indexOf(param1) != -1;
      }
      
      public static function §_-c1x§(param1:int) : int
      {
         return §_-j2A§ - (param1 == §_-F2j§ ? 0 : §_-vd§[param1]);
      }
      
      public static function §_-JN§(param1:int, param2:int) : int
      {
         return §_-03B§(param2) - (§_-vd§[param1] + §_-XM§[param1]);
      }
      
      public static function §_-m1R§(param1:int, param2:int, param3:int) : void
      {
         §_-vd§[param1] = param2;
         §_-XM§[param1] = param3;
      }
      
      public static function get §_-62r§() : Boolean
      {
         return §_-W1K§;
      }
      
      public static function set §_-62r§(param1:Boolean) : void
      {
         §_-W1K§ = param1;
      }
      
      public static function §_-w2d§(param1:int, param2:int) : int
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
      
      public static function §_-qy§(param1:int) : void
      {
         if(!§_-U6§)
         {
            §_-U6§ = new §_-nx§();
         }
         (§_-U6§ as §_-nx§).branch = param1;
         §_-U6§.show();
      }
      
      public static function §_-M2c§() : void
      {
         if(!§_-t1a§)
         {
            §_-t1a§ = new §_-8V§();
         }
         §_-t1a§.show();
      }
      
      public static function §_-f10§(param1:int) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-43U§,param1);
      }
      
      public static function §_-Z2D§(param1:int, param2:int, param3:int = 0) : void
      {
         var _loc4_:int = 0;
         if(§_-Ek§ == §_-ct§.§_-F2j§)
         {
            _loc4_ = 0;
            while(_loc4_ < §_-ct§.§_-i1§.length)
            {
               if(§_-ct§.§_-i1§[_loc4_].indexOf(param1) != -1)
               {
                  §_-VS§ = _loc4_;
                  §_-A3W§ = param1;
                  if(§_-221§)
                  {
                     §_-221§.hide();
                  }
                  §_-221§ = new §_-Q13§(gls("Изучение навыка"),gls("Ты собираешься выучить 1-й уровень навыка «{0}», после чего тебе будет доступна только профессия «{1}».\n\nДругие профессии будут недоступны. Чтобы выучить навыки новой профессии, нужно её купить и создать дополнительный набор навыков. Все перья будут доступны для изучения навыков новой профессии.",§_-QC§.perkData[§_-A3W§]["name"],§_-t1c§[§_-VS§]),true,§_-T1M§,430,new TextFormat(§_-22V§.§_-F2z§,14,2039583));
                  §_-221§.show();
                  return;
               }
               _loc4_++;
            }
         }
         if(param2 < 3)
         {
            Connection.§_-Li§(§_-h2B§.§_-X2b§,param1);
         }
         else if(!§_-ct§.§_-62r§)
         {
            if(!§_-x2p§)
            {
               §_-x2p§ = new §_-6Z§();
            }
            (§_-x2p§ as §_-6Z§).§_-Q2s§ = param1;
            (§_-x2p§ as §_-6Z§).cost = param3;
            §_-x2p§.show();
         }
         else
         {
            Game.§_-K2t§(§_-h2B§.§_-T2O§,param3,0,Game.selfId,param1);
         }
      }
      
      public static function §_-r2x§(param1:§_-G1v§) : void
      {
         if(!§_-z1p§)
         {
            §_-z1p§ = new §_-c1E§();
         }
         (§_-z1p§ as §_-c1E§).§_-v1t§(param1);
      }
      
      public static function §_-l2G§() : void
      {
         if(!§_-z1p§)
         {
            return;
         }
         (§_-z1p§ as §_-c1E§).§_-k§();
      }
      
      public static function set §_-gg§(param1:Function) : void
      {
         callback = param1;
      }
      
      public static function §_-42u§(param1:int) : String
      {
         switch(param1)
         {
            case §_-Te§:
               return gls("<body><span class=\'bold\'>Профессия «Наставник»</span>\nЭта профессия позволяет шаману оказывать прямое воздействие на белок.</body");
            case §_-e2p§:
               return gls("<body><span class=\'bold\'>Профессия «Вожак»</span>\nЭта профессия усиливает шамана с помощью дополнительных навыков.</body");
            case §_-pO§:
               return gls("<body><span class=\'bold\'>Профессия «Творец»</span>\nЭта профессия даёт шаману навыки для воздействия на физические объекты.</body");
            default:
               return "";
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
      
      private static function showDialog(param1:int) : void
      {
         new DialogRepost(§_-73l§.WALL_SHAMAN_EXP,param1).show();
      }
      
      private static function §_-T1M§() : void
      {
         if(§_-VS§ == §_-ct§.§_-F2j§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-43U§,§_-VS§);
         Connection.§_-Li§(§_-h2B§.§_-X2b§,§_-A3W§);
      }
      
      private static function §_-03B§(param1:int) : int
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
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         switch(param1.type)
         {
            case §_-S2I§.§_-cb§:
               §_-d2Q§ = param1[0];
               break;
            case §_-S2I§.§_-Kd§:
               if(§_-Ek§ != §_-F2j§ && §_-Ek§ != param1[4] && Boolean(§_-z1p§))
               {
                  §_-z1p§.hide();
               }
               if(§_-t1a§)
               {
                  §_-t1a§.hide();
               }
               if(§_-U6§)
               {
                  §_-U6§.hide();
               }
               _loc2_ = param1[0] + 1;
               if(_loc2_ > §_-E1§ && §_-E1§ != -1)
               {
                  §_-X6§(§_-E1§ + 1);
               }
               §_-E1§ = _loc2_;
               §_-d2Q§ = param1[1];
               §_-j2A§ = param1[2];
               §_-E17§ = [];
               if(param1[3] & 1)
               {
                  §_-E17§.push(§_-Te§);
               }
               if(param1[3] & 2)
               {
                  §_-E17§.push(§_-e2p§);
               }
               if(param1[3] & 4)
               {
                  §_-E17§.push(§_-pO§);
               }
               §_-Ek§ = param1[4];
               §_-5R§.splice(0);
               _loc3_ = param1[5];
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  §_-5R§.push([_loc3_[_loc4_],_loc3_[_loc4_ + 1],_loc3_[_loc4_ + 2]]);
                  _loc4_ += 3;
               }
               if(callback != null)
               {
                  callback();
               }
               break;
            case §_-S2I§.BUY:
               if(param1[0] != §_-S2I§.§_-k2l§ || param1[1] != Game.selfId)
               {
                  break;
               }
               if(param1[2] == §_-h2B§.§_-u2H§ && Boolean(§_-z1p§))
               {
                  §_-z1p§.hide();
               }
         }
      }
   }
}

