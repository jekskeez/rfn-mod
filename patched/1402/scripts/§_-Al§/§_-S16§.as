package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-y1B§;
   import §_-X1k§.§_-42H§;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-S16§ extends §_-K1K§
   {
      
      private var values:Object = {};
      
      public function §_-S16§()
      {
         super(§_-K1K§.§_-9h§);
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
         var _loc4_:Array = [§_-42H§.§_-U13§,§_-42H§.§_-V10§];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc4_[_loc5_].length)
            {
               if(_loc5_ in this.values && _loc2_ in this.values[_loc5_])
               {
                  this.§_-23Z§[_loc3_].text = this.values[_loc5_][_loc2_].toString();
               }
               else
               {
                  this.§_-23Z§[_loc3_].text = "0";
               }
               _loc3_++;
               _loc2_++;
            }
            _loc5_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         var _loc5_:String = null;
         var _loc6_:§_-z1i§ = null;
         var _loc7_:int = 0;
         this.values = {};
         var _loc1_:int = 0;
         var _loc2_:Array = [§_-42H§.§_-U13§,§_-42H§.§_-V10§];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc2_[_loc3_].length)
            {
               if(int(this.§_-23Z§[_loc1_].text) > 0)
               {
                  this.values[_loc1_] = {
                     "type":_loc3_,
                     "element":_loc7_,
                     "count":int(this.§_-23Z§[_loc1_].text)
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
         _loc6_ = new §_-z1i§();
         _loc6_.endian = Endian.LITTLE_ENDIAN;
         _loc6_.§_-C1W§(_loc4_);
         for(_loc5_ in this.values)
         {
            _loc6_.writeByte(this.values[_loc5_]["type"]);
            _loc6_.writeByte(this.values[_loc5_]["element"]);
            _loc6_.§_-C1W§(this.values[_loc5_]["count"]);
         }
         return _loc6_;
      }
      
      override protected function §_-c1v§() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:Array = [§_-42H§.§_-U13§,§_-42H§.§_-V10§];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_[_loc3_].length)
            {
               if(!_loc2_[_loc3_][_loc4_] || !_loc2_[_loc3_][_loc4_]["tittle"])
               {
                  _loc5_ = this.§_-t1o§;
                  _loc6_ = this.§_-J1E§;
                  §_-HE§("",this.fieldWidth,false);
                  this.§_-t1o§ = _loc5_;
                  this.§_-J1E§ = _loc6_;
               }
               else
               {
                  §_-HE§(_loc2_[_loc3_][_loc4_]["tittle"],this.fieldWidth);
                  _loc1_++;
                  if(_loc3_ == 0 && _loc1_ % 5 == 0)
                  {
                     this.§_-t1o§ = 0;
                     this.§_-J1E§ += 25;
                  }
               }
               _loc4_++;
            }
            if(_loc3_ != 1)
            {
               this.§_-2H§.addChild(new §_-y1B§("Золотые Коллекции",150,this.§_-J1E§,§_-A3G§.§_-EF§));
               this.§_-J1E§ += 25;
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

