package §_-Al§
{
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-57§ extends §_-K1K§
   {
      
      private static const §_-q1s§:Array = [{
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
      
      public function §_-57§()
      {
         super(§_-K1K§.§_-x2p§);
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
         while(_loc2_ < §_-q1s§.length)
         {
            _loc4_ = §_-q1s§[_loc2_]["id"] in this.values ? int(this.values[§_-q1s§[_loc2_]["id"]]) : 0;
            this.§_-23Z§[_loc2_].text = _loc4_.toString();
            _loc2_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         var _loc3_:String = null;
         var _loc4_:§_-z1i§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < §_-q1s§.length)
         {
            this.values[§_-q1s§[_loc1_]["id"]] = int(this.§_-23Z§[_loc1_].text);
            _loc1_++;
         }
         var _loc2_:int = 0;
         for(_loc3_ in this.values)
         {
            _loc2_++;
         }
         _loc4_ = new §_-z1i§();
         _loc4_.endian = Endian.LITTLE_ENDIAN;
         _loc4_.§_-C1W§(_loc2_);
         for(_loc3_ in this.values)
         {
            _loc4_.§_-C1W§(this.values[_loc3_]);
         }
         return _loc4_;
      }
      
      override protected function get fieldList() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < §_-q1s§.length)
         {
            _loc1_.push(§_-q1s§[_loc2_]["title"]);
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

