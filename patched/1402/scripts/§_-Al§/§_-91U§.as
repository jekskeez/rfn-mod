package §_-Al§
{
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-91U§ extends §_-K1K§
   {
      
      private static const §_-3w§:int = 10;
      
      private var values:Array = [];
      
      public function §_-91U§()
      {
         super(§_-K1K§.EXCHANGE);
      }
      
      override public function load(param1:*) : void
      {
         var _loc3_:int = 0;
         this.values = [];
         var _loc2_:int = 0;
         while(_loc2_ < §_-3w§)
         {
            this.values.push(0);
            _loc2_++;
         }
         if(param1 != null)
         {
            _loc3_ = Math.min(param1.length,§_-3w§);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.values[_loc2_] = int(param1[_loc2_]);
               _loc2_++;
            }
         }
         _loc2_ = 0;
         while(_loc2_ < §_-3w§)
         {
            this.§_-23Z§[_loc2_].text = this.values[_loc2_] == 0 ? "" : String(this.values[_loc2_]);
            _loc2_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         var _loc3_:int = 0;
         this.values = [];
         var _loc1_:int = 0;
         while(_loc1_ < §_-3w§)
         {
            _loc3_ = int(this.§_-23Z§[_loc1_].text);
            if(_loc3_ > 0)
            {
               this.values.push(_loc3_);
            }
            _loc1_++;
         }
         var _loc2_:§_-z1i§ = new §_-z1i§();
         _loc2_.endian = Endian.LITTLE_ENDIAN;
         _loc2_.§_-C1W§(this.values.length);
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
         while(_loc2_ < §_-3w§)
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

