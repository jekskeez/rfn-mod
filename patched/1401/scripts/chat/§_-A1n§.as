package chat
{
   import §_-T2y§.§_-92z§;
   import com.api.Player;
   import events.§_-11G§;
   import utils.§_-c10§;
   
   public class §_-A1n§ extends §_-s2y§
   {
      
      public static const §_-N1c§:int = 2;
      
      public static const §_-uj§:int = 3;
      
      public static const §_-S2i§:int = 4;
      
      public static const §_-w2x§:int = 5;
      
      public static const §_-81r§:int = 6;
      
      public static const §_-B2l§:int = 7;
      
      public static const §_-D1q§:int = 8;
      
      public static const §_-q1Z§:int = 9;
      
      public static const §_-P1D§:int = 10;
      
      public static const §_-b2y§:int = 11;
      
      public static const §_-p9§:int = 12;
      
      public static const §_-32a§:int = 13;
      
      public static const §_-iG§:int = 14;
      
      public static const §_-7u§:int = 15;
      
      public static const §_-31o§:int = 16;
      
      public static const §_-z1S§:int = 17;
      
      public static const §_-J2t§:int = 18;
      
      public static const §_-D16§:int = 19;
      
      public static const §_-51l§:int = 20;
      
      public static const §_-s1R§:int = 21;
      
      public static const §_-21b§:int = 22;
      
      public static const §_-t2D§:int = 23;
      
      public static const §_-mn§:int = 26;
      
      public static const §_-us§:int = 27;
      
      public static const §_-61t§:int = 28;
      
      public static const §_-Ph§:int = 29;
      
      public static const §_-92r§:int = 30;
      
      public static const §_-y2Z§:int = 31;
      
      public static const §_-IF§:int = 32;
      
      public static const §_-71L§:int = 33;
      
      public static const §_-l2p§:int = 34;
      
      public static const §_-Gw§:int = 35;
      
      public static const §_-L2b§:int = 36;
      
      public static const §_-rr§:int = 40;
      
      public static const §_-p2k§:int = 41;
      
      public static const §_-83W§:int = 42;
      
      public static const §_-o2u§:int = 43;
      
      public static const §_-02O§:int = 44;
      
      public static const §_-t1U§:int = 45;
      
      public static const §_-Y2R§:int = 46;
      
      public static const §_-W1s§:int = 47;
      
      public static const §_-o2y§:int = 48;
      
      public static const §_-M2u§:int = 49;
      
      public static const §_-b2a§:int = 50;
      
      public static const §_-lZ§:int = 51;
      
      public static const §_-vW§:int = 52;
      
      public static const §_-L1m§:int = 53;
      
      private var redraw:Boolean = false;
      
      private var type:int;
      
      private var amount:int;
      
      public function §_-A1n§(param1:Player, param2:String, param3:int, param4:int = 0, param5:int = 0)
      {
         this.type = param3;
         this.amount = param4;
         super(param1,param2,false,false,param5);
      }
      
      override public function get isNull() : Boolean
      {
         switch(this.type)
         {
            case §_-S2i§:
            case §_-32a§:
            case §_-iG§:
            case §_-7u§:
            case §_-31o§:
            case §_-z1S§:
            case §_-IF§:
               return false;
            default:
               if(this.player.id == Game.selfId || §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§))
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
            this.text = this.§_-r7§(this.player,this.text,this.type,this.amount);
            this.redraw = true;
         }
         super.draw(param1);
      }
      
      override protected function §_-P9§(param1:Player) : void
      {
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§) && §_-c10§.§_-73j§(param1.rights,§_-c10§.§_-639§) && (this.type == §_-32a§ || this.type == §_-7u§ || this.type == §_-iG§))
         {
            if(hasEventListener(§_-11G§.REMOVE))
            {
               dispatchEvent(new §_-11G§(this));
            }
            param1.removeEventListener(this.§_-P9§);
            return;
         }
         super.§_-P9§(param1);
      }
      
      override protected function §_-w1s§(param1:String) : String
      {
         return "<body><span class=\'service_message\'>" + param1 + "</span></body>";
      }
      
      private function §_-r7§(param1:Player, param2:String, param3:int, param4:int) : String
      {
         var _loc5_:String = null;
         switch(param3)
         {
            case §_-N1c§:
               return param2;
            case §_-uj§:
               return gls("Фотография сохранена в альбом.");
            case §_-w2x§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал глобальное оледенение.");
               }
               return gls("Игрок {0} вызвал глобальное оледенение.",§_-F3§());
               break;
            case §_-p9§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты превратил всех белок в семечки.");
               }
               return gls("Игрок {0} превратил всех белок в семечки.",§_-F3§());
               break;
            case §_-81r§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты запустил праздничный феерверк.");
               }
               return gls("Игрок {0} запустил праздничный феерверк.",§_-F3§());
               break;
            case §_-B2l§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты включил песню Jingle Bells.");
               }
               return gls("Игрок {0} включил песню Jingle Bells.",§_-F3§());
               break;
            case §_-D1q§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал новогодний снегопад.");
               }
               return gls("Игрок {0} вызвал новогодний снегопад.",§_-F3§());
               break;
            case §_-q1Z§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал пацанский снегопад.");
               }
               return gls("Игрок {0} вызвал пацанский снегопад.",§_-F3§());
               break;
            case §_-P1D§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал цветочный дождь.");
               }
               return gls("Игрок {0} вызвал цветочный дождь.",§_-F3§());
               break;
            case §_-b2y§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал морской дождь.");
               }
               return gls("Игрок {0} вызвал морской дождь.",§_-F3§());
               break;
            case §_-32a§:
               return gls("Твой друг {0} присоединился к игре.",§_-F3§());
            case §_-S2i§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты стал шаманом");
               }
               return gls("Игрок {0} стал шаманом.",§_-F3§());
               break;
            case §_-iG§:
               return gls("Твой друг {0} в данный момент в игре.",§_-F3§());
            case §_-7u§:
               return gls("Твой друг {0} присоединится к игре.",§_-F3§());
            case §_-31o§:
               return gls("Ты убил игрока {0}.",§_-F3§());
            case §_-z1S§:
               return gls("Тебя убил игрок {0}.",§_-F3§());
            case §_-IF§:
               return gls("Ты помог в убийстве игрока {0}.",§_-F3§());
            case §_-J2t§:
               if(param1.id == Game.selfId)
               {
                  return gls("На тебя поступила жалоба (не идешь в дупло).");
               }
               return gls("На игрока {0} поступила жалоба (не идет в дупло).",§_-F3§());
               break;
            case §_-D16§:
               if(param1.id == Game.selfId)
               {
                  return gls("Пять игроков подали жалобу, что ты всех задерживаешь, и выгнали тебя из команды.");
               }
               return gls("Игрок {0} выгнан из игры.",§_-F3§());
               break;
            case §_-51l§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты пришёл первым, но не сможешь стать шаманом, потому что не получил Аттестат в Школе.");
               }
               break;
            case §_-s1R§:
               if(param1.id == Game.selfId)
               {
                  return gls("Место шамана у тебя перекупили и ты получаешь {0} орешков в качестве компенсации.",param4);
               }
               break;
            case §_-21b§:
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
                  if(§_-q1p§.§_-m15§[§_-92z§.mode] != null && Hero.self.isHare || §_-92z§.mode == §_-q1p§.§_-w1Y§ || §_-92z§.location == §_-q1p§.§_-k2B§)
                  {
                     _loc5_ += gls(" Теперь доживи до конца раунда.");
                  }
                  else if(§_-92z§.location == §_-q1p§.§_-M1m§)
                  {
                     _loc5_ += gls(" Теперь дождись конца раунда.");
                  }
                  else
                  {
                     _loc5_ += gls(" Теперь дойди до дупла.");
                  }
                  return _loc5_;
               }
               if(§_-92z§.§_-81f§(param1.id))
               {
                  return gls("Игрок {0} получил элемент коллекции «{1}».",§_-F3§(),param2);
               }
               return gls("Игрок {0} подобрал элемент коллекции «{1}».",§_-F3§(),param2);
               break;
            case §_-t2D§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты не можешь стать драконом, так как ты стал шаманом. Потраченная сумма возвращена.");
               }
               break;
            case §_-mn§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты вызвал дождь из драгоценных камней.");
               }
               return gls("Игрок {0} вызвал дождь из драгоценных камней.",§_-F3§());
               break;
            case §_-us§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты отобрал орех у другой белки.");
               }
               return gls("Игрок {0} отобрал орех у другой белки.",§_-F3§());
               break;
            case §_-61t§:
               if(param1.id == Game.selfId)
               {
                  return gls("У тебя не получилось отобрать орех.");
               }
               return gls("Игроку {0} не удалось отобрать орех.",§_-F3§());
               break;
            case §_-Ph§:
               return param2;
            case §_-92r§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты поднял аптечку.");
               }
               return gls("Игрок {0} поднял аптечку.",§_-F3§());
               break;
            case §_-y2Z§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты выпил коктейль.");
               }
               return gls("Игрок {0} выпил коктейль.",§_-F3§());
               break;
            case §_-71L§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты поднял мешок с золотом и {0}.",param2);
               }
               return gls("Игрок {0} поднял мешок с золотом и {1}.",§_-F3§(),param2);
               break;
            case §_-l2p§:
               return gls("Не удалось использовать магию, нет свободного предмета коллекции.");
            case §_-Gw§:
               if(param1.id == Game.selfId)
               {
                  return gls("Тебе не хватило чуть-чуть мастерства, чтобы стать Шаманом.");
               }
               break;
            case §_-L2b§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты не можешь стать шаманом, пока не пройдёшь Школу Шаманов.");
               }
               break;
            case §_-rr§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты использовал Заморозку. Только обладатели этой магии могут взять предмет.");
               }
               return gls("Игрок {0} использовал Заморозку. Только обладатели этой магии могут взять предмет.",§_-F3§());
               break;
            case §_-p2k§:
               return gls("Не удалось использовать магию, нет свободного предмета коллекции, который ты можешь поднять.");
            case §_-83W§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Тонкий лёд».");
               }
               return gls("Шаман применил к игроку {0} магию «Тонкий лёд».",§_-F3§());
               break;
            case §_-o2u§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Ледяной куб».");
               }
               return gls("Шаман применил к игроку {0} магию «Ледяной куб».",§_-F3§());
               break;
            case §_-02O§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Друг шамана».");
               }
               return gls("Шаман применил к игроку {0} магию «Друг шамана».",§_-F3§());
               break;
            case §_-t1U§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Телепорт».");
               }
               return gls("Шаман применил к игроку {0} магию «Телепорт».",§_-F3§());
               break;
            case §_-Y2R§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Беличье счастье».");
               }
               return gls("Шаман применил к игроку {0} магию «Беличье счастье».",§_-F3§());
               break;
            case §_-W1s§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Любимчик».");
               }
               return gls("Шаман применил к игроку {0} магию «Любимчик».",§_-F3§());
               break;
            case §_-o2y§:
               if(param1.id == Game.selfId)
               {
                  return gls("Шаман применил к тебе магию «Помощник».");
               }
               return gls("Шаман применил к игроку {0} магию «Помощник».",§_-F3§());
               break;
            case §_-M2u§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты открыл шкатулку с секретом и {0}.",param2);
               }
               return gls("Игрок {0} открыл шкатулку с секретом и {1}.",§_-F3§(),param2);
               break;
            case §_-b2a§:
               return param2;
            case §_-lZ§:
               return param2;
            case §_-vW§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты начал раздачу ореха.");
               }
               return gls("Игрок {0} начал раздачу ореха.",§_-F3§());
               break;
            case §_-L1m§:
               if(param1.id == Game.selfId)
               {
                  return gls("Ты не можешь стать Зайцем НеСудьбы, так как ты стал шаманом. Потраченная сумма возвращена.");
               }
         }
         return "";
      }
   }
}

