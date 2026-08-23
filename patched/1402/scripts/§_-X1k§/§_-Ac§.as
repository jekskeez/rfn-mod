package §_-X1k§
{
   import §_-bN§.§_-Dn§;
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import §_-s2e§.§_-U2d§;
   import §_-xr§.§_-A3X§;
   import §_-xr§.§_-E1J§;
   import §_-xr§.§_-U2u§;
   import §_-xr§.§_-j1X§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-n2E§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-Ac§
   {
      
      private static const §_-f1j§:int = 3;
      
      private static const NONE:int = 0;
      
      private static const §_-Ck§:int = 1;
      
      private static const COMPLETE:int = 2;
      
      public static const §_-Zm§:int = 0;
      
      public static const §_-j18§:int = 1;
      
      public static const §_-A2D§:int = 2;
      
      public static const §_-y3§:int = 3;
      
      public static const §_-K2A§:int = 4;
      
      public static const §_-FM§:int = 5;
      
      public static const §_-qV§:int = 6;
      
      public static const §_-71w§:int = 7;
      
      public static const §_-T1Z§:int = 8;
      
      public static const §_-9h§:int = 9;
      
      public static const §_-h15§:int = 10;
      
      public static const §_-w1H§:int = 11;
      
      public static const §_-A3u§:int = 12;
      
      public static const §_-Z2N§:int = 13;
      
      public static const §_-K1w§:int = 14;
      
      public static const HOME:int = 15;
      
      public static const §_-R2n§:int = 16;
      
      private static const §_-pY§:Array = [{
         "id":§_-j18§,
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
         "id":§_-71w§,
         "name":gls("Приоденься!"),
         "level":1,
         "short":gls("Примерь костюм"),
         "award":"#Co   1",
         "icon":"EducationQuestIconWardrobe",
         "image":"EducationQuestImageWardrobe",
         "text":gls("Главное, чтобы костюмчик сидел! Пушистым белкам тоже хочется выглядеть красиво и круто. В твоём <b>гардеробе</b> будут храниться вещи, которые подчеркнут твою уникальность. Зайди туда и примерь новую одежду!")
      },{
         "id":§_-A2D§,
         "name":gls("Белки-Летяги"),
         "level":1,
         "short":gls("Получи 4 уровень"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconLevelUp",
         "image":"EducationQuestImageLevelUp",
         "text":gls("Основы ты изучил, пора проверить свои силы. Когда ты приносишь орех в дупло, ты получаешь опыт. А чем больше у тебя опыта - тем выше уровень. Вернись в <b>Солнечные долины</b> и заработай там <b>4 уровень</b>!")
      },{
         "id":§_-y3§,
         "name":gls("Магия нас связала"),
         "level":4,
         "short":gls("Пройди обучение магии"),
         "award":"#Co   1",
         "icon":"EducationQuestIconMagic",
         "image":"EducationQuestImageMagic",
         "text":gls("Ты - не простая белочка! <b>Ты - волшебник</b>, Гарр.. упс, Бельчонок! Белочки нашего мира ещё в древности научились творить магию, расходуя ману. Пройди <b>обучение в Школе</b> и ты тоже постигнешь это искусство.")
      },{
         "id":§_-K2A§,
         "name":gls("По магазинам!"),
         "level":4,
         "short":gls("Ознакомься с магазином"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconShop",
         "image":"EducationQuestImageShop",
         "text":gls("Как-то пусто у тебя в гардеробе. Время заглянуть в <b>магазин</b>. Аренда костюмов позволит тебе использовать удивительную магию и выделиться среди других белок. Сходи в магазин и посмотри, какие костюмы там есть!")
      },{
         "id":§_-FM§,
         "name":gls("Всегда в курсе"),
         "level":4,
         "short":gls("Просмотри текущие новости"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconNews",
         "image":"EducationQuestImageNews",
         "text":gls("Ты знаешь последние новости? Ещё нет? Скорее читай в беличьей <b>газете</b>! Незаменимая штука: если что забудешь, она поможет тебе вспомнить всё. Там пишут обо всех событиях в мире белок, точно ничего не пропустишь.")
      },{
         "id":§_-T1Z§,
         "name":gls("Вам письмо, танцуйте!"),
         "level":4,
         "short":gls("Ознакомься с почтой"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconMail",
         "image":"EducationQuestImageMail",
         "text":gls("Какой же домик без почтового ящика? Найди его, там тебя дожидается моё письмо. По <b>почте</b> ты будешь получать письма с подарками, приглашения и самые важные новости. Очень удобно, попробуй!")
      },{
         "id":§_-9h§,
         "name":gls("Пятый элемент"),
         "level":4,
         "short":gls("Ознакомься с коллекциями"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconCollection",
         "image":"EducationQuestImageCollection",
         "text":gls("Кто-то собирает марки или крышки от люков. А белочки копят <b>элементы коллекций</b> и превращают их в <b>золотые элементы</b>. Обменивайся с друзьями и не зевай - ещё много желающих! Сходи в домик, проверь свою коллекцию.")
      },{
         "id":§_-h15§,
         "name":gls("Только ачивки, только хардкор!"),
         "level":4,
         "short":gls("Ознакомься с достижениями"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconAchieve",
         "image":"EducationQuestImageAchieve",
         "text":gls("Приятно знать, когда о твоих подвигах помнят. Все <b>твои достижения</b> внимательно отслеживаются - ты всегда можешь посмотреть, чего достиг и какие вершины ещё нужно покорить. Загляни в домик и посмотри сам!")
      },{
         "id":§_-w1H§,
         "name":gls("Таинственные топи"),
         "level":7,
         "short":gls("Доберись до дупла на локации Топи"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconRainbow",
         "image":"EducationQuestImageSwamp",
         "text":gls("Мир белок велик и разнообразен! Пора тебе отправляться дальше - в таинственные <b>Топи</b> . Чем выше будет твой уровень, тем больше новых и интересных мест сможешь посетить. Принеси орех с труднопроходимых топей и я тебя награжу!")
      },{
         "id":§_-K1w§,
         "name":gls("Реши свою судьбу!"),
         "level":7,
         "short":gls("Пройди обучение в Битве"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconBattle",
         "image":"EducationQuestImageBattle",
         "text":gls("В мире белок есть несколько разных планет. На одной из них проводятся соревнования закалённых бойцов - <b>Битва</b>. Тебе тоже стоит попробовать! Для начала, пройди обучение в Битве и возвращайся за наградой.")
      },{
         "id":§_-A3u§,
         "name":gls("Быть шаманом"),
         "level":7,
         "short":gls("Пройди обучение шамана"),
         "award":"#Co   1",
         "icon":"EducationQuestIconSchool",
         "image":"EducationQuestImageSchool",
         "text":gls("Взгляни вокруг, оглянись назад. Духи с тобой связаться хотят! Но тебе сперва надо пройти обучение <b>шаманству в Школе</b>. Отправляйся туда и познай это мастерство. Каждая белочка может стать шаманом! Надо только научиться!")
      },{
         "id":§_-Z2N§,
         "name":gls("Духи прошлого"),
         "level":7,
         "short":gls("Стань шаманом"),
         "award":"#Co   1",
         "icon":"EducationQuestIconShaman",
         "image":"EducationQuestImageShaman",
         "text":gls("Ты уже знаешь, кто такие шаманы. Теперь твоя очередь вести за собой бельчат. Зайди на любую локацию и <b>стань шаманом</b>. Немножко орехов или монет помогут тебе. Покажи всё, чему ты научился за время тренировок.")
      },{
         "id":§_-R2n§,
         "name":gls("С ветки на ветку"),
         "level":7,
         "short":gls("Ознакомься с навыками шамана"),
         "award":"#Ac   10 #Mn   10",
         "icon":"EducationQuestIconShamanTree",
         "image":"EducationQuestImageShamanTree",
         "text":gls("Быть шаманом - не только важно и почётно. За помощь другим белкам ты получаешь шаманский опыт и особые <b>Перья</b> для изучения новых навыков. Посмотри какие <b>шаманские навыки</b> ты сможешь со временем освоить.")
      },{
         "id":§_-qV§,
         "name":gls("Быстрее, выше, сильнее!"),
         "level":7,
         "short":gls("Ознакомься с рейтингом"),
         "award":"#Co   1",
         "icon":"EducationQuestIconRating",
         "image":"EducationQuestImageRating",
         "text":gls("Среди белок есть свои спортсмены и чемпионы. С помощью <b>рейтинга</b> удаётся определить, кто из белочек самый лучший. Загляни в рейтинг и посмотри, к чему стоит стремиться. Как только разберёшься, возвращайся!")
      }];
      
      public static var §_-if§:Array = [];
      
      public static var §_-63M§:§_-i5§ = null;
      
      public static var §_-Bi§:ImageArrowRespawn = null;
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      private static var quests:Object = {};
      
      private static var §_-H7§:Boolean = false;
      
      private static var §_-EW§:Boolean = false;
      
      private static var §_-R2v§:int = 0;
      
      private static var loaded:Boolean = false;
      
      public function §_-Ac§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-Bi§ = new ImageArrowRespawn();
         §_-Bi§.visible = false;
         §_-Bi§.rotation = 90;
         §_-63M§ = new §_-i5§("",0,0,new TextFormat(§_-i5§.§_-p1s§,14,16777215,null,null,null,null,null,"center"));
         §_-63M§.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            if(§_-Ac§.§_-nG§)
            {
               §_-U2u§.show();
            }
            else
            {
               §_-Dn§.show();
            }
         });
         §_-p1V§.§_-63T§(§_-11L§);
         Connection.listen(§_-x2f§,[§_-s2l§.§_-QJ§]);
         §_-r12§.§_-73x§(§_-n2E§.§_-y1i§).listen(§_-F12§);
         §_-r12§.§_-73x§(§_-n2E§.§_-X1A§).listen(§_-BS§);
         §_-r12§.§_-73x§(§_-n2E§.§_-A3F§).listen(§_-OQ§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function §_-t1Y§() : void
      {
         if(§_-21c§)
         {
            §_-U2d§.load(function():void
            {
               new §_-j1X§().show();
            },true);
         }
      }
      
      public static function get §_-21c§() : Boolean
      {
         return !§_-f2l§(§_-Zm§) && !§_-f2l§(§_-j18§) && !§_-HU§(§_-j18§);
      }
      
      public static function get §_-nG§() : Boolean
      {
         return !§_-f2l§(§_-Zm§);
      }
      
      public static function get §_-V26§() : Boolean
      {
         return !§_-nG§ || §_-H7§;
      }
      
      public static function get §_-K2Y§() : Boolean
      {
         return §_-nG§ && §_-f2l§(§_-j18§) && !§_-HU§(§_-j18§);
      }
      
      public static function get §_-eh§() : Boolean
      {
         return !§_-nG§ || §_-C1O§(§_-y3§) && §_-if§.indexOf(§_-y3§) != -1;
      }
      
      public static function get §_-W1S§() : Boolean
      {
         return !§_-nG§ || §_-C1O§(§_-A3u§) && §_-if§.indexOf(§_-A3u§) != -1;
      }
      
      public static function §_-G1x§(param1:int) : Object
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-pY§.length)
         {
            if(§_-pY§[_loc2_]["id"] == param1)
            {
               return §_-pY§[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public static function §_-HU§(param1:int) : Boolean
      {
         if(param1 in quests)
         {
            return quests[param1] == COMPLETE;
         }
         return false;
      }
      
      public static function §_-f2l§(param1:int) : Boolean
      {
         if(param1 in quests)
         {
            return quests[param1] == §_-Ck§;
         }
         return false;
      }
      
      public static function §_-C1O§(param1:int) : Boolean
      {
         return §_-G1x§(param1)["level"] <= §_-LZ§.§_-mA§;
      }
      
      public static function complete(param1:int) : void
      {
         if(§_-if§.indexOf(param1) == -1)
         {
            return;
         }
         quests[param1] = COMPLETE;
         Connection.§_-e2T§(§_-u1O§.§_-92§,param1,COMPLETE);
         §_-H7§ = true;
         §_-r18§(true);
      }
      
      public static function §_-91§(param1:int, param2:Boolean = false) : Boolean
      {
         var id:int = param1;
         var force:Boolean = param2;
         if(!§_-nG§)
         {
            return false;
         }
         if(quests[id] == §_-Ck§)
         {
            return false;
         }
         if(§_-if§.indexOf(id) == -1 && !force)
         {
            return false;
         }
         if(!§_-C1O§(id) && !force)
         {
            return false;
         }
         quests[id] = §_-Ck§;
         Connection.§_-e2T§(§_-u1O§.§_-92§,id,§_-Ck§);
         if(loaded)
         {
            if(id == §_-Z2N§)
            {
               §_-A3X§.show(id);
            }
            else
            {
               §_-t2c§.addCallback(function():void
               {
                  §_-A3X§.show(id);
               });
            }
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.EDUCATION_QUEST_PROGRESS));
         §_-EW§ = true;
         §_-Vj§();
         return true;
      }
      
      public static function §_-Vj§() : void
      {
         if(!§_-nG§)
         {
            §_-Ac§.§_-63M§.text = "";
            §_-Bi§.visible = false;
            return;
         }
         if(§_-EW§)
         {
            §_-Ac§.§_-63M§.text = gls("Миссия\nвыполнена");
            return;
         }
         if(§_-U2u§.§_-p2j§ || §_-if§.length == 0)
         {
            §_-Ac§.§_-63M§.text = "";
            §_-Bi§.visible = false;
            return;
         }
         §_-Ac§.§_-63M§.text = gls("Новая\nмиссия");
      }
      
      private static function §_-r18§(param1:Boolean = false) : void
      {
         §_-Bi§.visible = §_-nG§ && quests[§_-A2D§] != COMPLETE;
         §_-if§ = [];
         §_-EW§ = false;
         var _loc2_:int = 0;
         while(_loc2_ < §_-pY§.length)
         {
            if(!§_-HU§(§_-pY§[_loc2_]["id"]))
            {
               §_-if§.push(§_-pY§[_loc2_]["id"]);
               §_-EW§ = §_-EW§ || §_-f2l§(§_-pY§[_loc2_]["id"]);
               if(§_-if§.length >= §_-f1j§)
               {
                  break;
               }
            }
            _loc2_++;
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.EDUCATION_QUEST_CHANGED,{"onComplete":param1}));
         if(§_-if§.length == 0)
         {
            quests[§_-Zm§] = §_-Ck§;
            new §_-E1J§().show();
            §_-jx§.dispatchEvent(new GameEvent(GameEvent.EDUCATION_QUEST_FINISH));
         }
         §_-Vj§();
         if(§_-LZ§.§_-mA§ >= Game.§_-da§ && §_-if§.indexOf(§_-A2D§) != -1)
         {
            §_-91§(§_-A2D§);
         }
         §_-si§.§_-m1x§();
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         Connection.forget(§_-x2f§,[§_-s2l§.§_-QJ§]);
         var _loc2_:Array = param1[0];
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            quests[_loc2_[_loc4_]] = _loc2_[_loc4_ + 1];
            _loc4_ += 2;
         }
         §_-r18§();
         §_-t1Y§();
         loaded = true;
      }
      
      private static function §_-11L§() : void
      {
         ++§_-R2v§;
         §_-63M§.textColor = §_-R2v§ % 2 ? uint(16750848) : uint(16777215);
         §_-R2v§ %= 2;
      }
      
      private static function §_-F12§(param1:§_-n2E§) : void
      {
         if(param1.value == 0)
         {
            return;
         }
         if(§_-f2l§(§_-y3§) || §_-HU§(§_-y3§) || !§_-C1O§(§_-y3§))
         {
            return;
         }
         if(!§_-nG§)
         {
            return;
         }
         §_-91§(§_-y3§,true);
      }
      
      private static function §_-BS§(param1:§_-n2E§) : void
      {
         if(param1.value == 0)
         {
            return;
         }
         if(§_-f2l§(§_-A3u§) || §_-HU§(§_-A3u§) || !§_-C1O§(§_-A3u§))
         {
            return;
         }
         if(!§_-nG§)
         {
            return;
         }
         §_-91§(§_-A3u§,true);
      }
      
      private static function §_-OQ§(param1:§_-n2E§) : void
      {
         if(param1.value == 0)
         {
            return;
         }
         if(§_-f2l§(§_-K1w§) || §_-HU§(§_-K1w§) || !§_-C1O§(§_-K1w§))
         {
            return;
         }
         if(!§_-nG§)
         {
            return;
         }
         §_-91§(§_-K1w§,true);
      }
   }
}

