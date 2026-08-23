package §_-81P§
{
   import §_-f1T§.Event;
   import §_-f1T§.EventDispatcher;
   import starling.core.starling_internal;
   
   use namespace starling_internal;
   
   public class §_-f1D§ extends EventDispatcher implements §_-93Y§
   {
      
      private static const §_-29§:String = "#";
      
      private static var §_-31i§:Vector.<§_-f1D§> = new Vector.<§_-f1D§>(0);
      
      private var §_-t1s§:Object;
      
      private var §_-z1R§:Function;
      
      private var §_-p2t§:String;
      
      private var §_-1o§:Vector.<String>;
      
      private var §_-Z2P§:Vector.<Number>;
      
      private var §_-IQ§:Vector.<Number>;
      
      private var §_-415§:Vector.<Function>;
      
      private var §_-l1u§:Function;
      
      private var §_-e1A§:Function;
      
      private var §_-M2u§:Function;
      
      private var §_-73k§:Function;
      
      private var §_-XB§:Array;
      
      private var §_-E2c§:Array;
      
      private var §_-d2A§:Array;
      
      private var §_-h§:Array;
      
      private var §_-SV§:Number;
      
      private var §_-Y2q§:Number;
      
      private var §_-T2O§:Number;
      
      private var §_-j1N§:Number;
      
      private var §_-A1Q§:Boolean;
      
      private var §_-v7§:§_-f1D§;
      
      private var §_-h1c§:int;
      
      private var §_-o2d§:Number;
      
      private var §_-et§:Boolean;
      
      private var §_-a1B§:int;
      
      public function §_-f1D§(param1:Object, param2:Number, param3:Object = "linear")
      {
         super();
         this.reset(param1,param2,param3);
      }
      
      internal static function §_-tg§(param1:String) : String
      {
         if(param1.indexOf("color") != -1 || param1.indexOf("Color") != -1)
         {
            return "rgb";
         }
         var _loc2_:int = param1.indexOf(§_-29§);
         if(_loc2_ != -1)
         {
            return param1.substr(_loc2_ + 1);
         }
         return null;
      }
      
      internal static function §_-v2r§(param1:String) : String
      {
         var _loc2_:int = param1.indexOf(§_-29§);
         if(_loc2_ != -1)
         {
            return param1.substring(0,_loc2_);
         }
         return param1;
      }
      
      starling_internal static function §_-11t§(param1:Object, param2:Number, param3:Object = "linear") : §_-f1D§
      {
         if(§_-31i§.length)
         {
            return §_-31i§.pop().reset(param1,param2,param3);
         }
         return new §_-f1D§(param1,param2,param3);
      }
      
      starling_internal static function §_-b3§(param1:§_-f1D§) : void
      {
         param1.§_-l1u§ = param1.§_-e1A§ = param1.§_-M2u§ = param1.§_-73k§ = null;
         param1.§_-XB§ = param1.§_-E2c§ = param1.§_-d2A§ = param1.§_-h§ = null;
         param1.§_-t1s§ = null;
         param1.§_-z1R§ = null;
         param1.§_-b1M§();
         §_-31i§.push(param1);
      }
      
      public function reset(param1:Object, param2:Number, param3:Object = "linear") : §_-f1D§
      {
         this.§_-t1s§ = param1;
         this.§_-Y2q§ = 0;
         this.§_-SV§ = Math.max(0.0001,param2);
         this.§_-T2O§ = 0;
         this.§_-j1N§ = this.§_-o2d§ = 0;
         this.§_-l1u§ = this.§_-e1A§ = this.§_-M2u§ = this.§_-73k§ = null;
         this.§_-XB§ = this.§_-E2c§ = this.§_-d2A§ = this.§_-h§ = null;
         this.§_-A1Q§ = this.§_-et§ = false;
         this.§_-h1c§ = 1;
         this.§_-a1B§ = -1;
         this.§_-v7§ = null;
         if(param3 is String)
         {
            this.§_-N1A§ = param3 as String;
         }
         else
         {
            if(!(param3 is Function))
            {
               throw new ArgumentError("Transition must be either a string or a function");
            }
            this.§_-d1K§ = param3 as Function;
         }
         if(this.§_-1o§)
         {
            this.§_-1o§.length = 0;
         }
         else
         {
            this.§_-1o§ = new Vector.<String>(0);
         }
         if(this.§_-Z2P§)
         {
            this.§_-Z2P§.length = 0;
         }
         else
         {
            this.§_-Z2P§ = new Vector.<Number>(0);
         }
         if(this.§_-IQ§)
         {
            this.§_-IQ§.length = 0;
         }
         else
         {
            this.§_-IQ§ = new Vector.<Number>(0);
         }
         if(this.§_-415§)
         {
            this.§_-415§.length = 0;
         }
         else
         {
            this.§_-415§ = new Vector.<Function>(0);
         }
         return this;
      }
      
      public function §_-02Q§(param1:String, param2:Number) : void
      {
         if(this.§_-t1s§ == null)
         {
            return;
         }
         var _loc3_:int = int(this.§_-1o§.length);
         var _loc4_:Function = this.§_-dN§(param1);
         this.§_-1o§[_loc3_] = §_-v2r§(param1);
         this.§_-Z2P§[_loc3_] = Number.NaN;
         this.§_-IQ§[_loc3_] = param2;
         this.§_-415§[_loc3_] = _loc4_;
      }
      
      public function §_-21O§(param1:Number) : void
      {
         this.§_-02Q§("scaleX",param1);
         this.§_-02Q§("scaleY",param1);
      }
      
      public function moveTo(param1:Number, param2:Number) : void
      {
         this.§_-02Q§("x",param1);
         this.§_-02Q§("y",param2);
      }
      
      public function §_-qD§(param1:Number) : void
      {
         this.§_-02Q§("alpha",param1);
      }
      
      public function §_-71I§(param1:Number, param2:String = "rad") : void
      {
         this.§_-02Q§("rotation#" + param2,param1);
      }
      
      public function §_-a1Q§(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc9_:Function = null;
         var _loc10_:Function = null;
         var _loc11_:Array = null;
         if(param1 == 0 || this.§_-h1c§ == 1 && this.§_-Y2q§ == this.§_-SV§)
         {
            return;
         }
         var _loc3_:Number = this.§_-Y2q§;
         var _loc4_:Number = this.§_-SV§ - this.§_-Y2q§;
         var _loc5_:Number = param1 > _loc4_ ? param1 - _loc4_ : 0;
         this.§_-Y2q§ += param1;
         if(this.§_-Y2q§ <= 0)
         {
            return;
         }
         if(this.§_-Y2q§ > this.§_-SV§)
         {
            this.§_-Y2q§ = this.§_-SV§;
         }
         if(this.§_-a1B§ < 0 && _loc3_ <= 0 && this.§_-Y2q§ > 0)
         {
            ++this.§_-a1B§;
            if(this.§_-l1u§ != null)
            {
               this.§_-l1u§.apply(this,this.§_-XB§);
            }
         }
         var _loc6_:Number = this.§_-Y2q§ / this.§_-SV§;
         var _loc7_:Boolean = this.§_-et§ && this.§_-a1B§ % 2 == 1;
         var _loc8_:int = int(this.§_-Z2P§.length);
         this.§_-T2O§ = _loc7_ ? Number(this.§_-z1R§(1 - _loc6_)) : Number(this.§_-z1R§(_loc6_));
         _loc2_ = 0;
         while(_loc2_ < _loc8_)
         {
            if(this.§_-Z2P§[_loc2_] != this.§_-Z2P§[_loc2_])
            {
               this.§_-Z2P§[_loc2_] = this.§_-t1s§[this.§_-1o§[_loc2_]] as Number;
            }
            _loc9_ = this.§_-415§[_loc2_] as Function;
            _loc9_(this.§_-1o§[_loc2_],this.§_-Z2P§[_loc2_],this.§_-IQ§[_loc2_]);
            _loc2_++;
         }
         if(this.§_-e1A§ != null)
         {
            this.§_-e1A§.apply(this,this.§_-E2c§);
         }
         if(_loc3_ < this.§_-SV§ && this.§_-Y2q§ >= this.§_-SV§)
         {
            if(this.§_-h1c§ == 0 || this.§_-h1c§ > 1)
            {
               this.§_-Y2q§ = -this.§_-o2d§;
               ++this.§_-a1B§;
               if(this.§_-h1c§ > 1)
               {
                  --this.§_-h1c§;
               }
               if(this.§_-M2u§ != null)
               {
                  this.§_-M2u§.apply(this,this.§_-d2A§);
               }
            }
            else
            {
               _loc10_ = this.§_-73k§;
               _loc11_ = this.§_-h§;
               §_-12v§(Event.§_-a2X§);
               if(_loc10_ != null)
               {
                  _loc10_.apply(this,_loc11_);
               }
            }
         }
         if(_loc5_)
         {
            this.§_-a1Q§(_loc5_);
         }
      }
      
      private function §_-dN§(param1:String) : Function
      {
         var _loc2_:Function = null;
         var _loc3_:String = §_-tg§(param1);
         switch(_loc3_)
         {
            case null:
               _loc2_ = this.§_-D1M§;
               break;
            case "rgb":
               _loc2_ = this.§_-tl§;
               break;
            case "rad":
               _loc2_ = this.§_-Xt§;
               break;
            case "deg":
               _loc2_ = this.§_-u2u§;
               break;
            default:
               trace("[Starling] Ignoring unknown property hint:",_loc3_);
               _loc2_ = this.§_-D1M§;
         }
         return _loc2_;
      }
      
      private function §_-D1M§(param1:String, param2:Number, param3:Number) : void
      {
         var _loc4_:Number = param2 + this.§_-T2O§ * (param3 - param2);
         if(this.§_-A1Q§)
         {
            _loc4_ = Math.round(_loc4_);
         }
         this.§_-t1s§[param1] = _loc4_;
      }
      
      private function §_-tl§(param1:String, param2:Number, param3:Number) : void
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
         var _loc14_:uint = _loc6_ + (_loc10_ - _loc6_) * this.§_-T2O§;
         var _loc15_:uint = _loc7_ + (_loc11_ - _loc7_) * this.§_-T2O§;
         var _loc16_:uint = _loc8_ + (_loc12_ - _loc8_) * this.§_-T2O§;
         var _loc17_:uint = _loc9_ + (_loc13_ - _loc9_) * this.§_-T2O§;
         this.§_-t1s§[param1] = _loc14_ << 24 | _loc15_ << 16 | _loc16_ << 8 | _loc17_;
      }
      
      private function §_-Xt§(param1:String, param2:Number, param3:Number) : void
      {
         this.§_-dR§(Math.PI,param1,param2,param3);
      }
      
      private function §_-u2u§(param1:String, param2:Number, param3:Number) : void
      {
         this.§_-dR§(180,param1,param2,param3);
      }
      
      private function §_-dR§(param1:Number, param2:String, param3:Number, param4:Number) : void
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
         this.§_-D1M§(param2,param3,param4);
      }
      
      public function §_-83e§(param1:String) : Number
      {
         var _loc2_:int = this.§_-1o§.indexOf(param1);
         if(_loc2_ == -1)
         {
            throw new ArgumentError("The property \'" + param1 + "\' is not animated");
         }
         return this.§_-IQ§[_loc2_] as Number;
      }
      
      public function get §_-HU§() : Boolean
      {
         return this.§_-Y2q§ >= this.§_-SV§ && this.§_-h1c§ == 1;
      }
      
      public function get target() : Object
      {
         return this.§_-t1s§;
      }
      
      public function get §_-N1A§() : String
      {
         return this.§_-p2t§;
      }
      
      public function set §_-N1A§(param1:String) : void
      {
         this.§_-p2t§ = param1;
         this.§_-z1R§ = §_-61P§.§_-b§(param1);
         if(this.§_-z1R§ == null)
         {
            throw new ArgumentError("Invalid transiton: " + param1);
         }
      }
      
      public function get §_-d1K§() : Function
      {
         return this.§_-z1R§;
      }
      
      public function set §_-d1K§(param1:Function) : void
      {
         this.§_-p2t§ = "custom";
         this.§_-z1R§ = param1;
      }
      
      public function get §_-R1Z§() : Number
      {
         return this.§_-SV§;
      }
      
      public function get currentTime() : Number
      {
         return this.§_-Y2q§;
      }
      
      public function get progress() : Number
      {
         return this.§_-T2O§;
      }
      
      public function get delay() : Number
      {
         return this.§_-j1N§;
      }
      
      public function set delay(param1:Number) : void
      {
         this.§_-Y2q§ = this.§_-Y2q§ + this.§_-j1N§ - param1;
         this.§_-j1N§ = param1;
      }
      
      public function get repeatCount() : int
      {
         return this.§_-h1c§;
      }
      
      public function set repeatCount(param1:int) : void
      {
         this.§_-h1c§ = param1;
      }
      
      public function get repeatDelay() : Number
      {
         return this.§_-o2d§;
      }
      
      public function set repeatDelay(param1:Number) : void
      {
         this.§_-o2d§ = param1;
      }
      
      public function get reverse() : Boolean
      {
         return this.§_-et§;
      }
      
      public function set reverse(param1:Boolean) : void
      {
         this.§_-et§ = param1;
      }
      
      public function get §_-k2H§() : Boolean
      {
         return this.§_-A1Q§;
      }
      
      public function set §_-k2H§(param1:Boolean) : void
      {
         this.§_-A1Q§ = param1;
      }
      
      public function get onStart() : Function
      {
         return this.§_-l1u§;
      }
      
      public function set onStart(param1:Function) : void
      {
         this.§_-l1u§ = param1;
      }
      
      public function get onUpdate() : Function
      {
         return this.§_-e1A§;
      }
      
      public function set onUpdate(param1:Function) : void
      {
         this.§_-e1A§ = param1;
      }
      
      public function get onRepeat() : Function
      {
         return this.§_-M2u§;
      }
      
      public function set onRepeat(param1:Function) : void
      {
         this.§_-M2u§ = param1;
      }
      
      public function get onComplete() : Function
      {
         return this.§_-73k§;
      }
      
      public function set onComplete(param1:Function) : void
      {
         this.§_-73k§ = param1;
      }
      
      public function get §_-UL§() : Array
      {
         return this.§_-XB§;
      }
      
      public function set §_-UL§(param1:Array) : void
      {
         this.§_-XB§ = param1;
      }
      
      public function get §_-H2Q§() : Array
      {
         return this.§_-E2c§;
      }
      
      public function set §_-H2Q§(param1:Array) : void
      {
         this.§_-E2c§ = param1;
      }
      
      public function get §_-R2l§() : Array
      {
         return this.§_-d2A§;
      }
      
      public function set §_-R2l§(param1:Array) : void
      {
         this.§_-d2A§ = param1;
      }
      
      public function get §_-22y§() : Array
      {
         return this.§_-h§;
      }
      
      public function set §_-22y§(param1:Array) : void
      {
         this.§_-h§ = param1;
      }
      
      public function get §_-r2§() : §_-f1D§
      {
         return this.§_-v7§;
      }
      
      public function set §_-r2§(param1:§_-f1D§) : void
      {
         this.§_-v7§ = param1;
      }
   }
}

