package §_-X1k§
{
   import flash.events.Event;
   import utils.StringUtil;
   import utils.§_-fE§;
   
   public class §_-A3y§
   {
      
      public static const §_-M1U§:int = 0;
      
      public static const §_-W27§:int = 1;
      
      public static const §_-fz§:int = 2;
      
      public static const §_-y2q§:int = 3;
      
      public static const §_-736§:int = 4;
      
      public static const §_-Z2h§:int = 5;
      
      public static const §_-t1F§:int = 6;
      
      public static const §_-o2t§:int = 7;
      
      public static const §_-33h§:int = 8;
      
      public static const §_-A2§:int = 9;
      
      public static const §_-l2X§:int = 10;
      
      public static const §_-V2n§:int = 11;
      
      public static const §_-b1B§:int = 12;
      
      public static const §_-j1G§:int = 13;
      
      public static const §_-QS§:int = 14;
      
      public static const §_-x2G§:int = 15;
      
      public static const §_-z1h§:String = "daily_bonus";
      
      public static const §_-y1s§:String = "nutty_pass";
      
      public static const §_-137§:int = 0;
      
      public static const §_-M11§:int = 7;
      
      public static const §_-C2U§:int = -1;
      
      public static const §_-vg§:Object = {};
      
      public static const §_-4o§:Object = {};
      
      private static var rewards:Object = {};
      
      private static var §_-MM§:Boolean = false;
      
      private static var §_-v2m§:Function = null;
      
      §_-vg§[§_-M1U§] = false;
      §_-vg§[§_-W27§] = false;
      §_-vg§[§_-fz§] = false;
      §_-vg§[§_-y2q§] = false;
      §_-vg§[§_-Z2h§] = false;
      §_-vg§[§_-t1F§] = true;
      §_-vg§[§_-o2t§] = true;
      §_-vg§[§_-33h§] = true;
      §_-vg§[§_-736§] = true;
      §_-vg§[§_-A2§] = true;
      §_-vg§[§_-l2X§] = false;
      §_-vg§[§_-V2n§] = false;
      §_-vg§[§_-b1B§] = false;
      §_-vg§[§_-j1G§] = false;
      §_-vg§[§_-QS§] = false;
      §_-4o§["coins"] = §_-M1U§;
      §_-4o§["energy"] = §_-W27§;
      §_-4o§["mana"] = §_-fz§;
      §_-4o§["expirations"] = §_-y2q§;
      §_-4o§["cast_items"] = §_-736§;
      §_-4o§["random_collections"] = §_-Z2h§;
      §_-4o§["random_package"] = §_-t1F§;
      §_-4o§["packages"] = §_-o2t§;
      §_-4o§["accessories"] = §_-33h§;
      §_-4o§["holiday_elements"] = §_-A2§;
      §_-4o§["nuts"] = §_-l2X§;
      §_-4o§["experience"] = §_-V2n§;
      §_-4o§["nutty_pass"] = §_-b1B§;
      §_-4o§["league_points"] = §_-j1G§;
      §_-4o§["shaman_experience"] = §_-QS§;
      
      public function §_-A3y§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-fE§.load(§_-Zy§.§_-a1s§ + "?" + Math.random(),false,null,§_-FT§,§_-n2y§);
      }
      
      public static function get §_-Xh§() : Boolean
      {
         return §_-MM§;
      }
      
      public static function set onLoaded(param1:Function) : void
      {
         if(§_-MM§)
         {
            if(param1 != null)
            {
               param1();
            }
            return;
         }
         if(param1 == null)
         {
            return;
         }
         §_-v2m§ = param1;
      }
      
      public static function §_-B3F§(param1:int) : Object
      {
         var _loc4_:String = null;
         var _loc2_:Object = rewards[String(param1)];
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:Object = {};
         for(_loc4_ in _loc2_)
         {
            _loc3_[_loc4_] = _loc2_[_loc4_];
         }
         return _loc3_;
      }
      
      public static function §_-H2X§(param1:int) : Boolean
      {
         return param1 == §_-736§;
      }
      
      public static function §_-be§(param1:Array) : Array
      {
         var _loc4_:Object = null;
         if(!param1 || param1.length == 0)
         {
            return param1;
         }
         var _loc2_:Object = {};
         var _loc3_:Array = [];
         for each(_loc4_ in param1)
         {
            if(§_-H2X§(_loc4_.type))
            {
               if(!_loc2_[_loc4_.type])
               {
                  _loc2_[_loc4_.type] = {
                     "type":_loc4_.type,
                     "id":§_-C2U§,
                     "count":0
                  };
                  _loc3_.push(_loc2_[_loc4_.type]);
               }
               _loc2_[_loc4_.type].count += _loc4_.count;
            }
            else
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public static function §_-z1m§(param1:int, param2:int) : String
      {
         var _loc3_:String = "";
         switch(param1)
         {
            case §_-M1U§:
               _loc3_ = gls("Монеты");
               break;
            case §_-W27§:
               _loc3_ = gls("Энергия");
               break;
            case §_-fz§:
               _loc3_ = gls("Мана");
               break;
            case §_-y2q§:
               switch(param2)
               {
                  case §_-ku§.VIP:
                     _loc3_ = gls("VIP-статус");
                     break;
                  case §_-ku§.§_-v2p§:
                     _loc3_ = gls("Зелье могущества");
               }
               break;
            case §_-Z2h§:
               switch(param2)
               {
                  case 0:
                     _loc3_ = gls("Элементы коллекции");
                     break;
                  case 1:
                     _loc3_ = gls("Редкие элементы коллекции");
               }
               break;
            case §_-t1F§:
               _loc3_ = gls("Костюм");
               break;
            case §_-o2t§:
               _loc3_ = §_-P2x§.§_-01H§(param2);
               break;
            case §_-33h§:
               _loc3_ = §_-P2x§.§_-d1E§(param2);
               break;
            case §_-736§:
               _loc3_ = gls("Предметы шамана");
               break;
            case §_-b1B§:
               _loc3_ = §_-C2b§.§_-S14§(param2);
               break;
            case §_-j1G§:
               _loc3_ = gls("Очки лиги");
         }
         return _loc3_;
      }
      
      public static function §_-i1F§(param1:int, param2:int) : String
      {
         var _loc3_:String = "";
         switch(param1)
         {
            case §_-M1U§:
               _loc3_ = gls("Монеты нужны в игре, чтобы стать сильнее, быстрее и иметь доступ к недоступным за орехи покупкам. Толще карман - больше возможностей!");
               break;
            case §_-W27§:
               _loc3_ = gls("Энергия используется для доступа на локации. Чем больше у тебя энергии, тем дольше сможешь играть без перерыва!");
               break;
            case §_-fz§:
               _loc3_ = gls("Мана позволяет тебе творить заклинания и использовать способности костюмов. С такой магией любые преграды будут по плечу!");
               break;
            case §_-y2q§:
               switch(param2)
               {
                  case §_-ku§.VIP:
                     _loc3_ = gls("VIP-статус увеличивает максимум энергии, восстанавливает ману ежедневно, даёт одно воскрешение, удваивает получаемый на локации опыт и многое другое.");
                     break;
                  case §_-ku§.§_-v2p§:
                     _loc3_ = gls("Зелье могущества делает невозможное - позволяет мане восстанавливаться со временем! Это же неограниченные возможности в колдовстве!");
               }
               break;
            case §_-Z2h§:
               switch(param2)
               {
                  case 0:
                     _loc3_ = gls("Из элементов коллекции собираются наборы - за это даётся опыт. А за наборы коллекций можно получить уникальных персонажей - Скрэта и Скрэтти.");
                     break;
                  case 1:
                     _loc3_ = gls("Редкие элементы коллекции не часто можно встретить на локации. Каждый из них поможет тебе собрать набор или несколько!");
               }
               break;
            case §_-t1F§:
               _loc3_ = gls("Костюмы, наделяющие способностями и уникальной магией.. Ты получишь один из костюмов, который сейчас доступен в магазине.");
               break;
            case §_-o2t§:
               _loc3_ = §_-P2x§.§_-T1O§(param2);
               break;
            case §_-736§:
               _loc3_ = gls("Набор предметов шамана всех типов сделает из тебя перспективного помощника шамана или грозу других белок... Решать тебе!");
               break;
            case §_-l2X§:
               _loc3_ = gls("Монеты нужны в игре, чтобы стать сильнее, быстрее и иметь доступ к недоступным за орехи покупкам. Толще карман - больше возможностей!");
               break;
            case §_-V2n§:
               _loc3_ = gls("Опыт позволяет получать новые уровни и открывать доступ к новым локациям и захватывающим режимам!");
               break;
            case §_-j1G§:
               _loc3_ = gls("Очки лиги повышают твой рейтинг и помогают перейти в следующую лигу. Чем выше лига, тем больше призов в конце сезона!");
         }
         return _loc3_;
      }
      
      private static function §_-ab§(param1:Object) : Array
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         var _loc6_:Object = null;
         var _loc2_:Array = [];
         if(!param1)
         {
            return _loc2_;
         }
         for(_loc3_ in param1)
         {
            _loc4_ = §_-4o§[_loc3_] != undefined ? int(§_-4o§[_loc3_]) : §_-x2G§;
            if(_loc4_ != §_-x2G§)
            {
               _loc5_ = param1[_loc3_];
               if(_loc5_)
               {
                  if(_loc5_ is int)
                  {
                     _loc2_.push({
                        "type":_loc4_,
                        "count":_loc5_
                     });
                  }
                  else if(_loc5_ is Array)
                  {
                     for each(_loc6_ in _loc5_)
                     {
                        _loc2_.push({
                           "type":_loc4_,
                           "id":_loc6_.id,
                           "count":_loc6_.count
                        });
                     }
                  }
               }
            }
         }
         return _loc2_;
      }
      
      private static function §_-nL§(param1:Object) : String
      {
         var _loc3_:Object = null;
         if(!param1.caption)
         {
            return "";
         }
         if(param1.caption is String)
         {
            return gls(param1.caption);
         }
         var _loc2_:Array = [];
         for each(_loc3_ in param1.caption.keywords)
         {
            if(_loc3_ is Number)
            {
               _loc2_.push(String(_loc3_));
            }
            else if(_loc3_ is String)
            {
               _loc2_.push(gls(String(_loc3_)));
            }
            else
            {
               _loc2_.push(StringUtil.word(_loc3_.word,_loc3_.count));
            }
         }
         if(param1.caption.text == "{0}")
         {
            return _loc2_.join(", ");
         }
         return gls(param1.caption.text,_loc2_);
      }
      
      private static function §_-FT§(param1:Event) : void
      {
         var config:Object = null;
         var source:String = null;
         var sourceRewards:Object = null;
         var reward:Object = null;
         var id:String = null;
         var e:Event = param1;
         try
         {
            config = JSON.parse(e.target.data);
            §_-MM§ = true;
            for(source in config)
            {
               for each(sourceRewards in config[source])
               {
                  reward = {};
                  for(id in sourceRewards)
                  {
                     reward[id] = sourceRewards[id];
                  }
                  reward.source = source;
                  reward.contentItems = §_-ab§(reward.content);
                  reward.translatedCaption = §_-nL§(reward);
                  rewards[reward.id] = reward;
               }
            }
         }
         catch(err:Error)
         {
            §_-p2U§.add("Rewards config parse error: " + err);
         }
         if(§_-v2m§ != null)
         {
            §_-v2m§();
         }
      }
      
      private static function §_-n2y§(param1:Event) : void
      {
         §_-p2U§.add("Rewards config load error: " + param1);
         if(§_-MM§)
         {
            return;
         }
         §_-MM§ = true;
         if(§_-v2m§ != null)
         {
            §_-v2m§();
         }
      }
   }
}

