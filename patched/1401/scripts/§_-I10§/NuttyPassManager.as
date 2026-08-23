package §_-I10§
{
   import §_-68§.§_-EI§;
   import §_-em§.§_-I1p§;
   import §_-em§.§_-S2c§;
   import §_-em§.§_-j1y§;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class NuttyPassManager
   {
      
      public static const CHANGE:String = "NuttyPassManager.CHANGE";
      
      private static var passDialog:§_-S2c§;
      
      private static var §_-l1Q§:Object = {};
      
      private static var §_-gK§:Object = {};
      
      private static var §_-82z§:int = 0;
      
      private static var §_-fU§:Object = {};
      
      private static var §_-03Y§:Object = {};
      
      private static var §_-C3P§:Array = [];
      
      private static var §_-l1W§:Object = {};
      
      private static var §_-8m§:Object = {};
      
      private static var §_-6z§:Object = {};
      
      private static var §_-k3§:Object = {};
      
      private static var §_-71j§:Object = {};
      
      private static var §_-W2v§:Object = {};
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function NuttyPassManager()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-43Y§]);
         EventsManager.§_-1v§(§_-K1X§.§_-T1I§,§_-51m§);
         EventsManager.addEventListener(EventsManager.CHANGE,§_-61V§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2,false,0,true);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function get §_-Y3§() : Array
      {
         var _loc1_:Array = §_-C3P§;
         §_-C3P§ = [];
         return _loc1_;
      }
      
      public static function get §_-21m§() : Array
      {
         var _loc2_:Object = null;
         var _loc1_:Array = [];
         for each(_loc2_ in §_-Hr§(§_-a1D§.§_-81j§))
         {
            _loc1_.push(_loc2_.v);
         }
         if(_loc1_.length > §_-a1D§.§_-k1r§)
         {
            _loc1_.length = §_-a1D§.§_-k1r§;
         }
         _loc1_.sort(Array.NUMERIC);
         return _loc1_;
      }
      
      public static function §_-m1t§(param1:int) : Boolean
      {
         return §_-R2B§(param1) > 0 || §_-e2b§(param1) > 0;
      }
      
      public static function §_-s1H§(param1:int) : Boolean
      {
         return !serverVersion(param1) && §_-e2b§(param1) > 0;
      }
      
      public static function §_-R2B§(param1:int) : int
      {
         return serverVersion(param1) || §_-n1W§(param1);
      }
      
      public static function §_-e2b§(param1:int) : int
      {
         var _loc2_:Array = §_-Hr§(param1);
         return _loc2_.length ? int(_loc2_[0].v) : 0;
      }
      
      public static function §_-A1x§(param1:int) : int
      {
         var _loc2_:Object = §_-l1Q§[param1];
         return _loc2_ ? int(_loc2_.level) : 0;
      }
      
      public static function §_-NY§(param1:int) : int
      {
         var _loc2_:Object = §_-l1Q§[param1];
         return _loc2_ ? int(_loc2_.points) : 0;
      }
      
      public static function §_-pU§(param1:int) : Boolean
      {
         var _loc2_:Object = §_-l1Q§[param1];
         return _loc2_ ? Boolean(_loc2_.isPaid) : false;
      }
      
      public static function §_-o20§(param1:int) : Array
      {
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc2_:int = §_-R2B§(param1);
         var _loc3_:Object = §_-l1Q§[param1];
         var _loc4_:Array = _loc3_ ? _loc3_.currentTasks : [];
         if(Boolean(§_-l1W§[param1]) && §_-8m§[param1] == _loc2_)
         {
            §_-j1m§(_loc2_,_loc4_,§_-l1W§[param1]);
            return §_-l1W§[param1];
         }
         var _loc5_:Object = {};
         var _loc6_:Object = {};
         §_-j14§(_loc2_,_loc5_,_loc6_);
         var _loc7_:Array = [];
         for each(_loc8_ in _loc4_)
         {
            _loc9_ = _loc5_[_loc8_.id];
            if(_loc9_)
            {
               _loc7_.push(§_-21U§(_loc9_,_loc6_[_loc8_.id] || "",_loc8_));
            }
         }
         §_-l1W§[param1] = _loc7_;
         §_-8m§[param1] = _loc2_;
         return _loc7_;
      }
      
      public static function §_-F1r§(param1:int) : Array
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc2_:int = §_-R2B§(param1);
         if(_loc2_ <= 0)
         {
            return [];
         }
         if(§_-6z§[_loc2_])
         {
            return §_-6z§[_loc2_];
         }
         var _loc3_:Array = [];
         for each(_loc4_ in §_-a1D§.§_-h2J§(_loc2_))
         {
            _loc5_ = _loc4_.reward_ids;
            _loc3_.push({
               "level":_loc4_.level,
               "points":_loc4_.points || 0,
               "free":§_-e1E§(_loc5_ ? int(_loc5_.free_id) : 0),
               "paid":§_-e1E§(_loc5_ ? int(_loc5_.paid_id) : 0)
            });
         }
         §_-6z§[_loc2_] = _loc3_;
         return _loc3_;
      }
      
      public static function §_-GE§(param1:int) : Object
      {
         var _loc2_:int = §_-R2B§(param1);
         if(_loc2_ <= 0)
         {
            return null;
         }
         if(_loc2_ in §_-k3§)
         {
            return §_-k3§[_loc2_];
         }
         var _loc3_:Object = §_-a1D§.§_-F1I§(_loc2_);
         var _loc4_:Object = _loc3_ ? {
            "points":_loc3_.points || 0,
            "reward":§_-e1E§(_loc3_.reward_id)
         } : null;
         §_-k3§[_loc2_] = _loc4_;
         return _loc4_;
      }
      
      public static function §_-UZ§(param1:int) : Object
      {
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:String = null;
         var _loc2_:Object = {};
         for each(_loc3_ in §_-F1r§(param1))
         {
            if(_loc3_.paid)
            {
               for each(_loc7_ in _loc3_.paid.items)
               {
                  _loc8_ = _loc7_.type + "_" + _loc7_.id;
                  if(!_loc2_[_loc8_])
                  {
                     _loc2_[_loc8_] = {
                        "type":_loc7_.type,
                        "id":_loc7_.id,
                        "count":0
                     };
                  }
                  _loc2_[_loc8_].count += _loc7_.count;
               }
            }
         }
         _loc4_ = [];
         _loc5_ = [];
         for each(_loc6_ in _loc2_)
         {
            if(_loc6_.type == §_-428§.§_-N1P§ || _loc6_.type == §_-428§.§_-dU§ || _loc6_.type == §_-428§.§_-m2z§)
            {
               _loc4_.push(_loc6_);
            }
            else
            {
               _loc5_.push(_loc6_);
            }
         }
         _loc4_.sort(§_-t2W§);
         _loc5_.sort(§_-t2W§);
         _loc5_ = §_-428§.§_-p1k§(_loc5_);
         return {
            "cosmetic":_loc4_,
            "items":_loc5_
         };
      }
      
      public static function §_-J1Q§(param1:int) : Array
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc2_:Array = [];
         var _loc3_:Array = §_-F1r§(param1);
         var _loc4_:int = §_-A1x§(param1);
         var _loc5_:Boolean = §_-pU§(param1);
         for each(_loc6_ in _loc3_)
         {
            _loc7_ = _loc6_.level + 1;
            if(_loc7_ <= _loc4_)
            {
               §_-T1K§(_loc2_,_loc6_.free ? int(_loc6_.free.rewardId) : 0);
               if(_loc5_)
               {
                  §_-T1K§(_loc2_,_loc6_.paid ? int(_loc6_.paid.rewardId) : 0);
               }
            }
         }
         if(_loc4_ >= _loc3_.length)
         {
            _loc8_ = §_-GE§(param1);
            if(Boolean(_loc8_) && Boolean(_loc8_.reward))
            {
               §_-T1K§(_loc2_,_loc8_.reward.rewardId);
            }
         }
         return _loc2_;
      }
      
      public static function §_-m2i§(param1:int) : Boolean
      {
         if(param1 <= 0)
         {
            return false;
         }
         var _loc2_:Object = §_-428§.§_-d1u§(param1);
         return Boolean(_loc2_) && _loc2_.source == §_-428§.§_-71H§;
      }
      
      public static function §_-GU§() : Object
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:Array = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc1_:Object = {};
         for each(_loc2_ in §_-a1D§.§_-Yh§)
         {
            _loc3_ = serverVersion(_loc2_);
            if(_loc3_ > 0)
            {
               _loc4_ = §_-A1x§(_loc2_);
               _loc5_ = §_-pU§(_loc2_);
               _loc6_ = §_-a1D§.§_-h2J§(_loc3_);
               for each(_loc7_ in _loc6_)
               {
                  if(_loc7_.level + 1 <= _loc4_)
                  {
                     _loc8_ = _loc7_.reward_ids;
                     if(_loc8_)
                     {
                        if(_loc8_.free_id)
                        {
                           _loc1_[_loc8_.free_id] = true;
                        }
                        if(_loc5_ && Boolean(_loc8_.paid_id))
                        {
                           _loc1_[_loc8_.paid_id] = true;
                        }
                     }
                  }
               }
               if(_loc4_ >= _loc6_.length)
               {
                  _loc9_ = §_-a1D§.§_-F1I§(_loc3_);
                  if(Boolean(_loc9_) && Boolean(_loc9_.reward_id))
                  {
                     _loc1_[_loc9_.reward_id] = true;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public static function §_-A1E§(param1:int, param2:int) : void
      {
         var _loc3_:int = §_-R2B§(param2);
         if(_loc3_)
         {
            Connection.§_-Li§(§_-h2B§.§_-k28§,param1,_loc3_);
         }
      }
      
      public static function §_-12u§(param1:int) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-TL§,param1);
      }
      
      public static function §_-51m§(param1:Boolean, param2:int) : void
      {
         var _loc3_:Object = null;
         if(param1)
         {
            if(§_-a1D§.§_-X1z§(param2) == §_-a1D§.§_-81j§)
            {
               return;
            }
            for each(_loc3_ in §_-gK§)
            {
               if(_loc3_.v == param2)
               {
                  return;
               }
            }
            activate(param2);
         }
         else
         {
            deactivate(param2);
         }
         §_-A1v§();
         §_-71j§ = {};
         §_-zG§();
         §_-u1o§.dispatchEvent(new Event(CHANGE));
      }
      
      public static function §_-n1N§() : void
      {
         if(!§_-K1X§.§_-v2e§)
         {
            return;
         }
         if(§_-Q2v§.§_-U2F§)
         {
            return;
         }
         §_-327§();
         §_-bq§();
      }
      
      public static function §_-U2§(param1:Event = null) : void
      {
         §_-4e§();
      }
      
      public static function §_-4e§(param1:int = 0, param2:Array = null) : void
      {
         var passType:int = param1;
         var seenEvents:Array = param2;
         if(passDialog)
         {
            presentPassDialog(passType,seenEvents);
            return;
         }
         §_-EI§.load(function():void
         {
            passDialog = new §_-S2c§();
            presentPassDialog(passType,seenEvents);
         });
      }
      
      public static function §_-Yd§(param1:int) : void
      {
         var _loc2_:int = §_-h1L§(param1);
         if(_loc2_ > 0)
         {
            new §_-j1y§(_loc2_).show();
         }
      }
      
      public static function §_-5y§() : void
      {
         §_-zG§();
         §_-u1o§.dispatchEvent(new Event(CHANGE));
      }
      
      public static function §_-zG§() : void
      {
         if(§_-81d§())
         {
            §_-fO§.show(NotificationManager.§_-Ee§);
         }
         else
         {
            §_-fO§.hide(NotificationManager.§_-Ee§);
         }
      }
      
      public static function §_-11M§(param1:int) : Boolean
      {
         var _loc3_:String = null;
         if(§_-s1H§(param1))
         {
            return true;
         }
         var _loc2_:Object = §_-fU§[serverVersion(param1)];
         if(!_loc2_)
         {
            return false;
         }
         for(_loc3_ in _loc2_)
         {
            if(§_-A29§.§_-nT§(int(_loc3_)))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function §_-o1r§(param1:int) : Boolean
      {
         var _loc2_:Object = null;
         if(§_-s1H§(param1))
         {
            return true;
         }
         for each(_loc2_ in §_-o20§(param1))
         {
            if(_loc2_.completed)
            {
               return true;
            }
         }
         return false;
      }
      
      private static function §_-81d§() : Boolean
      {
         var _loc1_:int = 0;
         for each(_loc1_ in §_-a1D§.§_-Yh§)
         {
            if(§_-11M§(_loc1_) || §_-o1r§(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      private static function presentPassDialog(param1:int, param2:Array) : void
      {
         passDialog.show();
         passDialog.§_-u2M§(param1,param2);
      }
      
      private static function §_-327§() : void
      {
         var _loc1_:Object = §_-K1X§.§_-e1K§(§_-K1X§.§_-822§);
         if(!_loc1_ || _loc1_.rate <= 0)
         {
            return;
         }
         if(§_-82N§.§_-m2x§(§_-K1X§.§_-822§,_loc1_.startSec))
         {
            return;
         }
         new §_-I1p§(_loc1_.rate,[_loc1_]).show();
      }
      
      private static function §_-bq§() : void
      {
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         var _loc1_:int = §_-xp§();
         if(_loc1_ <= 0)
         {
            return;
         }
         var _loc2_:Array = [];
         var _loc3_:Boolean = false;
         for each(_loc4_ in §_-a1D§.§_-Yh§)
         {
            for each(_loc5_ in §_-Hr§(_loc4_))
            {
               _loc2_.push(_loc5_);
               if(!§_-82N§.§_-m2x§(_loc5_.type,_loc5_.startSec))
               {
                  _loc3_ = true;
               }
            }
         }
         if(_loc3_)
         {
            §_-4e§(_loc1_,_loc2_);
         }
      }
      
      private static function §_-xp§() : int
      {
         var _loc1_:int = 0;
         for each(_loc1_ in §_-a1D§.§_-Yh§)
         {
            if(§_-s1H§(_loc1_) || §_-U28§(_loc1_))
            {
               return _loc1_;
            }
         }
         return 0;
      }
      
      private static function §_-h1L§(param1:int) : int
      {
         var _loc2_:int = 0;
         if(§_-U28§(param1))
         {
            return param1;
         }
         for each(_loc2_ in §_-a1D§.§_-Yh§)
         {
            if(§_-U28§(_loc2_))
            {
               return _loc2_;
            }
         }
         return 0;
      }
      
      public static function §_-U28§(param1:int) : Boolean
      {
         if(!§_-m1t§(param1) || §_-pU§(param1) || §_-a1D§.§_-w§(param1) <= 0)
         {
            return false;
         }
         var _loc2_:int = §_-R2B§(param1);
         if(_loc2_ <= 0)
         {
            return false;
         }
         return EventsManager.§_-11w§(§_-K1X§.§_-T1I§,_loc2_) > §_-a1D§.§_-51H§;
      }
      
      private static function §_-T1K§(param1:Array, param2:int) : void
      {
         var _loc3_:int = §_-A29§.§_-w2E§(param2);
         if(_loc3_ > 0)
         {
            param1.push({
               "id":param2,
               "count":_loc3_
            });
         }
      }
      
      private static function §_-e1E§(param1:int) : Object
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc2_:Object = param1 ? §_-428§.§_-d1u§(param1) : null;
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_ ? _loc2_.contentItems : null)
         {
            _loc3_.push({
               "type":_loc4_.type,
               "id":_loc4_.id,
               "count":_loc4_.count
            });
         }
         _loc5_ = _loc3_.length ? _loc3_[0] : null;
         return {
            "rewardId":param1,
            "name":(_loc2_ ? _loc2_.translatedCaption || "" : ""),
            "type":(_loc5_ ? _loc5_.type : 0),
            "id":(_loc5_ ? _loc5_.id : 0),
            "count":(_loc5_ ? _loc5_.count : 0),
            "items":_loc3_
         };
      }
      
      private static function §_-t2W§(param1:Object, param2:Object) : int
      {
         if(param1.type != param2.type)
         {
            return param1.type - param2.type;
         }
         return param1.id - param2.id;
      }
      
      private static function §_-A1v§() : void
      {
         §_-l1W§ = {};
         §_-8m§ = {};
      }
      
      private static function §_-t2q§(param1:int) : void
      {
         delete §_-l1W§[param1];
         delete §_-8m§[param1];
      }
      
      private static function §_-j14§(param1:int, param2:Object, param3:Object) : void
      {
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc4_:Object = §_-a1D§.§_-i10§(param1);
         for each(_loc5_ in §_-a1D§.§_-lS§)
         {
            for each(_loc6_ in _loc4_ ? _loc4_[_loc5_] : null)
            {
               param2[_loc6_.id] = _loc6_;
               param3[_loc6_.id] = _loc5_;
            }
         }
      }
      
      private static function §_-21U§(param1:Object, param2:String, param3:Object) : Object
      {
         var _loc4_:int = int(int(param1.goal) || 0);
         var _loc5_:int = int(int(param3.count) || 0);
         return {
            "id":param3.id,
            "title":§_-a1D§.§_-13S§(param1) || param3.id,
            "value":_loc5_,
            "max":_loc4_,
            "reward":param1.points_reward || 0,
            "action":param1.action || "",
            "pool":param2 || "",
            "completed":_loc4_ > 0 && _loc5_ >= _loc4_
         };
      }
      
      private static function §_-j1m§(param1:int, param2:Array, param3:Array) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc12_:int = 0;
         var _loc13_:Object = null;
         if(!param2)
         {
            param2 = [];
         }
         var _loc4_:Object = {};
         for each(_loc5_ in param3)
         {
            _loc4_[_loc5_.id] = _loc5_;
         }
         _loc6_ = null;
         _loc7_ = null;
         _loc8_ = [];
         for each(_loc9_ in param2)
         {
            _loc11_ = _loc4_[_loc9_.id];
            if(_loc11_)
            {
               _loc12_ = int(int(_loc9_.count) || 0);
               _loc11_.value = _loc12_;
               _loc11_.completed = _loc11_.max > 0 && _loc12_ >= _loc11_.max;
               _loc8_.push(_loc11_);
               delete _loc4_[_loc9_.id];
            }
            else
            {
               if(!_loc6_)
               {
                  _loc6_ = {};
                  _loc7_ = {};
                  §_-j14§(param1,_loc6_,_loc7_);
               }
               _loc13_ = _loc6_[_loc9_.id];
               if(_loc13_)
               {
                  _loc8_.push(§_-21U§(_loc13_,_loc7_[_loc9_.id] || "",_loc9_));
               }
            }
         }
         param3.length = 0;
         for each(_loc10_ in _loc8_)
         {
            param3.push(_loc10_);
         }
      }
      
      private static function §_-Xt§() : Boolean
      {
         return §_-82z§ > 0;
      }
      
      private static function serverVersion(param1:int) : int
      {
         var _loc2_:Object = §_-l1Q§[param1];
         return _loc2_ ? int(_loc2_.serverVersion) : 0;
      }
      
      private static function §_-n1W§(param1:int) : int
      {
         var _loc2_:Object = §_-gK§[param1];
         return _loc2_ ? int(_loc2_.v) : 0;
      }
      
      private static function §_-Hr§(param1:int) : Array
      {
         var _loc3_:Object = null;
         if(§_-71j§[param1])
         {
            return §_-71j§[param1];
         }
         var _loc2_:Array = [];
         for each(_loc3_ in §_-K1X§.§_-M2p§())
         {
            if(_loc3_.type == §_-K1X§.§_-T1I§ && §_-a1D§.§_-X1z§(_loc3_.v) == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         _loc2_.sort(§_-b1w§);
         §_-71j§[param1] = _loc2_;
         return _loc2_;
      }
      
      private static function §_-b1w§(param1:Object, param2:Object) : int
      {
         return param2.startSec - param1.startSec;
      }
      
      private static function activate(param1:int) : void
      {
         §_-11K§(param1);
         var _loc2_:Object = §_-a1D§.§_-y13§(param1);
         if(!_loc2_)
         {
            return;
         }
         if(!§_-gK§[_loc2_.type])
         {
            ++§_-82z§;
         }
         §_-gK§[_loc2_.type] = _loc2_;
      }
      
      private static function deactivate(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         if(param1 <= 0)
         {
            §_-gK§ = {};
            §_-82z§ = 0;
            §_-03Y§ = {};
            §_-fU§ = {};
            §_-A1v§();
            §_-6z§ = {};
            §_-k3§ = {};
            §_-71j§ = {};
            return;
         }
         for each(_loc2_ in §_-a1D§.§_-Yh§)
         {
            _loc3_ = §_-gK§[_loc2_];
            if(Boolean(_loc3_) && _loc3_.v == param1)
            {
               delete §_-gK§[_loc2_];
               --§_-82z§;
               delete §_-03Y§[_loc2_];
            }
         }
         delete §_-fU§[param1];
         delete §_-6z§[param1];
         delete §_-k3§[param1];
         §_-71j§ = {};
      }
      
      private static function §_-11K§(param1:int) : void
      {
         var _loc2_:Object = {};
         §_-y10§(§_-a1D§.§_-h2J§(param1),_loc2_);
         §_-N1x§(param1,_loc2_);
         §_-fU§[param1] = _loc2_;
      }
      
      private static function §_-y10§(param1:Array, param2:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         for each(_loc3_ in param1)
         {
            _loc4_ = _loc3_.reward_ids;
            if(_loc4_)
            {
               if(_loc4_.free_id)
               {
                  param2[_loc4_.free_id] = true;
               }
               if(_loc4_.paid_id)
               {
                  param2[_loc4_.paid_id] = true;
               }
            }
         }
      }
      
      private static function §_-N1x§(param1:int, param2:Object) : void
      {
         var _loc3_:Object = §_-a1D§.§_-F1I§(param1);
         if(Boolean(_loc3_) && Boolean(_loc3_.reward_id))
         {
            param2[_loc3_.reward_id] = true;
         }
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc14_:Object = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc2_:Array = param1[0];
         var _loc3_:Object = §_-l1Q§;
         var _loc4_:Object = {};
         var _loc5_:int = 0;
         while(_loc5_ + 5 < _loc2_.length)
         {
            _loc7_ = int(_loc2_[_loc5_]);
            _loc8_ = §_-a1D§.§_-X1z§(_loc7_);
            if(_loc8_ > 0)
            {
               _loc9_ = _loc2_[_loc5_ + 5];
               _loc10_ = [];
               _loc11_ = 0;
               while(Boolean(_loc9_) && _loc11_ + 1 < _loc9_.length)
               {
                  _loc10_.push({
                     "id":_loc9_[_loc11_],
                     "count":_loc9_[_loc11_ + 1]
                  });
                  _loc11_ += 2;
               }
               _loc4_[_loc8_] = {
                  "serverVersion":_loc7_,
                  "level":_loc2_[_loc5_ + 1],
                  "points":_loc2_[_loc5_ + 2],
                  "isPaid":_loc2_[_loc5_ + 3],
                  "taskSkipCount":_loc2_[_loc5_ + 4],
                  "currentTasks":_loc10_
               };
               _loc12_ = §_-gK§[_loc8_];
               if(_loc7_ > 0 && (!_loc12_ || _loc12_.v != _loc7_))
               {
                  activate(_loc7_);
               }
            }
            _loc5_ += 6;
         }
         for each(_loc6_ in §_-a1D§.§_-Yh§)
         {
            _loc13_ = _loc3_[_loc6_];
            _loc14_ = _loc4_[_loc6_];
            _loc15_ = _loc13_ ? int(_loc13_.serverVersion) : 0;
            _loc16_ = _loc14_ ? int(_loc14_.serverVersion) : 0;
            if(_loc15_ != _loc16_)
            {
               §_-t2q§(_loc6_);
               if(_loc15_ > 0)
               {
                  delete §_-6z§[_loc15_];
                  delete §_-k3§[_loc15_];
               }
            }
            else if(Boolean(_loc14_) && Boolean(§_-l1W§[_loc6_]) && §_-8m§[_loc6_] == _loc16_)
            {
               §_-j1m§(_loc16_,_loc14_.currentTasks,§_-l1W§[_loc6_]);
            }
         }
         §_-l1Q§ = _loc4_;
         §_-nB§(false);
         §_-E1a§(§_-Xt§());
         §_-A29§.§_-m12§();
         §_-u1o§.dispatchEvent(new Event(CHANGE));
      }
      
      private static function §_-E1a§(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         if(param1)
         {
            §_-C3P§ = [];
         }
         for each(_loc2_ in §_-a1D§.§_-Yh§)
         {
            _loc3_ = §_-03Y§[_loc2_] || {};
            _loc4_ = {};
            for each(_loc5_ in §_-o20§(_loc2_))
            {
               if(_loc5_.completed)
               {
                  _loc4_[_loc5_.id] = true;
                  if(param1 && !_loc3_[_loc5_.id])
                  {
                     §_-C3P§.push({
                        "passType":_loc2_,
                        "taskId":_loc5_.id
                     });
                  }
               }
            }
            §_-03Y§[_loc2_] = _loc4_;
         }
      }
      
      private static function §_-61V§(param1:Event) : void
      {
         §_-71j§ = {};
         §_-nB§(true);
      }
      
      private static function §_-nB§(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc2_:Boolean = false;
         for each(_loc3_ in §_-a1D§.§_-Yh§)
         {
            _loc4_ = §_-U28§(_loc3_);
            if(§_-W2v§[_loc3_] == undefined || §_-W2v§[_loc3_] != _loc4_)
            {
               §_-W2v§[_loc3_] = _loc4_;
               _loc2_ = true;
            }
         }
         if(param1 && _loc2_)
         {
            §_-u1o§.dispatchEvent(new Event(CHANGE));
         }
      }
   }
}

