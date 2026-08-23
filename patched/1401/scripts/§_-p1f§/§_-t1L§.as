package §_-p1f§
{
   import §_-I10§.§_-I2h§;
   import flash.events.Event;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-t1L§ extends §_-6Y§
   {
      
      private var §_-R23§:Object = {};
      
      public function §_-t1L§()
      {
         super(§_-6Y§.§_-U2X§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         this.§_-R23§ = {};
         var _loc2_:Object = {};
         var _loc3_:int = 0;
         while(_loc3_ + 1 < param1.length)
         {
            _loc4_ = int(param1[_loc3_]);
            _loc5_ = int(param1[_loc3_ + 1]) != 0;
            _loc2_[_loc4_] = true;
            if(_loc5_)
            {
               this.§_-R23§[_loc4_] = true;
            }
            _loc3_ += 2;
         }
         _loc3_ = 0;
         while(_loc3_ < §_-I2h§.DATA.length)
         {
            _loc6_ = _loc3_ * 2;
            _loc7_ = _loc6_ + 1;
            this.§_-MO§[_loc6_].selected = _loc3_ in _loc2_;
            this.§_-MO§[_loc7_].selected = _loc3_ in this.§_-R23§;
            _loc3_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:§_-U1M§ = new §_-U1M§();
         _loc2_.endian = Endian.LITTLE_ENDIAN;
         var _loc3_:int = 0;
         while(_loc3_ < §_-I2h§.DATA.length)
         {
            _loc4_ = _loc3_ * 2;
            _loc5_ = _loc4_ + 1;
            if(this.§_-MO§[_loc4_].selected)
            {
               _loc1_.push([_loc3_,this.§_-MO§[_loc5_].selected ? 1 : 0]);
            }
            _loc3_++;
         }
         _loc2_.§_-s15§(_loc1_.length);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc2_.writeByte(_loc1_[_loc3_][0]);
            _loc2_.writeByte(_loc1_[_loc3_][1]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function §_-X26§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-I2h§.DATA.length)
         {
            this.§_-22N§ = 0;
            §_-c1H§(§_-I2h§.§_-bh§(_loc1_));
            §_-c1H§("Установлено");
            this.§_-uH§ += 25;
            _loc1_++;
         }
      }
      
      override protected function get fieldList() : Array
      {
         return [];
      }
      
      override protected function §_-Hp§(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         super.§_-Hp§(param1);
         var _loc2_:int = 0;
         while(_loc2_ < §_-I2h§.DATA.length)
         {
            _loc3_ = _loc2_ * 2;
            _loc4_ = _loc3_ + 1;
            if(this.§_-MO§[_loc4_].selected && !this.§_-MO§[_loc3_].selected)
            {
               this.§_-MO§[_loc3_].selected = true;
            }
            _loc2_++;
         }
      }
   }
}

