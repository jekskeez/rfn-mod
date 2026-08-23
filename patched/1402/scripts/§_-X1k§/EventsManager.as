package §_-X1k§
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   
   public class EventsManager
   {
      
      public static const CHANGE:String = "EventsManager.CHANGE";
      
      private static const §_-Y2v§:int = 60;
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      private static var §_-m2F§:Object = {};
      
      private static var §_-ta§:int = 0;
      
      private static var §_-A1H§:Object = {};
      
      private static var §_-m2L§:Object = {};
      
      private static var §_-S1i§:int = 0;
      
      public function EventsManager()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-S1i§ = §_-K2N§();
         §_-iJ§();
         §_-p1V§.§_-63T§(§_-32d§);
      }
      
      public static function §_-Yz§(param1:String, param2:Function) : void
      {
         §_-m2L§[param1] = param2;
         §_-m2F§ = {};
         §_-ta§ = 0;
         §_-A1H§ = {};
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2,false,0,true);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function §_-M1b§(param1:String, param2:int) : int
      {
         var _loc3_:Object = §_-z9§.§_-d2K§(param1,param2);
         if(!_loc3_)
         {
            return 0;
         }
         var _loc4_:int = §_-K2N§();
         if(_loc4_ < _loc3_.startSec)
         {
            return 0;
         }
         return Math.max(0,int(_loc3_.finishSec) - _loc4_);
      }
      
      private static function §_-iJ§() : void
      {
         var _loc7_:Object = null;
         if(!§_-z9§.§_-Xh§)
         {
            return;
         }
         var _loc1_:int = §_-K2N§();
         §_-S1i§ = _loc1_;
         var _loc2_:Array = §_-z9§.events;
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc7_ = _loc2_[_loc6_];
            if(!(_loc1_ < _loc7_.startSec || _loc1_ > _loc7_.finishSec))
            {
               _loc4_++;
               if(!(_loc7_.key in §_-m2F§))
               {
                  _loc5_ = true;
                  break;
               }
            }
            _loc6_++;
         }
         if(!_loc5_ && _loc4_ == §_-ta§)
         {
            return;
         }
         §_-bd§(_loc1_);
      }
      
      private static function §_-bd§(param1:int) : void
      {
         var _loc6_:Object = null;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc2_:Object = {};
         var _loc3_:int = 0;
         var _loc4_:Object = {};
         var _loc5_:Object = null;
         for each(_loc6_ in §_-z9§.events)
         {
            if(!(param1 < _loc6_.startSec || param1 > _loc6_.finishSec))
            {
               _loc2_[_loc6_.key] = true;
               _loc3_++;
               _loc4_[_loc6_.type] = true;
               if(!(_loc6_.key in §_-m2F§))
               {
                  if(_loc6_.type in §_-m2L§)
                  {
                     if(!_loc5_)
                     {
                        _loc5_ = {};
                     }
                     _loc8_ = _loc5_[_loc6_.type];
                     if(!_loc8_)
                     {
                        _loc5_[_loc6_.type] = _loc8_ = [];
                     }
                     _loc8_.push(_loc6_.v);
                  }
               }
            }
         }
         §_-m2F§ = _loc2_;
         §_-ta§ = _loc3_;
         if(_loc5_)
         {
            §_-01D§(_loc5_);
         }
         for(_loc7_ in §_-A1H§)
         {
            if(!(_loc7_ in _loc4_) && _loc7_ in §_-m2L§)
            {
               §_-m2L§[_loc7_](false,0);
            }
         }
         §_-A1H§ = _loc4_;
         §_-jx§.dispatchEvent(new Event(CHANGE));
      }
      
      private static function §_-01D§(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:Function = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for(_loc2_ in param1)
         {
            _loc3_ = §_-m2L§[_loc2_];
            _loc4_ = param1[_loc2_];
            _loc5_ = int(_loc4_.length);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc3_(true,int(_loc4_[_loc6_]));
               _loc6_++;
            }
         }
      }
      
      private static function §_-K2N§() : int
      {
         return Game.§_-i24§ + int(getTimer() / 1000);
      }
      
      private static function §_-32d§() : void
      {
         if(§_-K2N§() - §_-S1i§ < §_-Y2v§)
         {
            return;
         }
         §_-iJ§();
      }
   }
}

