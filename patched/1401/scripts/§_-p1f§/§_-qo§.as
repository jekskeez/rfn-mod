package §_-p1f§
{
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-qo§ extends §_-6Y§
   {
      
      private static const §_-l2W§:Array = [{
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
      
      public function §_-qo§()
      {
         super(§_-6Y§.§_-U1l§);
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
            this.§_-MO§[_loc2_].selected = §_-l2W§[_loc2_]["id"] in this.values && this.values[§_-l2W§[_loc2_]["id"]] != 0;
            _loc2_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc3_:String = null;
         var _loc4_:§_-U1M§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-MO§.length)
         {
            this.values[§_-l2W§[_loc1_]["id"]] = this.§_-MO§[_loc1_].selected ? 1 : 0;
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
      
      override protected function get checkList() : Array
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

