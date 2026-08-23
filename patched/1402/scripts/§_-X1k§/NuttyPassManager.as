package §_-X1k§
{
   import §_-l2f§.§_-I2u§;
   import §_-l2f§.§_-K1n§;
   import §_-l2f§.§_-eH§;
   import §_-s2e§.§_-U2d§;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class NuttyPassManager
   {
      
      public static const CHANGE:String = "NuttyPassManager.CHANGE";
      
      private static var passDialog:§_-eH§;
      
      private static var §_-i1P§:Object = {};
      
      private static var §_-B2I§:Object = {};
      
      private static var §_-8k§:int = 0;
      
      private static var §_-v1Z§:Object = {};
      
      private static var §_-lD§:Object = {};
      
      private static var §_-mQ§:Array = [];
      
      private static var §_-Gg§:Object = {};
      
      private static var §_-B1B§:Object = {};
      
      private static var §_-f25§:Object = {};
      
      private static var §_-gW§:Object = {};
      
      private static var §_-l12§:Object = {};
      
      private static var §_-rL§:Object = {};
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function NuttyPassManager()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-8i§]);
         EventsManager.§_-Yz§(§_-z9§.§_-bp§,§_-724§);
         EventsManager.addEventListener(EventsManager.CHANGE,§_-X2P§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2,false,0,true);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function get §_-8G§() : Array
      {
         var _loc1_:Array = §_-mQ§;
         §_-mQ§ = [];
         return _loc1_;
      }
      
      public static function get §_-L1D§() : Array
      {
         var _loc2_:Object = null;
         var _loc1_:Array = [];
         for each(_loc2_ in §_-PI§(§_-C2b§.§_-pP§))
         {
            _loc1_.push(_loc2_.v);
         }
         if(_loc1_.length > §_-C2b§.§_-C2z§)
         {
            _loc1_.length = §_-C2b§.§_-C2z§;
         }
         _loc1_.sort(Array.NUMERIC);
         return _loc1_;
      }
      
      public static function §_-K2s§(param1:int) : Boolean
      {
         return §_-d1l§(param1) > 0 || §_-xo§(param1) > 0;
      }
      
      public static function §_-n1H§(param1:int) : Boolean
      {
         return !serverVersion(param1) && §_-xo§(param1) > 0;
      }
      
      public static function §_-d1l§(param1:int) : int
      {
         return serverVersion(param1) || §_-31h§(param1);
      }
      
      public static function §_-xo§(param1:int) : int
      {
         var _loc2_:Array = §_-PI§(param1);
         return _loc2_.length ? int(_loc2_[0].v) : 0;
      }
      
      public static function §_-82P§(param1:int) : int
      {
         var _loc2_:Object = §_-i1P§[param1];
         return _loc2_ ? int(_loc2_.level) : 0;
      }
      
      public static function §_-NZ§(param1:int) : int
      {
         var _loc2_:Object = §_-i1P§[param1];
         return _loc2_ ? int(_loc2_.points) : 0;
      }
      
      public static function §_-M2X§(param1:int) : Boolean
      {
         var _loc2_:Object = §_-i1P§[param1];
         return _loc2_ ? Boolean(_loc2_.isPaid) : false;
      }
      
      public static function §_-U1O§(param1:int) : Array
      {
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc2_:int = §_-d1l§(param1);
         var _loc3_:Object = §_-i1P§[param1];
         var _loc4_:Array = _loc3_ ? _loc3_.currentTasks : [];
         if(Boolean(§_-Gg§[param1]) && §_-B1B§[param1] == _loc2_)
         {
            §_-OJ§(_loc2_,_loc4_,§_-Gg§[param1]);
            return §_-Gg§[param1];
         }
         var _loc5_:Object = {};
         var _loc6_:Object = {};
         §_-Z1U§(_loc2_,_loc5_,_loc6_);
         var _loc7_:Array = [];
         for each(_loc8_ in _loc4_)
         {
            _loc9_ = _loc5_[_loc8_.id];
            if(_loc9_)
            {
               _loc7_.push(§_-K1g§(_loc9_,_loc6_[_loc8_.id] || "",_loc8_));
            }
         }
         §_-Gg§[param1] = _loc7_;
         §_-B1B§[param1] = _loc2_;
         return _loc7_;
      }
      
      public static function §_-V2L§(param1:int) : Array
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc2_:int = §_-d1l§(param1);
         if(_loc2_ <= 0)
         {
            return [];
         }
         if(§_-f25§[_loc2_])
         {
            return §_-f25§[_loc2_];
         }
         var _loc3_:Array = [];
         for each(_loc4_ in §_-C2b§.§_-k18§(_loc2_))
         {
            _loc5_ = _loc4_.reward_ids;
            _loc3_.push({
               "level":_loc4_.level,
               "points":_loc4_.points || 0,
               "free":§_-a1U§(_loc5_ ? int(_loc5_.free_id) : 0),
               "paid":§_-a1U§(_loc5_ ? int(_loc5_.paid_id) : 0)
            });
         }
         §_-f25§[_loc2_] = _loc3_;
         return _loc3_;
      }
      
      public static function §_-t2K§(param1:int) : Object
      {
         var _loc2_:int = §_-d1l§(param1);
         if(_loc2_ <= 0)
         {
            return null;
         }
         if(_loc2_ in §_-gW§)
         {
            return §_-gW§[_loc2_];
         }
         var _loc3_:Object = §_-C2b§.§_-X2j§(_loc2_);
         var _loc4_:Object = _loc3_ ? {
            "points":_loc3_.points || 0,
            "reward":§_-a1U§(_loc3_.reward_id)
         } : null;
         §_-gW§[_loc2_] = _loc4_;
         return _loc4_;
      }
      
      public static function §_-L11§(param1:int) : Object
      {
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:String = null;
         var _loc2_:Object = {};
         for each(_loc3_ in §_-V2L§(param1))
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
            if(_loc6_.type == §_-A3y§.§_-o2t§ || _loc6_.type == §_-A3y§.§_-t1F§ || _loc6_.type == §_-A3y§.§_-33h§)
            {
               _loc4_.push(_loc6_);
            }
            else
            {
               _loc5_.push(_loc6_);
            }
         }
         _loc4_.sort(§_-lt§);
         _loc5_.sort(§_-lt§);
         _loc5_ = §_-A3y§.§_-be§(_loc5_);
         return {
            "cosmetic":_loc4_,
            "items":_loc5_
         };
      }
      
      public static function §_-aE§(param1:int) : Array
      {
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc2_:Array = [];
         var _loc3_:Array = §_-V2L§(param1);
         var _loc4_:int = §_-82P§(param1);
         var _loc5_:Boolean = §_-M2X§(param1);
         for each(_loc6_ in _loc3_)
         {
            _loc7_ = _loc6_.level + 1;
            if(_loc7_ <= _loc4_)
            {
               §_-21a§(_loc2_,_loc6_.free ? int(_loc6_.free.rewardId) : 0);
               if(_loc5_)
               {
                  §_-21a§(_loc2_,_loc6_.paid ? int(_loc6_.paid.rewardId) : 0);
               }
            }
         }
         if(_loc4_ >= _loc3_.length)
         {
            _loc8_ = §_-t2K§(param1);
            if(Boolean(_loc8_) && Boolean(_loc8_.reward))
            {
               §_-21a§(_loc2_,_loc8_.reward.rewardId);
            }
         }
         return _loc2_;
      }
      
      public static function §_-v2f§(param1:int) : Boolean
      {
         if(param1 <= 0)
         {
            return false;
         }
         var _loc2_:Object = §_-A3y§.§_-B3F§(param1);
         return Boolean(_loc2_) && _loc2_.source == §_-A3y§.§_-y1s§;
      }
      
      public static function §_-33X§() : Object
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
         for each(_loc2_ in §_-C2b§.§_-78§)
         {
            _loc3_ = serverVersion(_loc2_);
            if(_loc3_ > 0)
            {
               _loc4_ = §_-82P§(_loc2_);
               _loc5_ = §_-M2X§(_loc2_);
               _loc6_ = §_-C2b§.§_-k18§(_loc3_);
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
                  _loc9_ = §_-C2b§.§_-X2j§(_loc3_);
                  if(Boolean(_loc9_) && Boolean(_loc9_.reward_id))
                  {
                     _loc1_[_loc9_.reward_id] = true;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public static function §_-T2D§(param1:int, param2:int) : void
      {
         var _loc3_:int = §_-d1l§(param2);
         if(_loc3_)
         {
            Connection.§_-e2T§(§_-u1O§.§_-q1J§,param1,_loc3_);
         }
      }
      
      public static function §_-l1i§(param1:int) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-h1m§,param1);
      }
      
      public static function §_-724§(param1:Boolean, param2:int) : void
      {
         var _loc3_:Object = null;
         if(param1)
         {
            if(§_-C2b§.§_-q1g§(param2) == §_-C2b§.§_-pP§)
            {
               return;
            }
            for each(_loc3_ in §_-B2I§)
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
         §_-t1r§();
         §_-l12§ = {};
         §_-Po§();
         §_-jx§.dispatchEvent(new Event(CHANGE));
      }
      
      public static function §_-63Q§() : void
      {
         if(!§_-z9§.§_-Xh§)
         {
            return;
         }
         if(§_-Ac§.§_-21c§)
         {
            return;
         }
         §_-rF§();
         §_-w1w§();
      }
      
      public static function §_-L1f§(param1:Event = null) : void
      {
         §_-12c§();
      }
      
      public static function §_-12c§(param1:int = 0, param2:Array = null) : void
      {
         var passType:int = param1;
         var seenEvents:Array = param2;
         if(passDialog)
         {
            presentPassDialog(passType,seenEvents);
            return;
         }
         §_-U2d§.load(function():void
         {
            passDialog = new §_-eH§();
            presentPassDialog(passType,seenEvents);
         });
      }
      
      public static function §_-L2Y§(param1:int) : void
      {
         var _loc2_:int = §_-A13§(param1);
         if(_loc2_ > 0)
         {
            new §_-K1n§(_loc2_).show();
         }
      }
      
      public static function §_-WX§() : void
      {
         §_-Po§();
         §_-jx§.dispatchEvent(new Event(CHANGE));
      }
      
      public static function §_-Po§() : void
      {
         if(§_-T2B§())
         {
            §_-L1H§.show(NotificationManager.§_-b1B§);
         }
         else
         {
            §_-L1H§.hide(NotificationManager.§_-b1B§);
         }
      }
      
      public static function §_-94§(param1:int) : Boolean
      {
         var _loc3_:String = null;
         if(§_-n1H§(param1))
         {
            return true;
         }
         var _loc2_:Object = §_-v1Z§[serverVersion(param1)];
         if(!_loc2_)
         {
            return false;
         }
         for(_loc3_ in _loc2_)
         {
            if(§_-f4§.§_-a1M§(int(_loc3_)))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function §_-s15§(param1:int) : Boolean
      {
         var _loc2_:Object = null;
         if(§_-n1H§(param1))
         {
            return true;
         }
         for each(_loc2_ in §_-U1O§(param1))
         {
            if(_loc2_.completed)
            {
               return true;
            }
         }
         return false;
      }
      
      private static function §_-T2B§() : Boolean
      {
         var _loc1_:int = 0;
         for each(_loc1_ in §_-C2b§.§_-78§)
         {
            if(§_-94§(_loc1_) || §_-s15§(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      private static function presentPassDialog(param1:int, param2:Array) : void
      {
         passDialog.show();
         passDialog.§_-t1u§(param1,param2);
      }
      
      private static function §_-rF§() : void
      {
         var _loc1_:Object = §_-z9§.§_-SC§(§_-z9§.§_-H2D§);
         if(!_loc1_ || _loc1_.rate <= 0)
         {
            return;
         }
         if(§_-u2n§.§_-F1a§(§_-z9§.§_-H2D§,_loc1_.startSec))
         {
            return;
         }
         new §_-I2u§(_loc1_.rate,[_loc1_]).show();
      }
      
      private static function §_-w1w§() : void
      {
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         var _loc1_:int = §_-g2r§();
         if(_loc1_ <= 0)
         {
            return;
         }
         var _loc2_:Array = [];
         var _loc3_:Boolean = false;
         for each(_loc4_ in §_-C2b§.§_-78§)
         {
            for each(_loc5_ in §_-PI§(_loc4_))
            {
               _loc2_.push(_loc5_);
               if(!§_-u2n§.§_-F1a§(_loc5_.type,_loc5_.startSec))
               {
                  _loc3_ = true;
               }
            }
         }
         if(_loc3_)
         {
            §_-12c§(_loc1_,_loc2_);
         }
      }
      
      private static function §_-g2r§() : int
      {
         var _loc1_:int = 0;
         for each(_loc1_ in §_-C2b§.§_-78§)
         {
            if(§_-n1H§(_loc1_) || §_-13X§(_loc1_))
            {
               return _loc1_;
            }
         }
         return 0;
      }
      
      private static function §_-A13§(param1:int) : int
      {
         var _loc2_:int = 0;
         if(§_-13X§(param1))
         {
            return param1;
         }
         for each(_loc2_ in §_-C2b§.§_-78§)
         {
            if(§_-13X§(_loc2_))
            {
               return _loc2_;
            }
         }
         return 0;
      }
      
      public static function §_-13X§(param1:int) : Boolean
      {
         if(!§_-K2s§(param1) || §_-M2X§(param1) || §_-C2b§.§_-W15§(param1) <= 0)
         {
            return false;
         }
         var _loc2_:int = §_-d1l§(param1);
         if(_loc2_ <= 0)
         {
            return false;
         }
         return EventsManager.§_-M1b§(§_-z9§.§_-bp§,_loc2_) > §_-C2b§.§_-1y§;
      }
      
      private static function §_-21a§(param1:Array, param2:int) : void
      {
         var _loc3_:int = §_-f4§.§_-P§(param2);
         if(_loc3_ > 0)
         {
            param1.push({
               "id":param2,
               "count":_loc3_
            });
         }
      }
      
      private static function §_-a1U§(param1:int) : Object
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc2_:Object = param1 ? §_-A3y§.§_-B3F§(param1) : null;
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
      
      private static function §_-lt§(param1:Object, param2:Object) : int
      {
         if(param1.type != param2.type)
         {
            return param1.type - param2.type;
         }
         return param1.id - param2.id;
      }
      
      private static function §_-t1r§() : void
      {
         §_-Gg§ = {};
         §_-B1B§ = {};
      }
      
      private static function §_-T2e§(param1:int) : void
      {
         delete §_-Gg§[param1];
         delete §_-B1B§[param1];
      }
      
      private static function §_-Z1U§(param1:int, param2:Object, param3:Object) : void
      {
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc4_:Object = §_-C2b§.§_-D1g§(param1);
         for each(_loc5_ in §_-C2b§.§_-qA§)
         {
            for each(_loc6_ in _loc4_ ? _loc4_[_loc5_] : null)
            {
               param2[_loc6_.id] = _loc6_;
               param3[_loc6_.id] = _loc5_;
            }
         }
      }
      
      private static function §_-K1g§(param1:Object, param2:String, param3:Object) : Object
      {
         var _loc4_:int = int(int(param1.goal) || 0);
         var _loc5_:int = int(int(param3.count) || 0);
         return {
            "id":param3.id,
            "title":§_-C2b§.§_-c1V§(param1) || param3.id,
            "value":_loc5_,
            "max":_loc4_,
            "reward":param1.points_reward || 0,
            "action":param1.action || "",
            "pool":param2 || "",
            "completed":_loc4_ > 0 && _loc5_ >= _loc4_
         };
      }
      
      private static function §_-OJ§(param1:int, param2:Array, param3:Array) : void
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
                  §_-Z1U§(param1,_loc6_,_loc7_);
               }
               _loc13_ = _loc6_[_loc9_.id];
               if(_loc13_)
               {
                  _loc8_.push(§_-K1g§(_loc13_,_loc7_[_loc9_.id] || "",_loc9_));
               }
            }
         }
         param3.length = 0;
         for each(_loc10_ in _loc8_)
         {
            param3.push(_loc10_);
         }
      }
      
      private static function §_-213§() : Boolean
      {
         return §_-8k§ > 0;
      }
      
      private static function serverVersion(param1:int) : int
      {
         var _loc2_:Object = §_-i1P§[param1];
         return _loc2_ ? int(_loc2_.serverVersion) : 0;
      }
      
      private static function §_-31h§(param1:int) : int
      {
         var _loc2_:Object = §_-B2I§[param1];
         return _loc2_ ? int(_loc2_.v) : 0;
      }
      
      private static function §_-PI§(param1:int) : Array
      {
         var _loc3_:Object = null;
         if(§_-l12§[param1])
         {
            return §_-l12§[param1];
         }
         var _loc2_:Array = [];
         for each(_loc3_ in §_-z9§.§_-C12§())
         {
            if(_loc3_.type == §_-z9§.§_-bp§ && §_-C2b§.§_-q1g§(_loc3_.v) == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         _loc2_.sort(§_-Ky§);
         §_-l12§[param1] = _loc2_;
         return _loc2_;
      }
      
      private static function §_-Ky§(param1:Object, param2:Object) : int
      {
         return param2.startSec - param1.startSec;
      }
      
      private static function activate(param1:int) : void
      {
         §_-FV§(param1);
         var _loc2_:Object = §_-C2b§.§_-Z2C§(param1);
         if(!_loc2_)
         {
            return;
         }
         if(!§_-B2I§[_loc2_.type])
         {
            ++§_-8k§;
         }
         §_-B2I§[_loc2_.type] = _loc2_;
      }
      
      private static function deactivate(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         if(param1 <= 0)
         {
            §_-B2I§ = {};
            §_-8k§ = 0;
            §_-lD§ = {};
            §_-v1Z§ = {};
            §_-t1r§();
            §_-f25§ = {};
            §_-gW§ = {};
            §_-l12§ = {};
            return;
         }
         for each(_loc2_ in §_-C2b§.§_-78§)
         {
            _loc3_ = §_-B2I§[_loc2_];
            if(Boolean(_loc3_) && _loc3_.v == param1)
            {
               delete §_-B2I§[_loc2_];
               --§_-8k§;
               delete §_-lD§[_loc2_];
            }
         }
         delete §_-v1Z§[param1];
         delete §_-f25§[param1];
         delete §_-gW§[param1];
         §_-l12§ = {};
      }
      
      private static function §_-FV§(param1:int) : void
      {
         var _loc2_:Object = {};
         §_-u2g§(§_-C2b§.§_-k18§(param1),_loc2_);
         §_-M1H§(param1,_loc2_);
         §_-v1Z§[param1] = _loc2_;
      }
      
      private static function §_-u2g§(param1:Array, param2:Object) : void
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
      
      private static function §_-M1H§(param1:int, param2:Object) : void
      {
         var _loc3_:Object = §_-C2b§.§_-X2j§(param1);
         if(Boolean(_loc3_) && Boolean(_loc3_.reward_id))
         {
            param2[_loc3_.reward_id] = true;
         }
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
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
         var _loc3_:Object = §_-i1P§;
         var _loc4_:Object = {};
         var _loc5_:int = 0;
         while(_loc5_ + 5 < _loc2_.length)
         {
            _loc7_ = int(_loc2_[_loc5_]);
            _loc8_ = §_-C2b§.§_-q1g§(_loc7_);
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
               _loc12_ = §_-B2I§[_loc8_];
               if(_loc7_ > 0 && (!_loc12_ || _loc12_.v != _loc7_))
               {
                  activate(_loc7_);
               }
            }
            _loc5_ += 6;
         }
         for each(_loc6_ in §_-C2b§.§_-78§)
         {
            _loc13_ = _loc3_[_loc6_];
            _loc14_ = _loc4_[_loc6_];
            _loc15_ = _loc13_ ? int(_loc13_.serverVersion) : 0;
            _loc16_ = _loc14_ ? int(_loc14_.serverVersion) : 0;
            if(_loc15_ != _loc16_)
            {
               §_-T2e§(_loc6_);
               if(_loc15_ > 0)
               {
                  delete §_-f25§[_loc15_];
                  delete §_-gW§[_loc15_];
               }
            }
            else if(Boolean(_loc14_) && Boolean(§_-Gg§[_loc6_]) && §_-B1B§[_loc6_] == _loc16_)
            {
               §_-OJ§(_loc16_,_loc14_.currentTasks,§_-Gg§[_loc6_]);
            }
         }
         §_-i1P§ = _loc4_;
         §_-oV§(false);
         §_-83L§(§_-213§());
         §_-f4§.§_-31y§();
         §_-jx§.dispatchEvent(new Event(CHANGE));
      }
      
      private static function §_-83L§(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         if(param1)
         {
            §_-mQ§ = [];
         }
         for each(_loc2_ in §_-C2b§.§_-78§)
         {
            _loc3_ = §_-lD§[_loc2_] || {};
            _loc4_ = {};
            for each(_loc5_ in §_-U1O§(_loc2_))
            {
               if(_loc5_.completed)
               {
                  _loc4_[_loc5_.id] = true;
                  if(param1 && !_loc3_[_loc5_.id])
                  {
                     §_-mQ§.push({
                        "passType":_loc2_,
                        "taskId":_loc5_.id
                     });
                  }
               }
            }
            §_-lD§[_loc2_] = _loc4_;
         }
      }
      
      private static function §_-X2P§(param1:Event) : void
      {
         §_-l12§ = {};
         §_-oV§(true);
      }
      
      private static function §_-oV§(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc2_:Boolean = false;
         for each(_loc3_ in §_-C2b§.§_-78§)
         {
            _loc4_ = §_-13X§(_loc3_);
            if(§_-rL§[_loc3_] == undefined || §_-rL§[_loc3_] != _loc4_)
            {
               §_-rL§[_loc3_] = _loc4_;
               _loc2_ = true;
            }
         }
         if(param1 && _loc2_)
         {
            §_-jx§.dispatchEvent(new Event(CHANGE));
         }
      }
   }
}

