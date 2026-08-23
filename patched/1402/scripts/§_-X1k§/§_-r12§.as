package §_-X1k§
{
   import protocol.Connection;
   import protocol.§_-n2E§;
   import protocol.§_-s2l§;
   
   public class §_-r12§
   {
      
      private static var flags:Vector.<§_-n2E§> = Vector.<§_-n2E§>([]);
      
      private static var §_-u21§:Boolean = false;
      
      private static var §_-H2A§:Vector.<Function> = Vector.<Function>([]);
      
      public function §_-r12§()
      {
         super();
      }
      
      public static function init() : void
      {
         if(§_-u21§)
         {
            return;
         }
         §_-u21§ = true;
         Connection.listen(§_-x2f§,[§_-s2l§.§_-12D§]);
      }
      
      public static function §_-FS§(param1:int) : Boolean
      {
         return §_-73x§(param1).value != 0;
      }
      
      public static function set(param1:int) : void
      {
         §_-73x§(param1).§_-i2T§(1);
      }
      
      public static function §_-42k§(param1:int) : void
      {
         §_-73x§(param1).§_-i2T§(0);
      }
      
      public static function §_-73x§(param1:int) : §_-n2E§
      {
         var _loc2_:§_-n2E§ = null;
         for each(_loc2_ in flags)
         {
            if(_loc2_.type == param1)
            {
               return _loc2_;
            }
         }
         _loc2_ = new §_-n2E§(param1);
         flags.push(_loc2_);
         return _loc2_;
      }
      
      public static function onLoad(param1:Function) : void
      {
         §_-H2A§.push(param1);
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc4_:Function = null;
         var _loc2_:uint = uint(param1[0].length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §_-73x§(param1[0][_loc3_]).§_-i2T§(param1[0][_loc3_ + 1],false);
            _loc3_ += 2;
         }
         while(§_-H2A§.length > 0)
         {
            _loc4_ = §_-H2A§.shift();
            _loc4_.apply();
         }
      }
   }
}

