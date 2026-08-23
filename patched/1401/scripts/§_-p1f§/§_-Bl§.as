package §_-p1f§
{
   import §_-I10§.§_-g2W§;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-Bl§ extends §_-6Y§
   {
      
      private var values:Object = {};
      
      public function §_-Bl§()
      {
         super(§_-6Y§.§_-Z2u§);
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
         while(_loc2_ < §_-g2W§.§_-fQ§ - 5)
         {
            this.§_-MO§[_loc2_ * 2].selected = _loc2_ in this.values;
            this.§_-MO§[_loc2_ * 2 + 1].selected = _loc2_ in this.values && this.values[_loc2_]["worn"] != 0;
            this.§_-53o§[_loc2_].text = _loc2_ in this.values ? this.values[_loc2_]["reason"] : "0";
            _loc2_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc3_:String = null;
         var _loc4_:§_-U1M§ = null;
         this.values = {};
         var _loc1_:int = 0;
         while(_loc1_ < §_-g2W§.§_-fQ§ - 5)
         {
            if(this.§_-MO§[_loc1_ * 2].selected)
            {
               this.values[_loc1_] = {
                  "worn":(this.§_-MO§[_loc1_ * 2 + 1].selected ? 1 : 0),
                  "reason":int(this.§_-53o§[_loc1_].text)
               };
            }
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
            _loc4_.§_-s15§(int(_loc3_));
            _loc4_.writeByte(this.values[_loc3_]["worn"]);
            _loc4_.writeByte(this.values[_loc3_]["reason"]);
         }
         return _loc4_;
      }
      
      override protected function §_-X26§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-g2W§.§_-fQ§ - 5)
         {
            §_-c1H§(§_-g2W§.§_-224§(_loc1_));
            §_-c1H§("Надет");
            §_-01s§("Причина",this.fieldWidth);
            _loc1_++;
         }
      }
      
      override protected function get checkTitleWidth() : int
      {
         return this.§_-MO§.length % 2 == 0 ? 150 : 0;
      }
   }
}

