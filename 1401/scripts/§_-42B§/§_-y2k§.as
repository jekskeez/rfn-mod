package §_-42B§
{
   import §_-bQ§.*;
   import §_-o1G§.*;
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class §_-y2k§ extends §_-lH§
   {
      
      public static var §_-Q1i§:§_-72V§;
      
      public static var §_-KR§:Function;
      
      public static var §_-Q2C§:§_-72V§;
      
      public static const version:Number = 11.62;
      
      public static var §_-D1r§:Object;
      
      public static var §_-j1Z§:Number;
      
      public static var §_-h2Q§:Object = {};
      
      public static var §_-03K§:Dictionary = new Dictionary(false);
      
      public static var §_-g1x§:Function = §_-y2k§.§_-R1Q§;
      
      public static var §_-62v§:Function = §_-y2k§.easeOut;
      
      public static var §_-R25§:Dictionary = new Dictionary(false);
      
      private static var §_-v2M§:Shape = new Shape();
      
      protected static var §_-32N§:Object = {
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
      
      protected var §_-K1W§:Boolean;
      
      public var §_-C1N§:Object;
      
      public var §_-t1b§:§_-f§;
      
      protected var §_-413§:int;
      
      protected var §_-g2t§:Function;
      
      public var target:Object;
      
      public var ratio:Number = 0;
      
      protected var §_-C2T§:Object;
      
      protected var §_-C38§:Boolean;
      
      public function §_-y2k§(param1:Object, param2:Number, param3:Object)
      {
         var _loc5_:§_-y2k§ = null;
         super(param2,param3);
         if(param1 == null)
         {
            throw new Error("Cannot tween a null object.");
         }
         this.target = param1;
         if(this.target is §_-lH§ && Boolean(this.vars.timeScale))
         {
            this.§_-L1l§ = 1;
         }
         §_-C1N§ = {};
         §_-g2t§ = §_-62v§;
         §_-413§ = Number(param3.overwrite) <= -1 || !§_-D1r§.enabled && param3.overwrite > 1 ? int(§_-D1r§.mode) : int(param3.overwrite);
         var _loc4_:Array = §_-R25§[param1];
         if(!_loc4_)
         {
            §_-R25§[param1] = [this];
         }
         else if(§_-413§ == 1)
         {
            for each(_loc5_ in _loc4_)
            {
               if(!_loc5_.gc)
               {
                  _loc5_.setEnabled(false,false);
               }
            }
            §_-R25§[param1] = [this];
         }
         else
         {
            _loc4_[_loc4_.length] = this;
         }
         if(this.active || Boolean(this.vars.immediateRender))
         {
            §_-m1b§(0,false,true);
         }
      }
      
      public static function §_-D2F§() : void
      {
         §_-j1Z§ = 0;
         §_-Q1i§ = new §_-72V§(null);
         §_-Q2C§ = new §_-72V§(null);
         §_-Q1i§.§_-hT§ = getTimer() * 0.001;
         §_-Q2C§.§_-hT§ = §_-j1Z§;
         §_-Q1i§.§_-n1J§ = true;
         §_-Q2C§.§_-n1J§ = true;
         §_-v2M§.addEventListener(Event.ENTER_FRAME,§_-E1n§,false,0,true);
         if(§_-D1r§ == null)
         {
            §_-D1r§ = {
               "mode":1,
               "enabled":false
            };
         }
      }
      
      public static function §_-R1Q§(param1:Object, param2:Boolean = false, param3:Object = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:§_-y2k§ = null;
         if(param1 in §_-R25§)
         {
            _loc4_ = §_-R25§[param1];
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
                     _loc6_.§_-d1R§(param3);
                  }
                  if(param3 == null || _loc6_.§_-t1b§ == null && _loc6_.§_-w2X§)
                  {
                     _loc6_.setEnabled(false,false);
                  }
               }
            }
            if(param3 == null)
            {
               delete §_-R25§[param1];
            }
         }
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : §_-y2k§
      {
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return new §_-y2k§(param1,param2,param3);
      }
      
      protected static function easeOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return 1 - (param1 = 1 - param1 / param4) * param1;
      }
      
      public static function §_-8Q§(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : §_-y2k§
      {
         return new §_-y2k§(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "immediateRender":false,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      protected static function §_-E1n§(param1:Event = null) : void
      {
         var _loc2_:Dictionary = null;
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         §_-Q1i§.§_-m1b§((getTimer() * 0.001 - §_-Q1i§.§_-hT§) * §_-Q1i§.§_-L1l§,false,false);
         §_-j1Z§ += 1;
         §_-Q2C§.§_-m1b§((§_-j1Z§ - §_-Q2C§.§_-hT§) * §_-Q2C§.§_-L1l§,false,false);
         if(!(§_-j1Z§ % 60))
         {
            _loc2_ = §_-R25§;
            for(_loc3_ in _loc2_)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = int(_loc4_.length);
               while(--_loc5_ > -1)
               {
                  if(§_-y2k§(_loc4_[_loc5_]).gc)
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
      
      public static function to(param1:Object, param2:Number, param3:Object) : §_-y2k§
      {
         return new §_-y2k§(param1,param2,param3);
      }
      
      protected function §_-61m§(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return this.vars.proxiedEase.apply(null,arguments.concat(this.vars.easeParams));
      }
      
      override public function §_-m1b§(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:Number = this.§_-b1T§;
         if(param1 >= this.§_-N18§)
         {
            this.§_-63E§ = this.§_-b1T§ = this.§_-N18§;
            this.ratio = 1;
            _loc4_ = true;
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
            this.§_-63E§ = this.§_-b1T§ = this.ratio = 0;
            if(param1 < 0)
            {
               this.active = false;
               if(this.§_-N18§ == 0)
               {
                  if(§_-23h§ >= 0)
                  {
                     param3 = true;
                     _loc4_ = true;
                  }
                  §_-23h§ = param1;
               }
            }
            if(this.§_-xA§ && _loc5_ != 0)
            {
               _loc4_ = true;
            }
         }
         else
         {
            this.§_-63E§ = this.§_-b1T§ = param1;
            this.ratio = §_-g2t§(param1,0,1,this.§_-N18§);
         }
         if(this.§_-b1T§ == _loc5_ && !param3)
         {
            return;
         }
         if(!this.§_-w2X§)
         {
            init();
            if(!_loc4_ && Boolean(this.§_-b1T§))
            {
               this.ratio = §_-g2t§(this.§_-b1T§,0,1,this.§_-N18§);
            }
         }
         if(!this.active && !this.§_-Np§)
         {
            this.active = true;
         }
         if(Boolean(_loc5_ == 0 && this.vars.onStart) && (Boolean(this.§_-b1T§ != 0 || this.§_-N18§ == 0)) && !param2)
         {
            this.vars.onStart.apply(null,this.vars.onStartParams);
         }
         var _loc6_:§_-f§ = this.§_-t1b§;
         while(_loc6_)
         {
            _loc6_.target[_loc6_.§_-w26§] = _loc6_.start + this.ratio * _loc6_.change;
            _loc6_ = _loc6_.nextNode;
         }
         if(§_-eb§ && !param2)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(_loc4_ && !this.gc)
         {
            if(§_-K1W§ && Boolean(this.§_-t1b§))
            {
               §_-KR§("onComplete",this);
            }
            complete(true,param2);
         }
      }
      
      override public function setEnabled(param1:Boolean, param2:Boolean = false) : Boolean
      {
         var _loc3_:Array = null;
         if(param1)
         {
            _loc3_ = §_-y2k§.§_-R25§[this.target];
            if(!_loc3_)
            {
               §_-y2k§.§_-R25§[this.target] = [this];
            }
            else
            {
               _loc3_[_loc3_.length] = this;
            }
         }
         super.setEnabled(param1,param2);
         if(§_-C38§ && Boolean(this.§_-t1b§))
         {
            return §_-KR§(param1 ? "onEnable" : "onDisable",this);
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
         var _loc6_:§_-f§ = null;
         if(this.vars.onInit)
         {
            this.vars.onInit.apply(null,this.vars.onInitParams);
         }
         if(typeof this.vars.ease == "function")
         {
            §_-g2t§ = this.vars.ease;
         }
         if(this.vars.easeParams)
         {
            this.vars.proxiedEase = §_-g2t§;
            §_-g2t§ = §_-61m§;
         }
         this.§_-t1b§ = null;
         this.§_-C1N§ = {};
         for(_loc1_ in this.vars)
         {
            if(!(_loc1_ in §_-32N§ && !(_loc1_ == "timeScale" && this.target is §_-lH§)))
            {
               if(_loc1_ in §_-h2Q§ && Boolean((_loc3_ = new (§_-h2Q§[_loc1_] as Class)()).onInitTween(this.target,this.vars[_loc1_],this)))
               {
                  this.§_-t1b§ = new §_-f§(_loc3_,"changeFactor",0,1,_loc3_.overwriteProps.length == 1 ? _loc3_.overwriteProps[0] : "_MULTIPLE_",true,this.§_-t1b§);
                  if(this.§_-t1b§.name == "_MULTIPLE_")
                  {
                     _loc2_ = int(_loc3_.overwriteProps.length);
                     while(--_loc2_ > -1)
                     {
                        this.§_-C1N§[_loc3_.overwriteProps[_loc2_]] = this.§_-t1b§;
                     }
                  }
                  else
                  {
                     this.§_-C1N§[this.§_-t1b§.name] = this.§_-t1b§;
                  }
                  if(_loc3_.priority)
                  {
                     this.§_-t1b§.priority = _loc3_.priority;
                     _loc4_ = true;
                  }
                  if(Boolean(_loc3_.onDisable) || Boolean(_loc3_.onEnable))
                  {
                     §_-C38§ = true;
                  }
                  §_-K1W§ = true;
               }
               else
               {
                  this.§_-t1b§ = new §_-f§(this.target,_loc1_,Number(this.target[_loc1_]),typeof this.vars[_loc1_] == "number" ? Number(this.vars[_loc1_]) - this.target[_loc1_] : Number(this.vars[_loc1_]),_loc1_,false,this.§_-t1b§);
                  this.§_-C1N§[_loc1_] = this.§_-t1b§;
               }
            }
         }
         if(_loc4_)
         {
            §_-KR§("onInitAllProps",this);
         }
         if(this.vars.runBackwards)
         {
            _loc6_ = this.§_-t1b§;
            while(_loc6_)
            {
               _loc6_.start += _loc6_.change;
               _loc6_.change = -_loc6_.change;
               _loc6_ = _loc6_.nextNode;
            }
         }
         §_-eb§ = Boolean(this.vars.onUpdate != null);
         if(§_-C2T§)
         {
            §_-d1R§(§_-C2T§);
            if(this.§_-t1b§ == null)
            {
               this.setEnabled(false,false);
            }
         }
         if(Boolean(§_-413§ > 1 && this.§_-t1b§) && (Boolean(_loc5_ = §_-R25§[this.target])) && _loc5_.length > 1)
         {
            if(§_-D1r§.manageOverwrites(this,this.§_-C1N§,_loc5_,§_-413§))
            {
               init();
            }
         }
         this.§_-w2X§ = true;
      }
      
      public function §_-d1R§(param1:Object, param2:Boolean = true) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:§_-f§ = null;
         var _loc5_:Boolean = false;
         if(§_-C2T§ == null)
         {
            §_-C2T§ = {};
         }
         for(_loc3_ in param1)
         {
            if(_loc3_ in §_-C1N§)
            {
               _loc4_ = §_-C1N§[_loc3_];
               if(_loc4_.§_-w27§ && _loc4_.name == "_MULTIPLE_")
               {
                  _loc4_.target.killProps(param1);
                  if(_loc4_.target.overwriteProps.length == 0)
                  {
                     _loc4_.name = "";
                  }
                  if(_loc3_ != _loc4_.target.propName || _loc4_.name == "")
                  {
                     delete §_-C1N§[_loc3_];
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
                  else if(this.§_-t1b§ == _loc4_)
                  {
                     this.§_-t1b§ = _loc4_.nextNode;
                  }
                  if(_loc4_.§_-w27§ && Boolean(_loc4_.target.onDisable))
                  {
                     _loc4_.target.onDisable();
                     if(_loc4_.target.activeDisable)
                     {
                        _loc5_ = true;
                     }
                  }
                  delete §_-C1N§[_loc3_];
               }
            }
            if(param2 && param1 != §_-C2T§)
            {
               §_-C2T§[_loc3_] = 1;
            }
         }
         return _loc5_;
      }
      
      override public function invalidate() : void
      {
         if(§_-C38§ && Boolean(this.§_-t1b§))
         {
            §_-KR§("onDisable",this);
         }
         this.§_-t1b§ = null;
         §_-C2T§ = null;
         §_-eb§ = this.§_-w2X§ = this.active = §_-C38§ = false;
         this.§_-C1N§ = {};
      }
   }
}

