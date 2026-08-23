package starling.display
{
   import §_-kW§.§_-J1k§;
   import flash.display3D.Context3DBlendFactor;
   
   public class BlendMode
   {
      
      public static const AUTO:String = "auto";
      
      public static const NONE:String = "none";
      
      public static const NORMAL:String = "normal";
      
      public static const ADD:String = "add";
      
      public static const §_-M1e§:String = "multiply";
      
      public static const SCREEN:String = "screen";
      
      public static const §_-i2E§:String = "erase";
      
      public static const §_-zX§:String = "mask";
      
      public static const §_-z2d§:String = "below";
      
      private static var §_-n26§:Array = [{
         "none":[Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO],
         "normal":[Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "add":[Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.DESTINATION_ALPHA],
         "multiply":[Context3DBlendFactor.DESTINATION_COLOR,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "screen":[Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE],
         "erase":[Context3DBlendFactor.ZERO,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "mask":[Context3DBlendFactor.ZERO,Context3DBlendFactor.SOURCE_ALPHA],
         "below":[Context3DBlendFactor.ONE_MINUS_DESTINATION_ALPHA,Context3DBlendFactor.DESTINATION_ALPHA]
      },{
         "none":[Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO],
         "normal":[Context3DBlendFactor.ONE,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "add":[Context3DBlendFactor.ONE,Context3DBlendFactor.ONE],
         "multiply":[Context3DBlendFactor.DESTINATION_COLOR,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "screen":[Context3DBlendFactor.ONE,Context3DBlendFactor.ONE_MINUS_SOURCE_COLOR],
         "erase":[Context3DBlendFactor.ZERO,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "mask":[Context3DBlendFactor.ZERO,Context3DBlendFactor.SOURCE_ALPHA],
         "below":[Context3DBlendFactor.ONE_MINUS_DESTINATION_ALPHA,Context3DBlendFactor.DESTINATION_ALPHA]
      }];
      
      public function BlendMode()
      {
         super();
         throw new §_-J1k§();
      }
      
      public static function §_-h2A§(param1:String, param2:Boolean = true) : Array
      {
         var _loc3_:Object = §_-n26§[int(param2)];
         if(param1 in _loc3_)
         {
            return _loc3_[param1];
         }
         throw new ArgumentError("Invalid blend mode");
      }
      
      public static function §_-P2Y§(param1:String, param2:String, param3:String, param4:Boolean = true) : void
      {
         var _loc5_:Object = §_-n26§[int(param4)];
         _loc5_[param1] = [param2,param3];
         var _loc6_:Object = §_-n26§[int(!param4)];
         if(!(param1 in _loc6_))
         {
            _loc6_[param1] = [param2,param3];
         }
      }
   }
}

