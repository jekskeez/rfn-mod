package §_-X1k§
{
   import events.GameEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import utils.§_-B1d§;
   import views.§_-O2E§;
   
   public class §_-hO§
   {
      
      private static const §_-17§:int = 60;
      
      private static var §_-t1b§:int = 0;
      
      private static var §_-k2J§:int = 0;
      
      private static var §_-q1§:int = 0;
      
      private static var §_-V2a§:int = 0;
      
      private static var §_-lQ§:int = §_-17§;
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function §_-hO§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-W27§,§_-s2l§.§_-fz§,§_-s2l§.§_-ra§]);
         §_-p1V§.§_-63T§(§_-62z§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function get §_-wH§() : Boolean
      {
         return §_-i2E§ >= §_-g2y§;
      }
      
      public static function get §_-ZC§() : Boolean
      {
         return §_-Sy§ >= §_-333§;
      }
      
      public static function §_-w2n§(param1:int) : Boolean
      {
         if(§_-ku§.§_-R1C§(§_-ku§.§_-Z2J§))
         {
            return true;
         }
         return §_-i2E§ >= §_-at§.§_-13l§(param1).cost;
      }
      
      public static function §_-42d§(param1:int) : Boolean
      {
         return §_-Sy§ >= param1;
      }
      
      public static function get §_-g2y§() : int
      {
         return §_-t1b§;
      }
      
      public static function get §_-333§() : int
      {
         return §_-k2J§;
      }
      
      public static function get §_-Sy§() : int
      {
         return §_-V2a§;
      }
      
      public static function get §_-i2E§() : int
      {
         return §_-q1§;
      }
      
      public static function get §_-j1x§() : String
      {
         return §_-B1d§.§_-z2d§(§_-lQ§);
      }
      
      private static function §_-62z§() : void
      {
         var _loc1_:int = 0;
         if(§_-lQ§ <= 0)
         {
            §_-lQ§ = §_-17§;
            if(!§_-wH§)
            {
               _loc1_ = §_-F1Z§.§_-O1u§ && §_-i2E§ + 2 <= §_-g2y§ ? 2 : 1;
               §_-q1§ += _loc1_;
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.ENERGY_CHANGED,{
                  "value":§_-i2E§,
                  "delta":_loc1_,
                  "reason":0
               }));
            }
         }
         --§_-lQ§;
         §_-jx§.dispatchEvent(new Event(Event.CHANGE));
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case §_-s2l§.§_-W27§:
               if(param1[1] == §_-s2l§.§_-cn§)
               {
                  §_-O2E§.energy = param1[0] - §_-q1§;
               }
               _loc2_ = §_-q1§;
               §_-q1§ = param1[0] - §_-O2E§.energy;
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.ENERGY_CHANGED,{
                  "value":§_-i2E§,
                  "delta":§_-i2E§ - _loc2_,
                  "reason":param1[1]
               }));
               break;
            case §_-s2l§.§_-fz§:
               if(param1[1] == §_-s2l§.§_-cn§)
               {
                  §_-O2E§.mana = param1[0] - §_-V2a§;
               }
               _loc2_ = §_-V2a§;
               §_-V2a§ = param1[0] - §_-O2E§.mana;
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.MANA_CHANGED,{
                  "value":§_-Sy§,
                  "delta":§_-Sy§ - _loc2_,
                  "reason":param1[1]
               }));
               break;
            case §_-s2l§.§_-ra§:
               §_-t1b§ = param1[0];
               §_-k2J§ = param1[1];
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.MAX_POWERS_CHANGED));
         }
      }
   }
}

