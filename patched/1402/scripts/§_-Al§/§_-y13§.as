package §_-Al§
{
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   import utils.§_-33I§;
   
   public class §_-y13§ extends §_-K1K§
   {
      
      public function §_-y13§()
      {
         super(§_-K1K§.§_-rC§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.checkList.length)
         {
            this.§_-53W§[_loc2_].selected = §_-33I§.§_-V1O§(param1[0],1 << _loc2_);
            _loc2_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.checkList.length)
         {
            if(this.§_-53W§[_loc2_].selected)
            {
               _loc1_ |= 1 << _loc2_;
            }
            _loc2_++;
         }
         var _loc3_:§_-z1i§ = new §_-z1i§();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         _loc3_.writeByte(_loc1_);
         return _loc3_;
      }
      
      override protected function get checkList() : Array
      {
         return ["Администратор","Модератор","Карторграф","Проверяющий"];
      }
   }
}

