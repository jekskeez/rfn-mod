package §_-I10§
{
   import §_-t1F§.§_-B24§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   
   public class §_-S9§
   {
      
      public static const §_-PQ§:int = 15;
      
      public static const §_-y1V§:int = 125;
      
      public static const §_-Q2A§:int = 126;
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private static var §_-519§:Array = [];
      
      private static var §_-R26§:Object = {};
      
      public function §_-S9§()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc1_:Object = null;
         §_-519§ = §_-t2V§.bank.bundle_offers.concat();
         for each(_loc1_ in §_-B2§.offers)
         {
            §_-R26§[_loc1_.offer_id] = §_-Tr§(_loc1_);
         }
         §_-d2x§.addEventListener(GameEvent.LEVEL_CHANGED,§_-A1O§);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.BUNDLE_UPDATE));
      }
      
      public static function §_-b28§(param1:int) : §_-63q§
      {
         return §_-R26§[param1];
      }
      
      public static function §_-t1Z§(param1:int) : §_-63q§
      {
         var _loc2_:§_-63q§ = null;
         for each(_loc2_ in §_-R26§)
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
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function §_-027§(param1:int) : void
      {
      }
      
      public static function get ids() : Array
      {
         return §_-519§;
      }
      
      private static function §_-Tr§(param1:Object) : §_-63q§
      {
         return new §_-63q§(param1.offer_id,param1.reward_id,gls(param1.title),§_-a9§.§_-sc§ ? Number(param1.price_rub) : Number(param1.price_usd),int(param1.benefit) || 0,param1.product,param1.image_class,§_-2L§(param1.reward_id));
      }
      
      private static function §_-2L§(param1:int) : Vector.<§_-51T§>
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Class = null;
         var _loc2_:Object = §_-428§.§_-d1u§(param1);
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:Vector.<§_-51T§> = new Vector.<§_-51T§>(0);
         for(_loc4_ in _loc2_.content)
         {
            if(_loc4_ in §_-428§.§_-A21§)
            {
               _loc5_ = int(§_-428§.§_-A21§[_loc4_]);
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
               _loc9_ = §_-i2m§(_loc5_,_loc7_);
               if(_loc9_)
               {
                  _loc3_.push(new §_-51T§(_loc9_,§_-c2Y§(_loc5_,_loc7_,_loc8_)));
               }
            }
         }
         return _loc3_;
      }
      
      private static function §_-i2m§(param1:int, param2:int) : Class
      {
         switch(param1)
         {
            case §_-428§.§_-113§:
            case §_-428§.§_-wG§:
               return ImageGetCoins;
            case §_-428§.§_-61Q§:
               return ImageGetEnergy;
            case §_-428§.§_-a1H§:
               return ImageGetMana;
            case §_-428§.§_-Q1C§:
               return ImageGetItemsPack;
            case §_-428§.§_-Z2n§:
               return param2 == 1 ? ImageGetCollectionsRare : ImageGetCollections;
            case §_-428§.§_-dU§:
            case §_-428§.§_-N1P§:
               return ImageGetPackage;
            case §_-428§.§_-O2P§:
               return param2 == §_-e1z§.§_-02l§ ? ImageGetManaRegenDrink : ImageGetVip;
            default:
               return null;
         }
      }
      
      private static function §_-c2Y§(param1:int, param2:int, param3:int) : String
      {
         switch(param1)
         {
            case §_-428§.§_-113§:
               return gls("{0} монет",param3);
            case §_-428§.§_-wG§:
               return gls("{0} орехов",param3);
            case §_-428§.§_-61Q§:
               return gls("{0} энергии",param3);
            case §_-428§.§_-a1H§:
               return gls("{0} маны",param3);
            case §_-428§.§_-Q1C§:
               return gls("{0} предметов шамана каждого типа",param3);
            case §_-428§.§_-Z2n§:
               return param2 == 1 ? gls("{0} редких элементов коллекций",param3) : gls("{0} элементов коллекций",param3);
            case §_-428§.§_-dU§:
               return gls("Случайный костюм");
            case §_-428§.§_-N1P§:
               return §_-g2W§.§_-G1Y§(param2);
            case §_-428§.§_-O2P§:
               if(param2 == §_-e1z§.§_-02l§)
               {
                  return gls("Зелье Могущества\nна {0} дней",param3);
               }
               return gls("VIP-статус\nна {0} дней",param3);
               break;
            default:
               return "";
         }
      }
      
      private static function §_-A1O§(param1:GameEvent) : void
      {
         if(param1.data["value"] != Game.§_-o9§ || §_-d2x§.§_-z2o§ >= Game.§_-b2u§)
         {
            return;
         }
         add(§_-y1V§);
         §_-519§.sort(sort);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.BUNDLE_UPDATE));
         §_-B24§.show(§_-y1V§);
      }
      
      private static function add(param1:int) : void
      {
         if(§_-519§.indexOf(param1) != -1)
         {
            return;
         }
         §_-519§.push(param1);
      }
      
      private static function remove(param1:int) : void
      {
         if(§_-519§.indexOf(param1) == -1)
         {
            return;
         }
         §_-519§.splice(§_-519§.indexOf(param1),1);
      }
      
      private static function sort(param1:int, param2:int) : int
      {
         return param1 > param2 ? 1 : -1;
      }
   }
}

