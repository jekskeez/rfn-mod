package §_-p1f§
{
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   import utils.§_-c10§;
   
   public class §_-y1r§ extends §_-6Y§
   {
      
      public function §_-y1r§()
      {
         super(§_-6Y§.§_-k2y§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.checkList.length)
         {
            this.§_-MO§[_loc2_].selected = §_-c10§.§_-73j§(param1[0],1 << _loc2_);
            _loc2_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.checkList.length)
         {
            if(this.§_-MO§[_loc2_].selected)
            {
               _loc1_ |= 1 << _loc2_;
            }
            _loc2_++;
         }
         var _loc3_:§_-U1M§ = new §_-U1M§();
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

