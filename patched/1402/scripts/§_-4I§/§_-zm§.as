package §_-4I§
{
   import §_-22D§.*;
   
   public class §_-zm§ extends §_-y2R§
   {
      
      public static const API:Number = 1;
      
      protected var §_-12J§:Array;
      
      public function §_-zm§()
      {
         super();
         this.propName = "hexColors";
         this.overwriteProps = [];
         §_-12J§ = [];
      }
      
      override public function killProps(param1:Object) : void
      {
         var _loc2_:* = int(§_-12J§.length - 1);
         while(_loc2_ > -1)
         {
            if(param1[§_-12J§[_loc2_][1]] != undefined)
            {
               §_-12J§.splice(_loc2_,1);
            }
            _loc2_--;
         }
         super.killProps(param1);
      }
      
      public function §_-vS§(param1:Object, param2:String, param3:uint, param4:uint) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(param3 != param4)
         {
            _loc5_ = param3 >> 16;
            _loc6_ = param3 >> 8 & 0xFF;
            _loc7_ = param3 & 0xFF;
            §_-12J§[§_-12J§.length] = [param1,param2,_loc5_,(param4 >> 16) - _loc5_,_loc6_,(param4 >> 8 & 0xFF) - _loc6_,_loc7_,(param4 & 0xFF) - _loc7_];
            this.overwriteProps[this.overwriteProps.length] = param2;
         }
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc3_:Array = null;
         var _loc2_:int = int(§_-12J§.length);
         while(--_loc2_ > -1)
         {
            _loc3_ = §_-12J§[_loc2_];
            _loc3_[0][_loc3_[1]] = _loc3_[2] + param1 * _loc3_[3] << 16 | _loc3_[4] + param1 * _loc3_[5] << 8 | _loc3_[6] + param1 * _loc3_[7];
         }
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         var _loc4_:String = null;
         for(_loc4_ in param2)
         {
            §_-vS§(param1,_loc4_,uint(param1[_loc4_]),uint(param2[_loc4_]));
         }
         return true;
      }
   }
}

