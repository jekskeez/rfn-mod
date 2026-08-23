package §_-C3A§
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   
   public final class §_-73K§
   {
      
      private static var _instance:§_-73K§ = null;
      
      private var §_-P2u§:Object = {};
      
      private var §_-T2§:Point = new Point();
      
      public function §_-73K§()
      {
         super();
      }
      
      public static function get instance() : §_-73K§
      {
         if(!_instance)
         {
            _instance = new §_-73K§();
         }
         return _instance;
      }
      
      public function §_-tK§(param1:§_-71U§, param2:DisplayObject) : void
      {
         this.§_-P2u§[param1.toString()] = param2;
      }
      
      public function §_-83L§(param1:§_-71U§) : Point
      {
         var _loc2_:* = this.§_-P2u§[param1.toString()];
         this.§_-T2§.setTo(0,0);
         if(_loc2_)
         {
            return (_loc2_ as DisplayObject).localToGlobal(this.§_-T2§);
         }
         return this.§_-T2§;
      }
      
      public function §_-A1R§(param1:§_-71U§) : void
      {
         if(this.§_-P2u§[param1.toString()])
         {
            delete this.§_-P2u§[param1.toString()];
         }
      }
   }
}

