package §_-I10§
{
   import flash.events.Event;
   import utils.StringUtil;
   import utils.§_-2Y§;
   
   public class §_-428§
   {
      
      public static const §_-113§:int = 0;
      
      public static const §_-61Q§:int = 1;
      
      public static const §_-a1H§:int = 2;
      
      public static const §_-O2P§:int = 3;
      
      public static const §_-Q1C§:int = 4;
      
      public static const §_-Z2n§:int = 5;
      
      public static const §_-dU§:int = 6;
      
      public static const §_-N1P§:int = 7;
      
      public static const §_-m2z§:int = 8;
      
      public static const §_-q1H§:int = 9;
      
      public static const §_-wG§:int = 10;
      
      public static const §_-P13§:int = 11;
      
      public static const §_-Ee§:int = 12;
      
      public static const §_-8r§:int = 13;
      
      public static const §_-cb§:int = 14;
      
      public static const §_-6n§:int = 15;
      
      public static const §_-33Q§:String = "daily_bonus";
      
      public static const §_-71H§:String = "nutty_pass";
      
      public static const §_-523§:int = 0;
      
      public static const §_-bW§:int = 7;
      
      public static const §_-A2C§:int = -1;
      
      public static const §_-u2l§:Object = {};
      
      public static const §_-A21§:Object = {};
      
      private static var rewards:Object = {};
      
      private static var §_-B1a§:Boolean = false;
      
      private static var §_-J2§:Function = null;
      
      §_-u2l§[§_-113§] = false;
      §_-u2l§[§_-61Q§] = false;
      §_-u2l§[§_-a1H§] = false;
      §_-u2l§[§_-O2P§] = false;
      §_-u2l§[§_-Z2n§] = false;
      §_-u2l§[§_-dU§] = true;
      §_-u2l§[§_-N1P§] = true;
      §_-u2l§[§_-m2z§] = true;
      §_-u2l§[§_-Q1C§] = true;
      §_-u2l§[§_-q1H§] = true;
      §_-u2l§[§_-wG§] = false;
      §_-u2l§[§_-P13§] = false;
      §_-u2l§[§_-Ee§] = false;
      §_-u2l§[§_-8r§] = false;
      §_-u2l§[§_-cb§] = false;
      §_-A21§["coins"] = §_-113§;
      §_-A21§["energy"] = §_-61Q§;
      §_-A21§["mana"] = §_-a1H§;
      §_-A21§["expirations"] = §_-O2P§;
      §_-A21§["cast_items"] = §_-Q1C§;
      §_-A21§["random_collections"] = §_-Z2n§;
      §_-A21§["random_package"] = §_-dU§;
      §_-A21§["packages"] = §_-N1P§;
      §_-A21§["accessories"] = §_-m2z§;
      §_-A21§["holiday_elements"] = §_-q1H§;
      §_-A21§["nuts"] = §_-wG§;
      §_-A21§["experience"] = §_-P13§;
      §_-A21§["nutty_pass"] = §_-Ee§;
      §_-A21§["league_points"] = §_-8r§;
      §_-A21§["shaman_experience"] = §_-cb§;
      
      public function §_-428§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-2Y§.load(§_-a9§.§_-c1i§ + "?" + Math.random(),false,null,§_-a0§,§_-93n§);
      }
      
      public static function get §_-v2e§() : Boolean
      {
         return §_-B1a§;
      }
      
      public static function set onLoaded(param1:Function) : void
      {
         if(§_-B1a§)
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
         §_-J2§ = param1;
      }
      
      public static function §_-d1u§(param1:int) : Object
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
      
      public static function §_-F4§(param1:int) : Boolean
      {
         return param1 == §_-Q1C§;
      }
      
      public static function §_-p1k§(param1:Array) : Array
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
            if(§_-F4§(_loc4_.type))
            {
               if(!_loc2_[_loc4_.type])
               {
                  _loc2_[_loc4_.type] = {
                     "type":_loc4_.type,
                     "id":§_-A2C§,
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
      
      public static function §_-L2n§(param1:int, param2:int) : String
      {
         var _loc3_:String = "";
         switch(param1)
         {
            case §_-113§:
               _loc3_ = gls("Монеты");
               break;
            case §_-61Q§:
               _loc3_ = gls("Энергия");
               break;
            case §_-a1H§:
               _loc3_ = gls("Мана");
               break;
            case §_-O2P§:
               switch(param2)
               {
                  case §_-e1z§.VIP:
                     _loc3_ = gls("VIP-статус");
                     break;
                  case §_-e1z§.§_-02l§:
                     _loc3_ = gls("Зелье могущества");
               }
               break;
            case §_-Z2n§:
               switch(param2)
               {
                  case 0:
                     _loc3_ = gls("Элементы коллекции");
                     break;
                  case 1:
                     _loc3_ = gls("Редкие элементы коллекции");
               }
               break;
            case §_-dU§:
               _loc3_ = gls("Костюм");
               break;
            case §_-N1P§:
               _loc3_ = §_-g2W§.§_-G1Y§(param2);
               break;
            case §_-m2z§:
               _loc3_ = §_-g2W§.§_-224§(param2);
               break;
            case §_-Q1C§:
               _loc3_ = gls("Предметы шамана");
               break;
            case §_-Ee§:
               _loc3_ = §_-a1D§.§_-hY§(param2);
               break;
            case §_-8r§:
               _loc3_ = gls("Очки лиги");
         }
         return _loc3_;
      }
      
      public static function §_-64§(param1:int, param2:int) : String
      {
         var _loc3_:String = "";
         switch(param1)
         {
            case §_-113§:
               _loc3_ = gls("Монеты нужны в игре, чтобы стать сильнее, быстрее и иметь доступ к недоступным за орехи покупкам. Толще карман - больше возможностей!");
               break;
            case §_-61Q§:
               _loc3_ = gls("Энергия используется для доступа на локации. Чем больше у тебя энергии, тем дольше сможешь играть без перерыва!");
               break;
            case §_-a1H§:
               _loc3_ = gls("Мана позволяет тебе творить заклинания и использовать способности костюмов. С такой магией любые преграды будут по плечу!");
               break;
            case §_-O2P§:
               switch(param2)
               {
                  case §_-e1z§.VIP:
                     _loc3_ = gls("VIP-статус увеличивает максимум энергии, восстанавливает ману ежедневно, даёт одно воскрешение, удваивает получаемый на локации опыт и многое другое.");
                     break;
                  case §_-e1z§.§_-02l§:
                     _loc3_ = gls("Зелье могущества делает невозможное - позволяет мане восстанавливаться со временем! Это же неограниченные возможности в колдовстве!");
               }
               break;
            case §_-Z2n§:
               switch(param2)
               {
                  case 0:
                     _loc3_ = gls("Из элементов коллекции собираются наборы - за это даётся опыт. А за наборы коллекций можно получить уникальных персонажей - Скрэта и Скрэтти.");
                     break;
                  case 1:
                     _loc3_ = gls("Редкие элементы коллекции не часто можно встретить на локации. Каждый из них поможет тебе собрать набор или несколько!");
               }
               break;
            case §_-dU§:
               _loc3_ = gls("Костюмы, наделяющие способностями и уникальной магией.. Ты получишь один из костюмов, который сейчас доступен в магазине.");
               break;
            case §_-N1P§:
               _loc3_ = §_-g2W§.§_-81F§(param2);
               break;
            case §_-Q1C§:
               _loc3_ = gls("Набор предметов шамана всех типов сделает из тебя перспективного помощника шамана или грозу других белок... Решать тебе!");
               break;
            case §_-wG§:
               _loc3_ = gls("Монеты нужны в игре, чтобы стать сильнее, быстрее и иметь доступ к недоступным за орехи покупкам. Толще карман - больше возможностей!");
               break;
            case §_-P13§:
               _loc3_ = gls("Опыт позволяет получать новые уровни и открывать доступ к новым локациям и захватывающим режимам!");
               break;
            case §_-8r§:
               _loc3_ = gls("Очки лиги повышают твой рейтинг и помогают перейти в следующую лигу. Чем выше лига, тем больше призов в конце сезона!");
         }
         return _loc3_;
      }
      
      private static function §_-q2s§(param1:Object) : Array
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
            _loc4_ = §_-A21§[_loc3_] != undefined ? int(§_-A21§[_loc3_]) : §_-6n§;
            if(_loc4_ != §_-6n§)
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
      
      private static function §_-a1m§(param1:Object) : String
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
      
      private static function §_-a0§(param1:Event) : void
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
            §_-B1a§ = true;
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
                  reward.contentItems = §_-q2s§(reward.content);
                  reward.translatedCaption = §_-a1m§(reward);
                  rewards[reward.id] = reward;
               }
            }
         }
         catch(err:Error)
         {
            §_-TQ§.add("Rewards config parse error: " + err);
         }
         if(§_-J2§ != null)
         {
            §_-J2§();
         }
      }
      
      private static function §_-93n§(param1:Event) : void
      {
         §_-TQ§.add("Rewards config load error: " + param1);
         if(§_-B1a§)
         {
            return;
         }
         §_-B1a§ = true;
         if(§_-J2§ != null)
         {
            §_-J2§();
         }
      }
   }
}

