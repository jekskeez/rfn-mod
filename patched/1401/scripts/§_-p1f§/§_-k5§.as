package §_-p1f§
{
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-k5§ extends §_-6Y§
   {
      
      private static const §_-51W§:int = 10;
      
      private var values:Array = [];
      
      public function §_-k5§()
      {
         super(§_-6Y§.EXCHANGE);
      }
      
      override public function load(param1:*) : void
      {
         var _loc3_:int = 0;
         this.values = [];
         var _loc2_:int = 0;
         while(_loc2_ < §_-51W§)
         {
            this.values.push(0);
            _loc2_++;
         }
         if(param1 != null)
         {
            _loc3_ = Math.min(param1.length,§_-51W§);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.values[_loc2_] = int(param1[_loc2_]);
               _loc2_++;
            }
         }
         _loc2_ = 0;
         while(_loc2_ < §_-51W§)
         {
            this.§_-53o§[_loc2_].text = this.values[_loc2_] == 0 ? "" : String(this.values[_loc2_]);
            _loc2_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc3_:int = 0;
         this.values = [];
         var _loc1_:int = 0;
         while(_loc1_ < §_-51W§)
         {
            _loc3_ = int(this.§_-53o§[_loc1_].text);
            if(_loc3_ > 0)
            {
               this.values.push(_loc3_);
            }
            _loc1_++;
         }
         var _loc2_:§_-U1M§ = new §_-U1M§();
         _loc2_.endian = Endian.LITTLE_ENDIAN;
         _loc2_.§_-s15§(this.values.length);
         _loc1_ = 0;
         while(_loc1_ < this.values.length)
         {
            _loc2_.writeByte(this.values[_loc1_]);
            _loc1_++;
         }
         return _loc2_;
      }
      
      override protected function get fieldList() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < §_-51W§)
         {
            _loc1_.push("Слот " + (_loc2_ + 1));
            _loc2_++;
         }
         return _loc1_;
      }
      
      override protected function get fieldWidth() : int
      {
         return 45;
      }
      
      override protected function get fieldTitleWidth() : int
      {
         return 55;
      }
   }
}

