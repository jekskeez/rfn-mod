package §_-X1k§
{
   import §_-6f§.§_-21G§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   
   public class §_-C3E§
   {
      
      public static const §_-Lh§:int = 15;
      
      public static const §_-ev§:int = 125;
      
      public static const §_-l1w§:int = 126;
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      private static var §_-f2R§:Array = [];
      
      private static var §_-Dp§:Object = {};
      
      public function §_-C3E§()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc1_:Object = null;
         §_-f2R§ = §_-HZ§.bank.bundle_offers.concat();
         for each(_loc1_ in §_-5E§.offers)
         {
            §_-Dp§[_loc1_.offer_id] = §_-iL§(_loc1_);
         }
         §_-LZ§.addEventListener(GameEvent.LEVEL_CHANGED,§_-22l§);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.BUNDLE_UPDATE));
      }
      
      public static function §_-L2Q§(param1:int) : §_-VZ§
      {
         return §_-Dp§[param1];
      }
      
      public static function §_-c29§(param1:int) : §_-VZ§
      {
         var _loc2_:§_-VZ§ = null;
         for each(_loc2_ in §_-Dp§)
         {
            if(_loc2_.rewardId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function §_-O1s§(param1:int) : void
      {
      }
      
      public static function get ids() : Array
      {
         return §_-f2R§;
      }
      
      private static function §_-iL§(param1:Object) : §_-VZ§
      {
         return new §_-VZ§(param1.offer_id,param1.reward_id,gls(param1.title),§_-Zy§.§_-BI§ ? Number(param1.price_rub) : Number(param1.price_usd),int(param1.benefit) || 0,param1.product,param1.image_class,§_-46§(param1.reward_id));
      }
      
      private static function §_-46§(param1:int) : Vector.<§_-73B§>
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Class = null;
         var _loc2_:Object = §_-A3y§.§_-B3F§(param1);
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:Vector.<§_-73B§> = new Vector.<§_-73B§>(0);
         for(_loc4_ in _loc2_.content)
         {
            if(_loc4_ in §_-A3y§.§_-4o§)
            {
               _loc5_ = int(§_-A3y§.§_-4o§[_loc4_]);
               _loc6_ = _loc2_.content[_loc4_];
               _loc7_ = 0;
               _loc8_ = 0;
               if(_loc6_ is Array)
               {
                  _loc7_ = int(_loc6_[0].id);
                  _loc8_ = int(_loc6_[0].count);
               }
               else
               {
                  _loc8_ = _loc6_;
               }
               _loc9_ = §_-AP§(_loc5_,_loc7_);
               if(_loc9_)
               {
                  _loc3_.push(new §_-73B§(_loc9_,§_-i2J§(_loc5_,_loc7_,_loc8_)));
               }
            }
         }
         return _loc3_;
      }
      
      private static function §_-AP§(param1:int, param2:int) : Class
      {
         switch(param1)
         {
            case §_-A3y§.§_-M1U§:
            case §_-A3y§.§_-l2X§:
               return ImageGetCoins;
            case §_-A3y§.§_-W27§:
               return ImageGetEnergy;
            case §_-A3y§.§_-fz§:
               return ImageGetMana;
            case §_-A3y§.§_-736§:
               return ImageGetItemsPack;
            case §_-A3y§.§_-Z2h§:
               return param2 == 1 ? ImageGetCollectionsRare : ImageGetCollections;
            case §_-A3y§.§_-t1F§:
            case §_-A3y§.§_-o2t§:
               return ImageGetPackage;
            case §_-A3y§.§_-y2q§:
               return param2 == §_-ku§.§_-v2p§ ? ImageGetManaRegenDrink : ImageGetVip;
            default:
               return null;
         }
      }
      
      private static function §_-i2J§(param1:int, param2:int, param3:int) : String
      {
         switch(param1)
         {
            case §_-A3y§.§_-M1U§:
               return gls("{0} монет",param3);
            case §_-A3y§.§_-l2X§:
               return gls("{0} орехов",param3);
            case §_-A3y§.§_-W27§:
               return gls("{0} энергии",param3);
            case §_-A3y§.§_-fz§:
               return gls("{0} маны",param3);
            case §_-A3y§.§_-736§:
               return gls("{0} предметов шамана каждого типа",param3);
            case §_-A3y§.§_-Z2h§:
               return param2 == 1 ? gls("{0} редких элементов коллекций",param3) : gls("{0} элементов коллекций",param3);
            case §_-A3y§.§_-t1F§:
               return gls("Случайный костюм");
            case §_-A3y§.§_-o2t§:
               return §_-P2x§.§_-01H§(param2);
            case §_-A3y§.§_-y2q§:
               if(param2 == §_-ku§.§_-v2p§)
               {
                  return gls("Зелье Могущества\nна {0} дней",param3);
               }
               return gls("VIP-статус\nна {0} дней",param3);
               break;
            default:
               return "";
         }
      }
      
      private static function §_-22l§(param1:GameEvent) : void
      {
         if(param1.data["value"] != Game.§_-K1o§ || §_-LZ§.§_-mA§ >= Game.§_-oK§)
         {
            return;
         }
         add(§_-ev§);
         §_-f2R§.sort(sort);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.BUNDLE_UPDATE));
         §_-21G§.show(§_-ev§);
      }
      
      private static function add(param1:int) : void
      {
         if(§_-f2R§.indexOf(param1) != -1)
         {
            return;
         }
         §_-f2R§.push(param1);
      }
      
      private static function remove(param1:int) : void
      {
         if(§_-f2R§.indexOf(param1) == -1)
         {
            return;
         }
         §_-f2R§.splice(§_-f2R§.indexOf(param1),1);
      }
      
      private static function sort(param1:int, param2:int) : int
      {
         return param1 > param2 ? 1 : -1;
      }
   }
}

