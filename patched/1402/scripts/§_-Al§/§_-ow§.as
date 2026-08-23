package §_-Al§
{
   import §_-X1k§.§_-P2x§;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-ow§ extends §_-K1K§
   {
      
      private var values:Object = {};
      
      public function §_-ow§()
      {
         super(§_-K1K§.§_-l1s§);
      }
      
      override public function load(param1:*) : void
      {
         this.values = {};
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.values[param1[_loc2_]] = {
               "worn":param1[_loc2_ + 1],
               "reason":param1[_loc2_ + 2]
            };
            _loc2_ += 3;
         }
         _loc2_ = 0;
         while(_loc2_ < §_-P2x§.§_-X1Q§ - 5)
         {
            this.§_-53W§[_loc2_ * 2].selected = _loc2_ in this.values;
            this.§_-53W§[_loc2_ * 2 + 1].selected = _loc2_ in this.values && this.values[_loc2_]["worn"] != 0;
            this.§_-23Z§[_loc2_].text = _loc2_ in this.values ? this.values[_loc2_]["reason"] : "0";
            _loc2_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         var _loc3_:String = null;
         var _loc4_:§_-z1i§ = null;
         this.values = {};
         var _loc1_:int = 0;
         while(_loc1_ < §_-P2x§.§_-X1Q§ - 5)
         {
            if(this.§_-53W§[_loc1_ * 2].selected)
            {
               this.values[_loc1_] = {
                  "worn":(this.§_-53W§[_loc1_ * 2 + 1].selected ? 1 : 0),
                  "reason":int(this.§_-23Z§[_loc1_].text)
               };
            }
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
            _loc4_.§_-C1W§(int(_loc3_));
            _loc4_.writeByte(this.values[_loc3_]["worn"]);
            _loc4_.writeByte(this.values[_loc3_]["reason"]);
         }
         return _loc4_;
      }
      
      override protected function §_-c1v§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-P2x§.§_-X1Q§ - 5)
         {
            §_-13x§(§_-P2x§.§_-d1E§(_loc1_));
            §_-13x§("Надет");
            §_-HE§("Причина",this.fieldWidth);
            _loc1_++;
         }
      }
      
      override protected function get checkTitleWidth() : int
      {
         return this.§_-53W§.length % 2 == 0 ? 150 : 0;
      }
   }
}

