package §_-p1f§
{
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-W11§ extends §_-6Y§
   {
      
      private static const §_-l2W§:Array = [{
         "title":"Палка",
         "id":0
      },{
         "title":"Ящик",
         "id":2
      },{
         "title":"Гиря",
         "id":8
      },{
         "title":"Батут",
         "id":9
      },{
         "title":"Ядро",
         "id":11
      },{
         "title":"Синий портал",
         "id":12
      },{
         "title":"Красный портал",
         "id":13
      },{
         "title":"Удаление",
         "id":16
      },{
         "title":"Шарик",
         "id":18
      },{
         "title":"Хлопушка",
         "id":23
      },{
         "title":"Молоток",
         "id":27
      }];
      
      private var values:Object = {};
      
      public function §_-W11§()
      {
         super(§_-6Y§.§_-N2n§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.values = {};
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = int(param1[_loc2_]);
            this.values[_loc3_] = param1[_loc2_ + 1];
            _loc2_ += 2;
         }
         _loc2_ = 0;
         while(_loc2_ < §_-l2W§.length)
         {
            _loc4_ = §_-l2W§[_loc2_]["id"] in this.values ? int(this.values[§_-l2W§[_loc2_]["id"]]) : 0;
            this.§_-53o§[_loc2_].text = _loc4_.toString();
            _loc2_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc3_:String = null;
         var _loc4_:§_-U1M§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < §_-l2W§.length)
         {
            this.values[§_-l2W§[_loc1_]["id"]] = int(this.§_-53o§[_loc1_].text);
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
            _loc4_.§_-s15§(this.values[_loc3_]);
         }
         return _loc4_;
      }
      
      override protected function get fieldList() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < §_-l2W§.length)
         {
            _loc1_.push(§_-l2W§[_loc2_]["title"]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      override protected function get fieldWidth() : int
      {
         return 30;
      }
      
      override protected function get fieldTitleWidth() : int
      {
         return 100;
      }
      
      override protected function get fieldOffset() : int
      {
         return 25;
      }
   }
}

