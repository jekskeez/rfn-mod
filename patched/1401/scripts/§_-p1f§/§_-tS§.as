package §_-p1f§
{
   import §_-I10§.§_-O1T§;
   import flash.events.Event;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-tS§ extends §_-6Y§
   {
      
      private var §_-91G§:Vector.<int> = new Vector.<int>();
      
      public function §_-tS§()
      {
         super(§_-6Y§.§_-2b§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         clear();
         this.§_-91G§ = new Vector.<int>();
         var _loc2_:Array = param1 is Array ? param1 as Array : null;
         if(_loc2_ == null)
         {
            _loc2_ = [];
         }
         var _loc3_:Object = {};
         var _loc4_:int = 0;
         while(_loc4_ + 1 < _loc2_.length)
         {
            _loc3_[_loc2_[_loc4_]] = _loc2_[_loc4_ + 1];
            _loc4_ += 2;
         }
         _loc4_ = 0;
         while(_loc4_ < §_-O1T§.DATA.length)
         {
            _loc5_ = §_-O1T§.DATA[_loc4_];
            _loc6_ = int(_loc5_["stat"]);
            this.§_-91G§.push(_loc6_);
            §_-01s§(String(_loc5_["name"]),55);
            _loc7_ = _loc6_ in _loc3_ ? int(_loc3_[_loc6_]) : 0;
            this.§_-53o§[_loc4_].text = String(_loc7_);
            this.§_-22N§ = 0;
            this.§_-uH§ += 22;
            _loc4_++;
         }
         dispatchEvent(new Event("change"));
      }
      
      override public function save() : §_-U1M§
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:Object = {};
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-53o§.length)
         {
            _loc6_ = int(this.§_-53o§[_loc2_].text);
            if(_loc6_ > 0)
            {
               _loc7_ = this.§_-91G§[_loc2_];
               if(!(_loc7_ in _loc1_) || _loc6_ > int(_loc1_[_loc7_]))
               {
                  _loc1_[_loc7_] = _loc6_;
               }
            }
            _loc2_++;
         }
         var _loc3_:§_-U1M§ = new §_-U1M§();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         var _loc4_:int = 0;
         for(_loc5_ in _loc1_)
         {
            _loc4_++;
         }
         _loc3_.§_-s15§(_loc4_);
         for(_loc5_ in _loc1_)
         {
            _loc3_.§_-s15§(int(_loc5_));
            _loc3_.§_-s15§(int(_loc1_[_loc5_]));
         }
         return _loc3_;
      }
      
      override protected function §_-X26§() : void
      {
      }
      
      override protected function get fieldList() : Array
      {
         return [];
      }
   }
}

