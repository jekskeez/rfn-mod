package §_-I10§
{
   import §_-t1F§.§_-oT§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-T2o§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-m2t§
   {
      
      public static const VIP:int = 4;
      
      public static const §_-N1P§:int = 6;
      
      public static var §_-qW§:int = -1;
      
      public static var §_-un§:int = 0;
      
      public static var §_-Pd§:Boolean = false;
      
      public static var §_-b2d§:int = 0;
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function §_-m2t§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-I2g§,§_-S2I§.§_-a2e§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-a2e§:
               _loc2_ = §_-428§.§_-d1u§(param1[1]);
               if(_loc2_.source != §_-428§.§_-33Q§)
               {
                  return;
               }
               if(_loc2_.id == §_-428§.§_-bW§)
               {
                  §_-SZ§();
                  new §_-oT§({"contentItems":[{
                     "type":§_-428§.§_-N1P§,
                     "id":§_-qW§,
                     "count":1
                  }]}).show();
               }
               GameSounds.play(§_-43Z§.§_-23R§,true);
               §_-Pd§ = false;
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.DAILY_BONUS_GET));
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.DAILY_BONUS_UPDATE));
               break;
            case §_-S2I§.§_-I2g§:
               §_-b2d§ = param1[0];
               §_-Pd§ = param1[1] != 0;
               if(§_-b2d§ >= §_-N1P§)
               {
                  §_-SZ§();
               }
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.DAILY_BONUS_UPDATE));
               if(§_-Br§.§_-f2k§ && §_-Pd§ && §_-Bm§.§_-2S§(§_-T2o§.§_-2O§))
               {
                  Connection.§_-Li§(§_-h2B§.§_-72c§);
               }
         }
      }
      
      private static function §_-SZ§() : void
      {
         §_-qW§ = §_-h1f§.§_-L1b§(§_-S2I§.§_-f2Y§);
         §_-un§ = §_-h1f§.§_-y2U§(§_-qW§);
      }
   }
}

