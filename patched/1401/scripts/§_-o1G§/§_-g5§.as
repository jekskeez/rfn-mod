package §_-o1G§
{
   import §_-42B§.*;
   import flash.filters.ColorMatrixFilter;
   
   public class §_-g5§ extends §_-31N§
   {
      
      public static const API:Number = 1;
      
      private static var §_-S1x§:Array = [];
      
      protected static var §_-D§:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
      
      protected static var §_-Wf§:Number = 0.212671;
      
      protected static var §_-T20§:Number = 0.71516;
      
      protected static var §_-r1r§:Number = 0.072169;
      
      protected var §_-to§:Array;
      
      protected var §_-Up§:EndArrayPlugin;
      
      public function §_-g5§()
      {
         super();
         this.propName = "colorMatrixFilter";
         this.overwriteProps = ["colorMatrixFilter"];
      }
      
      public static function §_-j2d§(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         var _loc3_:Number = 1 - param2;
         var _loc4_:Number = _loc3_ * §_-Wf§;
         var _loc5_:Number = _loc3_ * §_-T20§;
         var _loc6_:Number = _loc3_ * §_-r1r§;
         var _loc7_:Array = [_loc4_ + param2,_loc5_,_loc6_,0,0,_loc4_,_loc5_ + param2,_loc6_,0,0,_loc4_,_loc5_,_loc6_ + param2,0,0,0,0,0,1,0];
         return §_-02d§(_loc7_,param1);
      }
      
      public static function §_-u1j§(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         param2 *= Math.PI / 180;
         var _loc3_:Number = Math.cos(param2);
         var _loc4_:Number = Math.sin(param2);
         var _loc5_:Array = [§_-Wf§ + _loc3_ * (1 - §_-Wf§) + _loc4_ * -§_-Wf§,§_-T20§ + _loc3_ * -§_-T20§ + _loc4_ * -§_-T20§,§_-r1r§ + _loc3_ * -§_-r1r§ + _loc4_ * (1 - §_-r1r§),0,0,§_-Wf§ + _loc3_ * -§_-Wf§ + _loc4_ * 0.143,§_-T20§ + _loc3_ * (1 - §_-T20§) + _loc4_ * 0.14,§_-r1r§ + _loc3_ * -§_-r1r§ + _loc4_ * -0.283,0,0,§_-Wf§ + _loc3_ * -§_-Wf§ + _loc4_ * -(1 - §_-Wf§),§_-T20§ + _loc3_ * -§_-T20§ + _loc4_ * §_-T20§,§_-r1r§ + _loc3_ * (1 - §_-r1r§) + _loc4_ * §_-r1r§,0,0,0,0,0,1,0,0,0,0,0,1];
         return §_-02d§(_loc5_,param1);
      }
      
      public static function §_-Z13§(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         param2 += 0.01;
         var _loc3_:Array = [param2,0,0,0,128 * (1 - param2),0,param2,0,0,128 * (1 - param2),0,0,param2,0,128 * (1 - param2),0,0,0,1,0];
         return §_-02d§(_loc3_,param1);
      }
      
      public static function §_-02d§(param1:Array, param2:Array) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!(param1 is Array) || !(param2 is Array))
         {
            return param2;
         }
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < 4)
         {
            _loc7_ = 0;
            while(_loc7_ < 5)
            {
               if(_loc7_ == 4)
               {
                  _loc5_ = int(param1[_loc4_ + 4]);
               }
               else
               {
                  _loc5_ = 0;
               }
               _loc3_[_loc4_ + _loc7_] = param1[_loc4_] * param2[_loc7_] + param1[_loc4_ + 1] * param2[_loc7_ + 5] + param1[_loc4_ + 2] * param2[_loc7_ + 10] + param1[_loc4_ + 3] * param2[_loc7_ + 15] + _loc5_;
               _loc7_ += 1;
            }
            _loc4_ += 5;
            _loc6_ += 1;
         }
         return _loc3_;
      }
      
      public static function §_-J22§(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         var _loc3_:Array = [§_-Wf§ * 256,§_-T20§ * 256,§_-r1r§ * 256,0,-256 * param2,§_-Wf§ * 256,§_-T20§ * 256,§_-r1r§ * 256,0,-256 * param2,§_-Wf§ * 256,§_-T20§ * 256,§_-r1r§ * 256,0,-256 * param2,0,0,0,1,0];
         return §_-02d§(_loc3_,param1);
      }
      
      public static function colorize(param1:Array, param2:Number, param3:Number = 1) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         if(isNaN(param3))
         {
            param3 = 1;
         }
         var _loc4_:Number = (param2 >> 16 & 0xFF) / 255;
         var _loc5_:Number = (param2 >> 8 & 0xFF) / 255;
         var _loc6_:Number = (param2 & 0xFF) / 255;
         var _loc7_:Number = 1 - param3;
         var _loc8_:Array = [_loc7_ + param3 * _loc4_ * §_-Wf§,param3 * _loc4_ * §_-T20§,param3 * _loc4_ * §_-r1r§,0,0,param3 * _loc5_ * §_-Wf§,_loc7_ + param3 * _loc5_ * §_-T20§,param3 * _loc5_ * §_-r1r§,0,0,param3 * _loc6_ * §_-Wf§,param3 * _loc6_ * §_-T20§,_loc7_ + param3 * _loc6_ * §_-r1r§,0,0,0,0,0,1,0];
         return §_-02d§(_loc8_,param1);
      }
      
      public static function §_-X1v§(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         param2 = param2 * 100 - 100;
         return §_-02d§([1,0,0,0,param2,0,1,0,0,param2,0,0,1,0,param2,0,0,0,1,0,0,0,0,0,1],param1);
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         §_-w2Z§ = param1;
         _type = ColorMatrixFilter;
         var _loc4_:Object = param2;
         §_-G24§({
            "remove":param2.remove,
            "index":param2.index,
            "addFilter":param2.addFilter
         },new ColorMatrixFilter(§_-D§.slice()),§_-S1x§);
         §_-to§ = ColorMatrixFilter(§_-A2n§).matrix;
         var _loc5_:Array = [];
         if(_loc4_.matrix != null && _loc4_.matrix is Array)
         {
            _loc5_ = _loc4_.matrix;
         }
         else
         {
            if(_loc4_.relative == true)
            {
               _loc5_ = §_-to§.slice();
            }
            else
            {
               _loc5_ = §_-D§.slice();
            }
            _loc5_ = §_-X1v§(_loc5_,_loc4_.brightness);
            _loc5_ = §_-Z13§(_loc5_,_loc4_.contrast);
            _loc5_ = §_-u1j§(_loc5_,_loc4_.hue);
            _loc5_ = §_-j2d§(_loc5_,_loc4_.saturation);
            _loc5_ = §_-J22§(_loc5_,_loc4_.threshold);
            if(!isNaN(_loc4_.colorize))
            {
               _loc5_ = colorize(_loc5_,_loc4_.colorize,_loc4_.amount);
            }
         }
         §_-Up§ = new EndArrayPlugin();
         §_-Up§.init(§_-to§,_loc5_);
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         §_-Up§.changeFactor = param1;
         ColorMatrixFilter(§_-A2n§).matrix = §_-to§;
         super.changeFactor = param1;
      }
   }
}

