package §_-I10§
{
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-T2o§;
   
   public class §_-Bm§
   {
      
      private static var flags:Vector.<§_-T2o§> = Vector.<§_-T2o§>([]);
      
      private static var §_-P20§:Boolean = false;
      
      private static var §_-81x§:Vector.<Function> = Vector.<Function>([]);
      
      public function §_-Bm§()
      {
         super();
      }
      
      public static function init() : void
      {
         if(§_-P20§)
         {
            return;
         }
         §_-P20§ = true;
         Connection.listen(§_-o2C§,[§_-S2I§.§_-L27§]);
      }
      
      public static function §_-2S§(param1:int) : Boolean
      {
         return §_-z1M§(param1).value != 0;
      }
      
      public static function set(param1:int) : void
      {
         §_-z1M§(param1).§_-r1g§(1);
      }
      
      public static function §_-fy§(param1:int) : void
      {
         §_-z1M§(param1).§_-r1g§(0);
      }
      
      public static function §_-z1M§(param1:int) : §_-T2o§
      {
         var _loc2_:§_-T2o§ = null;
         for each(_loc2_ in flags)
         {
            if(_loc2_.type == param1)
            {
               return _loc2_;
            }
         }
         _loc2_ = new §_-T2o§(param1);
         flags.push(_loc2_);
         return _loc2_;
      }
      
      public static function onLoad(param1:Function) : void
      {
         §_-81x§.push(param1);
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc4_:Function = null;
         var _loc2_:uint = uint(param1[0].length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §_-z1M§(param1[0][_loc3_]).§_-r1g§(param1[0][_loc3_ + 1],false);
            _loc3_ += 2;
         }
         while(§_-81x§.length > 0)
         {
            _loc4_ = §_-81x§.shift();
            _loc4_.apply();
         }
      }
   }
}

