package §_-X1k§
{
   import §_-6f§.§_-a2M§;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-t2c§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.StringUtil;
   
   public class §_-T2A§
   {
      
      private static const §_-17§:int = 0;
      
      private static const §_-o1E§:int = 1;
      
      public static const §_-c2h§:int = 0;
      
      public static const §_-x2G§:int = 1;
      
      public static var §_-P2D§:int = 510;
      
      public static var §_-G24§:int = 30;
      
      public static var §_-R1§:int = 17;
      
      private static var §_-lQ§:Object = {};
      
      private static var §_-L2f§:Object = {};
      
      private static var §_-u21§:Object = {};
      
      private static var §_-d1h§:Object = {};
      
      private static var §_-Qk§:Array = [];
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function §_-T2A§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-P1s§,§_-s2l§.§_-K1j§]);
         var _loc1_:int = 0;
         while(_loc1_ < §_-x2G§)
         {
            §_-lQ§[_loc1_] = 0;
            §_-L2f§[_loc1_] = 0;
            §_-u21§[_loc1_] = false;
            §_-d1h§[_loc1_] = false;
            Connection.§_-e2T§(§_-u1O§.§_-eW§,_loc1_,§_-17§);
            _loc1_++;
         }
      }
      
      public static function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         §_-jx§.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public static function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         §_-jx§.removeEventListener(param1,param2,param3);
      }
      
      public static function §_-c2S§(param1:int) : Boolean
      {
         return §_-lQ§[param1] > 0 && §_-L2f§[param1] == 0;
      }
      
      public static function §_-pW§(param1:int) : Boolean
      {
         return §_-lQ§[param1] > 0;
      }
      
      public static function timeString(param1:int) : String
      {
         var _loc2_:String = "";
         if(§_-lQ§[param1] == 0)
         {
            return _loc2_;
         }
         if(§_-L2f§[param1] > 0)
         {
            _loc2_ += gls("Следующий бонус:") + " <b>" + new Date(0,0,0,0,0,§_-L2f§[param1]).toTimeString().slice(0,8) + "</b>\n";
         }
         _loc2_ += gls("До окончания:") + "<b> ";
         var _loc3_:int = §_-lQ§[param1] / (24 * 60 * 60);
         if(_loc3_ > 0)
         {
            _loc2_ += _loc3_ + " " + StringUtil.word("день",_loc3_) + "</b>";
         }
         else
         {
            _loc2_ += new Date(0,0,0,0,0,§_-lQ§[param1]).toTimeString().slice(0,8) + "</b>";
         }
         return _loc2_;
      }
      
      public static function §_-O2Z§(param1:int) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-eW§,param1,§_-17§);
      }
      
      public static function §_-311§(param1:int) : void
      {
         if(§_-d1h§[param1])
         {
            return;
         }
         §_-d1h§[param1] = true;
         Connection.§_-e2T§(§_-u1O§.§_-eW§,param1,§_-o1E§);
      }
      
      public static function §_-g2g§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         for(; _loc2_ < param1.length; _loc2_ += 3)
         {
            if(param1[_loc2_] != §_-s2l§.§_-y2q§)
            {
               continue;
            }
            switch(param1[_loc2_ + 1])
            {
               case §_-ku§.§_-c2h§:
                  §_-t2c§.show(§_-51A§.instance);
                  §_-W2q§();
                  §_-51A§.§_-h2w§(Game.selfId);
                  Connection.§_-e2T§(§_-u1O§.§_-eW§,§_-c2h§,§_-17§);
            }
         }
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         switch(param1.type)
         {
            case §_-s2l§.§_-P1s§:
               _loc2_ = §_-pW§(param1[0]);
               _loc3_ = §_-c2S§(param1[0]);
               §_-lQ§[param1[0]] = param1[1];
               §_-L2f§[param1[0]] = param1[2];
               if(_loc3_ && !§_-c2S§(param1[0]))
               {
                  §_-jx§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_BONUS_END,{"type":param1[0]}));
               }
               if(!§_-u21§[param1[0]] && §_-lQ§[param1[0]] > 0 && §_-L2f§[param1[0]] == 0)
               {
                  §_-jx§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_BONUS_START,{"type":param1[0]}));
               }
               if(§_-lQ§[param1[0]] > 0)
               {
                  if(!_loc2_)
                  {
                     §_-jx§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_START,{"type":param1[0]}));
                  }
                  if(§_-Qk§.length == 0)
                  {
                     §_-p1V§.§_-63T§(§_-62z§);
                  }
                  if(§_-Qk§.indexOf(param1[0]) == -1)
                  {
                     §_-Qk§.push(param1[0]);
                  }
               }
               §_-u21§[param1[0]] = true;
               break;
            case §_-s2l§.§_-K1j§:
               if(param1[2] != §_-s2l§.§_-y8§)
               {
                  return;
               }
               §_-d1h§[§_-c2h§] = false;
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_BONUS,{"type":§_-c2h§}));
         }
      }
      
      private static function §_-W2q§() : void
      {
         new §_-a2M§().show();
      }
      
      private static function §_-62z§() : void
      {
         var _loc1_:* = int(§_-Qk§.length - 1);
         while(_loc1_ >= 0)
         {
            §_-N2v§(§_-Qk§[_loc1_]);
            §_-E2p§(§_-Qk§[_loc1_]);
            §_-jx§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_UPDATE,{"type":§_-Qk§[_loc1_]}));
            if(§_-lQ§[§_-Qk§[_loc1_]] == 0)
            {
               §_-Qk§.splice(_loc1_,1);
            }
            _loc1_--;
         }
         if(§_-Qk§.length == 0)
         {
            §_-p1V§.§_-B3x§(§_-62z§);
         }
      }
      
      private static function §_-N2v§(param1:int) : void
      {
         if(§_-lQ§[param1] == 0)
         {
            return;
         }
         --§_-lQ§[param1];
         if(§_-lQ§[param1] != 0)
         {
            return;
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_END,{"type":param1}));
      }
      
      private static function §_-E2p§(param1:int) : void
      {
         if(§_-L2f§[param1] == 0)
         {
            return;
         }
         --§_-L2f§[param1];
         if(§_-L2f§[param1] != 0)
         {
            return;
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.PRODUCE_BONUS_START,{"type":param1}));
      }
   }
}

