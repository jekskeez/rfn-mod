package
{
   import utils.§_-j2O§;
   
   public class §_-A1Y§
   {
      
      private static const §_-7s§:int = 10000;
      
      private static const §_-d2l§:int = 100;
      
      private static const §_-t1w§:int = 1000;
      
      private static const §_-6y§:Object = {
         "vk":0,
         "mm":1,
         "ok":2,
         "fb":3,
         "fs":4
      };
      
      private static const §_-62G§:Object = {
         "catalog_ads":1,
         "catalog_popular":2,
         "friends_feed":3,
         "wall_view":4,
         "wall_view_inline":4,
         "group":5,
         "request":6,
         "quick_search":7,
         "user_apps":8,
         "menu":9,
         "notification":10,
         "notification_realtime":11,
         "app_suggestions":12,
         "featured":13,
         "profile_status":14,
         "top_grossing":15,
         "join_request":16,
         "friends_apps":17,
         "collections":18,
         "catalog_new":19
      };
      
      private static const §_-92Y§:Object = {
         "stream.install":1,
         "stream.publish":2,
         "invitation":3,
         "catalog":4,
         "suggests":5,
         "left_menu_suggest":6,
         "new apps":7,
         "guestbook":8,
         "agent":9,
         "search":10,
         "left_menu":11,
         "promo":12,
         "mailru_featured":13,
         "widget":14,
         "installed_apps":15,
         "banner_catalog":16,
         "notification":17,
         "friends_apps":18,
         "advertisement":19,
         "left_promo":20,
         "feedpromo":21
      };
      
      private static const §_-R2I§:Object = {
         "catalog":1,
         "banner":2,
         "friend_invitation":3,
         "friend_feed":4,
         "friend_notification":5,
         "new_apps":6,
         "top_apps":7,
         "app_search_apps":8,
         "user_apps":9,
         "app_notification":10,
         "friend_apps":11,
         "user_apps_bottom_app_main":12,
         "app_block":13
      };
      
      private static const §_-ii§:Object = {
         "aggregation":1,
         "appcenter":2,
         "appcenter_request":3,
         "bookmark_apps":4,
         "bookmark_favorites":5,
         "bookmark_seeall":6,
         "canvasbookmark":7,
         "canvasbookmark_more":8,
         "canvasbookmark_recommended":9,
         "dashboard_bookmark":10,
         "dashboard_toplist":11,
         "dialog_permission":12,
         "ego":13,
         "feed":14,
         "nf":15,
         "feed_achievement":16,
         "feed_highscore":17,
         "feed_music":18,
         "feed_opengraph":19,
         "feed_passing":20,
         "feed_playing":21,
         "feed_video":22,
         "games_my_recent":23,
         "games_friends_apps":24,
         "hovercard":25,
         "message":26,
         "mf":27,
         "notification":28,
         "other_multiline":29,
         "pymk":30,
         "recent_activity":31,
         "reminders":32,
         "request":33,
         "search":34,
         "ticker":35,
         "timeline_og":36,
         "timeline_news":37,
         "timeline_passing":38,
         "timeline_recent":39,
         "sidebar_bookmark":40,
         "sidebar_recommended":41,
         "bookmarks":42,
         "games_featured":43,
         "featured_game ":44,
         "notif":45,
         "ts":46,
         "rua":47,
         "feed_music ":48,
         "timeline":49
      };
      
      public function §_-A1Y§()
      {
         super();
      }
      
      public static function get() : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Object = §_-uR§.§_-p2P§;
         if(!(_loc1_["useApiType"] in §_-6y§))
         {
            return -1;
         }
         var _loc2_:int = §_-7s§ * §_-6y§[_loc1_["useApiType"]];
         switch(_loc1_["useApiType"])
         {
            case "vk":
               if(!("hash" in _loc1_))
               {
                  _loc1_["hash"] = "unknown";
               }
               _loc3_ = §_-j2O§.§_-fh§(_loc1_["hash"]);
               if(_loc3_ > 0)
               {
                  return _loc3_ + _loc2_ + §_-d2l§;
               }
               _loc4_ = parseInt(§_-Qn§(_loc1_["hash"],"ref"));
               if(_loc4_ > 0 && _loc4_ < §_-7s§ - §_-t1w§)
               {
                  return _loc4_ + _loc2_ + §_-t1w§;
               }
               if(!("referrer" in _loc1_))
               {
                  _loc1_["referrer"] = "unknown";
               }
               if(_loc1_["referrer"] in §_-62G§)
               {
                  return §_-62G§[_loc1_["referrer"]] + _loc2_;
               }
               return _loc2_;
               break;
            case "mm":
               if(!("hash" in _loc1_))
               {
                  _loc1_["hash"] = "";
               }
               _loc3_ = §_-j2O§.§_-fh§(_loc1_["hash"]);
               if(_loc3_ > 0)
               {
                  return _loc3_ + _loc2_ + §_-d2l§;
               }
               _loc4_ = parseInt(§_-Qn§(_loc1_["hash"],"ref"));
               if(_loc4_ > 0 && _loc4_ < §_-7s§ - §_-t1w§)
               {
                  return _loc4_ + _loc2_ + §_-t1w§;
               }
               if(!("referer_type" in _loc1_))
               {
                  _loc1_["referer_type"] = "unknown";
               }
               if(_loc1_["referer_type"] in §_-92Y§)
               {
                  return §_-92Y§[_loc1_["referer_type"]] + _loc2_;
               }
               return _loc2_;
               break;
            case "ok":
               if(!("custom_args" in _loc1_))
               {
                  _loc1_["custom_args"] = "";
               }
               _loc3_ = §_-j2O§.§_-fh§(_loc1_["custom_args"]);
               if(_loc3_ > 0)
               {
                  return _loc3_ + _loc2_ + §_-d2l§;
               }
               _loc4_ = parseInt(§_-Qn§(_loc1_["custom_args"],"ref"));
               if(_loc4_ > 0 && _loc4_ < §_-7s§ - §_-t1w§)
               {
                  return _loc4_ + _loc2_ + §_-t1w§;
               }
               if(!("refplace" in _loc1_))
               {
                  _loc1_["refplace"] = "unknown";
               }
               if(_loc1_["refplace"] in §_-R2I§)
               {
                  return §_-R2I§[_loc1_["refplace"]] + _loc2_;
               }
               return _loc2_;
               break;
            case "fs":
               if(!("ref" in _loc1_))
               {
                  _loc1_["ref"] = "";
               }
               if(!("custom_args" in _loc1_))
               {
                  _loc1_["custom_args"] = "";
               }
               _loc3_ = §_-j2O§.§_-fh§(_loc1_["custom_args"]);
               if(_loc3_ > 0)
               {
                  return _loc3_ + _loc2_ + §_-d2l§;
               }
               _loc4_ = parseInt(_loc1_["ref"]);
               if(_loc4_ > 0 && _loc4_ < §_-7s§ - §_-t1w§)
               {
                  return _loc4_ + _loc2_ + §_-t1w§;
               }
               return _loc2_;
               break;
            case "fb":
               if(!("ref" in _loc1_))
               {
                  _loc1_["ref"] = "";
               }
               if(!("custom_args" in _loc1_))
               {
                  _loc1_["custom_args"] = "";
               }
               _loc3_ = §_-j2O§.§_-fh§(_loc1_["custom_args"]);
               if(_loc3_ > 0)
               {
                  return _loc3_ + _loc2_ + §_-d2l§;
               }
               _loc4_ = parseInt(_loc1_["ref"]);
               if(_loc4_ > 0 && _loc4_ < §_-7s§ - §_-t1w§)
               {
                  return _loc4_ + _loc2_ + §_-t1w§;
               }
               if(!("fb_source" in _loc1_))
               {
                  _loc1_["fb_source"] = "unknown";
               }
               if(_loc1_["fb_source"] in §_-ii§)
               {
                  return §_-ii§[_loc1_["fb_source"]] + _loc2_;
               }
               return _loc2_;
               break;
            default:
               return -1;
         }
      }
      
      public static function §_-x1q§() : Boolean
      {
         var _loc1_:Array = [3,1003,10002,20004,20013,20101,30014,30101,40101];
         return _loc1_.indexOf(get()) != -1;
      }
      
      private static function §_-Qn§(param1:String, param2:String) : String
      {
         var _loc5_:Array = null;
         var _loc3_:Array = param1.split("&");
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_].split("=");
            if(_loc5_[0] == param2)
            {
               return _loc5_[1];
            }
            _loc4_++;
         }
         return "";
      }
   }
}

