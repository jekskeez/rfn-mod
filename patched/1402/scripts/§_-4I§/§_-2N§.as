package §_-4I§
{
   import §_-22D§.*;
   import flash.filters.ColorMatrixFilter;
   
   public class §_-2N§ extends §_-qX§
   {
      
      public static const API:Number = 1;
      
      private static var §_-U2M§:Array = [];
      
      protected static var §_-NT§:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
      
      protected static var §_-41e§:Number = 0.212671;
      
      protected static var §_-m2f§:Number = 0.71516;
      
      protected static var §_-a2§:Number = 0.072169;
      
      protected var §_-I2S§:Array;
      
      protected var §_-D2L§:EndArrayPlugin;
      
      public function §_-2N§()
      {
         super();
         this.propName = "colorMatrixFilter";
         this.overwriteProps = ["colorMatrixFilter"];
      }
      
      public static function §_-l2k§(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         var _loc3_:Number = 1 - param2;
         var _loc4_:Number = _loc3_ * §_-41e§;
         var _loc5_:Number = _loc3_ * §_-m2f§;
         var _loc6_:Number = _loc3_ * §_-a2§;
         var _loc7_:Array = [_loc4_ + param2,_loc5_,_loc6_,0,0,_loc4_,_loc5_ + param2,_loc6_,0,0,_loc4_,_loc5_,_loc6_ + param2,0,0,0,0,0,1,0];
         return §_-F22§(_loc7_,param1);
      }
      
      public static function §_-pN§(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         param2 *= Math.PI / 180;
         var _loc3_:Number = Math.cos(param2);
         var _loc4_:Number = Math.sin(param2);
         var _loc5_:Array = [§_-41e§ + _loc3_ * (1 - §_-41e§) + _loc4_ * -§_-41e§,§_-m2f§ + _loc3_ * -§_-m2f§ + _loc4_ * -§_-m2f§,§_-a2§ + _loc3_ * -§_-a2§ + _loc4_ * (1 - §_-a2§),0,0,§_-41e§ + _loc3_ * -§_-41e§ + _loc4_ * 0.143,§_-m2f§ + _loc3_ * (1 - §_-m2f§) + _loc4_ * 0.14,§_-a2§ + _loc3_ * -§_-a2§ + _loc4_ * -0.283,0,0,§_-41e§ + _loc3_ * -§_-41e§ + _loc4_ * -(1 - §_-41e§),§_-m2f§ + _loc3_ * -§_-m2f§ + _loc4_ * §_-m2f§,§_-a2§ + _loc3_ * (1 - §_-a2§) + _loc4_ * §_-a2§,0,0,0,0,0,1,0,0,0,0,0,1];
         return §_-F22§(_loc5_,param1);
      }
      
      public static function §_-m2X§(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         param2 += 0.01;
         var _loc3_:Array = [param2,0,0,0,128 * (1 - param2),0,param2,0,0,128 * (1 - param2),0,0,param2,0,128 * (1 - param2),0,0,0,1,0];
         return §_-F22§(_loc3_,param1);
      }
      
      public static function §_-F22§(param1:Array, param2:Array) : Array
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
      
      public static function §_-X0§(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         var _loc3_:Array = [§_-41e§ * 256,§_-m2f§ * 256,§_-a2§ * 256,0,-256 * param2,§_-41e§ * 256,§_-m2f§ * 256,§_-a2§ * 256,0,-256 * param2,§_-41e§ * 256,§_-m2f§ * 256,§_-a2§ * 256,0,-256 * param2,0,0,0,1,0];
         return §_-F22§(_loc3_,param1);
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
         var _loc8_:Array = [_loc7_ + param3 * _loc4_ * §_-41e§,param3 * _loc4_ * §_-m2f§,param3 * _loc4_ * §_-a2§,0,0,param3 * _loc5_ * §_-41e§,_loc7_ + param3 * _loc5_ * §_-m2f§,param3 * _loc5_ * §_-a2§,0,0,param3 * _loc6_ * §_-41e§,param3 * _loc6_ * §_-m2f§,_loc7_ + param3 * _loc6_ * §_-a2§,0,0,0,0,0,1,0];
         return §_-F22§(_loc8_,param1);
      }
      
      public static function §_-O2§(param1:Array, param2:Number) : Array
      {
         if(isNaN(param2))
         {
            return param1;
         }
         param2 = param2 * 100 - 100;
         return §_-F22§([1,0,0,0,param2,0,1,0,0,param2,0,0,1,0,param2,0,0,0,1,0,0,0,0,0,1],param1);
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         §_-i1U§ = param1;
         _type = ColorMatrixFilter;
         var _loc4_:Object = param2;
         §_-T20§({
            "remove":param2.remove,
            "index":param2.index,
            "addFilter":param2.addFilter
         },new ColorMatrixFilter(§_-NT§.slice()),§_-U2M§);
         §_-I2S§ = ColorMatrixFilter(§_-M2f§).matrix;
         var _loc5_:Array = [];
         if(_loc4_.matrix != null && _loc4_.matrix is Array)
         {
            _loc5_ = _loc4_.matrix;
         }
         else
         {
            if(_loc4_.relative == true)
            {
               _loc5_ = §_-I2S§.slice();
            }
            else
            {
               _loc5_ = §_-NT§.slice();
            }
            _loc5_ = §_-O2§(_loc5_,_loc4_.brightness);
            _loc5_ = §_-m2X§(_loc5_,_loc4_.contrast);
            _loc5_ = §_-pN§(_loc5_,_loc4_.hue);
            _loc5_ = §_-l2k§(_loc5_,_loc4_.saturation);
            _loc5_ = §_-X0§(_loc5_,_loc4_.threshold);
            if(!isNaN(_loc4_.colorize))
            {
               _loc5_ = colorize(_loc5_,_loc4_.colorize,_loc4_.amount);
            }
         }
         §_-D2L§ = new EndArrayPlugin();
         §_-D2L§.init(§_-I2S§,_loc5_);
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         §_-D2L§.changeFactor = param1;
         ColorMatrixFilter(§_-M2f§).matrix = §_-I2S§;
         super.changeFactor = param1;
      }
   }
}

