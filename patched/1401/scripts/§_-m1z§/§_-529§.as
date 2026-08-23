package §_-m1z§
{
   import §_-K2c§.Event;
   import §_-K2c§.EventDispatcher;
   import starling.core.starling_internal;
   
   use namespace starling_internal;
   
   public class §_-529§ extends EventDispatcher implements §_-N1Q§
   {
      
      private static const §_-I2q§:String = "#";
      
      private static var §_-Bn§:Vector.<§_-529§> = new Vector.<§_-529§>(0);
      
      private var §_-e2X§:Object;
      
      private var §_-Jc§:Function;
      
      private var §_-ug§:String;
      
      private var §_-y26§:Vector.<String>;
      
      private var §_-NN§:Vector.<Number>;
      
      private var §_-y1E§:Vector.<Number>;
      
      private var §_-4H§:Vector.<Function>;
      
      private var §_-h7§:Function;
      
      private var §_-71P§:Function;
      
      private var §_-92q§:Function;
      
      private var §_-s29§:Function;
      
      private var §_-N2H§:Array;
      
      private var §_-Q11§:Array;
      
      private var §_-Y2d§:Array;
      
      private var §_-DU§:Array;
      
      private var §_-GP§:Number;
      
      private var §_-61r§:Number;
      
      private var §_-92E§:Number;
      
      private var §_-119§:Number;
      
      private var §_-3u§:Boolean;
      
      private var §_-e28§:§_-529§;
      
      private var §_-7a§:int;
      
      private var §_-r25§:Number;
      
      private var §_-b7§:Boolean;
      
      private var §_-M2T§:int;
      
      public function §_-529§(param1:Object, param2:Number, param3:Object = "linear")
      {
         super();
         this.reset(param1,param2,param3);
      }
      
      internal static function §_-tF§(param1:String) : String
      {
         if(param1.indexOf("color") != -1 || param1.indexOf("Color") != -1)
         {
            return "rgb";
         }
         var _loc2_:int = param1.indexOf(§_-I2q§);
         if(_loc2_ != -1)
         {
            return param1.substr(_loc2_ + 1);
         }
         return null;
      }
      
      internal static function §_-TF§(param1:String) : String
      {
         var _loc2_:int = param1.indexOf(§_-I2q§);
         if(_loc2_ != -1)
         {
            return param1.substring(0,_loc2_);
         }
         return param1;
      }
      
      starling_internal static function §_-11x§(param1:Object, param2:Number, param3:Object = "linear") : §_-529§
      {
         if(§_-Bn§.length)
         {
            return §_-Bn§.pop().reset(param1,param2,param3);
         }
         return new §_-529§(param1,param2,param3);
      }
      
      starling_internal static function §_-3h§(param1:§_-529§) : void
      {
         param1.§_-h7§ = param1.§_-71P§ = param1.§_-92q§ = param1.§_-s29§ = null;
         param1.§_-N2H§ = param1.§_-Q11§ = param1.§_-Y2d§ = param1.§_-DU§ = null;
         param1.§_-e2X§ = null;
         param1.§_-Jc§ = null;
         param1.§_-b8§();
         §_-Bn§.push(param1);
      }
      
      public function reset(param1:Object, param2:Number, param3:Object = "linear") : §_-529§
      {
         this.§_-e2X§ = param1;
         this.§_-61r§ = 0;
         this.§_-GP§ = Math.max(0.0001,param2);
         this.§_-92E§ = 0;
         this.§_-119§ = this.§_-r25§ = 0;
         this.§_-h7§ = this.§_-71P§ = this.§_-92q§ = this.§_-s29§ = null;
         this.§_-N2H§ = this.§_-Q11§ = this.§_-Y2d§ = this.§_-DU§ = null;
         this.§_-3u§ = this.§_-b7§ = false;
         this.§_-7a§ = 1;
         this.§_-M2T§ = -1;
         this.§_-e28§ = null;
         if(param3 is String)
         {
            this.§_-42f§ = param3 as String;
         }
         else
         {
            if(!(param3 is Function))
            {
               throw new ArgumentError("Transition must be either a string or a function");
            }
            this.§_-H1V§ = param3 as Function;
         }
         if(this.§_-y26§)
         {
            this.§_-y26§.length = 0;
         }
         else
         {
            this.§_-y26§ = new Vector.<String>(0);
         }
         if(this.§_-NN§)
         {
            this.§_-NN§.length = 0;
         }
         else
         {
            this.§_-NN§ = new Vector.<Number>(0);
         }
         if(this.§_-y1E§)
         {
            this.§_-y1E§.length = 0;
         }
         else
         {
            this.§_-y1E§ = new Vector.<Number>(0);
         }
         if(this.§_-4H§)
         {
            this.§_-4H§.length = 0;
         }
         else
         {
            this.§_-4H§ = new Vector.<Function>(0);
         }
         return this;
      }
      
      public function §_-42i§(param1:String, param2:Number) : void
      {
         if(this.§_-e2X§ == null)
         {
            return;
         }
         var _loc3_:int = int(this.§_-y26§.length);
         var _loc4_:Function = this.§_-Y2l§(param1);
         this.§_-y26§[_loc3_] = §_-TF§(param1);
         this.§_-NN§[_loc3_] = Number.NaN;
         this.§_-y1E§[_loc3_] = param2;
         this.§_-4H§[_loc3_] = _loc4_;
      }
      
      public function §_-u1g§(param1:Number) : void
      {
         this.§_-42i§("scaleX",param1);
         this.§_-42i§("scaleY",param1);
      }
      
      public function moveTo(param1:Number, param2:Number) : void
      {
         this.§_-42i§("x",param1);
         this.§_-42i§("y",param2);
      }
      
      public function §_-O2h§(param1:Number) : void
      {
         this.§_-42i§("alpha",param1);
      }
      
      public function §_-03J§(param1:Number, param2:String = "rad") : void
      {
         this.§_-42i§("rotation#" + param2,param1);
      }
      
      public function §_-ld§(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc9_:Function = null;
         var _loc10_:Function = null;
         var _loc11_:Array = null;
         if(param1 == 0 || this.§_-7a§ == 1 && this.§_-61r§ == this.§_-GP§)
         {
            return;
         }
         var _loc3_:Number = this.§_-61r§;
         var _loc4_:Number = this.§_-GP§ - this.§_-61r§;
         var _loc5_:Number = param1 > _loc4_ ? param1 - _loc4_ : 0;
         this.§_-61r§ += param1;
         if(this.§_-61r§ <= 0)
         {
            return;
         }
         if(this.§_-61r§ > this.§_-GP§)
         {
            this.§_-61r§ = this.§_-GP§;
         }
         if(this.§_-M2T§ < 0 && _loc3_ <= 0 && this.§_-61r§ > 0)
         {
            ++this.§_-M2T§;
            if(this.§_-h7§ != null)
            {
               this.§_-h7§.apply(this,this.§_-N2H§);
            }
         }
         var _loc6_:Number = this.§_-61r§ / this.§_-GP§;
         var _loc7_:Boolean = this.§_-b7§ && this.§_-M2T§ % 2 == 1;
         var _loc8_:int = int(this.§_-NN§.length);
         this.§_-92E§ = _loc7_ ? Number(this.§_-Jc§(1 - _loc6_)) : Number(this.§_-Jc§(_loc6_));
         _loc2_ = 0;
         while(_loc2_ < _loc8_)
         {
            if(this.§_-NN§[_loc2_] != this.§_-NN§[_loc2_])
            {
               this.§_-NN§[_loc2_] = this.§_-e2X§[this.§_-y26§[_loc2_]] as Number;
            }
            _loc9_ = this.§_-4H§[_loc2_] as Function;
            _loc9_(this.§_-y26§[_loc2_],this.§_-NN§[_loc2_],this.§_-y1E§[_loc2_]);
            _loc2_++;
         }
         if(this.§_-71P§ != null)
         {
            this.§_-71P§.apply(this,this.§_-Q11§);
         }
         if(_loc3_ < this.§_-GP§ && this.§_-61r§ >= this.§_-GP§)
         {
            if(this.§_-7a§ == 0 || this.§_-7a§ > 1)
            {
               this.§_-61r§ = -this.§_-r25§;
               ++this.§_-M2T§;
               if(this.§_-7a§ > 1)
               {
                  --this.§_-7a§;
               }
               if(this.§_-92q§ != null)
               {
                  this.§_-92q§.apply(this,this.§_-Y2d§);
               }
            }
            else
            {
               _loc10_ = this.§_-s29§;
               _loc11_ = this.§_-DU§;
               §_-g11§(Event.§_-P2F§);
               if(_loc10_ != null)
               {
                  _loc10_.apply(this,_loc11_);
               }
            }
         }
         if(_loc5_)
         {
            this.§_-ld§(_loc5_);
         }
      }
      
      private function §_-Y2l§(param1:String) : Function
      {
         var _loc2_:Function = null;
         var _loc3_:String = §_-tF§(param1);
         switch(_loc3_)
         {
            case null:
               _loc2_ = this.§_-G9§;
               break;
            case "rgb":
               _loc2_ = this.§_-W9§;
               break;
            case "rad":
               _loc2_ = this.§_-s2Q§;
               break;
            case "deg":
               _loc2_ = this.§_-o2P§;
               break;
            default:
               trace("[Starling] Ignoring unknown property hint:",_loc3_);
               _loc2_ = this.§_-G9§;
         }
         return _loc2_;
      }
      
      private function §_-G9§(param1:String, param2:Number, param3:Number) : void
      {
         var _loc4_:Number = param2 + this.§_-92E§ * (param3 - param2);
         if(this.§_-3u§)
         {
            _loc4_ = Math.round(_loc4_);
         }
         this.§_-e2X§[param1] = _loc4_;
      }
      
      private function §_-W9§(param1:String, param2:Number, param3:Number) : void
      {
         var _loc4_:uint = uint(param2);
         var _loc5_:uint = uint(param3);
         var _loc6_:uint = uint(_loc4_ >> 24 & 0xFF);
         var _loc7_:uint = uint(_loc4_ >> 16 & 0xFF);
         var _loc8_:uint = uint(_loc4_ >> 8 & 0xFF);
         var _loc9_:uint = uint(_loc4_ & 0xFF);
         var _loc10_:uint = uint(_loc5_ >> 24 & 0xFF);
         var _loc11_:uint = uint(_loc5_ >> 16 & 0xFF);
         var _loc12_:uint = uint(_loc5_ >> 8 & 0xFF);
         var _loc13_:uint = uint(_loc5_ & 0xFF);
         var _loc14_:uint = _loc6_ + (_loc10_ - _loc6_) * this.§_-92E§;
         var _loc15_:uint = _loc7_ + (_loc11_ - _loc7_) * this.§_-92E§;
         var _loc16_:uint = _loc8_ + (_loc12_ - _loc8_) * this.§_-92E§;
         var _loc17_:uint = _loc9_ + (_loc13_ - _loc9_) * this.§_-92E§;
         this.§_-e2X§[param1] = _loc14_ << 24 | _loc15_ << 16 | _loc16_ << 8 | _loc17_;
      }
      
      private function §_-s2Q§(param1:String, param2:Number, param3:Number) : void
      {
         this.§_-12v§(Math.PI,param1,param2,param3);
      }
      
      private function §_-o2P§(param1:String, param2:Number, param3:Number) : void
      {
         this.§_-12v§(180,param1,param2,param3);
      }
      
      private function §_-12v§(param1:Number, param2:String, param3:Number, param4:Number) : void
      {
         while(Math.abs(param4 - param3) > param1)
         {
            if(param3 < param4)
            {
               param4 -= 2 * param1;
            }
            else
            {
               param4 += 2 * param1;
            }
         }
         this.§_-G9§(param2,param3,param4);
      }
      
      public function §_-r2h§(param1:String) : Number
      {
         var _loc2_:int = this.§_-y26§.indexOf(param1);
         if(_loc2_ == -1)
         {
            throw new ArgumentError("The property \'" + param1 + "\' is not animated");
         }
         return this.§_-y1E§[_loc2_] as Number;
      }
      
      public function get §_-Y2w§() : Boolean
      {
         return this.§_-61r§ >= this.§_-GP§ && this.§_-7a§ == 1;
      }
      
      public function get target() : Object
      {
         return this.§_-e2X§;
      }
      
      public function get §_-42f§() : String
      {
         return this.§_-ug§;
      }
      
      public function set §_-42f§(param1:String) : void
      {
         this.§_-ug§ = param1;
         this.§_-Jc§ = §_-Mk§.§_-11j§(param1);
         if(this.§_-Jc§ == null)
         {
            throw new ArgumentError("Invalid transiton: " + param1);
         }
      }
      
      public function get §_-H1V§() : Function
      {
         return this.§_-Jc§;
      }
      
      public function set §_-H1V§(param1:Function) : void
      {
         this.§_-ug§ = "custom";
         this.§_-Jc§ = param1;
      }
      
      public function get §_-D2C§() : Number
      {
         return this.§_-GP§;
      }
      
      public function get currentTime() : Number
      {
         return this.§_-61r§;
      }
      
      public function get progress() : Number
      {
         return this.§_-92E§;
      }
      
      public function get delay() : Number
      {
         return this.§_-119§;
      }
      
      public function set delay(param1:Number) : void
      {
         this.§_-61r§ = this.§_-61r§ + this.§_-119§ - param1;
         this.§_-119§ = param1;
      }
      
      public function get repeatCount() : int
      {
         return this.§_-7a§;
      }
      
      public function set repeatCount(param1:int) : void
      {
         this.§_-7a§ = param1;
      }
      
      public function get repeatDelay() : Number
      {
         return this.§_-r25§;
      }
      
      public function set repeatDelay(param1:Number) : void
      {
         this.§_-r25§ = param1;
      }
      
      public function get reverse() : Boolean
      {
         return this.§_-b7§;
      }
      
      public function set reverse(param1:Boolean) : void
      {
         this.§_-b7§ = param1;
      }
      
      public function get §_-91H§() : Boolean
      {
         return this.§_-3u§;
      }
      
      public function set §_-91H§(param1:Boolean) : void
      {
         this.§_-3u§ = param1;
      }
      
      public function get onStart() : Function
      {
         return this.§_-h7§;
      }
      
      public function set onStart(param1:Function) : void
      {
         this.§_-h7§ = param1;
      }
      
      public function get onUpdate() : Function
      {
         return this.§_-71P§;
      }
      
      public function set onUpdate(param1:Function) : void
      {
         this.§_-71P§ = param1;
      }
      
      public function get onRepeat() : Function
      {
         return this.§_-92q§;
      }
      
      public function set onRepeat(param1:Function) : void
      {
         this.§_-92q§ = param1;
      }
      
      public function get onComplete() : Function
      {
         return this.§_-s29§;
      }
      
      public function set onComplete(param1:Function) : void
      {
         this.§_-s29§ = param1;
      }
      
      public function get §_-c19§() : Array
      {
         return this.§_-N2H§;
      }
      
      public function set §_-c19§(param1:Array) : void
      {
         this.§_-N2H§ = param1;
      }
      
      public function get §_-T1a§() : Array
      {
         return this.§_-Q11§;
      }
      
      public function set §_-T1a§(param1:Array) : void
      {
         this.§_-Q11§ = param1;
      }
      
      public function get §_-r9§() : Array
      {
         return this.§_-Y2d§;
      }
      
      public function set §_-r9§(param1:Array) : void
      {
         this.§_-Y2d§ = param1;
      }
      
      public function get §_-63D§() : Array
      {
         return this.§_-DU§;
      }
      
      public function set §_-63D§(param1:Array) : void
      {
         this.§_-DU§ = param1;
      }
      
      public function get §_-n2Z§() : §_-529§
      {
         return this.§_-e28§;
      }
      
      public function set §_-n2Z§(param1:§_-529§) : void
      {
         this.§_-e28§ = param1;
      }
   }
}

