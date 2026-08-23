package §_-Al§
{
   import §_-X1k§.§_-m2r§;
   import flash.events.Event;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-55§ extends §_-K1K§
   {
      
      private var §_-h1J§:Object = {};
      
      public function §_-55§()
      {
         super(§_-K1K§.§_-sa§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         this.§_-h1J§ = {};
         var _loc2_:Object = {};
         var _loc3_:int = 0;
         while(_loc3_ + 1 < param1.length)
         {
            _loc4_ = int(param1[_loc3_]);
            _loc5_ = int(param1[_loc3_ + 1]) != 0;
            _loc2_[_loc4_] = true;
            if(_loc5_)
            {
               this.§_-h1J§[_loc4_] = true;
            }
            _loc3_ += 2;
         }
         _loc3_ = 0;
         while(_loc3_ < §_-m2r§.DATA.length)
         {
            _loc6_ = _loc3_ * 2;
            _loc7_ = _loc6_ + 1;
            this.§_-53W§[_loc6_].selected = _loc3_ in _loc2_;
            this.§_-53W§[_loc7_].selected = _loc3_ in this.§_-h1J§;
            _loc3_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:§_-z1i§ = new §_-z1i§();
         _loc2_.endian = Endian.LITTLE_ENDIAN;
         var _loc3_:int = 0;
         while(_loc3_ < §_-m2r§.DATA.length)
         {
            _loc4_ = _loc3_ * 2;
            _loc5_ = _loc4_ + 1;
            if(this.§_-53W§[_loc4_].selected)
            {
               _loc1_.push([_loc3_,this.§_-53W§[_loc5_].selected ? 1 : 0]);
            }
            _loc3_++;
         }
         _loc2_.§_-C1W§(_loc1_.length);
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
      
      override protected function §_-c1v§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-m2r§.DATA.length)
         {
            this.§_-t1o§ = 0;
            §_-13x§(§_-m2r§.§_-3f§(_loc1_));
            §_-13x§("Установлено");
            this.§_-J1E§ += 25;
            _loc1_++;
         }
      }
      
      override protected function get fieldList() : Array
      {
         return [];
      }
      
      override protected function §_-w1T§(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         super.§_-w1T§(param1);
         var _loc2_:int = 0;
         while(_loc2_ < §_-m2r§.DATA.length)
         {
            _loc3_ = _loc2_ * 2;
            _loc4_ = _loc3_ + 1;
            if(this.§_-53W§[_loc4_].selected && !this.§_-53W§[_loc3_].selected)
            {
               this.§_-53W§[_loc3_].selected = true;
            }
            _loc2_++;
         }
      }
   }
}

