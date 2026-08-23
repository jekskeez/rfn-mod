package
{
   import §_-I10§.§_-d2x§;
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   import flash.utils.getTimer;
   import utils.§_-ex§;
   
   public class §_-QP§
   {
      
      private static const DATA:Array = [{
         "name":gls("Мастер слежения"),
         "value":[[5,4,4,3,3,2],[10,8,8,6,6,4]],
         "short":gls("Курьеров сопровождено: "),
         "text":gls("Курьер должен доставить экспонат в Музей Истории на локацию #loc. Не отходи от белки, отмеченной стрелкой, а то артефакт украдут. Доберёшься до дупла - получишь награду.")
      },{
         "name":gls("Срочная доставка"),
         "value":[[5,5,5,5,5,5],[10,10,10,10,10,10]],
         "short":gls("Артефактов доставлено: "),
         "text":gls("Ты обнаружил древний артефакт! Его нужно срочно доставить на локацию #loc. Забеги в дупло за отведённое время и будешь щедро вознаграждён!")
      },{
         "name":gls("Поручение Зайца"),
         "value":[[1,1,1,1,1,1],[3,3,3,3,3,3]],
         "short":gls("Белок погибло: "),
         "text":gls("У Зайца НеСудьбы есть для тебя работа. Отправляйся в Шторм, в режим “связанные”. Убей белку, связанную с тобой, и доберись до дупла. Справишься, и Заяц наградит тебя.")
      },{
         "name":gls("Призрачное золото"),
         "value":[[20,18,15,8,7,5],[30,28,25,18,16,14]],
         "short":gls("Найдено золота: "),
         "text":gls("На локации #loc было найдено призрачное золото! Используй локатор, чтобы найти его, а затем забеги в дупло - и тогда ты получишь награду!")
      },{
         "name":gls("Спасительные орехи"),
         "value":[[6,5,4,2,2,1],[15,12,8,6,6,3]],
         "short":gls("Урожая выращено: "),
         "text":gls("Группа археологов ведет раскопки на локации #loc, и им нужен источник пищи. Посади в каждом раунде не менее 3 орехов в подготовленных местах, зайди в дупло и получи заслуженную награду.")
      },{
         "name":gls("Триангуляция"),
         "value":[[5,4,4,3,3,1],[10,8,8,6,6,2]],
         "short":gls("Артефактов отмечено: "),
         "text":gls("Команда учёных спешит на локацию #loc для исследования артефакта. Поставь три триангулятора вокруг артефакта, чтобы учёные знали, куда им идти, доберись до дупла, и награда станет твоей.")
      },{
         "name":gls("Золотые слитки"),
         "value":[[20,18,15,8,7,5],[30,28,25,18,16,14]],
         "short":gls("Слитков собрано: "),
         "text":gls("На локации #loc были найдены золотые слитки. Собирай их и помни: чем больше слитков ты поднимешь, тем медленнее будешь передвигаться. Доберёшься до дупла - получишь награду.")
      },{
         "name":gls("Безумное испытание"),
         "value":[[5,4,4,3,3,1],[10,8,8,6,6,2]],
         "short":gls("Пройдено испытаний: "),
         "text":gls("Безумный шаман готов наградить тебя, если ты сможешь пройти его испытание на локации #loc. Добеги до дупла под действием проклятия дезориентации, и награда станет твоей!")
      },{
         "name":gls("Волшебная вода"),
         "value":[[20,18,15,8,7,4],[40,36,34,28,26,20]],
         "short":gls("Воды собрано: "),
         "text":gls("Волшебная вода встречается крайне редко и высоко ценится! Чтобы получить награду, отправляйся на локацию #loc, найди Чудесную Тучу и лови её, пока не наберёшь нужное количество воды!")
      },{
         "name":gls("Компас"),
         "value":[[7,6,6,5,5,4],[15,12,12,10,10,8]],
         "short":gls("Артефактов найдено: "),
         "text":gls("Охотник за сокровищами должен уметь пользоваться компасом, краснеющим при приближении к цели. Используй его, чтобы найти артефакт на локации #loc, доберись до дупла и получи награду.")
      },{
         "name":gls("Опасный шаман"),
         "value":[[5,4,4,3,3,1],[10,8,8,6,6,2]],
         "short":gls("Сокровищ спасено: "),
         "text":gls("Шаман тоже ищет сокровища на локации #loc. А вдруг он захочет украсть твои? Доберись до дупла, не приближаясь к шаману, и получишь награду!")
      },{
         "name":gls("Конкурент"),
         "value":[[5,4,4,3,3,2],[10,8,8,6,6,4]],
         "short":gls("Конкурентов повержено: "),
         "text":gls("У тебя появился конкурент - он охотится за твоими сокровищами! Беги на локацию #loc и доберись до дупла раньше белки, отмеченной стрелкой, чтобы получить заслуженную награду!")
      },{
         "name":gls("Злой дух"),
         "value":[[5,4,4,2,2,1],[10,8,8,5,5,3]],
         "short":gls("Сокровищ получено: "),
         "text":gls("Твои сокровища находятся в дупле на локации #loc, но их охраняет злой дух. Не дай призраку коснуться тебя и доберись до дупла, чтобы получить заслуженную награду.")
      },{
         "name":gls("Экстракт бессмертия"),
         "value":[[5,5,5,10,10,10],[15,15,15,30,30,30]],
         "short":gls("Душ собрано: "),
         "text":gls("Из душ погибших белок могущественные шаманы готовят Экстракт Бессмертия. Отправляйся на локацию #loc, собери души погибших белок, отнеси их в дупло и получи награду.")
      }];
      
      private static const §_-U4§:Array = [{
         "level":7,
         "exp":30
      },{
         "level":13,
         "exp":50
      },{
         "level":17,
         "exp":70
      },{
         "level":999,
         "exp":120
      }];
      
      private static var locations:Array = null;
      
      private static var images:Array = null;
      
      private static var §_-J1E§:Array = null;
      
      public var type:int = -1;
      
      public var §_-QN§:int = -1;
      
      public var location:int = -1;
      
      public var value:int = -1;
      
      public var time:int = -1;
      
      public function §_-QP§(param1:int, param2:int, param3:int, param4:int, param5:int)
      {
         super();
         this.type = param1;
         this.§_-QN§ = param5;
         this.location = param2;
         this.value = param3;
         this.time = param4 + getTimer() / 1000;
      }
      
      public static function §_-qa§(param1:int) : int
      {
         if(!locations)
         {
            locations = [§_-q1p§.§_-C25§,§_-q1p§.§_-sL§,§_-q1p§.§_-P4§,§_-q1p§.§_-Q1s§,§_-q1p§.§_-u2u§];
         }
         return Math.max(0,locations.indexOf(param1));
      }
      
      public function get §_-Y2w§() : Boolean
      {
         return this.value >= this.§_-g2T§;
      }
      
      public function get §_-g2T§() : int
      {
         return DATA[this.type]["value"][this.§_-QN§][this.§_-mS§];
      }
      
      public function get name() : String
      {
         return DATA[this.type]["name"];
      }
      
      public function get text() : String
      {
         return DATA[this.type]["text"].replace("#loc","<b>" + §_-q1p§.§_-l29§(this.location).name + "</b>");
      }
      
      public function get short() : String
      {
         return DATA[this.type]["short"];
      }
      
      public function get image() : Sprite
      {
         if(!images)
         {
            images = [QuestImage0,QuestImage1,QuestImage2,QuestImage3,QuestImage4,QuestImage5,QuestImage6,QuestImage7,QuestImage8,QuestImage9,QuestImage10,QuestImage11,QuestImage12,QuestImage13];
         }
         return new images[this.type]();
      }
      
      public function get icon() : Sprite
      {
         if(!§_-J1E§)
         {
            §_-J1E§ = [QuestIcon0,QuestIcon1,QuestIcon2,QuestIcon3,QuestIcon4,QuestIcon5,QuestIcon6,QuestIcon7,QuestIcon8,QuestIcon9,QuestIcon10,QuestIcon11,QuestIcon12,QuestIcon13];
         }
         return new §_-J1E§[this.type]();
      }
      
      public function get award() : String
      {
         var _loc1_:String = this.§_-QN§ == 0 ? "#Ac 50   #Mn 30   #Ex " : "#Ac 80   #Mn 40   #Ex ";
         var _loc2_:int = 0;
         while(_loc2_ < §_-U4§.length)
         {
            if(§_-U4§[_loc2_]["level"] >= §_-d2x§.§_-z2o§)
            {
               _loc1_ += §_-U4§[_loc2_]["exp"] * (this.§_-QN§ == 0 ? 1 : 2);
               break;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get §_-i1n§() : String
      {
         return §_-ex§.§_-d2X§(this.time - getTimer() / 1000);
      }
      
      private function get §_-mS§() : int
      {
         return §_-qa§(this.location);
      }
   }
}

