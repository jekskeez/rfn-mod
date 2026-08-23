package §_-p1f§
{
   import §_-I10§.§_-vy§;
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-i1J§;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-310§ extends §_-6Y§
   {
      
      private var values:Object = {};
      
      public function §_-310§()
      {
         super(§_-6Y§.§_-3C§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         this.values = {};
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc6_ = int(param1[_loc2_]);
            _loc7_ = int(param1[_loc2_ + 1]);
            if(!(_loc6_ in this.values))
            {
               this.values[_loc6_] = {};
            }
            this.values[_loc6_][_loc7_] = param1[_loc2_ + 2];
            _loc2_ += 3;
         }
         var _loc3_:int = 0;
         var _loc4_:Array = [§_-vy§.§_-U2M§,§_-vy§.§_-C3T§];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc4_[_loc5_].length)
            {
               if(_loc5_ in this.values && _loc2_ in this.values[_loc5_])
               {
                  this.§_-53o§[_loc3_].text = this.values[_loc5_][_loc2_].toString();
               }
               else
               {
                  this.§_-53o§[_loc3_].text = "0";
               }
               _loc3_++;
               _loc2_++;
            }
            _loc5_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc5_:String = null;
         var _loc6_:§_-U1M§ = null;
         var _loc7_:int = 0;
         this.values = {};
         var _loc1_:int = 0;
         var _loc2_:Array = [§_-vy§.§_-U2M§,§_-vy§.§_-C3T§];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc2_[_loc3_].length)
            {
               if(int(this.§_-53o§[_loc1_].text) > 0)
               {
                  this.values[_loc1_] = {
                     "type":_loc3_,
                     "element":_loc7_,
                     "count":int(this.§_-53o§[_loc1_].text)
                  };
               }
               _loc1_++;
               _loc7_++;
            }
            _loc3_++;
         }
         var _loc4_:int = 0;
         for(_loc5_ in this.values)
         {
            _loc4_++;
         }
         _loc6_ = new §_-U1M§();
         _loc6_.endian = Endian.LITTLE_ENDIAN;
         _loc6_.§_-s15§(_loc4_);
         for(_loc5_ in this.values)
         {
            _loc6_.writeByte(this.values[_loc5_]["type"]);
            _loc6_.writeByte(this.values[_loc5_]["element"]);
            _loc6_.§_-s15§(this.values[_loc5_]["count"]);
         }
         return _loc6_;
      }
      
      override protected function §_-X26§() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:Array = [§_-vy§.§_-U2M§,§_-vy§.§_-C3T§];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_[_loc3_].length)
            {
               if(!_loc2_[_loc3_][_loc4_] || !_loc2_[_loc3_][_loc4_]["tittle"])
               {
                  _loc5_ = this.§_-22N§;
                  _loc6_ = this.§_-uH§;
                  §_-01s§("",this.fieldWidth,false);
                  this.§_-22N§ = _loc5_;
                  this.§_-uH§ = _loc6_;
               }
               else
               {
                  §_-01s§(_loc2_[_loc3_][_loc4_]["tittle"],this.fieldWidth);
                  _loc1_++;
                  if(_loc3_ == 0 && _loc1_ % 5 == 0)
                  {
                     this.§_-22N§ = 0;
                     this.§_-uH§ += 25;
                  }
               }
               _loc4_++;
            }
            if(_loc3_ != 1)
            {
               this.§_-HL§.addChild(new §_-i1J§("Золотые Коллекции",150,this.§_-uH§,§_-32A§.§_-hP§));
               this.§_-uH§ += 25;
            }
            _loc3_++;
         }
      }
      
      override protected function get fieldWidth() : int
      {
         return 30;
      }
      
      override protected function get fieldTitleWidth() : int
      {
         return 115;
      }
   }
}

