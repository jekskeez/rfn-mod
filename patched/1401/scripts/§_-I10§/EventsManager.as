package §_-I10§
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   
   public class EventsManager
   {
      
      public static const CHANGE:String = "EventsManager.CHANGE";
      
      private static const §_-318§:int = 60;
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private static var §_-V1F§:Object = {};
      
      private static var §_-C2i§:int = 0;
      
      private static var §_-O2H§:Object = {};
      
      private static var §_-r1x§:Object = {};
      
      private static var §_-eT§:int = 0;
      
      public function EventsManager()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-eT§ = §_-C35§();
         §_-f19§();
         §_-01Y§.§_-c9§(§_-ij§);
      }
      
      public static function §_-1v§(param1:String, param2:Function) : void
      {
         §_-r1x§[param1] = param2;
         §_-V1F§ = {};
         §_-C2i§ = 0;
         §_-O2H§ = {};
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2,false,0,true);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function §_-11w§(param1:String, param2:int) : int
      {
         var _loc3_:Object = §_-K1X§.§_-5n§(param1,param2);
         if(!_loc3_)
         {
            return 0;
         }
         var _loc4_:int = §_-C35§();
         if(_loc4_ < _loc3_.startSec)
         {
            return 0;
         }
         return Math.max(0,int(_loc3_.finishSec) - _loc4_);
      }
      
      private static function §_-f19§() : void
      {
         var _loc7_:Object = null;
         if(!§_-K1X§.§_-v2e§)
         {
            return;
         }
         var _loc1_:int = §_-C35§();
         §_-eT§ = _loc1_;
         var _loc2_:Array = §_-K1X§.events;
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
               if(!(_loc7_.key in §_-V1F§))
               {
                  _loc5_ = true;
                  break;
               }
            }
            _loc6_++;
         }
         if(!_loc5_ && _loc4_ == §_-C2i§)
         {
            return;
         }
         §_-ty§(_loc1_);
      }
      
      private static function §_-ty§(param1:int) : void
      {
         var _loc6_:Object = null;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc2_:Object = {};
         var _loc3_:int = 0;
         var _loc4_:Object = {};
         var _loc5_:Object = null;
         for each(_loc6_ in §_-K1X§.events)
         {
            if(!(param1 < _loc6_.startSec || param1 > _loc6_.finishSec))
            {
               _loc2_[_loc6_.key] = true;
               _loc3_++;
               _loc4_[_loc6_.type] = true;
               if(!(_loc6_.key in §_-V1F§))
               {
                  if(_loc6_.type in §_-r1x§)
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
         §_-V1F§ = _loc2_;
         §_-C2i§ = _loc3_;
         if(_loc5_)
         {
            §_-Xp§(_loc5_);
         }
         for(_loc7_ in §_-O2H§)
         {
            if(!(_loc7_ in _loc4_) && _loc7_ in §_-r1x§)
            {
               §_-r1x§[_loc7_](false,0);
            }
         }
         §_-O2H§ = _loc4_;
         §_-u1o§.dispatchEvent(new Event(CHANGE));
      }
      
      private static function §_-Xp§(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:Function = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         for(_loc2_ in param1)
         {
            _loc3_ = §_-r1x§[_loc2_];
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
      
      private static function §_-C35§() : int
      {
         return Game.§_-nE§ + int(getTimer() / 1000);
      }
      
      private static function §_-ij§() : void
      {
         if(§_-C35§() - §_-eT§ < §_-318§)
         {
            return;
         }
         §_-f19§();
      }
   }
}

