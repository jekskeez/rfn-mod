package §_-22D§
{
   import §_-4I§.*;
   import §_-Z1Y§.§_-111§;
   import §_-y1E§.*;
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class TweenMax extends §_-C2E§ implements IEventDispatcher
   {
      
      public static const version:Number = 11.68;
      
      private static var §_-V1P§:int = §_-P5§.enabled ? §_-P5§.mode : §_-P5§.init(2);
      
      public static var §_-q29§:Function = §_-C2E§.§_-q29§;
      
      public static var §_-y2w§:Function = §_-C2E§.§_-q29§;
      
      §_-y2R§.activate([§_-v1m§,EndArrayPlugin,§_-53I§,§_-H2S§,§_-dr§,§_-NN§,§_-vD§,§_-F1e§,§_-61z§,§_-h2C§,§_-o1P§,§_-2N§,§_-E5§,§_-H1b§,§_-Lb§,§_-7b§,§_-zm§,§_-lc§,§_-B1x§,{}]);
      
      protected var §_-g12§:int = 0;
      
      protected var §_-E16§:EventDispatcher;
      
      protected var §_-k1C§:Boolean;
      
      protected var §_-w2t§:int;
      
      protected var §_-52f§:Number = 0;
      
      public var yoyo:Boolean;
      
      protected var §_-S2u§:int;
      
      protected var §_-42K§:int = 0;
      
      public function TweenMax(param1:Object, param2:Number, param3:Object)
      {
         super(param1,param2,param3);
         if(§_-C2E§.version < 11.2)
         {
            throw new Error("TweenMax error! Please update your TweenLite class or try deleting your ASO files. TweenMax requires a more recent version. Download updates at http://www.TweenMax.com.");
         }
         this.yoyo = Boolean(this.vars.yoyo);
         §_-42K§ = uint(this.vars.repeat);
         §_-52f§ = this.vars.repeatDelay ? Number(this.vars.repeatDelay) : 0;
         this.§_-hz§ = true;
         if(Boolean(this.vars.onCompleteListener) || Boolean(this.vars.onInitListener) || Boolean(this.vars.onUpdateListener) || Boolean(this.vars.onStartListener) || Boolean(this.vars.onRepeatListener) || Boolean(this.vars.onReverseCompleteListener))
         {
            §_-P2F§();
            if(param2 == 0 && §_-eZ§ == 0)
            {
               §_-E16§.dispatchEvent(new §_-111§(§_-111§.UPDATE));
               §_-E16§.dispatchEvent(new §_-111§(§_-111§.COMPLETE));
            }
         }
         if(Boolean(this.vars.timeScale) && !(this.target is §_-bq§))
         {
            this.§_-936§ = this.vars.timeScale;
         }
      }
      
      public static function set §_-g2A§(param1:Number) : void
      {
         if(param1 == 0)
         {
            param1 = 0.0001;
         }
         if(§_-C2E§.§_-32n§ == null)
         {
            §_-C2E§.to({},0,{});
         }
         var _loc2_:§_-61U§ = §_-C2E§.§_-32n§;
         var _loc3_:Number = getTimer() * 0.001;
         _loc2_.§_-T18§ = _loc3_ - (_loc3_ - _loc2_.§_-T18§) * _loc2_.§_-936§ / param1;
         _loc2_ = §_-C2E§.§_-D1E§;
         _loc3_ = §_-C2E§.§_-qw§;
         _loc2_.§_-T18§ = _loc3_ - (_loc3_ - _loc2_.§_-T18§) * _loc2_.§_-936§ / param1;
         §_-C2E§.§_-D1E§.§_-936§ = §_-C2E§.§_-32n§.§_-936§ = param1;
      }
      
      public static function §_-v27§(param1:Object, param2:Number, param3:Object, param4:Object) : TweenMax
      {
         param4.startAt = param3;
         if(param3.immediateRender)
         {
            param4.immediateRender = true;
         }
         return new TweenMax(param1,param2,param4);
      }
      
      public static function §_-a1C§(param1:Array, param2:Number, param3:Object, param4:Object, param5:Number = 0, param6:Function = null, param7:Array = null) : Array
      {
         param4.startAt = param3;
         if(param3.immediateRender)
         {
            param4.immediateRender = true;
         }
         return §_-722§(param1,param2,param4,param5,param6,param7);
      }
      
      public static function §_-62M§(param1:Boolean = true, param2:Boolean = true) : void
      {
         §_-lE§(true,param1,param2);
      }
      
      public static function §_-8A§(param1:Object) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc2_:Array = §_-Y1J§[param1];
         var _loc3_:Array = [];
         if(_loc2_)
         {
            _loc4_ = int(_loc2_.length);
            _loc5_ = 0;
            while(--_loc4_ > -1)
            {
               if(!§_-C2E§(_loc2_[_loc4_]).gc)
               {
                  _loc3_[_loc5_++] = _loc2_[_loc4_];
               }
            }
         }
         return _loc3_;
      }
      
      public static function get §_-g2A§() : Number
      {
         return §_-C2E§.§_-32n§ == null ? 1 : §_-C2E§.§_-32n§.§_-936§;
      }
      
      public static function §_-kk§(param1:DisplayObjectContainer, param2:Boolean = false) : void
      {
         var _loc4_:Object = null;
         var _loc5_:DisplayObjectContainer = null;
         var _loc3_:Array = §_-R0§();
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
      
      public static function §_-n1k§(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : TweenMax
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
      
      public static function §_-13k§(param1:Object) : Boolean
      {
         var _loc4_:§_-C2E§ = null;
         var _loc2_:Array = §_-8A§(param1);
         var _loc3_:int = int(_loc2_.length);
         while(--_loc3_ > -1)
         {
            _loc4_ = _loc2_[_loc3_];
            if(_loc4_.active || _loc4_.§_-T18§ == _loc4_.timeline.§_-Qt§ && _loc4_.timeline.active)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function §_-72o§(param1:Boolean = false, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc5_:Boolean = false;
         var _loc4_:Array = §_-R0§();
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
      
      private static function §_-lE§(param1:Boolean, param2:Boolean = true, param3:Boolean = false) : void
      {
         var _loc5_:Boolean = false;
         var _loc4_:Array = §_-R0§();
         var _loc6_:int = int(_loc4_.length);
         while(--_loc6_ > -1)
         {
            _loc5_ = §_-C2E§(_loc4_[_loc6_]).target == §_-C2E§(_loc4_[_loc6_]).vars.onComplete;
            if(_loc5_ == param3 || _loc5_ != param2)
            {
               §_-bq§(_loc4_[_loc6_]).paused = param1;
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
      
      public static function §_-O6§(param1:Array, param2:Number, param3:Object, param4:Number = 0, param5:Function = null, param6:Array = null) : Array
      {
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return §_-722§(param1,param2,param3,param4,param5,param6);
      }
      
      public static function §_-R0§() : Array
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc1_:Dictionary = §_-Y1J§;
         var _loc2_:* = 0;
         var _loc3_:Array = [];
         for each(_loc4_ in _loc1_)
         {
            _loc5_ = int(_loc4_.length);
            while(--_loc5_ > -1)
            {
               if(!§_-C2E§(_loc4_[_loc5_]).gc)
               {
                  _loc3_[_loc2_++] = _loc4_[_loc5_];
               }
            }
         }
         return _loc3_;
      }
      
      public static function §_-32M§(param1:Boolean = true, param2:Boolean = true) : void
      {
         §_-lE§(false,param1,param2);
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : TweenMax
      {
         return new TweenMax(param1,param2,param3);
      }
      
      public static function §_-722§(param1:Array, param2:Number, param3:Object, param4:Number = 0, param5:Function = null, param6:Array = null) : Array
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
         return §_-E16§ == null ? false : §_-E16§.dispatchEvent(param1);
      }
      
      public function set timeScale(param1:Number) : void
      {
         if(param1 == 0)
         {
            param1 = 0.0001;
         }
         var _loc2_:Number = Boolean(this.§_-YV§) || this.§_-YV§ == 0 ? this.§_-YV§ : this.timeline.§_-I10§;
         this.§_-T18§ = _loc2_ - (_loc2_ - this.§_-T18§) * this.§_-936§ / param1;
         this.§_-936§ = param1;
         §_-VN§(false);
      }
      
      override public function §_-a2G§(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc4_:Number = this.§_-hz§ ? this.totalDuration : this.§_-13H§;
         var _loc5_:Number = this.§_-I10§;
         if(param1 >= _loc4_)
         {
            this.§_-I10§ = _loc4_;
            this.§_-Qt§ = this.§_-N1S§;
            this.ratio = 1;
            _loc6_ = true;
            if(this.§_-N1S§ == 0)
            {
               if((param1 == 0 || §_-B2a§ < 0) && §_-B2a§ != param1)
               {
                  param3 = true;
               }
               §_-B2a§ = param1;
            }
         }
         else if(param1 <= 0)
         {
            if(param1 < 0)
            {
               this.active = false;
               if(this.§_-N1S§ == 0)
               {
                  if(§_-B2a§ >= 0)
                  {
                     param3 = true;
                     _loc6_ = true;
                  }
                  §_-B2a§ = param1;
               }
            }
            else if(param1 == 0 && !this.§_-83Y§)
            {
               param3 = true;
            }
            this.§_-I10§ = this.§_-Qt§ = this.ratio = 0;
            if(this.§_-i8§ && _loc5_ != 0)
            {
               _loc6_ = true;
            }
         }
         else
         {
            this.§_-I10§ = this.§_-Qt§ = param1;
            _loc8_ = true;
         }
         if(§_-42K§ != 0)
         {
            _loc10_ = this.§_-N1S§ + §_-52f§;
            _loc11_ = §_-g12§;
            §_-g12§ = this.§_-I10§ / _loc10_ >> 0;
            if(§_-g12§ == this.§_-I10§ / _loc10_)
            {
               --§_-g12§;
            }
            if(_loc11_ != §_-g12§)
            {
               _loc7_ = true;
            }
            if(_loc6_)
            {
               if(this.yoyo && Boolean(§_-42K§ % 2))
               {
                  this.§_-Qt§ = this.ratio = 0;
               }
            }
            else if(param1 > 0)
            {
               this.§_-Qt§ = (this.§_-I10§ / _loc10_ - §_-g12§) * _loc10_;
               if(this.yoyo && Boolean(§_-g12§ % 2))
               {
                  this.§_-Qt§ = this.§_-N1S§ - this.§_-Qt§;
               }
               else if(this.§_-Qt§ >= this.§_-N1S§)
               {
                  this.§_-Qt§ = this.§_-N1S§;
                  this.ratio = 1;
                  _loc8_ = false;
               }
               if(this.§_-Qt§ <= 0)
               {
                  this.§_-Qt§ = this.ratio = 0;
                  _loc8_ = false;
               }
            }
            else
            {
               §_-g12§ = 0;
            }
         }
         if(_loc5_ == this.§_-I10§ && !param3)
         {
            return;
         }
         if(!this.§_-83Y§)
         {
            init();
         }
         if(!this.active && !this.§_-bY§)
         {
            this.active = true;
         }
         if(_loc8_)
         {
            if(§_-w2t§)
            {
               _loc12_ = §_-S2u§;
               _loc13_ = this.§_-Qt§ / this.§_-N1S§;
               if(§_-w2t§ == 2)
               {
                  this.ratio = _loc13_ = 1 - _loc13_;
                  while(--_loc12_ > -1)
                  {
                     this.ratio = _loc13_ * this.ratio;
                  }
                  this.ratio = 1 - this.ratio;
               }
               else if(§_-w2t§ == 1)
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
               this.ratio = §_-O2u§(this.§_-Qt§,0,1,this.§_-N1S§);
            }
         }
         if(_loc5_ == 0 && (this.§_-I10§ != 0 || this.§_-N1S§ == 0) && !param2)
         {
            if(this.vars.onStart)
            {
               this.vars.onStart.apply(null,this.vars.onStartParams);
            }
            if(§_-E16§)
            {
               §_-E16§.dispatchEvent(new §_-111§(§_-111§.START));
            }
         }
         var _loc9_:§_-bg§ = this.§_-V2§;
         while(_loc9_)
         {
            _loc9_.target[_loc9_.§_-MF§] = _loc9_.start + this.ratio * _loc9_.change;
            _loc9_ = _loc9_.nextNode;
         }
         if(§_-319§ && !param2)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(§_-k1C§ && !param2)
         {
            §_-E16§.dispatchEvent(new §_-111§(§_-111§.UPDATE));
         }
         if(_loc7_ && !param2 && !this.gc)
         {
            if(this.vars.onRepeat)
            {
               this.vars.onRepeat.apply(null,this.vars.onRepeatParams);
            }
            if(§_-E16§)
            {
               §_-E16§.dispatchEvent(new §_-111§(§_-111§.§_-83R§));
            }
         }
         if(_loc6_ && !this.gc)
         {
            if(§_-Rn§ && Boolean(this.§_-V2§))
            {
               §_-y§("onComplete",this);
            }
            complete(true,param2);
         }
      }
      
      override public function set totalDuration(param1:Number) : void
      {
         if(§_-42K§ == -1)
         {
            return;
         }
         this.duration = (param1 - §_-42K§ * §_-52f§) / (§_-42K§ + 1);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(§_-E16§ == null)
         {
            §_-P2F§();
         }
         if(param1 == §_-111§.UPDATE)
         {
            §_-k1C§ = true;
         }
         §_-E16§.addEventListener(param1,param2,param3,param4,param5);
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
         if(§_-E16§)
         {
            §_-E16§.dispatchEvent(new §_-111§(§_-111§.INIT));
         }
         super.init();
         if(§_-O2u§ in §_-mS§)
         {
            §_-w2t§ = §_-mS§[§_-O2u§][0];
            §_-S2u§ = §_-mS§[§_-O2u§][1];
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(§_-E16§)
         {
            §_-E16§.removeEventListener(param1,param2,param3);
         }
      }
      
      public function §_-d1a§(param1:String, param2:*, param3:Boolean = true) : void
      {
         var _loc4_:Object = {};
         _loc4_[param1] = param2;
         §_-l0§(_loc4_,!param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return §_-E16§ == null ? false : §_-E16§.willTrigger(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return §_-E16§ == null ? false : §_-E16§.hasEventListener(param1);
      }
      
      protected function §_-P2F§() : void
      {
         if(§_-E16§ == null)
         {
            §_-E16§ = new EventDispatcher(this);
         }
         if(this.vars.onInitListener is Function)
         {
            §_-E16§.addEventListener(§_-111§.INIT,this.vars.onInitListener,false,0,true);
         }
         if(this.vars.onStartListener is Function)
         {
            §_-E16§.addEventListener(§_-111§.START,this.vars.onStartListener,false,0,true);
         }
         if(this.vars.onUpdateListener is Function)
         {
            §_-E16§.addEventListener(§_-111§.UPDATE,this.vars.onUpdateListener,false,0,true);
            §_-k1C§ = true;
         }
         if(this.vars.onCompleteListener is Function)
         {
            §_-E16§.addEventListener(§_-111§.COMPLETE,this.vars.onCompleteListener,false,0,true);
         }
         if(this.vars.onRepeatListener is Function)
         {
            §_-E16§.addEventListener(§_-111§.§_-83R§,this.vars.onRepeatListener,false,0,true);
         }
         if(this.vars.onReverseCompleteListener is Function)
         {
            §_-E16§.addEventListener(§_-111§.§_-R2Z§,this.vars.onReverseCompleteListener,false,0,true);
         }
      }
      
      public function set §_-52r§(param1:Number) : void
      {
         if(§_-g12§ == 0)
         {
            §_-JI§(this.duration * param1,false);
         }
         else
         {
            §_-JI§(this.duration * param1 + §_-g12§ * this.§_-N1S§,false);
         }
      }
      
      public function get §_-p2F§() : Number
      {
         return this.§_-I10§ / this.totalDuration;
      }
      
      public function set §_-p2F§(param1:Number) : void
      {
         §_-JI§(this.totalDuration * param1,false);
      }
      
      public function §_-l0§(param1:Object, param2:Boolean = false) : void
      {
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:§_-bg§ = null;
         var _loc8_:Number = NaN;
         var _loc3_:Number = this.ratio;
         if(param2 && this.timeline != null && this.§_-T18§ < this.timeline.§_-Qt§)
         {
            this.§_-T18§ = this.timeline.§_-Qt§;
            this.§_-VN§(false);
            if(this.gc)
            {
               this.setEnabled(true,false);
            }
            else
            {
               this.timeline.insert(this,this.§_-T18§ - §_-eZ§);
            }
         }
         for(_loc4_ in param1)
         {
            this.vars[_loc4_] = param1[_loc4_];
         }
         if(this.§_-83Y§)
         {
            if(param2)
            {
               this.§_-83Y§ = false;
            }
            else
            {
               if(§_-Y2O§ && Boolean(this.§_-V2§))
               {
                  §_-y§("onDisable",this);
               }
               if(this.§_-Qt§ / this.§_-N1S§ > 0.998)
               {
                  _loc5_ = this.§_-Qt§;
                  this.§_-a2G§(0,true,false);
                  this.§_-83Y§ = false;
                  this.§_-a2G§(_loc5_,true,false);
               }
               else if(this.§_-Qt§ > 0)
               {
                  this.§_-83Y§ = false;
                  init();
                  _loc6_ = 1 / (1 - _loc3_);
                  _loc7_ = this.§_-V2§;
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
      
      public function get §_-52r§() : Number
      {
         return this.§_-Qt§ / this.duration;
      }
      
      public function get repeat() : int
      {
         return §_-42K§;
      }
      
      override public function set currentTime(param1:Number) : void
      {
         if(§_-g12§ != 0)
         {
            if(this.yoyo && §_-g12§ % 2 == 1)
            {
               param1 = this.duration - param1 + §_-g12§ * (this.§_-N1S§ + §_-52f§);
            }
            else
            {
               param1 += §_-g12§ * (this.duration + §_-52f§);
            }
         }
         §_-JI§(param1,false);
      }
      
      public function get repeatDelay() : Number
      {
         return §_-52f§;
      }
      
      public function §_-92u§(param1:Array) : void
      {
         var _loc2_:Object = {};
         var _loc3_:int = int(param1.length);
         while(--_loc3_ > -1)
         {
            _loc2_[param1[_loc3_]] = true;
         }
         §_-b1R§(_loc2_);
      }
      
      public function set repeatDelay(param1:Number) : void
      {
         §_-52f§ = param1;
         §_-VN§(true);
      }
      
      public function set repeat(param1:int) : void
      {
         §_-42K§ = param1;
         §_-VN§(true);
      }
      
      override public function complete(param1:Boolean = false, param2:Boolean = false) : void
      {
         super.complete(param1,param2);
         if(!param2 && Boolean(§_-E16§))
         {
            if(this.§_-I10§ == this.§_-13H§ && !this.§_-i8§)
            {
               §_-E16§.dispatchEvent(new §_-111§(§_-111§.COMPLETE));
            }
            else if(this.§_-i8§ && this.§_-I10§ == 0)
            {
               §_-E16§.dispatchEvent(new §_-111§(§_-111§.§_-R2Z§));
            }
         }
      }
      
      override public function invalidate() : void
      {
         this.yoyo = Boolean(this.vars.yoyo == true);
         §_-42K§ = this.vars.repeat ? int(Number(this.vars.repeat)) : 0;
         §_-52f§ = this.vars.repeatDelay ? Number(this.vars.repeatDelay) : 0;
         §_-k1C§ = false;
         if(this.vars.onCompleteListener != null || this.vars.onUpdateListener != null || this.vars.onStartListener != null)
         {
            §_-P2F§();
         }
         §_-VN§(true);
         super.invalidate();
      }
      
      public function get timeScale() : Number
      {
         return this.§_-936§;
      }
      
      override public function get totalDuration() : Number
      {
         if(this.§_-hz§)
         {
            this.§_-13H§ = §_-42K§ == -1 ? 999999999999 : this.§_-N1S§ * (§_-42K§ + 1) + §_-52f§ * §_-42K§;
            this.§_-hz§ = false;
         }
         return this.§_-13H§;
      }
   }
}

