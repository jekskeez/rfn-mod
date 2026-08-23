package §_-p1f§
{
   import fl.data.DataProvider;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-e25§ extends §_-6Y§
   {
      
      private static const §_-l2W§:Array = [{
         "title":"Обучение завершенно",
         "id":0
      },{
         "title":"Первые шаги",
         "id":1
      },{
         "title":"Дом, милый дом",
         "id":15
      },{
         "title":"Приоденься!",
         "id":7
      },{
         "title":"Белки-Летяги",
         "id":2
      },{
         "title":"Магия нас связала",
         "id":3
      },{
         "title":"По магазинам!",
         "id":4
      },{
         "title":"Всегда в курсе",
         "id":5
      },{
         "title":"Вам письмо, танцуйте!",
         "id":8
      },{
         "title":"Пятый элемент",
         "id":9
      },{
         "title":"Только ачивки...",
         "id":10
      },{
         "title":"Таинственные топи",
         "id":11
      },{
         "title":"Реши свою судьбу!",
         "id":14
      },{
         "title":"Быть шаманом",
         "id":12
      },{
         "title":"Духи прошлого",
         "id":13
      },{
         "title":"С ветки на ветку",
         "id":16
      },{
         "title":"Быстрее, выше, сильнее!",
         "id":6
      }];
      
      private var values:Object = {};
      
      public function §_-e25§()
      {
         super(§_-6Y§.§_-Jy§);
      }
      
      override public function load(param1:*) : void
      {
         this.values = {};
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.values[param1[_loc2_]] = param1[_loc2_ + 1];
            _loc2_ += 2;
         }
         _loc2_ = 0;
         while(_loc2_ < §_-l2W§.length)
         {
            this.§_-UK§[_loc2_].§_-Uf§ = §_-l2W§[_loc2_]["id"] in this.values ? int(this.values[§_-l2W§[_loc2_]["id"]]) : 0;
            _loc2_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc3_:String = null;
         var _loc4_:§_-U1M§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-UK§.length)
         {
            this.values[§_-l2W§[_loc1_]["id"]] = int(this.§_-UK§[_loc1_].§_-l1§["value"]);
            _loc1_++;
         }
         var _loc2_:int = 0;
         for(_loc3_ in this.values)
         {
            _loc2_++;
         }
         _loc4_ = new §_-U1M§();
         _loc4_.endian = Endian.LITTLE_ENDIAN;
         _loc4_.§_-s15§(_loc2_);
         for(_loc3_ in this.values)
         {
            _loc4_.writeByte(int(_loc3_));
            _loc4_.writeByte(this.values[_loc3_]);
         }
         return _loc4_;
      }
      
      override protected function get comboList() : Array
      {
         var _loc1_:DataProvider = new DataProvider();
         var _loc2_:Array = ["Нет","Выполнен","Завершён"];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc1_.addItem({
               "label":_loc2_[_loc3_],
               "value":_loc3_
            });
            _loc3_++;
         }
         var _loc4_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < §_-l2W§.length)
         {
            _loc4_.push([§_-l2W§[_loc3_]["title"],_loc1_]);
            _loc3_++;
         }
         return _loc4_;
      }
      
      override protected function get comboTitleWidth() : int
      {
         return 165;
      }
      
      override protected function get comboOffset() : int
      {
         return WIDTH;
      }
   }
}

