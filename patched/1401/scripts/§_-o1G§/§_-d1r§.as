package §_-o1G§
{
   import §_-42B§.*;
   
   public class §_-d1r§ extends §_-J21§
   {
      
      public static const API:Number = 1;
      
      protected static const §_-lw§:Number = 57.29577951308232;
      
      protected var §_-71O§:Object = {};
      
      protected var §_-lI§:Boolean;
      
      protected var §_-l2§:Array;
      
      protected var §_-w2Z§:Object;
      
      protected var §_-q1B§:Object;
      
      public function §_-d1r§()
      {
         super();
         this.propName = "bezier";
         this.overwriteProps = [];
      }
      
      public static function §_-33b§(param1:Object, param2:Boolean = false) : Object
      {
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:Object = {};
         if(param2)
         {
            for(_loc6_ in param1)
            {
               _loc4_ = param1[_loc6_];
               _loc7_[_loc6_] = _loc5_ = [];
               if(_loc4_.length > 2)
               {
                  _loc5_[_loc5_.length] = [_loc4_[0],_loc4_[1] - (_loc4_[2] - _loc4_[0]) / 4,_loc4_[1]];
                  _loc3_ = 1;
                  while(_loc3_ < _loc4_.length - 1)
                  {
                     _loc5_[_loc5_.length] = [_loc4_[_loc3_],_loc4_[_loc3_] + (_loc4_[_loc3_] - _loc5_[_loc3_ - 1][1]),_loc4_[_loc3_ + 1]];
                     _loc3_ += 1;
                  }
               }
               else
               {
                  _loc5_[_loc5_.length] = [_loc4_[0],(_loc4_[0] + _loc4_[1]) / 2,_loc4_[1]];
               }
            }
         }
         else
         {
            for(_loc6_ in param1)
            {
               _loc4_ = param1[_loc6_];
               _loc7_[_loc6_] = _loc5_ = [];
               if(_loc4_.length > 3)
               {
                  _loc5_[_loc5_.length] = [_loc4_[0],_loc4_[1],(_loc4_[1] + _loc4_[2]) / 2];
                  _loc3_ = 2;
                  while(_loc3_ < _loc4_.length - 2)
                  {
                     _loc5_[_loc5_.length] = [_loc5_[_loc3_ - 2][2],_loc4_[_loc3_],(_loc4_[_loc3_] + _loc4_[_loc3_ + 1]) / 2];
                     _loc3_ += 1;
                  }
                  _loc5_[_loc5_.length] = [_loc5_[_loc5_.length - 1][2],_loc4_[_loc4_.length - 2],_loc4_[_loc4_.length - 1]];
               }
               else if(_loc4_.length == 3)
               {
                  _loc5_[_loc5_.length] = [_loc4_[0],_loc4_[1],_loc4_[2]];
               }
               else if(_loc4_.length == 2)
               {
                  _loc5_[_loc5_.length] = [_loc4_[0],(_loc4_[0] + _loc4_[1]) / 2,_loc4_[1]];
               }
            }
         }
         return _loc7_;
      }
      
      override public function killProps(param1:Object) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in §_-q1B§)
         {
            if(_loc2_ in param1)
            {
               delete §_-q1B§[_loc2_];
            }
         }
         super.killProps(param1);
      }
      
      protected function init(param1:§_-y2k§, param2:Array, param3:Boolean) : void
      {
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Object = null;
         §_-w2Z§ = param1.target;
         var _loc4_:Object = param1.vars.isTV == true ? param1.vars.exposedVars : param1.vars;
         if(_loc4_.orientToBezier == true)
         {
            §_-l2§ = [["x","y","rotation",0,0.01]];
            §_-lI§ = true;
         }
         else if(_loc4_.orientToBezier is Array)
         {
            §_-l2§ = _loc4_.orientToBezier;
            §_-lI§ = true;
         }
         var _loc5_:Object = {};
         _loc6_ = 0;
         while(_loc6_ < param2.length)
         {
            for(_loc7_ in param2[_loc6_])
            {
               if(_loc5_[_loc7_] == undefined)
               {
                  _loc5_[_loc7_] = [param1.target[_loc7_]];
               }
               if(typeof param2[_loc6_][_loc7_] == "number")
               {
                  _loc5_[_loc7_].push(param2[_loc6_][_loc7_]);
               }
               else
               {
                  _loc5_[_loc7_].push(param1.target[_loc7_] + Number(param2[_loc6_][_loc7_]));
               }
            }
            _loc6_ += 1;
         }
         for(_loc7_ in _loc5_)
         {
            this.overwriteProps[this.overwriteProps.length] = _loc7_;
            if(_loc4_[_loc7_] != undefined)
            {
               if(typeof _loc4_[_loc7_] == "number")
               {
                  _loc5_[_loc7_].push(_loc4_[_loc7_]);
               }
               else
               {
                  _loc5_[_loc7_].push(param1.target[_loc7_] + Number(_loc4_[_loc7_]));
               }
               _loc8_ = {};
               _loc8_[_loc7_] = true;
               param1.§_-d1R§(_loc8_,false);
               delete _loc4_[_loc7_];
            }
         }
         §_-q1B§ = §_-33b§(_loc5_,param3);
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         if(!(param2 is Array))
         {
            return false;
         }
         init(param3,param2 as Array,false);
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc2_:* = 0;
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Object = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Array = null;
         var _loc12_:Number = NaN;
         var _loc13_:Object = null;
         var _loc14_:Boolean = false;
         §_-h1q§ = param1;
         if(param1 == 1)
         {
            for(_loc3_ in §_-q1B§)
            {
               _loc2_ = int(§_-q1B§[_loc3_].length - 1);
               §_-w2Z§[_loc3_] = §_-q1B§[_loc3_][_loc2_][2];
            }
         }
         else
         {
            for(_loc3_ in §_-q1B§)
            {
               _loc6_ = int(§_-q1B§[_loc3_].length);
               if(param1 < 0)
               {
                  _loc2_ = 0;
               }
               else if(param1 >= 1)
               {
                  _loc2_ = int(_loc6_ - 1);
               }
               else
               {
                  _loc2_ = _loc6_ * param1 >> 0;
               }
               _loc5_ = (param1 - _loc2_ * (1 / _loc6_)) * _loc6_;
               _loc4_ = §_-q1B§[_loc3_][_loc2_];
               if(this.round)
               {
                  _loc7_ = _loc4_[0] + _loc5_ * (2 * (1 - _loc5_) * (_loc4_[1] - _loc4_[0]) + _loc5_ * (_loc4_[2] - _loc4_[0]));
                  if(_loc7_ > 0)
                  {
                     §_-w2Z§[_loc3_] = _loc7_ + 0.5 >> 0;
                  }
                  else
                  {
                     §_-w2Z§[_loc3_] = _loc7_ - 0.5 >> 0;
                  }
               }
               else
               {
                  §_-w2Z§[_loc3_] = _loc4_[0] + _loc5_ * (2 * (1 - _loc5_) * (_loc4_[1] - _loc4_[0]) + _loc5_ * (_loc4_[2] - _loc4_[0]));
               }
            }
         }
         if(§_-lI§)
         {
            _loc2_ = int(§_-l2§.length);
            _loc8_ = {};
            while(_loc2_--)
            {
               _loc11_ = §_-l2§[_loc2_];
               _loc8_[_loc11_[0]] = §_-w2Z§[_loc11_[0]];
               _loc8_[_loc11_[1]] = §_-w2Z§[_loc11_[1]];
            }
            _loc13_ = §_-w2Z§;
            _loc14_ = this.round;
            §_-w2Z§ = §_-71O§;
            this.round = false;
            §_-lI§ = false;
            _loc2_ = int(§_-l2§.length);
            while(_loc2_--)
            {
               _loc11_ = §_-l2§[_loc2_];
               this.changeFactor = param1 + (_loc11_[4] || 0.01);
               _loc12_ = Number(Number(_loc11_[3]) || 0);
               _loc9_ = §_-71O§[_loc11_[0]] - _loc8_[_loc11_[0]];
               _loc10_ = §_-71O§[_loc11_[1]] - _loc8_[_loc11_[1]];
               _loc13_[_loc11_[2]] = Math.atan2(_loc10_,_loc9_) * §_-lw§ + _loc12_;
            }
            §_-w2Z§ = _loc13_;
            this.round = _loc14_;
            §_-lI§ = true;
         }
      }
   }
}

