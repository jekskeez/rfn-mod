package §_-I10§
{
   import §_-68§.§_-EI§;
   import §_-D2e§.§_-127§;
   import §_-D2e§.§_-R1e§;
   import §_-D2e§.§_-k1n§;
   import §_-D2e§.§_-z1R§;
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-71o§;
   import §_-k1c§.§_-82v§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-T2o§;
   import protocol.§_-h2B§;
   
   public class §_-Q2v§
   {
      
      private static const §_-e2Z§:int = 3;
      
      private static const NONE:int = 0;
      
      private static const §_-K1A§:int = 1;
      
      private static const COMPLETE:int = 2;
      
      public static const §_-7N§:int = 0;
      
      public static const §_-W1q§:int = 1;
      
      public static const §_-YJ§:int = 2;
      
      public static const §_-q1M§:int = 3;
      
      public static const §_-X1A§:int = 4;
      
      public static const §_-K12§:int = 5;
      
      public static const §_-aS§:int = 6;
      
      public static const §_-I1X§:int = 7;
      
      public static const §_-V1P§:int = 8;
      
      public static const §_-3C§:int = 9;
      
      public static const §_-F2§:int = 10;
      
      public static const §_-fh§:int = 11;
      
      public static const §_-X4§:int = 12;
      
      public static const §_-S2i§:int = 13;
      
      public static const §_-fY§:int = 14;
      
      public static const HOME:int = 15;
      
      public static const §_-a2k§:int = 16;
      
      private static const §_-x2g§:Array = [{
         "id":§_-W1q§,
         "name":gls("Первые шаги"),
         "level":0,
         "short":gls("Отправляйся в Солнечные долины"),
         "award":"#Ex   10",
         "icon":"EducationQuestIconFirstGame",
         "image":"EducationQuestImageFirstGame",
         "text":gls("Собирать орехи и хранить их в дупле - вот беличий путь. Настанет зима и запасы тебе пригодятся. На <b>Солнечных долинах</b> как раз ореховый сезон, туда мы и отправимся. Ты готов к курсу молодой белки? Вперёд!")
      },{
         "id":HOME,
         "name":gls("Дом, милый дом"),
         "level":1,
         "short":gls("Ознакомься с домиком"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconHome",
         "image":"EducationQuestImageHome",
         "text":gls("У каждого должен быть <b>дом</b>, где можно отдохнуть и расслабиться, куда приходят друзья и заглядывают знакомые. Поэтому там всегда должно быть красиво и празднично. Загляни к себе домой, рассмотри там всё и возвращайся!")
      },{
         "id":§_-I1X§,
         "name":gls("Приоденься!"),
         "level":1,
         "short":gls("Примерь костюм"),
         "award":"#Co   1",
         "icon":"EducationQuestIconWardrobe",
         "image":"EducationQuestImageWardrobe",
         "text":gls("Главное, чтобы костюмчик сидел! Пушистым белкам тоже хочется выглядеть красиво и круто. В твоём <b>гардеробе</b> будут храниться вещи, которые подчеркнут твою уникальность. Зайди туда и примерь новую одежду!")
      },{
         "id":§_-YJ§,
         "name":gls("Белки-Летяги"),
         "level":1,
         "short":gls("Получи 4 уровень"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconLevelUp",
         "image":"EducationQuestImageLevelUp",
         "text":gls("Основы ты изучил, пора проверить свои силы. Когда ты приносишь орех в дупло, ты получаешь опыт. А чем больше у тебя опыта - тем выше уровень. Вернись в <b>Солнечные долины</b> и заработай там <b>4 уровень</b>!")
      },{
         "id":§_-q1M§,
         "name":gls("Магия нас связала"),
         "level":4,
         "short":gls("Пройди обучение магии"),
         "award":"#Co   1",
         "icon":"EducationQuestIconMagic",
         "image":"EducationQuestImageMagic",
         "text":gls("Ты - не простая белочка! <b>Ты - волшебник</b>, Гарр.. упс, Бельчонок! Белочки нашего мира ещё в древности научились творить магию, расходуя ману. Пройди <b>обучение в Школе</b> и ты тоже постигнешь это искусство.")
      },{
         "id":§_-X1A§,
         "name":gls("По магазинам!"),
         "level":4,
         "short":gls("Ознакомься с магазином"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconShop",
         "image":"EducationQuestImageShop",
         "text":gls("Как-то пусто у тебя в гардеробе. Время заглянуть в <b>магазин</b>. Аренда костюмов позволит тебе использовать удивительную магию и выделиться среди других белок. Сходи в магазин и посмотри, какие костюмы там есть!")
      },{
         "id":§_-K12§,
         "name":gls("Всегда в курсе"),
         "level":4,
         "short":gls("Просмотри текущие новости"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconNews",
         "image":"EducationQuestImageNews",
         "text":gls("Ты знаешь последние новости? Ещё нет? Скорее читай в беличьей <b>газете</b>! Незаменимая штука: если что забудешь, она поможет тебе вспомнить всё. Там пишут обо всех событиях в мире белок, точно ничего не пропустишь.")
      },{
         "id":§_-V1P§,
         "name":gls("Вам письмо, танцуйте!"),
         "level":4,
         "short":gls("Ознакомься с почтой"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconMail",
         "image":"EducationQuestImageMail",
         "text":gls("Какой же домик без почтового ящика? Найди его, там тебя дожидается моё письмо. По <b>почте</b> ты будешь получать письма с подарками, приглашения и самые важные новости. Очень удобно, попробуй!")
      },{
         "id":§_-3C§,
         "name":gls("Пятый элемент"),
         "level":4,
         "short":gls("Ознакомься с коллекциями"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconCollection",
         "image":"EducationQuestImageCollection",
         "text":gls("Кто-то собирает марки или крышки от люков. А белочки копят <b>элементы коллекций</b> и превращают их в <b>золотые элементы</b>. Обменивайся с друзьями и не зевай - ещё много желающих! Сходи в домик, проверь свою коллекцию.")
      },{
         "id":§_-F2§,
         "name":gls("Только ачивки, только хардкор!"),
         "level":4,
         "short":gls("Ознакомься с достижениями"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconAchieve",
         "image":"EducationQuestImageAchieve",
         "text":gls("Приятно знать, когда о твоих подвигах помнят. Все <b>твои достижения</b> внимательно отслеживаются - ты всегда можешь посмотреть, чего достиг и какие вершины ещё нужно покорить. Загляни в домик и посмотри сам!")
      },{
         "id":§_-fh§,
         "name":gls("Таинственные топи"),
         "level":7,
         "short":gls("Доберись до дупла на локации Топи"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconRainbow",
         "image":"EducationQuestImageSwamp",
         "text":gls("Мир белок велик и разнообразен! Пора тебе отправляться дальше - в таинственные <b>Топи</b> . Чем выше будет твой уровень, тем больше новых и интересных мест сможешь посетить. Принеси орех с труднопроходимых топей и я тебя награжу!")
      },{
         "id":§_-fY§,
         "name":gls("Реши свою судьбу!"),
         "level":7,
         "short":gls("Пройди обучение в Битве"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconBattle",
         "image":"EducationQuestImageBattle",
         "text":gls("В мире белок есть несколько разных планет. На одной из них проводятся соревнования закалённых бойцов - <b>Битва</b>. Тебе тоже стоит попробовать! Для начала, пройди обучение в Битве и возвращайся за наградой.")
      },{
         "id":§_-X4§,
         "name":gls("Быть шаманом"),
         "level":7,
         "short":gls("Пройди обучение шамана"),
         "award":"#Co   1",
         "icon":"EducationQuestIconSchool",
         "image":"EducationQuestImageSchool",
         "text":gls("Взгляни вокруг, оглянись назад. Духи с тобой связаться хотят! Но тебе сперва надо пройти обучение <b>шаманству в Школе</b>. Отправляйся туда и познай это мастерство. Каждая белочка может стать шаманом! Надо только научиться!")
      },{
         "id":§_-S2i§,
         "name":gls("Духи прошлого"),
         "level":7,
         "short":gls("Стань шаманом"),
         "award":"#Co   1",
         "icon":"EducationQuestIconShaman",
         "image":"EducationQuestImageShaman",
         "text":gls("Ты уже знаешь, кто такие шаманы. Теперь твоя очередь вести за собой бельчат. Зайди на любую локацию и <b>стань шаманом</b>. Немножко орехов или монет помогут тебе. Покажи всё, чему ты научился за время тренировок.")
      },{
         "id":§_-a2k§,
         "name":gls("С ветки на ветку"),
         "level":7,
         "short":gls("Ознакомься с навыками шамана"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconShamanTree",
         "image":"EducationQuestImageShamanTree",
         "text":gls("Быть шаманом - не только важно и почётно. За помощь другим белкам ты получаешь шаманский опыт и особые <b>Перья</b> для изучения новых навыков. Посмотри какие <b>шаманские навыки</b> ты сможешь со временем освоить.")
      },{
         "id":§_-aS§,
         "name":gls("Быстрее, выше, сильнее!"),
         "level":7,
         "short":gls("Ознакомься с рейтингом"),
         "award":"#Co   1",
         "icon":"EducationQuestIconRating",
         "image":"EducationQuestImageRating",
         "text":gls("Среди белок есть свои спортсмены и чемпионы. С помощью <b>рейтинга</b> удаётся определить, кто из белочек самый лучший. Загляни в рейтинг и посмотри, к чему стоит стремиться. Как только разберёшься, возвращайся!")
      }];
      
      public static var §_-62b§:Array = [];
      
      public static var §_-u2X§:§_-22V§ = null;
      
      public static var §_-Tv§:ImageArrowRespawn = null;
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private static var quests:Object = {};
      
      private static var §_-fk§:Boolean = false;
      
      private static var §_-K9§:Boolean = false;
      
      private static var §_-g1Q§:int = 0;
      
      private static var loaded:Boolean = false;
      
      public function §_-Q2v§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-Tv§ = new ImageArrowRespawn();
         §_-Tv§.visible = false;
         §_-Tv§.rotation = 90;
         §_-u2X§ = new §_-22V§("",0,0,new TextFormat(§_-22V§.§_-pJ§,14,16777215,null,null,null,null,null,"center"));
         §_-u2X§.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            if(§_-Q2v§.§_-U2K§)
            {
               §_-z1R§.show();
            }
            else
            {
               §_-82v§.show();
            }
         });
         §_-01Y§.§_-c9§(§_-J2u§);
         Connection.listen(§_-o2C§,[§_-S2I§.§_-Jy§]);
         §_-Bm§.§_-z1M§(§_-T2o§.§_-Q2R§).listen(§_-rV§);
         §_-Bm§.§_-z1M§(§_-T2o§.§_-m11§).listen(§_-S2Z§);
         §_-Bm§.§_-z1M§(§_-T2o§.§_-mM§).listen(§_-w5§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function §_-g2K§() : void
      {
         if(§_-U2F§)
         {
            §_-EI§.load(function():void
            {
               new §_-k1n§().show();
            },true);
         }
      }
      
      public static function get §_-U2F§() : Boolean
      {
         return !§_-H4§(§_-7N§) && !§_-H4§(§_-W1q§) && !§_-Y2w§(§_-W1q§);
      }
      
      public static function get §_-U2K§() : Boolean
      {
         return !§_-H4§(§_-7N§);
      }
      
      public static function get §_-91S§() : Boolean
      {
         return !§_-U2K§ || §_-fk§;
      }
      
      public static function get §_-03D§() : Boolean
      {
         return §_-U2K§ && §_-H4§(§_-W1q§) && !§_-Y2w§(§_-W1q§);
      }
      
      public static function get §_-og§() : Boolean
      {
         return !§_-U2K§ || §_-d2A§(§_-q1M§) && §_-62b§.indexOf(§_-q1M§) != -1;
      }
      
      public static function get §_-d2U§() : Boolean
      {
         return !§_-U2K§ || §_-d2A§(§_-X4§) && §_-62b§.indexOf(§_-X4§) != -1;
      }
      
      public static function §_-d2I§(param1:int) : Object
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-x2g§.length)
         {
            if(§_-x2g§[_loc2_]["id"] == param1)
            {
               return §_-x2g§[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public static function §_-Y2w§(param1:int) : Boolean
      {
         if(param1 in quests)
         {
            return quests[param1] == COMPLETE;
         }
         return false;
      }
      
      public static function §_-H4§(param1:int) : Boolean
      {
         if(param1 in quests)
         {
            return quests[param1] == §_-K1A§;
         }
         return false;
      }
      
      public static function §_-d2A§(param1:int) : Boolean
      {
         return §_-d2I§(param1)["level"] <= §_-d2x§.§_-z2o§;
      }
      
      public static function complete(param1:int) : void
      {
         if(§_-62b§.indexOf(param1) == -1)
         {
            return;
         }
         quests[param1] = COMPLETE;
         Connection.§_-Li§(§_-h2B§.§_-7t§,param1,COMPLETE);
         §_-fk§ = true;
         §_-P2j§(true);
      }
      
      public static function §_-S2y§(param1:int, param2:Boolean = false) : Boolean
      {
         var id:int = param1;
         var force:Boolean = param2;
         if(!§_-U2K§)
         {
            return false;
         }
         if(quests[id] == §_-K1A§)
         {
            return false;
         }
         if(§_-62b§.indexOf(id) == -1 && !force)
         {
            return false;
         }
         if(!§_-d2A§(id) && !force)
         {
            return false;
         }
         quests[id] = §_-K1A§;
         Connection.§_-Li§(§_-h2B§.§_-7t§,id,§_-K1A§);
         if(loaded)
         {
            if(id == §_-S2i§)
            {
               §_-127§.show(id);
            }
            else
            {
               §_-71o§.addCallback(function():void
               {
                  §_-127§.show(id);
               });
            }
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.EDUCATION_QUEST_PROGRESS));
         §_-K9§ = true;
         §_-EK§();
         return true;
      }
      
      public static function §_-EK§() : void
      {
         if(!§_-U2K§)
         {
            §_-Q2v§.§_-u2X§.text = "";
            §_-Tv§.visible = false;
            return;
         }
         if(§_-K9§)
         {
            §_-Q2v§.§_-u2X§.text = gls("Миссия\nвыполнена");
            return;
         }
         if(§_-z1R§.§_-q1R§ || §_-62b§.length == 0)
         {
            §_-Q2v§.§_-u2X§.text = "";
            §_-Tv§.visible = false;
            return;
         }
         §_-Q2v§.§_-u2X§.text = gls("Новая\nмиссия");
      }
      
      private static function §_-P2j§(param1:Boolean = false) : void
      {
         §_-Tv§.visible = §_-U2K§ && quests[§_-YJ§] != COMPLETE;
         §_-62b§ = [];
         §_-K9§ = false;
         var _loc2_:int = 0;
         while(_loc2_ < §_-x2g§.length)
         {
            if(!§_-Y2w§(§_-x2g§[_loc2_]["id"]))
            {
               §_-62b§.push(§_-x2g§[_loc2_]["id"]);
               §_-K9§ = §_-K9§ || §_-H4§(§_-x2g§[_loc2_]["id"]);
               if(§_-62b§.length >= §_-e2Z§)
               {
                  break;
               }
            }
            _loc2_++;
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.EDUCATION_QUEST_CHANGED,{"onComplete":param1}));
         if(§_-62b§.length == 0)
         {
            quests[§_-7N§] = §_-K1A§;
            new §_-R1e§().show();
            §_-u1o§.dispatchEvent(new GameEvent(GameEvent.EDUCATION_QUEST_FINISH));
         }
         §_-EK§();
         if(§_-d2x§.§_-z2o§ >= Game.§_-P2z§ && §_-62b§.indexOf(§_-YJ§) != -1)
         {
            §_-S2y§(§_-YJ§);
         }
         §_-5K§.§_-b1W§();
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         Connection.forget(§_-o2C§,[§_-S2I§.§_-Jy§]);
         var _loc2_:Array = param1[0];
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            quests[_loc2_[_loc4_]] = _loc2_[_loc4_ + 1];
            _loc4_ += 2;
         }
         §_-P2j§();
         §_-g2K§();
         loaded = true;
      }
      
      private static function §_-J2u§() : void
      {
         ++§_-g1Q§;
         §_-u2X§.textColor = §_-g1Q§ % 2 ? uint(16750848) : uint(16777215);
         §_-g1Q§ %= 2;
      }
      
      private static function §_-rV§(param1:§_-T2o§) : void
      {
         if(param1.value == 0)
         {
            return;
         }
         if(§_-H4§(§_-q1M§) || §_-Y2w§(§_-q1M§) || !§_-d2A§(§_-q1M§))
         {
            return;
         }
         if(!§_-U2K§)
         {
            return;
         }
         §_-S2y§(§_-q1M§,true);
      }
      
      private static function §_-S2Z§(param1:§_-T2o§) : void
      {
         if(param1.value == 0)
         {
            return;
         }
         if(§_-H4§(§_-X4§) || §_-Y2w§(§_-X4§) || !§_-d2A§(§_-X4§))
         {
            return;
         }
         if(!§_-U2K§)
         {
            return;
         }
         §_-S2y§(§_-X4§,true);
      }
      
      private static function §_-w5§(param1:§_-T2o§) : void
      {
         if(param1.value == 0)
         {
            return;
         }
         if(§_-H4§(§_-fY§) || §_-Y2w§(§_-fY§) || !§_-d2A§(§_-fY§))
         {
            return;
         }
         if(!§_-U2K§)
         {
            return;
         }
         §_-S2y§(§_-fY§,true);
      }
   }
}

