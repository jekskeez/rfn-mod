package §_-I10§
{
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-71o§;
   import §_-t1F§.§_-Gk§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.StringUtil;
   
   public class §_-l1f§
   {
      
      private static const §_-p2O§:int = 0;
      
      private static const §_-R2V§:int = 1;
      
      public static const §_-I13§:int = 0;
      
      public static const §_-6n§:int = 1;
      
      public static var §_-c2b§:int = 510;
      
      public static var §_-F24§:int = 30;
      
      public static var §_-w2a§:int = 17;
      
      private static var §_-un§:Object = {};
      
      private static var §_-71D§:Object = {};
      
      private static var §_-P20§:Object = {};
      
      private static var §_-x11§:Object = {};
      
      private static var §_-pc§:Array = [];
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function §_-l1f§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-z10§,§_-S2I§.§_-s1J§]);
         var _loc1_:int = 0;
         while(_loc1_ < §_-6n§)
         {
            §_-un§[_loc1_] = 0;
            §_-71D§[_loc1_] = 0;
            §_-P20§[_loc1_] = false;
            §_-x11§[_loc1_] = false;
            Connection.§_-Li§(§_-h2B§.§_-Nm§,_loc1_,§_-p2O§);
            _loc1_++;
         }
      }
      
      public static function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         §_-u1o§.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public static function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         §_-u1o§.removeEventListener(param1,param2,param3);
      }
      
      public static function §_-Pd§(param1:int) : Boolean
      {
         return §_-un§[param1] > 0 && §_-71D§[param1] == 0;
      }
      
      public static function §_-J26§(param1:int) : Boolean
      {
         return §_-un§[param1] > 0;
      }
      
      public static function timeString(param1:int) : String
      {
         var _loc2_:String = "";
         if(§_-un§[param1] == 0)
         {
            return _loc2_;
         }
         if(§_-71D§[param1] > 0)
         {
            _loc2_ += gls("Следующий бонус:") + " <b>" + new Date(0,0,0,0,0,§_-71D§[param1]).toTimeString().slice(0,8) + "</b>\n";
         }
         _loc2_ += gls("До окончания:") + "<b> ";
         var _loc3_:int = §_-un§[param1] / (24 * 60 * 60);
         if(_loc3_ > 0)
         {
            _loc2_ += _loc3_ + " " + StringUtil.word("день",_loc3_) + "</b>";
         }
         else
         {
            _loc2_ += new Date(0,0,0,0,0,§_-un§[param1]).toTimeString().slice(0,8) + "</b>";
         }
         return _loc2_;
      }
      
      public static function §_-53g§(param1:int) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-Nm§,param1,§_-p2O§);
      }
      
      public static function §_-zk§(param1:int) : void
      {
         if(§_-x11§[param1])
         {
            return;
         }
         §_-x11§[param1] = true;
         Connection.§_-Li§(§_-h2B§.§_-Nm§,param1,§_-R2V§);
      }
      
      public static function §_-w2y§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
         for(; _loc2_ < param1.length; _loc2_ += 3)
         {
            if(param1[_loc2_] != §_-S2I§.§_-O2P§)
            {
               continue;
            }
            switch(param1[_loc2_ + 1])
            {
               case §_-e1z§.§_-I13§:
                  §_-71o§.show(§_-5B§.instance);
                  §_-12i§();
                  §_-5B§.§_-R1G§(Game.selfId);
                  Connection.§_-Li§(§_-h2B§.§_-Nm§,§_-I13§,§_-p2O§);
            }
         }
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         switch(param1.type)
         {
            case §_-S2I§.§_-z10§:
               _loc2_ = §_-J26§(param1[0]);
               _loc3_ = §_-Pd§(param1[0]);
               §_-un§[param1[0]] = param1[1];
               §_-71D§[param1[0]] = param1[2];
               if(_loc3_ && !§_-Pd§(param1[0]))
               {
                  §_-u1o§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_BONUS_END,{"type":param1[0]}));
               }
               if(!§_-P20§[param1[0]] && §_-un§[param1[0]] > 0 && §_-71D§[param1[0]] == 0)
               {
                  §_-u1o§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_BONUS_START,{"type":param1[0]}));
               }
               if(§_-un§[param1[0]] > 0)
               {
                  if(!_loc2_)
                  {
                     §_-u1o§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_START,{"type":param1[0]}));
                  }
                  if(§_-pc§.length == 0)
                  {
                     §_-01Y§.§_-c9§(§_-A1b§);
                  }
                  if(§_-pc§.indexOf(param1[0]) == -1)
                  {
                     §_-pc§.push(param1[0]);
                  }
               }
               §_-P20§[param1[0]] = true;
               break;
            case §_-S2I§.§_-s1J§:
               if(param1[2] != §_-S2I§.§_-cZ§)
               {
                  return;
               }
               §_-x11§[§_-I13§] = false;
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_BONUS,{"type":§_-I13§}));
         }
      }
      
      private static function §_-12i§() : void
      {
         new §_-Gk§().show();
      }
      
      private static function §_-A1b§() : void
      {
         var _loc1_:* = int(§_-pc§.length - 1);
         while(_loc1_ >= 0)
         {
            §_-Hm§(§_-pc§[_loc1_]);
            §_-b1V§(§_-pc§[_loc1_]);
            §_-u1o§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_UPDATE,{"type":§_-pc§[_loc1_]}));
            if(§_-un§[§_-pc§[_loc1_]] == 0)
            {
               §_-pc§.splice(_loc1_,1);
            }
            _loc1_--;
         }
         if(§_-pc§.length == 0)
         {
            §_-01Y§.§_-l2K§(§_-A1b§);
         }
      }
      
      private static function §_-Hm§(param1:int) : void
      {
         if(§_-un§[param1] == 0)
         {
            return;
         }
         --§_-un§[param1];
         if(§_-un§[param1] != 0)
         {
            return;
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_END,{"type":param1}));
      }
      
      private static function §_-b1V§(param1:int) : void
      {
         if(§_-71D§[param1] == 0)
         {
            return;
         }
         --§_-71D§[param1];
         if(§_-71D§[param1] != 0)
         {
            return;
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_BONUS_START,{"type":param1}));
      }
   }
}

