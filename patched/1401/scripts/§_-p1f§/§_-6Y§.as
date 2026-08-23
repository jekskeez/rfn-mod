package §_-p1f§
{
   import §_-Kr§.§_-h1x§;
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-43M§;
   import §_-l26§.§_-i1J§;
   import fl.controls.CheckBox;
   import fl.data.DataProvider;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import protocol.§_-U1M§;
   
   public class §_-6Y§ extends Sprite
   {
      
      public static const §_-a2u§:int = 0;
      
      public static const §_-113§:int = 1;
      
      public static const §_-wG§:int = 2;
      
      public static const §_-61Q§:int = 3;
      
      public static const §_-a1H§:int = 4;
      
      public static const §_-P13§:int = 5;
      
      public static const §_-k2y§:int = 6;
      
      public static const §_-l2Y§:int = 7;
      
      public static const §_-L27§:int = 8;
      
      public static const §_-Jy§:int = 9;
      
      public static const §_-N29§:int = 10;
      
      public static const §_-O2P§:int = 11;
      
      public static const §_-j2r§:int = 12;
      
      public static const §_-Z2u§:int = 13;
      
      public static const §_-x2g§:int = 14;
      
      public static const §_-U5§:int = 15;
      
      public static const EXCHANGE:int = 16;
      
      public static const §_-3C§:int = 17;
      
      public static const §_-N2n§:int = 18;
      
      public static const §_-TZ§:int = 19;
      
      public static const §_-33V§:int = 20;
      
      public static const §_-U2X§:int = 21;
      
      public static const §_-S2i§:int = 22;
      
      public static const §_-U1l§:int = 23;
      
      public static const §_-43h§:int = 24;
      
      public static const §_-329§:int = 25;
      
      public static const §_-w2A§:int = 26;
      
      public static const §_-Ee§:int = 27;
      
      public static const §_-aS§:int = 28;
      
      public static const §_-2b§:int = 29;
      
      public static const WIDTH:int = 475;
      
      public static const §_-ZC§:Array = ["Профиль","Монеты","Орехи","Энергия","Мана","Опыт","Права","Ежедневный бонус","Флаги","Обучение","Бан","Временные бонусы","Костюмы","Аксессуары","Квесты","Подарки","Обмен","Коллекции","Предметы шамана","Тотемы","Смайлы","Мебель","Дерево шамана","Ежедневные флаги","Настройки","Клан","Начисления","Пропуск","Рейтинг","Достижения"];
      
      public static var §_-b10§:Array = null;
      
      protected var §_-53o§:Vector.<TextField> = new Vector.<TextField>(0);
      
      protected var §_-MO§:Vector.<CheckBox> = new Vector.<CheckBox>(0);
      
      protected var §_-UK§:Vector.<§_-h1x§> = new Vector.<§_-h1x§>(0);
      
      protected var §_-22N§:int = 0;
      
      protected var §_-uH§:int = 0;
      
      protected var §_-13b§:Boolean = false;
      
      protected var _type:int = 0;
      
      protected var §_-HL§:Sprite = new Sprite();
      
      public function §_-6Y§(param1:int)
      {
         super();
         this._type = param1;
         this.init();
      }
      
      public static function §_-Q2Y§(param1:int) : §_-6Y§
      {
         if(!§_-b10§)
         {
            §_-b10§ = [null,§_-33D§,§_-O2D§,§_-X1c§,§_-g2e§,§_-R1H§,§_-y1r§,§_-W1§,§_-QY§,§_-e25§,§_-Px§,§_-W2z§,§_-x1q§,§_-Bl§,§_-a2R§,§_-XA§,§_-k5§,§_-310§,§_-W11§,§_-61L§,§_-fK§,§_-t1L§,§_-zv§,§_-qo§,§_-m7§,§_-y1O§,§_-A3b§,§_-Q1K§,§_-RZ§,§_-tS§];
         }
         var _loc2_:Class = §_-b10§[param1];
         return new _loc2_() as §_-6Y§;
      }
      
      public static function §_-ol§(param1:Sprite) : void
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
      
      public function save() : §_-U1M§
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
      
      public function get §_-72j§() : Boolean
      {
         return this.§_-13b§;
      }
      
      public function set §_-72j§(param1:Boolean) : void
      {
         if(this.§_-72j§ == param1)
         {
            return;
         }
         this.§_-13b§ = param1;
      }
      
      protected function init() : void
      {
         addChild(this.§_-HL§);
         this.§_-X26§();
      }
      
      protected function clear() : void
      {
         var _loc1_:TextField = null;
         var _loc2_:CheckBox = null;
         var _loc3_:§_-h1x§ = null;
         for each(_loc1_ in this.§_-53o§)
         {
            _loc1_.parent.removeChild(_loc1_);
         }
         this.§_-53o§ = new Vector.<TextField>(0);
         for each(_loc2_ in this.§_-MO§)
         {
            _loc2_.parent.removeChild(_loc2_);
         }
         this.§_-MO§ = new Vector.<CheckBox>(0);
         for each(_loc3_ in this.§_-UK§)
         {
            _loc3_.parent.removeChild(_loc3_);
         }
         this.§_-UK§ = new Vector.<§_-h1x§>(0);
         if(Boolean(this.§_-HL§) && Boolean(this.§_-HL§.parent))
         {
            this.§_-HL§.parent.removeChild(this.§_-HL§);
         }
         this.§_-HL§ = new Sprite();
         addChild(this.§_-HL§);
         this.§_-22N§ = 0;
         this.§_-uH§ = 0;
         this.§_-72j§ = false;
      }
      
      protected function §_-X26§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.fieldList.length)
         {
            this.§_-01s§(this.fieldList[_loc1_],this.fieldWidth);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.checkList.length)
         {
            this.§_-c1H§(this.checkList[_loc1_]);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.comboList.length)
         {
            this.§_-x2L§(this.comboList[_loc1_][0],this.comboList[_loc1_][1]);
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
      
      protected function §_-01s§(param1:String, param2:int, param3:Boolean = true) : void
      {
         var _loc4_:Sprite = new Sprite();
         _loc4_.addChild(new §_-i1J§(param1,0,0,§_-32A§.§_-53t§));
         var _loc5_:TextField = new TextField();
         _loc5_.selectable = param3;
         _loc5_.mouseEnabled = param3;
         _loc5_.addEventListener(Event.CHANGE,this.§_-Hp§);
         if(this.fieldTitleWidth == 0)
         {
            §_-43M§.§_-22h§(_loc5_,_loc4_,_loc4_.width + 2,0,param2,18,100,true);
         }
         else
         {
            §_-43M§.§_-22h§(_loc5_,_loc4_,this.fieldTitleWidth,0,param2,18,100,true);
         }
         if(this.§_-22N§ + _loc4_.width > WIDTH)
         {
            this.§_-22N§ = 0;
            this.§_-uH§ += 25;
         }
         _loc4_.x = this.§_-22N§;
         _loc4_.y = this.§_-uH§;
         this.§_-HL§.addChild(_loc4_);
         this.§_-22N§ += _loc4_.width + this.fieldOffset;
         this.§_-53o§.push(_loc5_);
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
      
      protected function §_-c1H§(param1:String) : void
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(new §_-i1J§(param1,0,0,§_-32A§.§_-53t§));
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
         _loc3_.addEventListener(Event.CHANGE,this.§_-Hp§);
         _loc2_.addChild(_loc3_);
         _loc3_.width = 20;
         §_-ol§(_loc3_);
         if(this.§_-22N§ + _loc2_.width > WIDTH)
         {
            this.§_-22N§ = 0;
            this.§_-uH§ += 25;
         }
         _loc2_.x = this.§_-22N§;
         _loc2_.y = this.§_-uH§;
         this.§_-HL§.addChild(_loc2_);
         this.§_-22N§ += _loc2_.width + this.checkOffset;
         this.§_-MO§.push(_loc3_);
      }
      
      protected function get checkTitleWidth() : int
      {
         return 0;
      }
      
      protected function get checkOffset() : int
      {
         return 5;
      }
      
      protected function §_-x2L§(param1:String, param2:DataProvider) : void
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.addChild(new §_-i1J§(param1,0,0,§_-32A§.§_-53t§));
         var _loc4_:§_-h1x§ = new §_-h1x§(this.§_-319§);
         _loc4_.§_-gx§ = param2;
         _loc4_.addEventListener(Event.CHANGE,this.§_-Hp§);
         _loc4_.x = this.comboTitleWidth == 0 ? _loc3_.width + 2 : this.comboTitleWidth;
         _loc4_.y = 0;
         _loc3_.addChild(_loc4_);
         if(this.§_-22N§ + _loc3_.width > WIDTH)
         {
            this.§_-22N§ = 0;
            this.§_-uH§ += 25;
         }
         _loc3_.x = this.§_-22N§;
         _loc3_.y = this.§_-uH§;
         this.§_-HL§.addChild(_loc3_);
         this.§_-22N§ += _loc3_.width + this.comboOffset;
         this.§_-UK§.push(_loc4_);
      }
      
      protected function get §_-319§() : int
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
      
      protected function §_-Hp§(param1:Event) : void
      {
         this.§_-72j§ = true;
      }
   }
}

