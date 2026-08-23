package §_-X1k§
{
   import §_-6f§.§_-y1G§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-n2E§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-X2k§
   {
      
      public static const VIP:int = 4;
      
      public static const §_-o2t§:int = 6;
      
      public static var §_-nb§:int = -1;
      
      public static var §_-lQ§:int = 0;
      
      public static var §_-c2S§:Boolean = false;
      
      public static var §_-I1i§:int = 0;
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function §_-X2k§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-324§,§_-s2l§.§_-PZ§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-PZ§:
               _loc2_ = §_-A3y§.§_-B3F§(param1[1]);
               if(_loc2_.source != §_-A3y§.§_-z1h§)
               {
                  return;
               }
               if(_loc2_.id == §_-A3y§.§_-M11§)
               {
                  §_-g2i§();
                  new §_-y1G§({"contentItems":[{
                     "type":§_-A3y§.§_-o2t§,
                     "id":§_-nb§,
                     "count":1
                  }]}).show();
               }
               GameSounds.play(§_-RH§.§_-T1§,true);
               §_-c2S§ = false;
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.DAILY_BONUS_GET));
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.DAILY_BONUS_UPDATE));
               break;
            case §_-s2l§.§_-324§:
               §_-I1i§ = param1[0];
               §_-c2S§ = param1[1] != 0;
               if(§_-I1i§ >= §_-o2t§)
               {
                  §_-g2i§();
               }
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.DAILY_BONUS_UPDATE));
               if(§_-F1Z§.§_-O1u§ && §_-c2S§ && §_-r12§.§_-FS§(§_-n2E§.§_-PG§))
               {
                  Connection.§_-e2T§(§_-u1O§.§_-7r§);
               }
         }
      }
      
      private static function §_-g2i§() : void
      {
         §_-nb§ = §_-L1o§.§_-i2i§(§_-s2l§.§_-gv§);
         §_-lQ§ = §_-L1o§.§_-Tg§(§_-nb§);
      }
   }
}

