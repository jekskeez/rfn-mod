package utils
{
   import §_-X1k§.§_-K0§;
   import com.api.Player;
   import com.api.Services;
   import com.fb.Wall;
   import com.fs.Wall;
   import com.mm.Wall;
   import com.ok.Wall;
   import com.vk.Wall;
   import flash.display.Bitmap;
   import flash.utils.getQualifiedClassName;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-j2O§
   {
      
      public static const WALL_AWARD:String = "WALL_AWARD";
      
      public static const WALL_COLLECTION_REGULAR:String = "WALL_COLLECTION_REGULAR";
      
      public static const WALL_COLLECTION_UNIQUE:String = "WALL_COLLECTION_UNIQUE";
      
      public static const WALL_COLLECTION_AWARD:String = "WALL_COLLECTION_AWARD";
      
      public static const WALL_COLLECTION_EXCHANGE:String = "WALL_COLLECTION_EXCHANGE";
      
      public static const WALL_EXP:String = "WALL_EXP";
      
      public static const WALL_SHAMAN_EXP:String = "WALL_SHAMAN_EXP";
      
      public static const WALL_PRESENT:String = "WALL_PRESENT";
      
      public static const WALL_BATTLE_RESULT:String = "WALL_BATTLE_RESULT";
      
      public static const WALL_FRIEND_RATING:String = "WALL_FRIEND_RATING";
      
      public static const WALL_NEWS:String = "WALL_NEWS";
      
      public static const MAP_APPROVED:String = "MAP_APPROVED";
      
      public static const WALL_EVERY_DAY_BONUS:String = "WALL_EVERY_DAY_BONUS";
      
      public static const WALL_RATING_LEAGUE:String = "WALL_RATING_LEAGUE";
      
      public static const WALL_GOLDEN_CUP:String = "WALL_GOLDEN_CUP";
      
      public static const WALL_PROMO:String = "WALL_PROMO";
      
      public static const WALL_HOLYDAY:String = "WALL_HOLYDAY";
      
      public static const WALL_SUGAR_PLUM_FAIRY:String = "WALL_SUGAR_PLUM_FAIRY";
      
      public static const WALL_NUTCRACKER:String = "WALL_NUTCRACKER";
      
      public static const WALL_AMUR:String = "WALL_AMUR";
      
      public static const §_-b1h§:Array = ["wall_ref"];
      
      public function §_-j2O§()
      {
         super();
      }
      
      public static function §_-J1V§(param1:String, param2:int) : String
      {
         switch(param1)
         {
            case WALL_AWARD:
               return §_-Zy§.§_-Y13§ + "repost_awards/" + getQualifiedClassName(§_-K0§.DATA[param2]["image"]) + ".png";
            case WALL_EXP:
               return §_-Zy§.§_-Y13§ + "repost_level/New_level_" + param2 + ".png";
            case WALL_SHAMAN_EXP:
               return §_-Zy§.§_-Y13§ + "repost_shaman/New_level_" + param2 + ".png";
            case WALL_PRESENT:
               return §_-Zy§.§_-Y13§ + "Present_" + param2 + ".png";
            case WALL_COLLECTION_REGULAR:
               return §_-Zy§.§_-Y13§ + "regular/Collection_regular_" + param2 + ".png";
            case WALL_COLLECTION_UNIQUE:
               return §_-Zy§.§_-Y13§ + "repost_unique/Collection_unique_" + param2 + ".png";
            case WALL_COLLECTION_AWARD:
               return §_-Zy§.§_-Y13§ + "repost_award/Collection_award_" + param2 + ".png";
            case WALL_FRIEND_RATING:
               return §_-Zy§.§_-Y13§ + "Friends_rating_" + param2 + ".png";
            case MAP_APPROVED:
               return §_-Zy§.§_-Y13§ + "map_approved.png";
            case WALL_EVERY_DAY_BONUS:
               return §_-Zy§.§_-Y13§ + "repost_bonus/every_day_bonus_" + param2 + ".png";
            case WALL_RATING_LEAGUE:
               return §_-Zy§.§_-Y13§ + "repost_rating/new_league_" + param2 + ".png";
            case WALL_HOLYDAY:
               return §_-Zy§.§_-Y13§ + "halloween_package_2015.png";
            case WALL_SUGAR_PLUM_FAIRY:
               return §_-Zy§.§_-Y13§ + "HY2025/new_year_package_2024_1.png";
            case WALL_NUTCRACKER:
               return §_-Zy§.§_-Y13§ + "HY2025/new_year_package_2024_2.png";
            case WALL_GOLDEN_CUP:
               return §_-Zy§.§_-Y13§ + "golden_cup.png";
            case WALL_AMUR:
               return §_-Zy§.§_-Y13§ + "amur_2016/amur_" + param2 + ".png";
            default:
               return "";
         }
      }
      
      public static function place(param1:Player, param2:String, param3:int, param4:Bitmap, param5:String, param6:String = "", param7:Boolean = true, param8:Function = null, param9:Array = null) : void
      {
         var actions:Array;
         var vkWall:com.vk.Wall = null;
         var mmWall:com.mm.Wall = null;
         var fbWall:com.fb.Wall = null;
         var okWall:com.ok.Wall = null;
         var fsWall:com.fs.Wall = null;
         var player:Player = param1;
         var type:String = param2;
         var id:int = param3;
         var image:Bitmap = param4;
         var text:String = param5;
         var url:String = param6;
         var withLinks:Boolean = param7;
         var callback:Function = param8;
         var actionsArray:Array = param9;
         if(!("nid" in player))
         {
            player.addEventListener(§_-Y2E§.§_-Jm§,function(param1:Player):void
            {
               place(param1,type,id,image,text,url,withLinks);
            });
            Game.request([player.id],§_-Y2E§.§_-Jm§);
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-P1r§,Game.self["type"]);
         §_-73Q§.§_-R1R§ = false;
         url = url == "" ? §_-j2O§.§_-J1V§(type,id) : url;
         actionsArray = [{
            "text":gls("Играть в Трагедию Белок"),
            "href":§_-b1h§[0] + "=" + String(Game.selfId)
         }];
         actions = §_-h19§(actionsArray);
         if(Services.wall is com.vk.Wall)
         {
            vkWall = Services.wall as com.vk.Wall;
            vkWall.placeVK(player["nid"],image,text + (withLinks ? " http://vk.com/squirrels_game#ref=3" : ""),callback);
         }
         if(Services.wall is com.mm.Wall)
         {
            mmWall = Services.wall as com.mm.Wall;
            mmWall.placeMM(player["nid"],"Трагедия белок",text + (withLinks ? " http://my.mail.ru/apps/648036" : ""),url,callback,actions);
         }
         if(Services.wall is com.fb.Wall)
         {
            fbWall = Services.wall as com.fb.Wall;
            fbWall.placeFB(player["nid"],url,gls("Трагедия белок"),"",text,actions,Services.config.fb_appAddress + "?fb_source=feed","iframe",callback);
         }
         if(Services.wall is com.ok.Wall)
         {
            okWall = Services.wall as com.ok.Wall;
            okWall.placeOK(text + (withLinks ? " http://www.odnoklassniki.ru/game/squirrels?" + §_-b1h§[0] + "=" + Game.selfId : ""),url,"Рассказать всем друзьям?",callback,actions);
         }
         if(Services.wall is com.fs.Wall)
         {
            fsWall = Services.wall as com.fs.Wall;
            fsWall.placeFS(text,url,callback,actions);
         }
      }
      
      public static function §_-fh§(param1:*) : int
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(!(param1 is String))
         {
            _loc3_ = 0;
            while(true)
            {
               if(_loc3_ < §_-b1h§.length)
               {
                  if(§_-b1h§[_loc3_] in param1)
                  {
                     break;
                  }
                  _loc3_++;
                  continue;
               }
            }
            return _loc3_ + 1;
         }
         _loc2_ = param1.split("=");
         _loc3_ = 0;
         while(_loc3_ < §_-b1h§.length)
         {
            if(_loc2_[0] == §_-b1h§[_loc3_])
            {
               return _loc3_ + 1;
            }
            _loc3_++;
         }
         return 0;
      }
      
      public static function get §_-Ik§() : Boolean
      {
         return Game.self.type != §_-Zy§.§_-nn§;
      }
      
      private static function §_-h19§(param1:Array) : Array
      {
         if(param1 == null)
         {
            return param1;
         }
         switch(Game.self.type)
         {
            case §_-Zy§.§_-s12§:
               return [{
                  "name":param1[0]["text"],
                  "link":Services.config.fb_appAddress + "?custom_args=" + param1[0]["href"]
               }];
            case §_-Zy§.§_-S2j§:
               return [param1[0]["text"],{"custom_args":param1[0]["href"]}];
            default:
               return param1;
         }
      }
   }
}

