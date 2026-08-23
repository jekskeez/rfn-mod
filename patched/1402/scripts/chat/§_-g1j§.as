package chat
{
   import §_-c2C§.§_-u24§;
   import com.api.Player;
   import events.§_-83v§;
   import utils.§_-33I§;
   
   public class §_-g1j§ extends §_-X9§
   {
      
      public static const §_-j1p§:int = 2;
      
      public static const §_-E2y§:int = 3;
      
      public static const §_-Z2N§:int = 4;
      
      public static const §_-62K§:int = 5;
      
      public static const §_-93J§:int = 6;
      
      public static const §_-aQ§:int = 7;
      
      public static const §_-c12§:int = 8;
      
      public static const §_-B3j§:int = 9;
      
      public static const §_-N16§:int = 10;
      
      public static const §_-325§:int = 11;
      
      public static const §_-e2f§:int = 12;
      
      public static const §_-42f§:int = 13;
      
      public static const §_-A3O§:int = 14;
      
      public static const §_-a9§:int = 15;
      
      public static const §_-m2Z§:int = 16;
      
      public static const §_-c2E§:int = 17;
      
      public static const §_-035§:int = 18;
      
      public static const §_-U2z§:int = 19;
      
      public static const §_-bO§:int = 20;
      
      public static const §_-a2z§:int = 21;
      
      public static const §_-K2D§:int = 22;
      
      public static const §_-81A§:int = 23;
      
      public static const §_-723§:int = 26;
      
      public static const §_-62i§:int = 27;
      
      public static const §_-X6§:int = 28;
      
      public static const §_-83B§:int = 29;
      
      public static const §_-220§:int = 30;
      
      public static const §_-821§:int = 31;
      
      public static const §_-21C§:int = 32;
      
      public static const §_-JS§:int = 33;
      
      public static const §_-t1E§:int = 34;
      
      public static const §_-VL§:int = 35;
      
      public static const §_-iK§:int = 36;
      
      public static const §_-x1P§:int = 40;
      
      public static const §_-b1K§:int = 41;
      
      public static const §_-j2A§:int = 42;
      
      public static const §_-AV§:int = 43;
      
      public static const §_-Z1w§:int = 44;
      
      public static const §_-m2§:int = 45;
      
      public static const §_-32Z§:int = 46;
      
      public static const §_-ly§:int = 47;
      
      public static const §_-C1E§:int = 48;
      
      public static const §_-O11§:int = 49;
      
      public static const §_-123§:int = 50;
      
      public static const §_-O2n§:int = 51;
      
      public static const §_-pt§:int = 52;
      
      public static const §_-01d§:int = 53;
      
      private var redraw:Boolean = false;
      
      private var type:int;
      
      private var amount:int;
      
      public function §_-g1j§(param1:Player, param2:String, param3:int, param4:int = 0, param5:int = 0)
      {
         this.type = param3;
         this.amount = param4;
         super(param1,param2,false,false,param5);
      }
      
      override public function get isNull() : Boolean
      {
         switch(this.type)
         {
            case §_-Z2N§:
            case §_-42f§:
            case §_-A3O§:
            case §_-a9§:
            case §_-m2Z§:
            case §_-c2E§:
            case §_-21C§:
               return false;
            default:
               if(this.player.id == Game.selfId || §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§))
               {
                  return false;
               }
               return true;
         }
      }
      
      override protected function draw(param1:Boolean = true) : void
      {
         if(!this.redraw)
         {
            this.text = this.§_-o2i§(this.player,this.text,this.type,this.amount);
            this.redraw = true;
         }
         super.draw(param1);
      }
      
      override protected function §_-Y16§(param1:Player) : void
      {
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§) && §_-33I§.§_-V1O§(param1.rights,§_-33I§.§_-AJ§) && (this.type == §_-42f§ || this.type == §_-a9§ || this.type == §_-A3O§))
         {
            if(hasEventListener(§_-83v§.REMOVE))
            {
               dispatchEvent(new §_-83v§(this));
            }
            param1.removeEventListener(this.§_-Y16§);
            return;
         }
         super.§_-Y16§(param1);
      }
      
      override protected function §_-z2U§(param1:String) : String
      {
         return "<body><span class=\'service_message\'>" + param1 + "</span></body>";
      }
      
      private function §_-o2i§(param1:Player, param2:String, param3:int, param4:int) : String
      {
         var _loc5_:String = null;
         switch(param3)
         {
            case §_-j1p§:
               return param2;
            case §_-E2y§:
               return gls("Фотография сохранена в альбом.");
            case §_-62K§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал глобальное оледенение.");
               }
               return gls("Игрок {0} вызвал глобальное оледенение.",§_-j1g§());
               break;
            case §_-e2f§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты превратил всех белок в семечки.");
               }
               return gls("Игрок {0} превратил всех белок в семечки.",§_-j1g§());
               break;
            case §_-93J§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты запустил праздничный феерверк.");
               }
               return gls("Игрок {0} запустил праздничный феерверк.",§_-j1g§());
               break;
            case §_-aQ§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты включил песню Jingle Bells.");
               }
               return gls("Игрок {0} включил песню Jingle Bells.",§_-j1g§());
               break;
            case §_-c12§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал новогодний снегопад.");
               }
               return gls("Игрок {0} вызвал новогодний снегопад.",§_-j1g§());
               break;
            case §_-B3j§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал пацанский снегопад.");
               }
               return gls("Игрок {0} вызвал пацанский снегопад.",§_-j1g§());
               break;
            case §_-N16§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал цветочный дождь.");
               }
               return gls("Игрок {0} вызвал цветочный дождь.",§_-j1g§());
               break;
            case §_-325§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал морской дождь.");
               }
               return gls("Игрок {0} вызвал морской дождь.",§_-j1g§());
               break;
            case §_-42f§:
               return gls("Твой друг {0} присоединился к игре.",§_-j1g§());
            case §_-Z2N§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты стал шаманом");
               }
               return gls("Игрок {0} стал шаманом.",§_-j1g§());
               break;
            case §_-A3O§:
               return gls("Твой друг {0} в данный момент в игре.",§_-j1g§());
            case §_-a9§:
               return gls("Твой друг {0} присоединится к игре.",§_-j1g§());
            case §_-m2Z§:
               return gls("Ты убил игрока {0}.",§_-j1g§());
            case §_-c2E§:
               return gls("Тебя убил игрок {0}.",§_-j1g§());
            case §_-21C§:
               return gls("Ты помог в убийстве игрока {0}.",§_-j1g§());
            case §_-035§:
               if(param1.id == Game.selfId)
               {
                  return gls("На тебя поступила жалоба (не идешь в дупло).");
               }
               return gls("На игрока {0} поступила жалоба (не идет в дупло).",§_-j1g§());
               break;
            case §_-U2z§:
               if(param1.id == Game.selfId)
               {
                  return gls("Пять игроков подали жалобу, что ты всех задерживаешь, и выгнали тебя из команды.");
               }
               return gls("Игрок {0} выгнан из игры.",§_-j1g§());
               break;
            case §_-bO§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты пришёл первым, но не сможешь стать шаманом, потому что не получил Аттестат в Школе.");
               }
               break;
            case §_-a2z§:
               if(param1.id == Game.selfId)
               {
                  return gls("Место шамана у тебя перекупили и ты получаешь {0} орешков в качестве компенсации.",param4);
               }
               break;
            case §_-K2D§:
               if(param1.id == Game.selfId)
               {
                  if(!Hero.self)
                  {
                     return "";
                  }
                  if(Hero.self.shaman)
                  {
                     return gls("Ты получил элемент коллекции «{0}».",param2);
                  }
                  _loc5_ = gls("Ты подобрал элемент коллекции «{0}».",param2);
                  if(§_-at§.§_-02X§[§_-u24§.mode] != null && Hero.self.isHare || §_-u24§.mode == §_-at§.§_-F15§ || §_-u24§.location == §_-at§.§_-G1K§)
                  {
                     _loc5_ += gls(" Теперь доживи до конца раунда.");
                  }
                  else if(§_-u24§.location == §_-at§.§_-N2g§)
                  {
                     _loc5_ += gls(" Теперь дождись конца раунда.");
                  }
                  else
                  {
                     _loc5_ += gls(" Теперь дойди до дупла.");
                  }
                  return _loc5_;
               }
               if(§_-u24§.§_-31B§(param1.id))
               {
                  return gls("Игрок {0} получил элемент коллекции «{1}».",§_-j1g§(),param2);
               }
               return gls("Игрок {0} подобрал элемент коллекции «{1}».",§_-j1g§(),param2);
               break;
            case §_-81A§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты не можешь стать драконом, так как ты стал шаманом. Потраченная сумма возвращена.");
               }
               break;
            case §_-723§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал дождь из драгоценных камней.");
               }
               return gls("Игрок {0} вызвал дождь из драгоценных камней.",§_-j1g§());
               break;
            case §_-62i§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты отобрал орех у другой белки.");
               }
               return gls("Игрок {0} отобрал орех у другой белки.",§_-j1g§());
               break;
            case §_-X6§:
               if(param1.id == Game.selfId)
               {
                  return gls("У тебя не получилось отобрать орех.");
               }
               return gls("Игроку {0} не удалось отобрать орех.",§_-j1g§());
               break;
            case §_-83B§:
               return param2;
            case §_-220§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты поднял аптечку.");
               }
               return gls("Игрок {0} поднял аптечку.",§_-j1g§());
               break;
            case §_-821§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты выпил коктейль.");
               }
               return gls("Игрок {0} выпил коктейль.",§_-j1g§());
               break;
            case §_-JS§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты поднял мешок с золотом и {0}.",param2);
               }
               return gls("Игрок {0} поднял мешок с золотом и {1}.",§_-j1g§(),param2);
               break;
            case §_-t1E§:
               return gls("Не удалось использовать магию, нет свободного предмета коллекции.");
            case §_-VL§:
               if(param1.id == Game.selfId)
               {
                  return gls("Тебе не хватило чуть-чуть мастерства, чтобы стать Шаманом.");
               }
               break;
            case §_-iK§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты не можешь стать шаманом, пока не пройдёшь Школу Шаманов.");
               }
               break;
            case §_-x1P§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты использовал Заморозку. Только обладатели этой магии могут взять предмет.");
               }
               return gls("Игрок {0} использовал Заморозку. Только обладатели этой магии могут взять предмет.",§_-j1g§());
               break;
            case §_-b1K§:
               return gls("Не удалось использовать магию, нет свободного предмета коллекции, который ты можешь поднять.");
            case §_-j2A§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Тонкий лёд».");
               }
               return gls("Шаман применил к игроку {0} магию «Тонкий лёд».",§_-j1g§());
               break;
            case §_-AV§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Ледяной куб».");
               }
               return gls("Шаман применил к игроку {0} магию «Ледяной куб».",§_-j1g§());
               break;
            case §_-Z1w§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Друг шамана».");
               }
               return gls("Шаман применил к игроку {0} магию «Друг шамана».",§_-j1g§());
               break;
            case §_-m2§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Телепорт».");
               }
               return gls("Шаман применил к игроку {0} магию «Телепорт».",§_-j1g§());
               break;
            case §_-32Z§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Беличье счастье».");
               }
               return gls("Шаман применил к игроку {0} магию «Беличье счастье».",§_-j1g§());
               break;
            case §_-ly§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Любимчик».");
               }
               return gls("Шаман применил к игроку {0} магию «Любимчик».",§_-j1g§());
               break;
            case §_-C1E§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Помощник».");
               }
               return gls("Шаман применил к игроку {0} магию «Помощник».",§_-j1g§());
               break;
            case §_-O11§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты открыл шкатулку с секретом и {0}.",param2);
               }
               return gls("Игрок {0} открыл шкатулку с секретом и {1}.",§_-j1g§(),param2);
               break;
            case §_-123§:
               return param2;
            case §_-O2n§:
               return param2;
            case §_-pt§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты начал раздачу ореха.");
               }
               return gls("Игрок {0} начал раздачу ореха.",§_-j1g§());
               break;
            case §_-01d§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты не можешь стать Зайцем НеСудьбы, так как ты стал шаманом. Потраченная сумма возвращена.");
               }
         }
         return "";
      }
   }
}

