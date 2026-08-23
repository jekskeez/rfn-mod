package §_-4I§
{
   import §_-22D§.*;
   
   public class §_-61z§ extends §_-y2R§
   {
      
      public static const API:Number = 1;
      
      protected static const §_-Om§:Number = 57.29577951308232;
      
      protected var §_-u2E§:Object = {};
      
      protected var §_-kq§:Boolean;
      
      protected var §_-yt§:Array;
      
      protected var §_-i1U§:Object;
      
      protected var §_-U1V§:Object;
      
      public function §_-61z§()
      {
         super();
         this.propName = "bezier";
         this.overwriteProps = [];
      }
      
      public static function §_-gS§(param1:Object, param2:Boolean = false) : Object
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
         for(_loc2_ in §_-U1V§)
         {
            if(_loc2_ in param1)
            {
               delete §_-U1V§[_loc2_];
            }
         }
         super.killProps(param1);
      }
      
      protected function init(param1:§_-C2E§, param2:Array, param3:Boolean) : void
      {
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Object = null;
         §_-i1U§ = param1.target;
         var _loc4_:Object = param1.vars.isTV == true ? param1.vars.exposedVars : param1.vars;
         if(_loc4_.orientToBezier == true)
         {
            §_-yt§ = [["x","y","rotation",0,0.01]];
            §_-kq§ = true;
         }
         else if(_loc4_.orientToBezier is Array)
         {
            §_-yt§ = _loc4_.orientToBezier;
            §_-kq§ = true;
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
               param1.§_-b1R§(_loc8_,false);
               delete _loc4_[_loc7_];
            }
         }
         §_-U1V§ = §_-gS§(_loc5_,param3);
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
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
         §_-92o§ = param1;
         if(param1 == 1)
         {
            for(_loc3_ in §_-U1V§)
            {
               _loc2_ = int(§_-U1V§[_loc3_].length - 1);
               §_-i1U§[_loc3_] = §_-U1V§[_loc3_][_loc2_][2];
            }
         }
         else
         {
            for(_loc3_ in §_-U1V§)
            {
               _loc6_ = int(§_-U1V§[_loc3_].length);
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
               _loc4_ = §_-U1V§[_loc3_][_loc2_];
               if(this.round)
               {
                  _loc7_ = _loc4_[0] + _loc5_ * (2 * (1 - _loc5_) * (_loc4_[1] - _loc4_[0]) + _loc5_ * (_loc4_[2] - _loc4_[0]));
                  if(_loc7_ > 0)
                  {
                     §_-i1U§[_loc3_] = _loc7_ + 0.5 >> 0;
                  }
                  else
                  {
                     §_-i1U§[_loc3_] = _loc7_ - 0.5 >> 0;
                  }
               }
               else
               {
                  §_-i1U§[_loc3_] = _loc4_[0] + _loc5_ * (2 * (1 - _loc5_) * (_loc4_[1] - _loc4_[0]) + _loc5_ * (_loc4_[2] - _loc4_[0]));
               }
            }
         }
         if(§_-kq§)
         {
            _loc2_ = int(§_-yt§.length);
            _loc8_ = {};
            while(_loc2_--)
            {
               _loc11_ = §_-yt§[_loc2_];
               _loc8_[_loc11_[0]] = §_-i1U§[_loc11_[0]];
               _loc8_[_loc11_[1]] = §_-i1U§[_loc11_[1]];
            }
            _loc13_ = §_-i1U§;
            _loc14_ = this.round;
            §_-i1U§ = §_-u2E§;
            this.round = false;
            §_-kq§ = false;
            _loc2_ = int(§_-yt§.length);
            while(_loc2_--)
            {
               _loc11_ = §_-yt§[_loc2_];
               this.changeFactor = param1 + (_loc11_[4] || 0.01);
               _loc12_ = Number(Number(_loc11_[3]) || 0);
               _loc9_ = §_-u2E§[_loc11_[0]] - _loc8_[_loc11_[0]];
               _loc10_ = §_-u2E§[_loc11_[1]] - _loc8_[_loc11_[1]];
               _loc13_[_loc11_[2]] = Math.atan2(_loc10_,_loc9_) * §_-Om§ + _loc12_;
            }
            §_-i1U§ = _loc13_;
            this.round = _loc14_;
            §_-kq§ = true;
         }
      }
   }
}

