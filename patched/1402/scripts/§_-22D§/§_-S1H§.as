package §_-22D§
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class §_-S1H§
   {
      
      protected static var §_-MJ§:Boolean;
      
      protected static var §_-J1Z§:Number;
      
      protected static var §_-V1K§:uint;
      
      protected static var §_-m1u§:Dictionary = new Dictionary(false);
      
      protected static var §_-413§:Shape = new Shape();
      
      protected static var §_-s2m§:Object = {
         "ease":1,
         "delay":1,
         "useFrames":1,
         "overwrite":1,
         "onComplete":1,
         "onCompleteParams":1,
         "runBackwards":1,
         "immediateRender":1,
         "onUpdate":1,
         "onUpdateParams":1
      };
      
      protected var §_-mf§:Boolean;
      
      public var active:Boolean;
      
      protected var §_-H1I§:Array;
      
      public var ratio:Number = 0;
      
      protected var §_-O2u§:Function;
      
      public var §_-k1H§:Number;
      
      public var target:Object;
      
      public var useFrames:Boolean;
      
      public var duration:Number;
      
      public var gc:Boolean;
      
      public var vars:Object;
      
      public function §_-S1H§(param1:Object, param2:Number, param3:Object)
      {
         super();
         if(!§_-MJ§)
         {
            §_-J1Z§ = getTimer() * 0.001;
            §_-V1K§ = 0;
            §_-413§.addEventListener(Event.ENTER_FRAME,§_-v3§,false,0,true);
            §_-MJ§ = true;
         }
         this.vars = param3;
         this.duration = param2;
         this.active = Boolean(param2 == 0 && this.vars.delay == 0 && this.vars.immediateRender != false);
         this.target = param1;
         if(typeof this.vars.ease != "function")
         {
            §_-O2u§ = §_-S1H§.easeOut;
         }
         else
         {
            §_-O2u§ = this.vars.ease;
         }
         §_-H1I§ = [];
         this.useFrames = Boolean(param3.useFrames == true);
         var _loc4_:Number = "delay" in this.vars ? Number(this.vars.delay) : 0;
         this.§_-k1H§ = this.useFrames ? §_-V1K§ + _loc4_ : §_-J1Z§ + _loc4_;
         var _loc5_:Array = §_-m1u§[param1];
         if(_loc5_ == null || int(this.vars.overwrite) == 1 || this.vars.overwrite == null)
         {
            §_-m1u§[param1] = [this];
         }
         else
         {
            _loc5_[_loc5_.length] = this;
         }
         if(this.vars.immediateRender == true || this.active)
         {
            §_-a2G§(0);
         }
      }
      
      public static function §_-n1k§(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : §_-S1H§
      {
         return new §_-S1H§(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      public static function §_-v3§(param1:Event = null) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:§_-S1H§ = null;
         §_-V1K§ += 1;
         §_-J1Z§ = getTimer() * 0.001;
         var _loc2_:Dictionary = §_-m1u§;
         for(_loc4_ in _loc2_)
         {
            _loc3_ = _loc2_[_loc4_];
            _loc5_ = int(_loc3_.length);
            while(--_loc5_ > -1)
            {
               _loc7_ = _loc3_[_loc5_];
               _loc6_ = _loc7_.useFrames ? §_-V1K§ : §_-J1Z§;
               if(_loc7_.active || !_loc7_.gc && _loc6_ >= _loc7_.§_-k1H§)
               {
                  _loc7_.§_-a2G§(_loc6_ - _loc7_.§_-k1H§);
               }
               else if(_loc7_.gc)
               {
                  _loc3_.splice(_loc5_,1);
               }
            }
            if(_loc3_.length == 0)
            {
               delete _loc2_[_loc4_];
            }
         }
      }
      
      private static function easeOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return -1 * (param1 = param1 / param4) * (param1 - 2);
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : §_-S1H§
      {
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return new §_-S1H§(param1,param2,param3);
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : §_-S1H§
      {
         return new §_-S1H§(param1,param2,param3);
      }
      
      public static function §_-q29§(param1:Object, param2:Boolean = false) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(param1 in §_-m1u§)
         {
            if(param2)
            {
               _loc3_ = §_-m1u§[param1];
               _loc4_ = int(_loc3_.length);
               while(--_loc4_ > -1)
               {
                  if(!§_-S1H§(_loc3_[_loc4_]).gc)
                  {
                     §_-S1H§(_loc3_[_loc4_]).complete(false);
                  }
               }
            }
            delete §_-m1u§[param1];
         }
      }
      
      public function §_-a2G§(param1:Number) : void
      {
         var _loc2_:Array = null;
         if(!§_-mf§)
         {
            init();
         }
         var _loc3_:int = int(§_-H1I§.length);
         if(param1 >= this.duration)
         {
            param1 = this.duration;
            this.ratio = 1;
         }
         else if(param1 <= 0)
         {
            this.ratio = 0;
         }
         else
         {
            this.ratio = §_-O2u§(param1,0,1,this.duration);
         }
         while(--_loc3_ > -1)
         {
            _loc2_ = §_-H1I§[_loc3_];
            this.target[_loc2_[0]] = _loc2_[1] + this.ratio * _loc2_[2];
         }
         if(this.vars.onUpdate)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(param1 == this.duration)
         {
            complete(true);
         }
      }
      
      public function init() : void
      {
         var _loc1_:String = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         for(_loc1_ in this.vars)
         {
            if(!(_loc1_ in §_-s2m§))
            {
               §_-H1I§[§_-H1I§.length] = [_loc1_,this.target[_loc1_],typeof this.vars[_loc1_] == "number" ? this.vars[_loc1_] - this.target[_loc1_] : Number(this.vars[_loc1_])];
            }
         }
         if(this.vars.runBackwards)
         {
            _loc3_ = int(§_-H1I§.length);
            while(--_loc3_ > -1)
            {
               _loc2_ = §_-H1I§[_loc3_];
               _loc2_[1] += _loc2_[2];
               _loc2_[2] = -_loc2_[2];
            }
         }
         §_-mf§ = true;
      }
      
      public function §_-kl§() : void
      {
         this.gc = true;
         this.active = false;
      }
      
      public function complete(param1:Boolean = false) : void
      {
         if(!param1)
         {
            §_-a2G§(this.duration);
            return;
         }
         §_-kl§();
         if(this.vars.onComplete)
         {
            this.vars.onComplete.apply(null,this.vars.onCompleteParams);
         }
      }
   }
}

