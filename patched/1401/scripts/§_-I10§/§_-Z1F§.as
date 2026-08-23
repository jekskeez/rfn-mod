package §_-I10§
{
   import events.GameEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import utils.§_-ex§;
   import views.§_-U1§;
   
   public class §_-Z1F§
   {
      
      private static const §_-p2O§:int = 60;
      
      private static var §_-F20§:int = 0;
      
      private static var §_-835§:int = 0;
      
      private static var §_-YS§:int = 0;
      
      private static var §_-I16§:int = 0;
      
      private static var §_-un§:int = §_-p2O§;
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function §_-Z1F§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-61Q§,§_-S2I§.§_-a1H§,§_-S2I§.§_-73a§]);
         §_-01Y§.§_-c9§(§_-A1b§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function get §_-2h§() : Boolean
      {
         return §_-U1f§ >= §_-u1t§;
      }
      
      public static function get §_-Lm§() : Boolean
      {
         return §_-bc§ >= §_-t2P§;
      }
      
      public static function §_-92p§(param1:int) : Boolean
      {
         if(§_-e1z§.§_-Lq§(§_-e1z§.§_-OJ§))
         {
            return true;
         }
         return §_-U1f§ >= §_-q1p§.§_-l29§(param1).cost;
      }
      
      public static function §_-k1w§(param1:int) : Boolean
      {
         return §_-bc§ >= param1;
      }
      
      public static function get §_-u1t§() : int
      {
         return §_-F20§;
      }
      
      public static function get §_-t2P§() : int
      {
         return §_-835§;
      }
      
      public static function get §_-bc§() : int
      {
         return §_-I16§;
      }
      
      public static function get §_-U1f§() : int
      {
         return §_-YS§;
      }
      
      public static function get §_-M1D§() : String
      {
         return §_-ex§.§_-p1x§(§_-un§);
      }
      
      private static function §_-A1b§() : void
      {
         var _loc1_:int = 0;
         if(§_-un§ <= 0)
         {
            §_-un§ = §_-p2O§;
            if(!§_-2h§)
            {
               _loc1_ = §_-Br§.§_-f2k§ && §_-U1f§ + 2 <= §_-u1t§ ? 2 : 1;
               §_-YS§ += _loc1_;
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.ENERGY_CHANGED,{
                  "value":§_-U1f§,
                  "delta":_loc1_,
                  "reason":0
               }));
            }
         }
         --§_-un§;
         §_-u1o§.dispatchEvent(new Event(Event.CHANGE));
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case §_-S2I§.§_-61Q§:
               if(param1[1] == §_-S2I§.§_-11N§)
               {
                  §_-U1§.energy = param1[0] - §_-YS§;
               }
               _loc2_ = §_-YS§;
               §_-YS§ = param1[0] - §_-U1§.energy;
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.ENERGY_CHANGED,{
                  "value":§_-U1f§,
                  "delta":§_-U1f§ - _loc2_,
                  "reason":param1[1]
               }));
               break;
            case §_-S2I§.§_-a1H§:
               if(param1[1] == §_-S2I§.§_-11N§)
               {
                  §_-U1§.mana = param1[0] - §_-I16§;
               }
               _loc2_ = §_-I16§;
               §_-I16§ = param1[0] - §_-U1§.mana;
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.MANA_CHANGED,{
                  "value":§_-bc§,
                  "delta":§_-bc§ - _loc2_,
                  "reason":param1[1]
               }));
               break;
            case §_-S2I§.§_-73a§:
               §_-F20§ = param1[0];
               §_-835§ = param1[1];
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.MAX_POWERS_CHANGED));
         }
      }
   }
}

