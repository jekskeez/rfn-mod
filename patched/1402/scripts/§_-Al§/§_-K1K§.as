package §_-Al§
{
   import §_-B1G§.§_-32t§;
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-j1d§;
   import §_-E1v§.§_-y1B§;
   import fl.controls.CheckBox;
   import fl.data.DataProvider;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import protocol.§_-z1i§;
   
   public class §_-K1K§ extends Sprite
   {
      
      public static const §_-C1Z§:int = 0;
      
      public static const §_-M1U§:int = 1;
      
      public static const §_-l2X§:int = 2;
      
      public static const §_-W27§:int = 3;
      
      public static const §_-fz§:int = 4;
      
      public static const §_-V2n§:int = 5;
      
      public static const §_-rC§:int = 6;
      
      public static const §_-wb§:int = 7;
      
      public static const §_-12D§:int = 8;
      
      public static const §_-QJ§:int = 9;
      
      public static const §_-x1i§:int = 10;
      
      public static const §_-y2q§:int = 11;
      
      public static const §_-jN§:int = 12;
      
      public static const §_-l1s§:int = 13;
      
      public static const §_-pY§:int = 14;
      
      public static const §_-F§:int = 15;
      
      public static const EXCHANGE:int = 16;
      
      public static const §_-9h§:int = 17;
      
      public static const §_-x2p§:int = 18;
      
      public static const §_-t1d§:int = 19;
      
      public static const §_-62E§:int = 20;
      
      public static const §_-sa§:int = 21;
      
      public static const §_-Z2N§:int = 22;
      
      public static const §_-Ug§:int = 23;
      
      public static const §_-eS§:int = 24;
      
      public static const §_-L1b§:int = 25;
      
      public static const §_-23J§:int = 26;
      
      public static const §_-b1B§:int = 27;
      
      public static const §_-qV§:int = 28;
      
      public static const §_-61L§:int = 29;
      
      public static const WIDTH:int = 475;
      
      public static const §_-X2R§:Array = ["Профиль","Монеты","Орехи","Энергия","Мана","Опыт","Права","Ежедневный бонус","Флаги","Обучение","Бан","Временные бонусы","Костюмы","Аксессуары","Квесты","Подарки","Обмен","Коллекции","Предметы шамана","Тотемы","Смайлы","Мебель","Дерево шамана","Ежедневные флаги","Настройки","Клан","Начисления","Пропуск","Рейтинг","Достижения"];
      
      public static var §_-W2V§:Array = null;
      
      protected var §_-23Z§:Vector.<TextField> = new Vector.<TextField>(0);
      
      protected var §_-53W§:Vector.<CheckBox> = new Vector.<CheckBox>(0);
      
      protected var §_-01i§:Vector.<§_-32t§> = new Vector.<§_-32t§>(0);
      
      protected var §_-t1o§:int = 0;
      
      protected var §_-J1E§:int = 0;
      
      protected var §_-WN§:Boolean = false;
      
      protected var _type:int = 0;
      
      protected var §_-2H§:Sprite = new Sprite();
      
      public function §_-K1K§(param1:int)
      {
         super();
         this._type = param1;
         this.init();
      }
      
      public static function §_-Eq§(param1:int) : §_-K1K§
      {
         if(!§_-W2V§)
         {
            §_-W2V§ = [null,§_-71z§,§_-bS§,§_-Yr§,§_-62L§,§_-4x§,§_-y13§,§_-i1t§,§_-x2n§,§_-h1B§,§_-gI§,§_-ny§,§_-N1r§,§_-ow§,§_-V27§,§_-o2E§,§_-91U§,§_-S16§,§_-57§,§_-l2Z§,§_-aH§,§_-55§,§_-hU§,§_-y2l§,§_-62x§,§_-l1§,§_-52e§,§_-y1J§,§_-R2L§,§_-Y2t§];
         }
         var _loc2_:Class = §_-W2V§[param1];
         return new _loc2_() as §_-K1K§;
      }
      
      public static function §_-Nj§(param1:Sprite) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).height = param1.height;
            param1.getChildAt(_loc2_).width = param1.width;
            _loc2_++;
         }
      }
      
      public function load(param1:*) : void
      {
      }
      
      public function save() : §_-z1i§
      {
         return null;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get isClan() : Boolean
      {
         return false;
      }
      
      public function get §_-51U§() : Boolean
      {
         return this.§_-WN§;
      }
      
      public function set §_-51U§(param1:Boolean) : void
      {
         if(this.§_-51U§ == param1)
         {
            return;
         }
         this.§_-WN§ = param1;
      }
      
      protected function init() : void
      {
         addChild(this.§_-2H§);
         this.§_-c1v§();
      }
      
      protected function clear() : void
      {
         var _loc1_:TextField = null;
         var _loc2_:CheckBox = null;
         var _loc3_:§_-32t§ = null;
         for each(_loc1_ in this.§_-23Z§)
         {
            _loc1_.parent.removeChild(_loc1_);
         }
         this.§_-23Z§ = new Vector.<TextField>(0);
         for each(_loc2_ in this.§_-53W§)
         {
            _loc2_.parent.removeChild(_loc2_);
         }
         this.§_-53W§ = new Vector.<CheckBox>(0);
         for each(_loc3_ in this.§_-01i§)
         {
            _loc3_.parent.removeChild(_loc3_);
         }
         this.§_-01i§ = new Vector.<§_-32t§>(0);
         if(Boolean(this.§_-2H§) && Boolean(this.§_-2H§.parent))
         {
            this.§_-2H§.parent.removeChild(this.§_-2H§);
         }
         this.§_-2H§ = new Sprite();
         addChild(this.§_-2H§);
         this.§_-t1o§ = 0;
         this.§_-J1E§ = 0;
         this.§_-51U§ = false;
      }
      
      protected function §_-c1v§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.fieldList.length)
         {
            this.§_-HE§(this.fieldList[_loc1_],this.fieldWidth);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.checkList.length)
         {
            this.§_-13x§(this.checkList[_loc1_]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.comboList.length)
         {
            this.§_-W2p§(this.comboList[_loc1_][0],this.comboList[_loc1_][1]);
            _loc1_++;
         }
      }
      
      protected function get fieldList() : Array
      {
         return [];
      }
      
      protected function get checkList() : Array
      {
         return [];
      }
      
      protected function get comboList() : Array
      {
         return [];
      }
      
      protected function §_-HE§(param1:String, param2:int, param3:Boolean = true) : void
      {
         var _loc4_:Sprite = new Sprite();
         _loc4_.addChild(new §_-y1B§(param1,0,0,§_-A3G§.§_-v1I§));
         var _loc5_:TextField = new TextField();
         _loc5_.selectable = param3;
         _loc5_.mouseEnabled = param3;
         _loc5_.addEventListener(Event.CHANGE,this.§_-w1T§);
         if(this.fieldTitleWidth == 0)
         {
            §_-j1d§.§_-43I§(_loc5_,_loc4_,_loc4_.width + 2,0,param2,18,100,true);
         }
         else
         {
            §_-j1d§.§_-43I§(_loc5_,_loc4_,this.fieldTitleWidth,0,param2,18,100,true);
         }
         if(this.§_-t1o§ + _loc4_.width > WIDTH)
         {
            this.§_-t1o§ = 0;
            this.§_-J1E§ += 25;
         }
         _loc4_.x = this.§_-t1o§;
         _loc4_.y = this.§_-J1E§;
         this.§_-2H§.addChild(_loc4_);
         this.§_-t1o§ += _loc4_.width + this.fieldOffset;
         this.§_-23Z§.push(_loc5_);
      }
      
      protected function get fieldWidth() : int
      {
         return 100;
      }
      
      protected function get fieldTitleWidth() : int
      {
         return 0;
      }
      
      protected function get fieldOffset() : int
      {
         return 5;
      }
      
      protected function §_-13x§(param1:String) : void
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(new §_-y1B§(param1,0,0,§_-A3G§.§_-v1I§));
         var _loc3_:CheckBox = new CheckBox();
         _loc3_.label = "";
         if(this.checkTitleWidth == 0)
         {
            _loc3_.x = _loc2_.width + 2;
         }
         else
         {
            _loc3_.x = this.checkTitleWidth;
         }
         _loc3_.selected = false;
         _loc3_.addEventListener(Event.CHANGE,this.§_-w1T§);
         _loc2_.addChild(_loc3_);
         _loc3_.width = 20;
         §_-Nj§(_loc3_);
         if(this.§_-t1o§ + _loc2_.width > WIDTH)
         {
            this.§_-t1o§ = 0;
            this.§_-J1E§ += 25;
         }
         _loc2_.x = this.§_-t1o§;
         _loc2_.y = this.§_-J1E§;
         this.§_-2H§.addChild(_loc2_);
         this.§_-t1o§ += _loc2_.width + this.checkOffset;
         this.§_-53W§.push(_loc3_);
      }
      
      protected function get checkTitleWidth() : int
      {
         return 0;
      }
      
      protected function get checkOffset() : int
      {
         return 5;
      }
      
      protected function §_-W2p§(param1:String, param2:DataProvider) : void
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.addChild(new §_-y1B§(param1,0,0,§_-A3G§.§_-v1I§));
         var _loc4_:§_-32t§ = new §_-32t§(this.§_-n2S§);
         _loc4_.§_-GO§ = param2;
         _loc4_.addEventListener(Event.CHANGE,this.§_-w1T§);
         _loc4_.x = this.comboTitleWidth == 0 ? _loc3_.width + 2 : this.comboTitleWidth;
         _loc4_.y = 0;
         _loc3_.addChild(_loc4_);
         if(this.§_-t1o§ + _loc3_.width > WIDTH)
         {
            this.§_-t1o§ = 0;
            this.§_-J1E§ += 25;
         }
         _loc3_.x = this.§_-t1o§;
         _loc3_.y = this.§_-J1E§;
         this.§_-2H§.addChild(_loc3_);
         this.§_-t1o§ += _loc3_.width + this.comboOffset;
         this.§_-01i§.push(_loc4_);
      }
      
      protected function get §_-n2S§() : int
      {
         return 200;
      }
      
      protected function get comboTitleWidth() : int
      {
         return 0;
      }
      
      protected function get comboOffset() : int
      {
         return 5;
      }
      
      protected function §_-w1T§(param1:Event) : void
      {
         this.§_-51U§ = true;
      }
   }
}

