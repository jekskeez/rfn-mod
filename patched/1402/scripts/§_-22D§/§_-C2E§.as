package §_-22D§
{
   import §_-4I§.*;
   import §_-y1E§.*;
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class §_-C2E§ extends §_-bq§
   {
      
      public static var §_-32n§:§_-61U§;
      
      public static var §_-y§:Function;
      
      public static var §_-D1E§:§_-61U§;
      
      public static const version:Number = 11.62;
      
      public static var §_-s2J§:Object;
      
      public static var §_-qw§:Number;
      
      public static var §_-t2o§:Object = {};
      
      public static var §_-mS§:Dictionary = new Dictionary(false);
      
      public static var §_-y2w§:Function = §_-C2E§.§_-q29§;
      
      public static var §_-A1s§:Function = §_-C2E§.easeOut;
      
      public static var §_-Y1J§:Dictionary = new Dictionary(false);
      
      private static var §_-413§:Shape = new Shape();
      
      protected static var §_-s2m§:Object = {
         "ease":1,
         "delay":1,
         "overwrite":1,
         "onComplete":1,
         "onCompleteParams":1,
         "useFrames":1,
         "runBackwards":1,
         "startAt":1,
         "onUpdate":1,
         "onUpdateParams":1,
         "onStart":1,
         "onStartParams":1,
         "onInit":1,
         "onInitParams":1,
         "onReverseComplete":1,
         "onReverseCompleteParams":1,
         "onRepeat":1,
         "onRepeatParams":1,
         "proxiedEase":1,
         "easeParams":1,
         "yoyo":1,
         "onCompleteListener":1,
         "onUpdateListener":1,
         "onStartListener":1,
         "onReverseCompleteListener":1,
         "onRepeatListener":1,
         "orientToBezier":1,
         "timeScale":1,
         "immediateRender":1,
         "repeat":1,
         "repeatDelay":1,
         "timeline":1,
         "data":1,
         "paused":1
      };
      
      protected var §_-Rn§:Boolean;
      
      public var §_-13E§:Object;
      
      public var §_-V2§:§_-bg§;
      
      protected var §_-V2K§:int;
      
      protected var §_-O2u§:Function;
      
      public var target:Object;
      
      public var ratio:Number = 0;
      
      protected var §_-r1W§:Object;
      
      protected var §_-Y2O§:Boolean;
      
      public function §_-C2E§(param1:Object, param2:Number, param3:Object)
      {
         var _loc5_:§_-C2E§ = null;
         super(param2,param3);
         if(param1 == null)
         {
            throw new Error("Cannot tween a null object.");
         }
         this.target = param1;
         if(this.target is §_-bq§ && Boolean(this.vars.timeScale))
         {
            this.§_-936§ = 1;
         }
         §_-13E§ = {};
         §_-O2u§ = §_-A1s§;
         §_-V2K§ = Number(param3.overwrite) <= -1 || !§_-s2J§.enabled && param3.overwrite > 1 ? int(§_-s2J§.mode) : int(param3.overwrite);
         var _loc4_:Array = §_-Y1J§[param1];
         if(!_loc4_)
         {
            §_-Y1J§[param1] = [this];
         }
         else if(§_-V2K§ == 1)
         {
            for each(_loc5_ in _loc4_)
            {
               if(!_loc5_.gc)
               {
                  _loc5_.setEnabled(false,false);
               }
            }
            §_-Y1J§[param1] = [this];
         }
         else
         {
            _loc4_[_loc4_.length] = this;
         }
         if(this.active || Boolean(this.vars.immediateRender))
         {
            §_-a2G§(0,false,true);
         }
      }
      
      public static function §_-Dl§() : void
      {
         §_-qw§ = 0;
         §_-32n§ = new §_-61U§(null);
         §_-D1E§ = new §_-61U§(null);
         §_-32n§.§_-T18§ = getTimer() * 0.001;
         §_-D1E§.§_-T18§ = §_-qw§;
         §_-32n§.§_-63r§ = true;
         §_-D1E§.§_-63r§ = true;
         §_-413§.addEventListener(Event.ENTER_FRAME,§_-v3§,false,0,true);
         if(§_-s2J§ == null)
         {
            §_-s2J§ = {
               "mode":1,
               "enabled":false
            };
         }
      }
      
      public static function §_-q29§(param1:Object, param2:Boolean = false, param3:Object = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:§_-C2E§ = null;
         if(param1 in §_-Y1J§)
         {
            _loc4_ = §_-Y1J§[param1];
            _loc5_ = int(_loc4_.length);
            while(--_loc5_ > -1)
            {
               _loc6_ = _loc4_[_loc5_];
               if(!_loc6_.gc)
               {
                  if(param2)
                  {
                     _loc6_.complete(false,false);
                  }
                  if(param3 != null)
                  {
                     _loc6_.§_-b1R§(param3);
                  }
                  if(param3 == null || _loc6_.§_-V2§ == null && _loc6_.§_-83Y§)
                  {
                     _loc6_.setEnabled(false,false);
                  }
               }
            }
            if(param3 == null)
            {
               delete §_-Y1J§[param1];
            }
         }
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : §_-C2E§
      {
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return new §_-C2E§(param1,param2,param3);
      }
      
      protected static function easeOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return 1 - (param1 = 1 - param1 / param4) * param1;
      }
      
      public static function §_-n1k§(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : §_-C2E§
      {
         return new §_-C2E§(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "immediateRender":false,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      protected static function §_-v3§(param1:Event = null) : void
      {
         var _loc2_:Dictionary = null;
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         §_-32n§.§_-a2G§((getTimer() * 0.001 - §_-32n§.§_-T18§) * §_-32n§.§_-936§,false,false);
         §_-qw§ += 1;
         §_-D1E§.§_-a2G§((§_-qw§ - §_-D1E§.§_-T18§) * §_-D1E§.§_-936§,false,false);
         if(!(§_-qw§ % 60))
         {
            _loc2_ = §_-Y1J§;
            for(_loc3_ in _loc2_)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = int(_loc4_.length);
               while(--_loc5_ > -1)
               {
                  if(§_-C2E§(_loc4_[_loc5_]).gc)
                  {
                     _loc4_.splice(_loc5_,1);
                  }
               }
               if(_loc4_.length == 0)
               {
                  delete _loc2_[_loc3_];
               }
            }
         }
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : §_-C2E§
      {
         return new §_-C2E§(param1,param2,param3);
      }
      
      protected function §_-x27§(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return this.vars.proxiedEase.apply(null,arguments.concat(this.vars.easeParams));
      }
      
      override public function §_-a2G§(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:Number = this.§_-Qt§;
         if(param1 >= this.§_-N1S§)
         {
            this.§_-I10§ = this.§_-Qt§ = this.§_-N1S§;
            this.ratio = 1;
            _loc4_ = true;
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
            this.§_-I10§ = this.§_-Qt§ = this.ratio = 0;
            if(param1 < 0)
            {
               this.active = false;
               if(this.§_-N1S§ == 0)
               {
                  if(§_-B2a§ >= 0)
                  {
                     param3 = true;
                     _loc4_ = true;
                  }
                  §_-B2a§ = param1;
               }
            }
            if(this.§_-i8§ && _loc5_ != 0)
            {
               _loc4_ = true;
            }
         }
         else
         {
            this.§_-I10§ = this.§_-Qt§ = param1;
            this.ratio = §_-O2u§(param1,0,1,this.§_-N1S§);
         }
         if(this.§_-Qt§ == _loc5_ && !param3)
         {
            return;
         }
         if(!this.§_-83Y§)
         {
            init();
            if(!_loc4_ && Boolean(this.§_-Qt§))
            {
               this.ratio = §_-O2u§(this.§_-Qt§,0,1,this.§_-N1S§);
            }
         }
         if(!this.active && !this.§_-bY§)
         {
            this.active = true;
         }
         if(Boolean(_loc5_ == 0 && this.vars.onStart) && (Boolean(this.§_-Qt§ != 0 || this.§_-N1S§ == 0)) && !param2)
         {
            this.vars.onStart.apply(null,this.vars.onStartParams);
         }
         var _loc6_:§_-bg§ = this.§_-V2§;
         while(_loc6_)
         {
            _loc6_.target[_loc6_.§_-MF§] = _loc6_.start + this.ratio * _loc6_.change;
            _loc6_ = _loc6_.nextNode;
         }
         if(§_-319§ && !param2)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(_loc4_ && !this.gc)
         {
            if(§_-Rn§ && Boolean(this.§_-V2§))
            {
               §_-y§("onComplete",this);
            }
            complete(true,param2);
         }
      }
      
      override public function setEnabled(param1:Boolean, param2:Boolean = false) : Boolean
      {
         var _loc3_:Array = null;
         if(param1)
         {
            _loc3_ = §_-C2E§.§_-Y1J§[this.target];
            if(!_loc3_)
            {
               §_-C2E§.§_-Y1J§[this.target] = [this];
            }
            else
            {
               _loc3_[_loc3_.length] = this;
            }
         }
         super.setEnabled(param1,param2);
         if(§_-Y2O§ && Boolean(this.§_-V2§))
         {
            return §_-y§(param1 ? "onEnable" : "onDisable",this);
         }
         return false;
      }
      
      protected function init() : void
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:Boolean = false;
         var _loc5_:Array = null;
         var _loc6_:§_-bg§ = null;
         if(this.vars.onInit)
         {
            this.vars.onInit.apply(null,this.vars.onInitParams);
         }
         if(typeof this.vars.ease == "function")
         {
            §_-O2u§ = this.vars.ease;
         }
         if(this.vars.easeParams)
         {
            this.vars.proxiedEase = §_-O2u§;
            §_-O2u§ = §_-x27§;
         }
         this.§_-V2§ = null;
         this.§_-13E§ = {};
         for(_loc1_ in this.vars)
         {
            if(!(_loc1_ in §_-s2m§ && !(_loc1_ == "timeScale" && this.target is §_-bq§)))
            {
               if(_loc1_ in §_-t2o§ && Boolean((_loc3_ = new (§_-t2o§[_loc1_] as Class)()).onInitTween(this.target,this.vars[_loc1_],this)))
               {
                  this.§_-V2§ = new §_-bg§(_loc3_,"changeFactor",0,1,_loc3_.overwriteProps.length == 1 ? _loc3_.overwriteProps[0] : "_MULTIPLE_",true,this.§_-V2§);
                  if(this.§_-V2§.name == "_MULTIPLE_")
                  {
                     _loc2_ = int(_loc3_.overwriteProps.length);
                     while(--_loc2_ > -1)
                     {
                        this.§_-13E§[_loc3_.overwriteProps[_loc2_]] = this.§_-V2§;
                     }
                  }
                  else
                  {
                     this.§_-13E§[this.§_-V2§.name] = this.§_-V2§;
                  }
                  if(_loc3_.priority)
                  {
                     this.§_-V2§.priority = _loc3_.priority;
                     _loc4_ = true;
                  }
                  if(Boolean(_loc3_.onDisable) || Boolean(_loc3_.onEnable))
                  {
                     §_-Y2O§ = true;
                  }
                  §_-Rn§ = true;
               }
               else
               {
                  this.§_-V2§ = new §_-bg§(this.target,_loc1_,Number(this.target[_loc1_]),typeof this.vars[_loc1_] == "number" ? Number(this.vars[_loc1_]) - this.target[_loc1_] : Number(this.vars[_loc1_]),_loc1_,false,this.§_-V2§);
                  this.§_-13E§[_loc1_] = this.§_-V2§;
               }
            }
         }
         if(_loc4_)
         {
            §_-y§("onInitAllProps",this);
         }
         if(this.vars.runBackwards)
         {
            _loc6_ = this.§_-V2§;
            while(_loc6_)
            {
               _loc6_.start += _loc6_.change;
               _loc6_.change = -_loc6_.change;
               _loc6_ = _loc6_.nextNode;
            }
         }
         §_-319§ = Boolean(this.vars.onUpdate != null);
         if(§_-r1W§)
         {
            §_-b1R§(§_-r1W§);
            if(this.§_-V2§ == null)
            {
               this.setEnabled(false,false);
            }
         }
         if(Boolean(§_-V2K§ > 1 && this.§_-V2§) && (Boolean(_loc5_ = §_-Y1J§[this.target])) && _loc5_.length > 1)
         {
            if(§_-s2J§.manageOverwrites(this,this.§_-13E§,_loc5_,§_-V2K§))
            {
               init();
            }
         }
         this.§_-83Y§ = true;
      }
      
      public function §_-b1R§(param1:Object, param2:Boolean = true) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:§_-bg§ = null;
         var _loc5_:Boolean = false;
         if(§_-r1W§ == null)
         {
            §_-r1W§ = {};
         }
         for(_loc3_ in param1)
         {
            if(_loc3_ in §_-13E§)
            {
               _loc4_ = §_-13E§[_loc3_];
               if(_loc4_.§_-33j§ && _loc4_.name == "_MULTIPLE_")
               {
                  _loc4_.target.killProps(param1);
                  if(_loc4_.target.overwriteProps.length == 0)
                  {
                     _loc4_.name = "";
                  }
                  if(_loc3_ != _loc4_.target.propName || _loc4_.name == "")
                  {
                     delete §_-13E§[_loc3_];
                  }
               }
               if(_loc4_.name != "_MULTIPLE_")
               {
                  if(_loc4_.nextNode)
                  {
                     _loc4_.nextNode.prevNode = _loc4_.prevNode;
                  }
                  if(_loc4_.prevNode)
                  {
                     _loc4_.prevNode.nextNode = _loc4_.nextNode;
                  }
                  else if(this.§_-V2§ == _loc4_)
                  {
                     this.§_-V2§ = _loc4_.nextNode;
                  }
                  if(_loc4_.§_-33j§ && Boolean(_loc4_.target.onDisable))
                  {
                     _loc4_.target.onDisable();
                     if(_loc4_.target.activeDisable)
                     {
                        _loc5_ = true;
                     }
                  }
                  delete §_-13E§[_loc3_];
               }
            }
            if(param2 && param1 != §_-r1W§)
            {
               §_-r1W§[_loc3_] = 1;
            }
         }
         return _loc5_;
      }
      
      override public function invalidate() : void
      {
         if(§_-Y2O§ && Boolean(this.§_-V2§))
         {
            §_-y§("onDisable",this);
         }
         this.§_-V2§ = null;
         §_-r1W§ = null;
         §_-319§ = this.§_-83Y§ = this.active = §_-Y2O§ = false;
         this.§_-13E§ = {};
      }
   }
}

