package §_-Al§
{
   import §_-X1k§.§_-K0§;
   import flash.events.Event;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-Y2t§ extends §_-K1K§
   {
      
      private var §_-M2v§:Vector.<int> = new Vector.<int>();
      
      public function §_-Y2t§()
      {
         super(§_-K1K§.§_-61L§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         clear();
         this.§_-M2v§ = new Vector.<int>();
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
         while(_loc4_ < §_-K0§.DATA.length)
         {
            _loc5_ = §_-K0§.DATA[_loc4_];
            _loc6_ = int(_loc5_["stat"]);
            this.§_-M2v§.push(_loc6_);
            §_-HE§(String(_loc5_["name"]),55);
            _loc7_ = _loc6_ in _loc3_ ? int(_loc3_[_loc6_]) : 0;
            this.§_-23Z§[_loc4_].text = String(_loc7_);
            this.§_-t1o§ = 0;
            this.§_-J1E§ += 22;
            _loc4_++;
         }
         dispatchEvent(new Event("change"));
      }
      
      override public function save() : §_-z1i§
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:Object = {};
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-23Z§.length)
         {
            _loc6_ = int(this.§_-23Z§[_loc2_].text);
            if(_loc6_ > 0)
            {
               _loc7_ = this.§_-M2v§[_loc2_];
               if(!(_loc7_ in _loc1_) || _loc6_ > int(_loc1_[_loc7_]))
               {
                  _loc1_[_loc7_] = _loc6_;
               }
            }
            _loc2_++;
         }
         var _loc3_:§_-z1i§ = new §_-z1i§();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         var _loc4_:int = 0;
         for(_loc5_ in _loc1_)
         {
            _loc4_++;
         }
         _loc3_.§_-C1W§(_loc4_);
         for(_loc5_ in _loc1_)
         {
            _loc3_.§_-C1W§(int(_loc5_));
            _loc3_.§_-C1W§(int(_loc1_[_loc5_]));
         }
         return _loc3_;
      }
      
      override protected function §_-c1v§() : void
      {
      }
      
      override protected function get fieldList() : Array
      {
         return [];
      }
   }
}

