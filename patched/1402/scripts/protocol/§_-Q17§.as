package protocol
{
   public class §_-Q17§
   {
      
      private static const §_-DV§:int = 64;
      
      private static const §_-71R§:int = 16;
      
      private static var §_-r2Y§:Vector.<Vector.<§_-z1i§>> = §_-M1n§();
      
      public function §_-Q17§()
      {
         super();
      }
      
      public static function get(param1:int) : §_-z1i§
      {
         var _loc5_:§_-z1i§ = null;
         var _loc2_:int = §_-u1d§(param1);
         var _loc3_:Vector.<§_-z1i§> = §_-r2Y§[_loc2_];
         if(_loc3_.length > 0)
         {
            _loc5_ = _loc3_.pop();
            _loc5_.length = param1;
            _loc5_.position = 0;
            return _loc5_;
         }
         var _loc4_:§_-z1i§ = new §_-z1i§();
         _loc4_.length = param1;
         return _loc4_;
      }
      
      public static function add(param1:§_-z1i§) : void
      {
         var _loc2_:int = §_-u1d§(param1.length);
         var _loc3_:Vector.<§_-z1i§> = §_-r2Y§[_loc2_];
         if(_loc3_.length >= §_-DV§)
         {
            return;
         }
         param1.position = 0;
         _loc3_.push(param1);
      }
      
      private static function §_-M1n§() : Vector.<Vector.<§_-z1i§>>
      {
         var _loc1_:Vector.<Vector.<§_-z1i§>> = new Vector.<Vector.<§_-z1i§>>(§_-71R§,true);
         var _loc2_:int = 0;
         while(_loc2_ < §_-71R§)
         {
            _loc1_[_loc2_] = new Vector.<§_-z1i§>();
            _loc2_++;
         }
         return _loc1_;
      }
      
      private static function §_-u1d§(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 16;
         while(_loc3_ < param1 && _loc2_ < §_-71R§ - 1)
         {
            _loc3_ <<= 1;
            _loc2_++;
         }
         return _loc2_;
      }
   }
}

