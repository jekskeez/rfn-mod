package protocol
{
   public class §_-P1h§
   {
      
      private static const §_-hZ§:int = 64;
      
      private static const §_-Qd§:int = 16;
      
      private static var §_-e1H§:Vector.<Vector.<§_-U1M§>> = §_-n10§();
      
      public function §_-P1h§()
      {
         super();
      }
      
      public static function get(param1:int) : §_-U1M§
      {
         var _loc5_:§_-U1M§ = null;
         var _loc2_:int = §_-R1X§(param1);
         var _loc3_:Vector.<§_-U1M§> = §_-e1H§[_loc2_];
         if(_loc3_.length > 0)
         {
            _loc5_ = _loc3_.pop();
            _loc5_.length = param1;
            _loc5_.position = 0;
            return _loc5_;
         }
         var _loc4_:§_-U1M§ = new §_-U1M§();
         _loc4_.length = param1;
         return _loc4_;
      }
      
      public static function add(param1:§_-U1M§) : void
      {
         var _loc2_:int = §_-R1X§(param1.length);
         var _loc3_:Vector.<§_-U1M§> = §_-e1H§[_loc2_];
         if(_loc3_.length >= §_-hZ§)
         {
            return;
         }
         param1.position = 0;
         _loc3_.push(param1);
      }
      
      private static function §_-n10§() : Vector.<Vector.<§_-U1M§>>
      {
         var _loc1_:Vector.<Vector.<§_-U1M§>> = new Vector.<Vector.<§_-U1M§>>(§_-Qd§,true);
         var _loc2_:int = 0;
         while(_loc2_ < §_-Qd§)
         {
            _loc1_[_loc2_] = new Vector.<§_-U1M§>();
            _loc2_++;
         }
         return _loc1_;
      }
      
      private static function §_-R1X§(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 16;
         while(_loc3_ < param1 && _loc2_ < §_-Qd§ - 1)
         {
            _loc3_ <<= 1;
            _loc2_++;
         }
         return _loc2_;
      }
   }
}

