package §_-t1c§
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   
   public final class §_-r8§
   {
      
      private static var _instance:§_-r8§ = null;
      
      private var §_-h1N§:Object = {};
      
      private var §_-E2C§:Point = new Point();
      
      public function §_-r8§()
      {
         super();
      }
      
      public static function get instance() : §_-r8§
      {
         if(!_instance)
         {
            _instance = new §_-r8§();
         }
         return _instance;
      }
      
      public function §_-23S§(param1:§_-R1P§, param2:DisplayObject) : void
      {
         this.§_-h1N§[param1.toString()] = param2;
      }
      
      public function §_-F2S§(param1:§_-R1P§) : Point
      {
         var _loc2_:* = this.§_-h1N§[param1.toString()];
         this.§_-E2C§.setTo(0,0);
         if(_loc2_)
         {
            return (_loc2_ as DisplayObject).localToGlobal(this.§_-E2C§);
         }
         return this.§_-E2C§;
      }
      
      public function §_-u2c§(param1:§_-R1P§) : void
      {
         if(this.§_-h1N§[param1.toString()])
         {
            delete this.§_-h1N§[param1.toString()];
         }
      }
   }
}

