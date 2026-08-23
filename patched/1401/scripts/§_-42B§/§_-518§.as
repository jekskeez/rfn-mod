package §_-42B§
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class §_-518§
   {
      
      protected static var §_-Ns§:Boolean;
      
      protected static var §_-l20§:Number;
      
      protected static var §_-43j§:uint;
      
      protected static var §_-r1X§:Dictionary = new Dictionary(false);
      
      protected static var §_-v2M§:Shape = new Shape();
      
      protected static var §_-32N§:Object = {
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
      
      protected var §_-J1V§:Boolean;
      
      public var active:Boolean;
      
      protected var §_-71b§:Array;
      
      public var ratio:Number = 0;
      
      protected var §_-g2t§:Function;
      
      public var §_-f2Z§:Number;
      
      public var target:Object;
      
      public var useFrames:Boolean;
      
      public var duration:Number;
      
      public var gc:Boolean;
      
      public var vars:Object;
      
      public function §_-518§(param1:Object, param2:Number, param3:Object)
      {
         super();
         if(!§_-Ns§)
         {
            §_-l20§ = getTimer() * 0.001;
            §_-43j§ = 0;
            §_-v2M§.addEventListener(Event.ENTER_FRAME,§_-E1n§,false,0,true);
            §_-Ns§ = true;
         }
         this.vars = param3;
         this.duration = param2;
         this.active = Boolean(param2 == 0 && this.vars.delay == 0 && this.vars.immediateRender != false);
         this.target = param1;
         if(typeof this.vars.ease != "function")
         {
            §_-g2t§ = §_-518§.easeOut;
         }
         else
         {
            §_-g2t§ = this.vars.ease;
         }
         §_-71b§ = [];
         this.useFrames = Boolean(param3.useFrames == true);
         var _loc4_:Number = "delay" in this.vars ? Number(this.vars.delay) : 0;
         this.§_-f2Z§ = this.useFrames ? §_-43j§ + _loc4_ : §_-l20§ + _loc4_;
         var _loc5_:Array = §_-r1X§[param1];
         if(_loc5_ == null || int(this.vars.overwrite) == 1 || this.vars.overwrite == null)
         {
            §_-r1X§[param1] = [this];
         }
         else
         {
            _loc5_[_loc5_.length] = this;
         }
         if(this.vars.immediateRender == true || this.active)
         {
            §_-m1b§(0);
         }
      }
      
      public static function §_-8Q§(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : §_-518§
      {
         return new §_-518§(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      public static function §_-E1n§(param1:Event = null) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:§_-518§ = null;
         §_-43j§ += 1;
         §_-l20§ = getTimer() * 0.001;
         var _loc2_:Dictionary = §_-r1X§;
         for(_loc4_ in _loc2_)
         {
            _loc3_ = _loc2_[_loc4_];
            _loc5_ = int(_loc3_.length);
            while(--_loc5_ > -1)
            {
               _loc7_ = _loc3_[_loc5_];
               _loc6_ = _loc7_.useFrames ? §_-43j§ : §_-l20§;
               if(_loc7_.active || !_loc7_.gc && _loc6_ >= _loc7_.§_-f2Z§)
               {
                  _loc7_.§_-m1b§(_loc6_ - _loc7_.§_-f2Z§);
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
      
      public static function from(param1:Object, param2:Number, param3:Object) : §_-518§
      {
         param3.runBackwards = true;
         if(!("immediateRender" in param3))
         {
            param3.immediateRender = true;
         }
         return new §_-518§(param1,param2,param3);
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : §_-518§
      {
         return new §_-518§(param1,param2,param3);
      }
      
      public static function §_-R1Q§(param1:Object, param2:Boolean = false) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(param1 in §_-r1X§)
         {
            if(param2)
            {
               _loc3_ = §_-r1X§[param1];
               _loc4_ = int(_loc3_.length);
               while(--_loc4_ > -1)
               {
                  if(!§_-518§(_loc3_[_loc4_]).gc)
                  {
                     §_-518§(_loc3_[_loc4_]).complete(false);
                  }
               }
            }
            delete §_-r1X§[param1];
         }
      }
      
      public function §_-m1b§(param1:Number) : void
      {
         var _loc2_:Array = null;
         if(!§_-J1V§)
         {
            init();
         }
         var _loc3_:int = int(§_-71b§.length);
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
            this.ratio = §_-g2t§(param1,0,1,this.duration);
         }
         while(--_loc3_ > -1)
         {
            _loc2_ = §_-71b§[_loc3_];
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
            if(!(_loc1_ in §_-32N§))
            {
               §_-71b§[§_-71b§.length] = [_loc1_,this.target[_loc1_],typeof this.vars[_loc1_] == "number" ? this.vars[_loc1_] - this.target[_loc1_] : Number(this.vars[_loc1_])];
            }
         }
         if(this.vars.runBackwards)
         {
            _loc3_ = int(§_-71b§.length);
            while(--_loc3_ > -1)
            {
               _loc2_ = §_-71b§[_loc3_];
               _loc2_[1] += _loc2_[2];
               _loc2_[2] = -_loc2_[2];
            }
         }
         §_-J1V§ = true;
      }
      
      public function §_-h2r§() : void
      {
         this.gc = true;
         this.active = false;
      }
      
      public function complete(param1:Boolean = false) : void
      {
         if(!param1)
         {
            §_-m1b§(this.duration);
            return;
         }
         §_-h2r§();
         if(this.vars.onComplete)
         {
            this.vars.onComplete.apply(null,this.vars.onCompleteParams);
         }
      }
   }
}

