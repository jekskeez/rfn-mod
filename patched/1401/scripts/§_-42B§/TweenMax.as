package §_-42B§
{
   import §_-B3g§.§_-51C§;
   import §_-bQ§.*;
   import §_-o1G§.*;
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class TweenMax extends §_-y2k§ implements IEventDispatcher
   {
      
      public static const version:Number = 11.68;
      
      private static var §_-i1d§:int = §_-IW§.enabled ? §_-IW§.mode : §_-IW§.init(2);
      
      public static var §_-R1Q§:Function = §_-y2k§.§_-R1Q§;
      
      public static var §_-g1x§:Function = §_-y2k§.§_-R1Q§;
      
      §_-J21§.activate([§_-V2p§,EndArrayPlugin,§_-V2F§,§_-eR§,§_-x2w§,§_-V1B§,§_-I1Q§,§_-Bi§,§_-d1r§,§_-nN§,§_-y1u§,§_-g5§,§_-x2c§,§_-Ys§,§_-T1F§,§_-f2G§,§_-R1x§,§_-315§,§_-B1U§,{}]);
      
      protected var §_-D2r§:int = 0;
      
      protected var §_-D1e§:EventDispatcher;
      
      protected var §_-B2H§:Boolean;
      
      protected var §_-Id§:int;
      
      protected var §_-q2W§:Number = 0;
      
      public var yoyo:Boolean;
      
      protected var §_-Q2f§:int;
      
      protected var §_-m2T§:int = 0;
      
      public function TweenMax(param1:Object, param2:Number, param3:Object)
      {
         super(param1,param2,param3);
         if(§_-y2k§.version < 11.2)
         {
            throw new Error("TweenMax error! Please update your TweenLite class or try deleting your ASO files. TweenMax requires a more recent version. Download updates at http://www.TweenMax.com.");
         }
         this.yoyo = Boolean(this.vars.yoyo);
         §_-m2T§ = uint(this.vars.repeat);
         §_-q2W§ = this.vars.repeatDelay ? Number(this.vars.repeatDelay) : 0;
         this.§_-BL§ = true;
         if(Boolean(this.vars.onCompleteListener) || Boolean(this.vars.onInitListener) || Boolean(this.vars.onUpdateListener) || Boolean(this.vars.onStartListener) || Boolean(this.vars.onRepeatListener) || Boolean(this.vars.onReverseCompleteListener))
         {
            §_-R19§();
            if(param2 == 0 && §_-lt§ == 0)
            {
               §_-D1e§.dispatchEvent(new §_-51C§(§_-51C§.UPDATE));
               §_-D1e§.dispatchEvent(new §_-51C§(§_-51C§.COMPLETE));
            }
         }
         if(Boolean(this.vars.timeScale) && !(this.target is §_-lH§))
         {
            this.§_-L1l§ = this.vars.timeScale;
         }
      }
      
      public static function set §_-he§(param1:Number) : void
      {
         if(param1 == 0)
         {
            param1 = 0.0001;
         }
         if(§_-y2k§.§_-Q1i§ == null)
         {
            §_-y2k§.to({},0,{});
         }
         var _loc2_:§_-72V§ = §_-y2k§.§_-Q1i§;
         var _loc3_:Number = getTimer() * 0.001;
         _loc2_.§_-hT§ = _loc3_ - (_loc3_ - _loc2_.§_-hT§) * _loc2_.§_-L1l§ / param1;
         _loc2_ = §_-y2k§.§_-Q2C§;
         _loc3_ = §_-y2k§.§_-j1Z§;
         _loc2_.§_-hT§ = _loc3_ - (_loc3_ - _loc2_.§_-hT§) * _loc2_.§_-L1l§ / param1;
         §_-y2k§.§_-Q2C§.§_-L1l§ = §_-y2k§.§_-Q1i§.§_-L1l§ = param1;
      }
      
      public static function §_-x1n§(param1:Object, param2:Number, param3:Object, param4:Object) : TweenMax
      {
         param4.startAt = param3;
         if(param3.immediateRender)
         {
            param4.immediateRender = true;
         }
         return new TweenMax(param1,param2,param4);
      }
      
      public static function §_-CE§(param1:Array, param2:Number, param3:Object, param4:Object, param5:Number = 0, param6:Function = null, param7:Array = null) : Array
      {
         param4.startAt = param3;
         if(param3.immediateRender)
         {
            param4.immediateRender = true;
         }
         return §_-Y2O§(param1,param2,param4,param5,param6,param7);
      }
      
      public static function §_-77§(param1:Boolean = true, param2:Boolean = true) : void
      {
         §_-1Y§(true,param1,param2);
      }
      
      public static function §_-L2d§(param1:Object) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc2_:Array = §_-R25§[param1];
         var _loc3_:Array = [];
         if(_loc2_)
         {
            _loc4_ = int(_loc2_.length);
            _loc5_ = 0;
            while(--_loc4_ > -1)
            {
               if(!§_-y2k§(_loc2_[_loc4_]).gc)
               {
                  _loc3_[_loc5_++] = _loc2_[_loc4_];
               }
            }
         }
         return _loc3_;
      }
      
      public static function get §_-he§() : Number
      {
         return §_-y2k§.§_-Q1i§ == null ? 1 : §_-y2k§.§_-Q1i§.§_-L1l§;
      }
      
      public static function §_-Y2g§(param1:DisplayObjectContainer, param2:Boolean = false) : void
      {
         var _loc4_:Object = null;
         var _loc5_:DisplayObjectContainer = null;
         var _loc3_:Array = §_-h2a§();
         var _loc6_:int = int(_loc3_.length);
         while(--_loc6_ > -1)
         {
            _loc4_ = _loc3_[_loc6_].target;
            if(_loc4_ is DisplayObject)
            {
               _loc5_ = _loc4_.parent;
               while(_loc5_)
               {
                  if(_loc5_ == param1)
                  {
                     if(param2)
                     {
                        _loc3_[_loc6_].complete(false);
                     }
                     else
                     {
                        _loc3_[_loc6_].setEnabled(false,false);
                     }
                  }
                  _loc5_ = _loc5_.parent;
               }
            }
         }
      }
      
      public static function §_-8Q§(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : TweenMax
      {
         return new TweenMax(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "immediateRender":false,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      public static function §_-k2u§(param1:Object) : Boolean
      {
         var _loc4_:§_-y2k§ = null;
         var _loc2_:Array = §_-L2d§(param1);
         var _loc3_:int = int(_loc2_.length);
         while(--_loc3_ > -1)
         {
            _loc4_ = _loc2_[_loc3_];
            if(_loc4_.active || _loc4_.§_-hT§ == _loc4_.timeline.§_-b1T§ && _loc4_.timeline.active)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function §_-q2i§(param1:Boolean = false, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc5_:Boolean = false;
         var _loc4_:Array = §_-h2a§();
         var _loc6_:int = int(_loc4_.length);
         while(--_loc6_ > -1)
         {
            _loc5_ = _loc4_[_loc6_].target == _loc4_[_loc6_].vars.onComplete;
            if(_loc5_ == param3 || _loc5_ != param2)
            {
               if(param1)
               {
                  _loc4_[_loc6_].complete(false);
               }
               else
               {
                  _loc4_[_loc6_].setEnabled(false,false);
               }
            }
         }
      }
      
      private static function §_-1Y§(param1:Boolean, param2:Boolean = true, param3:Boolean = false) : void
      {
         var _loc5_:Boolean = false;
         var _loc4_:Array = §_-h2a§();
         var _loc6_:int = int(_loc4_.length);
         while(--_loc6_ > -1)
         {
            _loc5_ = §_-y2k§(_loc4_[_loc6_]).target == §_-y2k§(_loc4_[_loc6_]).vars.onComplete;
            if(_loc5_ == param3 || _loc5_ != param2)
            {
               §_-lH§(_loc4_[_loc6_]).paused = param1;
            }
         }
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : TweenMax
      {
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return new TweenMax(param1,param2,param3);
      }
      
      public static function §_-a2I§(param1:Array, param2:Number, param3:Object, param4:Number = 0, param5:Function = null, param6:Array = null) : Array
      {
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return §_-Y2O§(param1,param2,param3,param4,param5,param6);
      }
      
      public static function §_-h2a§() : Array
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc1_:Dictionary = §_-R25§;
         var _loc2_:* = 0;
         var _loc3_:Array = [];
         for each(_loc4_ in _loc1_)
         {
            _loc5_ = int(_loc4_.length);
            while(--_loc5_ > -1)
            {
               if(!§_-y2k§(_loc4_[_loc5_]).gc)
               {
                  _loc3_[_loc2_++] = _loc4_[_loc5_];
               }
            }
         }
         return _loc3_;
      }
      
      public static function §_-E1X§(param1:Boolean = true, param2:Boolean = true) : void
      {
         §_-1Y§(false,param1,param2);
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : TweenMax
      {
         return new TweenMax(param1,param2,param3);
      }
      
      public static function §_-Y2O§(param1:Array, param2:Number, param3:Object, param4:Number = 0, param5:Function = null, param6:Array = null) : Array
      {
         var lastIndex:int;
         var curDelay:Number;
         var i:int = 0;
         var varsDup:Object = null;
         var p:String = null;
         var onCompleteProxy:Function = null;
         var onCompleteParamsProxy:Array = null;
         var targets:Array = param1;
         var duration:Number = param2;
         var vars:Object = param3;
         var stagger:Number = param4;
         var onCompleteAll:Function = param5;
         var onCompleteAllParams:Array = param6;
         var l:int = int(targets.length);
         var a:Array = [];
         if(vars.isGSVars)
         {
            vars = vars.vars;
         }
         curDelay = "delay" in vars ? Number(vars.delay) : 0;
         onCompleteProxy = vars.onComplete;
         onCompleteParamsProxy = vars.onCompleteParams;
         lastIndex = l - 1;
         i = 0;
         while(i < l)
         {
            varsDup = {};
            for(p in vars)
            {
               varsDup[p] = vars[p];
            }
            varsDup.delay = curDelay;
            if(i == lastIndex && onCompleteAll != null)
            {
               varsDup.onComplete = function():void
               {
                  if(onCompleteProxy != null)
                  {
                     onCompleteProxy.apply(null,onCompleteParamsProxy);
                  }
                  onCompleteAll.apply(null,onCompleteAllParams);
               };
            }
            a[i] = new TweenMax(targets[i],duration,varsDup);
            curDelay += stagger;
            i += 1;
         }
         return a;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return §_-D1e§ == null ? false : §_-D1e§.dispatchEvent(param1);
      }
      
      public function set timeScale(param1:Number) : void
      {
         if(param1 == 0)
         {
            param1 = 0.0001;
         }
         var _loc2_:Number = Boolean(this.§_-v2s§) || this.§_-v2s§ == 0 ? this.§_-v2s§ : this.timeline.§_-63E§;
         this.§_-hT§ = _loc2_ - (_loc2_ - this.§_-hT§) * this.§_-L1l§ / param1;
         this.§_-L1l§ = param1;
         §_-g2G§(false);
      }
      
      override public function §_-m1b§(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc4_:Number = this.§_-BL§ ? this.totalDuration : this.§_-n1P§;
         var _loc5_:Number = this.§_-63E§;
         if(param1 >= _loc4_)
         {
            this.§_-63E§ = _loc4_;
            this.§_-b1T§ = this.§_-N18§;
            this.ratio = 1;
            _loc6_ = true;
            if(this.§_-N18§ == 0)
            {
               if((param1 == 0 || §_-23h§ < 0) && §_-23h§ != param1)
               {
                  param3 = true;
               }
               §_-23h§ = param1;
            }
         }
         else if(param1 <= 0)
         {
            if(param1 < 0)
            {
               this.active = false;
               if(this.§_-N18§ == 0)
               {
                  if(§_-23h§ >= 0)
                  {
                     param3 = true;
                     _loc6_ = true;
                  }
                  §_-23h§ = param1;
               }
            }
            else if(param1 == 0 && !this.§_-w2X§)
            {
               param3 = true;
            }
            this.§_-63E§ = this.§_-b1T§ = this.ratio = 0;
            if(this.§_-xA§ && _loc5_ != 0)
            {
               _loc6_ = true;
            }
         }
         else
         {
            this.§_-63E§ = this.§_-b1T§ = param1;
            _loc8_ = true;
         }
         if(§_-m2T§ != 0)
         {
            _loc10_ = this.§_-N18§ + §_-q2W§;
            _loc11_ = §_-D2r§;
            §_-D2r§ = this.§_-63E§ / _loc10_ >> 0;
            if(§_-D2r§ == this.§_-63E§ / _loc10_)
            {
               --§_-D2r§;
            }
            if(_loc11_ != §_-D2r§)
            {
               _loc7_ = true;
            }
            if(_loc6_)
            {
               if(this.yoyo && Boolean(§_-m2T§ % 2))
               {
                  this.§_-b1T§ = this.ratio = 0;
               }
            }
            else if(param1 > 0)
            {
               this.§_-b1T§ = (this.§_-63E§ / _loc10_ - §_-D2r§) * _loc10_;
               if(this.yoyo && Boolean(§_-D2r§ % 2))
               {
                  this.§_-b1T§ = this.§_-N18§ - this.§_-b1T§;
               }
               else if(this.§_-b1T§ >= this.§_-N18§)
               {
                  this.§_-b1T§ = this.§_-N18§;
                  this.ratio = 1;
                  _loc8_ = false;
               }
               if(this.§_-b1T§ <= 0)
               {
                  this.§_-b1T§ = this.ratio = 0;
                  _loc8_ = false;
               }
            }
            else
            {
               §_-D2r§ = 0;
            }
         }
         if(_loc5_ == this.§_-63E§ && !param3)
         {
            return;
         }
         if(!this.§_-w2X§)
         {
            init();
         }
         if(!this.active && !this.§_-Np§)
         {
            this.active = true;
         }
         if(_loc8_)
         {
            if(§_-Id§)
            {
               _loc12_ = §_-Q2f§;
               _loc13_ = this.§_-b1T§ / this.§_-N18§;
               if(§_-Id§ == 2)
               {
                  this.ratio = _loc13_ = 1 - _loc13_;
                  while(--_loc12_ > -1)
                  {
                     this.ratio = _loc13_ * this.ratio;
                  }
                  this.ratio = 1 - this.ratio;
               }
               else if(§_-Id§ == 1)
               {
                  this.ratio = _loc13_;
                  while(--_loc12_ > -1)
                  {
                     this.ratio = _loc13_ * this.ratio;
                  }
               }
               else if(_loc13_ < 0.5)
               {
                  this.ratio = _loc13_ = _loc13_ * 2;
                  while(--_loc12_ > -1)
                  {
                     this.ratio = _loc13_ * this.ratio;
                  }
                  this.ratio *= 0.5;
               }
               else
               {
                  this.ratio = _loc13_ = (1 - _loc13_) * 2;
                  while(--_loc12_ > -1)
                  {
                     this.ratio = _loc13_ * this.ratio;
                  }
                  this.ratio = 1 - 0.5 * this.ratio;
               }
            }
            else
            {
               this.ratio = §_-g2t§(this.§_-b1T§,0,1,this.§_-N18§);
            }
         }
         if(_loc5_ == 0 && (this.§_-63E§ != 0 || this.§_-N18§ == 0) && !param2)
         {
            if(this.vars.onStart)
            {
               this.vars.onStart.apply(null,this.vars.onStartParams);
            }
            if(§_-D1e§)
            {
               §_-D1e§.dispatchEvent(new §_-51C§(§_-51C§.START));
            }
         }
         var _loc9_:§_-f§ = this.§_-t1b§;
         while(_loc9_)
         {
            _loc9_.target[_loc9_.§_-w26§] = _loc9_.start + this.ratio * _loc9_.change;
            _loc9_ = _loc9_.nextNode;
         }
         if(§_-eb§ && !param2)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(§_-B2H§ && !param2)
         {
            §_-D1e§.dispatchEvent(new §_-51C§(§_-51C§.UPDATE));
         }
         if(_loc7_ && !param2 && !this.gc)
         {
            if(this.vars.onRepeat)
            {
               this.vars.onRepeat.apply(null,this.vars.onRepeatParams);
            }
            if(§_-D1e§)
            {
               §_-D1e§.dispatchEvent(new §_-51C§(§_-51C§.§_-B3X§));
            }
         }
         if(_loc6_ && !this.gc)
         {
            if(§_-K1W§ && Boolean(this.§_-t1b§))
            {
               §_-KR§("onComplete",this);
            }
            complete(true,param2);
         }
      }
      
      override public function set totalDuration(param1:Number) : void
      {
         if(§_-m2T§ == -1)
         {
            return;
         }
         this.duration = (param1 - §_-m2T§ * §_-q2W§) / (§_-m2T§ + 1);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(§_-D1e§ == null)
         {
            §_-R19§();
         }
         if(param1 == §_-51C§.UPDATE)
         {
            §_-B2H§ = true;
         }
         §_-D1e§.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override protected function init() : void
      {
         var _loc1_:TweenMax = null;
         if(this.vars.startAt)
         {
            this.vars.startAt.overwrite = 0;
            this.vars.startAt.immediateRender = true;
            _loc1_ = new TweenMax(this.target,0,this.vars.startAt);
         }
         if(§_-D1e§)
         {
            §_-D1e§.dispatchEvent(new §_-51C§(§_-51C§.INIT));
         }
         super.init();
         if(§_-g2t§ in §_-03K§)
         {
            §_-Id§ = §_-03K§[§_-g2t§][0];
            §_-Q2f§ = §_-03K§[§_-g2t§][1];
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(§_-D1e§)
         {
            §_-D1e§.removeEventListener(param1,param2,param3);
         }
      }
      
      public function §_-Q16§(param1:String, param2:*, param3:Boolean = true) : void
      {
         var _loc4_:Object = {};
         _loc4_[param1] = param2;
         §_-x1d§(_loc4_,!param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return §_-D1e§ == null ? false : §_-D1e§.willTrigger(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return §_-D1e§ == null ? false : §_-D1e§.hasEventListener(param1);
      }
      
      protected function §_-R19§() : void
      {
         if(§_-D1e§ == null)
         {
            §_-D1e§ = new EventDispatcher(this);
         }
         if(this.vars.onInitListener is Function)
         {
            §_-D1e§.addEventListener(§_-51C§.INIT,this.vars.onInitListener,false,0,true);
         }
         if(this.vars.onStartListener is Function)
         {
            §_-D1e§.addEventListener(§_-51C§.START,this.vars.onStartListener,false,0,true);
         }
         if(this.vars.onUpdateListener is Function)
         {
            §_-D1e§.addEventListener(§_-51C§.UPDATE,this.vars.onUpdateListener,false,0,true);
            §_-B2H§ = true;
         }
         if(this.vars.onCompleteListener is Function)
         {
            §_-D1e§.addEventListener(§_-51C§.COMPLETE,this.vars.onCompleteListener,false,0,true);
         }
         if(this.vars.onRepeatListener is Function)
         {
            §_-D1e§.addEventListener(§_-51C§.§_-B3X§,this.vars.onRepeatListener,false,0,true);
         }
         if(this.vars.onReverseCompleteListener is Function)
         {
            §_-D1e§.addEventListener(§_-51C§.§_-Jg§,this.vars.onReverseCompleteListener,false,0,true);
         }
      }
      
      public function set §_-1M§(param1:Number) : void
      {
         if(§_-D2r§ == 0)
         {
            §_-O2A§(this.duration * param1,false);
         }
         else
         {
            §_-O2A§(this.duration * param1 + §_-D2r§ * this.§_-N18§,false);
         }
      }
      
      public function get §_-Q1w§() : Number
      {
         return this.§_-63E§ / this.totalDuration;
      }
      
      public function set §_-Q1w§(param1:Number) : void
      {
         §_-O2A§(this.totalDuration * param1,false);
      }
      
      public function §_-x1d§(param1:Object, param2:Boolean = false) : void
      {
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:§_-f§ = null;
         var _loc8_:Number = NaN;
         var _loc3_:Number = this.ratio;
         if(param2 && this.timeline != null && this.§_-hT§ < this.timeline.§_-b1T§)
         {
            this.§_-hT§ = this.timeline.§_-b1T§;
            this.§_-g2G§(false);
            if(this.gc)
            {
               this.setEnabled(true,false);
            }
            else
            {
               this.timeline.insert(this,this.§_-hT§ - §_-lt§);
            }
         }
         for(_loc4_ in param1)
         {
            this.vars[_loc4_] = param1[_loc4_];
         }
         if(this.§_-w2X§)
         {
            if(param2)
            {
               this.§_-w2X§ = false;
            }
            else
            {
               if(§_-C38§ && Boolean(this.§_-t1b§))
               {
                  §_-KR§("onDisable",this);
               }
               if(this.§_-b1T§ / this.§_-N18§ > 0.998)
               {
                  _loc5_ = this.§_-b1T§;
                  this.§_-m1b§(0,true,false);
                  this.§_-w2X§ = false;
                  this.§_-m1b§(_loc5_,true,false);
               }
               else if(this.§_-b1T§ > 0)
               {
                  this.§_-w2X§ = false;
                  init();
                  _loc6_ = 1 / (1 - _loc3_);
                  _loc7_ = this.§_-t1b§;
                  while(_loc7_)
                  {
                     _loc8_ = _loc7_.start + _loc7_.change;
                     _loc7_.change *= _loc6_;
                     _loc7_.start = _loc8_ - _loc7_.change;
                     _loc7_ = _loc7_.nextNode;
                  }
               }
            }
         }
      }
      
      public function get §_-1M§() : Number
      {
         return this.§_-b1T§ / this.duration;
      }
      
      public function get repeat() : int
      {
         return §_-m2T§;
      }
      
      override public function set currentTime(param1:Number) : void
      {
         if(§_-D2r§ != 0)
         {
            if(this.yoyo && §_-D2r§ % 2 == 1)
            {
               param1 = this.duration - param1 + §_-D2r§ * (this.§_-N18§ + §_-q2W§);
            }
            else
            {
               param1 += §_-D2r§ * (this.duration + §_-q2W§);
            }
         }
         §_-O2A§(param1,false);
      }
      
      public function get repeatDelay() : Number
      {
         return §_-q2W§;
      }
      
      public function §_-61e§(param1:Array) : void
      {
         var _loc2_:Object = {};
         var _loc3_:int = int(param1.length);
         while(--_loc3_ > -1)
         {
            _loc2_[param1[_loc3_]] = true;
         }
         §_-d1R§(_loc2_);
      }
      
      public function set repeatDelay(param1:Number) : void
      {
         §_-q2W§ = param1;
         §_-g2G§(true);
      }
      
      public function set repeat(param1:int) : void
      {
         §_-m2T§ = param1;
         §_-g2G§(true);
      }
      
      override public function complete(param1:Boolean = false, param2:Boolean = false) : void
      {
         super.complete(param1,param2);
         if(!param2 && Boolean(§_-D1e§))
         {
            if(this.§_-63E§ == this.§_-n1P§ && !this.§_-xA§)
            {
               §_-D1e§.dispatchEvent(new §_-51C§(§_-51C§.COMPLETE));
            }
            else if(this.§_-xA§ && this.§_-63E§ == 0)
            {
               §_-D1e§.dispatchEvent(new §_-51C§(§_-51C§.§_-Jg§));
            }
         }
      }
      
      override public function invalidate() : void
      {
         this.yoyo = Boolean(this.vars.yoyo == true);
         §_-m2T§ = this.vars.repeat ? int(Number(this.vars.repeat)) : 0;
         §_-q2W§ = this.vars.repeatDelay ? Number(this.vars.repeatDelay) : 0;
         §_-B2H§ = false;
         if(this.vars.onCompleteListener != null || this.vars.onUpdateListener != null || this.vars.onStartListener != null)
         {
            §_-R19§();
         }
         §_-g2G§(true);
         super.invalidate();
      }
      
      public function get timeScale() : Number
      {
         return this.§_-L1l§;
      }
      
      override public function get totalDuration() : Number
      {
         if(this.§_-BL§)
         {
            this.§_-n1P§ = §_-m2T§ == -1 ? 999999999999 : this.§_-N18§ * (§_-m2T§ + 1) + §_-q2W§ * §_-m2T§;
            this.§_-BL§ = false;
         }
         return this.§_-n1P§;
      }
   }
}

