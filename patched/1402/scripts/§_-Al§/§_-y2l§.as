package §_-Al§
{
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-y2l§ extends §_-K1K§
   {
      
      private static const §_-q1s§:Array = [{
         "title":"Ежедневный бонус",
         "id":1
      },{
         "title":"Монеты лепрекона",
         "id":3
      },{
         "title":"Праздничный бустер",
         "id":13
      }];
      
      private var values:Object = {};
      
      public function §_-y2l§()
      {
         super(§_-K1K§.§_-Ug§);
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
         while(_loc2_ < §_-q1s§.length)
         {
            this.§_-53W§[_loc2_].selected = §_-q1s§[_loc2_]["id"] in this.values && this.values[§_-q1s§[_loc2_]["id"]] != 0;
            _loc2_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         var _loc3_:String = null;
         var _loc4_:§_-z1i§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-53W§.length)
         {
            this.values[§_-q1s§[_loc1_]["id"]] = this.§_-53W§[_loc1_].selected ? 1 : 0;
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
            _loc4_.writeByte(int(_loc3_));
            _loc4_.writeByte(this.values[_loc3_]);
         }
         return _loc4_;
      }
      
      override protected function get checkList() : Array
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
      
      override protected function get checkTitleWidth() : int
      {
         return 115;
      }
      
      override protected function get checkOffset() : int
      {
         return 15;
      }
   }
}

