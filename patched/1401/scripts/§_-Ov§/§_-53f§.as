package §_-Ov§
{
   import §_-K2c§.Event;
   import §_-kW§.§_-F2U§;
   import §_-m1z§.§_-537§;
   import §_-m1z§.§_-N1Q§;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.Program3D;
   import flash.display3D.VertexBuffer3D;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.ApplicationDomain;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import starling.core.Starling;
   import starling.core.§_-T2v§;
   import starling.display.DisplayObject;
   import starling.filters.FragmentFilter;
   import starling.textures.SubTexture;
   import starling.textures.Texture;
   import starling.textures.§_-a1g§;
   import starling.utils.§_-km§;
   import starling.utils.§_-rI§;
   
   public class §_-53f§ extends DisplayObject implements §_-N1Q§
   {
      
      public static const §_-V2B§:int = 0;
      
      public static const §_-SW§:int = 1;
      
      public static const §_-p24§:int = 16383;
      
      private static var §_-919§:Vector.<uint>;
      
      private static var §_-Zw§:IndexBuffer3D;
      
      private static var §_-93D§:Vector.<§_-a29§>;
      
      private static var §_-yW§:Vector.<VertexBuffer3D>;
      
      private static var §_-M9§:int;
      
      public static var §_-530§:Boolean = true;
      
      public static var §_-QS§:Boolean = true;
      
      public static var §_-F2M§:§_-537§ = Starling.§_-A3B§;
      
      private static var §_-iq§:uint = 0;
      
      private static var §_-v23§:uint = 0;
      
      private static var §_-mj§:int = -1;
      
      private static var §_-S19§:Matrix = new Matrix();
      
      private static var §_-G2g§:Point = new Point();
      
      private static var §_-M1n§:Vector.<Number> = new <Number>[1,1,1,1];
      
      private static var §_-f2r§:Matrix3D = new Matrix3D();
      
      private static var §_-R2u§:Vector.<§_-53f§> = new Vector.<§_-53f§>(0);
      
      private static var §_-01f§:Dictionary = new Dictionary();
      
      private static var §_-B2J§:Boolean = false;
      
      private static var §_-N11§:Vector.<Number> = new Vector.<Number>(2048,true);
      
      private static var §_-L2M§:Vector.<Number> = new Vector.<Number>(2048,true);
      
      private static var §_-N2f§:Boolean = false;
      
      private static var §_-C1I§:uint = 1;
      
      private static var §_-02i§:Rectangle = new Rectangle();
      
      public var §_-530§:Boolean = §_-53f§.§_-530§;
      
      public var §_-t1H§:Boolean = false;
      
      private var §_-F1O§:§_-537§ = §_-53f§.§_-F2M§;
      
      private var §_-Z1e§:Boolean = false;
      
      private var §_-T1u§:Boolean = true;
      
      private var §_-i1S§:Rectangle;
      
      private var §_-cC§:Boolean;
      
      private var §_-B1p§:Function;
      
      private var §_-C1X§:Boolean = false;
      
      private var §_-02Q§:Number = 0;
      
      private var §_-r1U§:Number = 0;
      
      private var §_-M25§:FragmentFilter = null;
      
      private var §_-M28§:int;
      
      private var §_-Jb§:int = 0;
      
      private var §_-N2d§:int = 0;
      
      private var §_-ax§:Boolean = false;
      
      private var §_-KB§:Boolean = false;
      
      private var §_-v2p§:String = "bilinear";
      
      private var §_-63r§:Function;
      
      private var §_-L18§:Number = 0;
      
      private var §_-W26§:Number = 1;
      
      private var §_-W1E§:Texture;
      
      private var §_-12q§:Boolean = false;
      
      private var §_-C2W§:Boolean = false;
      
      private var §_-02B§:Boolean = false;
      
      private var §_-X1J§:Vector.<§_-a29§>;
      
      private var §_-oW§:§_-km§;
      
      private var §_-L2§:int;
      
      private var §_-DH§:Number;
      
      private var §_-W1C§:Number;
      
      private var §_-41h§:int;
      
      private var §_-I29§:Number;
      
      private var §_-6M§:Number;
      
      private var §_-r23§:Number;
      
      private var §_-x2D§:Number;
      
      private var §_-g2§:Number;
      
      private var §_-i1j§:Number;
      
      private var §_-s2R§:Number;
      
      private var §_-c2j§:Number;
      
      private var §_-r1G§:Boolean = false;
      
      private var §_-f1X§:Number;
      
      private var §_-eo§:Number;
      
      private var §_-G1X§:Number;
      
      private var §_-lp§:Number;
      
      private var §_-V1n§:Number;
      
      private var §_-VY§:Number;
      
      private var §_-b1I§:Number;
      
      private var §_-i1Y§:Number;
      
      private var §_-j21§:Number;
      
      private var §_-m2r§:Number;
      
      private var §_-L2L§:Number;
      
      private var §_-W2F§:Number;
      
      private var §_-J2i§:Number;
      
      private var §_-gl§:Number;
      
      private var §_-e2f§:Number;
      
      private var §_-i1t§:Number;
      
      private var §_-w1r§:Number;
      
      private var §_-E2A§:Number;
      
      private var §_-JR§:§_-b1i§ = new §_-b1i§(1,1,1,1);
      
      private var §_-p1O§:§_-b1i§ = new §_-b1i§(0,0,0,0);
      
      private var §_-ui§:§_-b1i§ = new §_-b1i§(1,1,1,1);
      
      private var §_-T4§:§_-b1i§ = new §_-b1i§(0,0,0,0);
      
      private var §_-51f§:Number = 1;
      
      private var §_-h2b§:int = 1;
      
      private var §_-G2P§:uint = 0;
      
      private var §_-9v§:Vector.<Frame>;
      
      private var mFrameLUTLength:uint;
      
      private var §_-gU§:Number;
      
      private var §_-B3l§:uint = 4294967295;
      
      private var mNumberOfFrames:int = 1;
      
      private var §_-Q2z§:Boolean = false;
      
      private var §_-938§:String;
      
      private var §_-y27§:String;
      
      private var §_-72g§:Number;
      
      private var §_-93X§:Number = -1;
      
      private var §_-Bb§:Number = -1;
      
      private var §_-823§:Number = 0;
      
      private var §_-z22§:Number = 0;
      
      public var §_-eM§:Point = new Point();
      
      private var §_-f1u§:Object;
      
      public var offsetX:Number = 0;
      
      public var offsetY:Number = 0;
      
      private var §_-H2T§:Rectangle = new Rectangle();
      
      public function §_-53f§(param1:§_-l21§)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("config must not be null");
         }
         §_-R2u§.push(this);
         this.§_-42W§(param1);
      }
      
      private static function §_-B38§(param1:uint) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(§_-yW§)
         {
            _loc4_ = 0;
            while(_loc4_ < §_-yW§.length)
            {
               §_-yW§[_loc4_].dispose();
               _loc4_++;
            }
         }
         if(§_-Zw§)
         {
            §_-Zw§.dispose();
         }
         var _loc2_:Context3D = Starling.context;
         if(_loc2_ == null)
         {
            throw new §_-F2U§();
         }
         if(_loc2_.driverInfo == "Disposed")
         {
            return;
         }
         §_-yW§ = new Vector.<VertexBuffer3D>();
         §_-mj§ = -1;
         if(ApplicationDomain.currentDomain.hasDefinition("flash.display3D.Context3DBufferUsage"))
         {
            _loc4_ = 0;
            while(_loc4_ < §_-M9§)
            {
               §_-yW§[_loc4_] = _loc2_.createVertexBuffer.call(_loc2_,param1 * 4,§_-km§.§_-L2w§,"dynamicDraw");
               _loc4_++;
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < §_-M9§)
            {
               §_-yW§[_loc4_] = _loc2_.createVertexBuffer(param1 * 4,§_-km§.§_-L2w§);
               _loc4_++;
            }
         }
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.length = param1 * 16 * §_-km§.§_-L2w§;
         _loc4_ = 0;
         while(_loc4_ < §_-M9§)
         {
            §_-yW§[_loc4_].uploadFromByteArray(_loc3_,0,0,param1 * 4);
            _loc4_++;
         }
         _loc3_.length = 0;
         if(!§_-919§)
         {
            §_-919§ = new Vector.<uint>();
            _loc5_ = 0;
            _loc6_ = -1;
            _loc4_ = 0;
            while(_loc4_ < §_-p24§)
            {
               §_-919§[++_loc6_] = _loc5_;
               §_-919§[++_loc6_] = _loc5_ + 1;
               §_-919§[++_loc6_] = _loc5_ + 2;
               §_-919§[++_loc6_] = _loc5_ + 1;
               §_-919§[++_loc6_] = _loc5_ + 3;
               §_-919§[++_loc6_] = _loc5_ + 2;
               _loc5_ += 4;
               _loc4_++;
            }
         }
         §_-Zw§ = _loc2_.createIndexBuffer(param1 * 6);
         §_-Zw§.uploadFromVector(§_-919§,0,param1 * 6);
      }
      
      public static function init(param1:uint = 16383, param2:Boolean = false, param3:uint = 0, param4:uint = 1) : void
      {
         var _loc5_:int = 0;
         if(!param3 && Boolean(§_-iq§))
         {
            param3 = §_-iq§;
         }
         if(param3 > §_-p24§)
         {
            param3 = uint(§_-p24§);
         }
         else if(param3 <= 0)
         {
            param3 = uint(§_-p24§);
         }
         §_-iq§ = param3;
         §_-M9§ = param4;
         §_-B38§(§_-iq§);
         if(!§_-B2J§)
         {
            §_-XF§();
         }
         if(!§_-93D§)
         {
            §_-N2f§ = param2;
            §_-93D§ = new Vector.<§_-a29§>();
            §_-v23§ = param1;
            _loc5_ = -1;
            while(++_loc5_ < §_-v23§)
            {
               §_-93D§[_loc5_] = new §_-a29§();
            }
         }
         if(§_-F2M§ == null)
         {
            §_-F2M§ = Starling.§_-A3B§;
         }
         Starling.§_-y1l§.stage3D.addEventListener(flash.events.Event.CONTEXT3D_CREATE,§_-w2G§,false,0,true);
      }
      
      private static function §_-XF§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 2048)
         {
            §_-N11§[_loc1_ & 0x07FF] = Math.cos(_loc1_ * 0.0030679615757712823);
            §_-L2M§[_loc1_ & 0x07FF] = Math.sin(_loc1_ * 0.0030679615757712823);
            _loc1_++;
         }
         §_-B2J§ = true;
      }
      
      public static function dispose() : void
      {
         Starling.§_-y1l§.stage3D.removeEventListener(flash.events.Event.CONTEXT3D_CREATE,§_-w2G§);
         §_-N2a§();
         §_-1C§();
      }
      
      public static function §_-N2a§() : void
      {
         var _loc1_:§_-53f§ = null;
         var _loc2_:int = 0;
         for each(_loc1_ in §_-R2u§)
         {
            _loc1_.dispose();
         }
         if(§_-yW§)
         {
            _loc2_ = 0;
            while(_loc2_ < §_-M9§)
            {
               §_-yW§[_loc2_].dispose();
               §_-yW§[_loc2_] = null;
               _loc2_++;
            }
            §_-yW§ = null;
            §_-M9§ = 0;
         }
         if(§_-Zw§)
         {
            §_-Zw§.dispose();
            §_-Zw§ = null;
         }
         §_-iq§ = 0;
      }
      
      public static function §_-1C§() : void
      {
         var _loc1_:§_-53f§ = null;
         for each(_loc1_ in §_-R2u§)
         {
            _loc1_.dispose();
         }
         §_-93D§ = null;
      }
      
      private static function §_-w2G§(param1:flash.events.Event) : void
      {
         §_-B38§(§_-iq§);
      }
      
      private static function §_-23p§(param1:Boolean, param2:Boolean = true, param3:Boolean = false, param4:String = "bgra", param5:String = "bilinear") : String
      {
         var _loc6_:uint = 0;
         if(param1)
         {
            _loc6_ |= 1;
         }
         if(param2)
         {
            _loc6_ |= 1 << 1;
         }
         if(param3)
         {
            _loc6_ |= 1 << 2;
         }
         if(param5 == §_-a1g§.NONE)
         {
            _loc6_ |= 1 << 3;
         }
         else if(param5 == §_-a1g§.§_-C2m§)
         {
            _loc6_ |= 1 << 4;
         }
         if(param4 == Context3DTextureFormat.COMPRESSED)
         {
            _loc6_ |= 1 << 5;
         }
         else if(param4 == "compressedAlpha")
         {
            _loc6_ |= 1 << 6;
         }
         var _loc7_:String = §_-01f§[_loc6_];
         if(_loc7_ == null)
         {
            _loc7_ = "QB_i." + _loc6_.toString(16);
            §_-01f§[_loc6_] = _loc7_;
         }
         return _loc7_;
      }
      
      public static function get §_-kr§() : uint
      {
         return §_-93D§.length;
      }
      
      public static function get §_-l27§() : uint
      {
         return §_-v23§;
      }
      
      private function §_-p0§(param1:§_-K2c§.Event) : void
      {
         this.§_-M28§ = this.§_-41h§ ? int(Math.min(§_-p24§,this.§_-41h§)) : §_-p24§;
         if(param1)
         {
            this.§_-B2X§();
            if(this.§_-ax§)
            {
               this.start(this.§_-93X§);
            }
         }
      }
      
      final private function §_-R1I§(param1:§_-a29§, param2:Number) : void
      {
         var _loc5_:uint = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc3_:§_-a29§ = param1;
         var _loc4_:Number = _loc3_.§_-D2C§ - _loc3_.currentTime;
         param2 = _loc4_ > param2 ? param2 : _loc4_;
         _loc3_.currentTime += param2;
         if(this.§_-L2§ == §_-SW§)
         {
            _loc3_.§_-62y§ += _loc3_.§_-61W§ * param2;
            _loc3_.§_-C2U§ += _loc3_.§_-eU§ * param2;
            _loc5_ = uint(_loc3_.§_-62y§ * 325.94932345220167 & 0x07FF);
            _loc3_.x = this.§_-823§ - §_-N11§[_loc5_] * _loc3_.§_-C2U§;
            _loc3_.y = this.§_-z22§ - §_-L2M§[_loc5_] * _loc3_.§_-C2U§;
         }
         else if(Boolean(_loc3_.radialAcceleration) || Boolean(_loc3_.tangentialAcceleration))
         {
            _loc6_ = _loc3_.x - _loc3_.startX;
            _loc7_ = _loc3_.y - _loc3_.startY;
            _loc8_ = Math.sqrt(_loc6_ * _loc6_ + _loc7_ * _loc7_);
            if(_loc8_ < 0.01)
            {
               _loc8_ = 0.01;
            }
            _loc9_ = _loc6_ / _loc8_;
            _loc10_ = _loc7_ / _loc8_;
            _loc11_ = _loc9_;
            _loc12_ = _loc10_;
            _loc9_ *= _loc3_.radialAcceleration;
            _loc10_ *= _loc3_.radialAcceleration;
            _loc13_ = _loc11_;
            _loc11_ = -_loc12_ * _loc3_.tangentialAcceleration;
            _loc12_ = _loc13_ * _loc3_.tangentialAcceleration;
            _loc3_.§_-C3G§ += param2 * (this.§_-b1I§ + _loc9_ + _loc11_);
            _loc3_.§_-t24§ += param2 * (this.§_-i1Y§ + _loc10_ + _loc12_);
            _loc3_.x += _loc3_.§_-C3G§ * param2;
            _loc3_.y += _loc3_.§_-t24§ * param2;
         }
         else
         {
            _loc3_.§_-C3G§ += param2 * this.§_-b1I§;
            _loc3_.§_-t24§ += param2 * this.§_-i1Y§;
            _loc3_.x += _loc3_.§_-C3G§ * param2;
            _loc3_.y += _loc3_.§_-t24§ * param2;
         }
         _loc3_.scale += _loc3_.§_-fC§ * param2;
         _loc3_.rotation += _loc3_.§_-K8§ * param2;
         if(this.§_-Q2z§)
         {
            _loc3_.frame += _loc3_.§_-b1Q§ * param2;
            _loc3_.§_-e2g§ = _loc3_.frame;
            if(_loc3_.§_-e2g§ > this.mFrameLUTLength)
            {
               _loc3_.§_-e2g§ = this.mFrameLUTLength;
            }
         }
         if(this.§_-12q§)
         {
            _loc3_.§_-e17§ += _loc3_.§_-BF§ * param2;
            _loc3_.§_-g3§ += _loc3_.§_-v2V§ * param2;
            _loc3_.§_-h0§ += _loc3_.§_-53s§ * param2;
            _loc3_.§_-T22§ += _loc3_.§_-220§ * param2;
         }
      }
      
      public function §_-ld§(param1:Number) : void
      {
         var _loc4_:§_-a29§ = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc16_:Frame = null;
         var _loc17_:uint = 0;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:uint = 0;
         var _loc25_:§_-a29§ = null;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:* = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc2_:Boolean = this.§_-t1H§;
         this.§_-gU§ += param1;
         if(!this.§_-X1J§)
         {
            if(this.§_-93X§)
            {
               this.§_-93X§ -= param1;
               if(this.§_-93X§ != Number.MAX_VALUE)
               {
                  this.§_-93X§ = Math.max(0,this.§_-93X§ - param1);
               }
               return;
            }
            this.stop(this.§_-530§);
            this.complete();
            return;
         }
         var _loc3_:int = 0;
         if(this.§_-f1u§ != null)
         {
            this.§_-823§ = this.§_-eM§.x = this.§_-f1u§.x;
            this.§_-z22§ = this.§_-eM§.y = this.§_-f1u§.y;
         }
         else
         {
            this.§_-823§ = this.§_-eM§.x;
            this.§_-z22§ = this.§_-eM§.y;
         }
         while(_loc3_ < this.§_-N2d§)
         {
            _loc4_ = this.§_-X1J§[_loc3_];
            if(_loc4_.currentTime < _loc4_.§_-D2C§)
            {
               this.§_-R1I§(_loc4_,param1);
               _loc3_++;
            }
            else
            {
               _loc4_.active = false;
               if(_loc3_ != --this.§_-N2d§)
               {
                  _loc25_ = this.§_-X1J§[this.§_-N2d§];
                  this.§_-X1J§[this.§_-N2d§] = _loc4_;
                  this.§_-X1J§[_loc3_] = _loc25_;
                  _loc2_ = true;
               }
               if(this.§_-N2d§ == 0 && this.§_-93X§ < 0)
               {
                  this.stop(this.§_-530§);
                  this.complete();
                  return;
               }
            }
         }
         if(this.§_-93X§ > 0)
         {
            _loc26_ = 1 / this.§_-72g§;
            while(this.§_-gU§ > 0 && this.§_-N2d§ < this.§_-M28§)
            {
               if(this.§_-N2d§ == this.§_-J1d§)
               {
                  this.§_-Av§(this.§_-J1d§);
               }
               _loc4_ = this.§_-X1J§[this.§_-N2d§];
               this.§_-I2O§(_loc4_);
               this.§_-R1I§(_loc4_,this.§_-gU§);
               ++this.§_-N2d§;
               this.§_-gU§ -= _loc26_;
            }
            if(this.§_-93X§ != Number.MAX_VALUE)
            {
               this.§_-93X§ = Math.max(0,this.§_-93X§ - param1);
            }
         }
         else if(!this.§_-cC§ && this.§_-N2d§ == 0)
         {
            this.stop(this.§_-530§);
            this.complete();
            return;
         }
         if(!this.§_-X1J§)
         {
            return;
         }
         if(this.§_-B1p§ !== null)
         {
            this.§_-B1p§(this.§_-X1J§,this.§_-N2d§);
         }
         if(_loc2_ && this.§_-63r§ !== null)
         {
            this.§_-X1J§ = this.§_-X1J§.sort(this.§_-63r§);
         }
         var _loc5_:int = 0;
         var _loc15_:Vector.<Number> = this.§_-oW§.§_-T1R§;
         if(Boolean(this.§_-L18§) || Boolean(this.§_-02Q§) || Boolean(this.§_-r1U§))
         {
            _loc28_ = 0;
            while(_loc28_ < this.§_-N2d§)
            {
               _loc4_ = this.§_-X1J§[_loc28_];
               _loc27_ = _loc4_.currentTime / _loc4_.§_-D2C§;
               if(this.§_-L18§)
               {
                  _loc4_.§_-a1L§ = _loc27_ < this.§_-L18§ ? _loc27_ / this.§_-L18§ : 1;
               }
               if(this.§_-02Q§)
               {
                  _loc4_.§_-Z1J§ = _loc27_ < this.§_-02Q§ ? _loc27_ / this.§_-02Q§ : 1;
               }
               if(this.§_-r1U§)
               {
                  _loc27_ = 1 - _loc27_;
                  _loc4_.§_-uU§ = _loc27_ < this.§_-r1U§ ? _loc27_ / this.§_-r1U§ : 1;
               }
               _loc28_++;
            }
         }
         _loc28_ = 0;
         while(_loc28_ < this.§_-N2d§)
         {
            _loc5_ = _loc28_ << 2;
            _loc4_ = this.§_-X1J§[_loc28_];
            _loc16_ = this.§_-9v§[_loc4_.§_-e2g§];
            _loc6_ = _loc4_.§_-e17§;
            _loc7_ = _loc4_.§_-g3§;
            _loc8_ = _loc4_.§_-h0§;
            _loc9_ = _loc4_.§_-T22§ * _loc4_.§_-Z1J§ * _loc4_.§_-uU§ * this.§_-W26§;
            _loc10_ = _loc4_.rotation;
            _loc11_ = _loc4_.x;
            _loc12_ = _loc4_.y;
            _loc13_ = _loc16_.§_-B2g§ * _loc4_.scale * _loc4_.§_-a1L§;
            _loc14_ = _loc16_.§_-l1e§ * _loc4_.scale * _loc4_.§_-a1L§;
            if(_loc10_)
            {
               _loc17_ = uint(_loc10_ * 325.94932345220167 & 0x07FF);
               _loc18_ = §_-N11§[_loc17_];
               _loc19_ = §_-L2M§[_loc17_];
               _loc20_ = _loc18_ * _loc13_;
               _loc21_ = _loc18_ * _loc14_;
               _loc22_ = _loc19_ * _loc13_;
               _loc23_ = _loc19_ * _loc14_;
               _loc24_ = uint(_loc5_ << 3);
               _loc15_[_loc24_] = _loc11_ - _loc20_ + _loc23_;
               _loc15_[++_loc24_] = _loc12_ - _loc22_ - _loc21_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-A3p§;
               _loc15_[++_loc24_] = _loc16_.§_-V2r§;
               _loc15_[++_loc24_] = _loc11_ + _loc20_ + _loc23_;
               _loc15_[++_loc24_] = _loc12_ + _loc22_ - _loc21_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-oP§;
               _loc15_[++_loc24_] = _loc16_.§_-V2r§;
               _loc15_[++_loc24_] = _loc11_ - _loc20_ - _loc23_;
               _loc15_[++_loc24_] = _loc12_ - _loc22_ + _loc21_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-A3p§;
               _loc15_[++_loc24_] = _loc16_.§_-z15§;
               _loc15_[++_loc24_] = _loc11_ + _loc20_ - _loc23_;
               _loc15_[++_loc24_] = _loc12_ + _loc22_ + _loc21_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-oP§;
               _loc15_[++_loc24_] = _loc16_.§_-z15§;
            }
            else
            {
               _loc24_ = uint(_loc5_ << 3);
               _loc15_[_loc24_] = _loc11_ - _loc13_;
               _loc15_[++_loc24_] = _loc12_ - _loc14_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-A3p§;
               _loc15_[++_loc24_] = _loc16_.§_-V2r§;
               _loc15_[++_loc24_] = _loc11_ + _loc13_;
               _loc15_[++_loc24_] = _loc12_ - _loc14_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-oP§;
               _loc15_[++_loc24_] = _loc16_.§_-V2r§;
               _loc15_[++_loc24_] = _loc11_ - _loc13_;
               _loc15_[++_loc24_] = _loc12_ + _loc14_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-A3p§;
               _loc15_[++_loc24_] = _loc16_.§_-z15§;
               _loc15_[++_loc24_] = _loc11_ + _loc13_;
               _loc15_[++_loc24_] = _loc12_ + _loc14_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-oP§;
               _loc15_[++_loc24_] = _loc16_.§_-z15§;
            }
            _loc28_++;
         }
         if(this.§_-02B§)
         {
            _loc29_ = 0;
            _loc30_ = 1;
            _loc31_ = 0;
            _loc32_ = 0;
            _loc33_ = Number.MAX_VALUE;
            _loc34_ = Number.MIN_VALUE;
            _loc35_ = Number.MAX_VALUE;
            _loc36_ = Number.MIN_VALUE;
            _loc28_ = int(this.§_-N2d§ * 4);
            while(_loc28_ > 0)
            {
               _loc31_ = _loc15_[_loc29_];
               _loc32_ = _loc15_[_loc30_];
               if(_loc33_ > _loc31_)
               {
                  _loc33_ = _loc31_;
               }
               if(_loc34_ < _loc31_)
               {
                  _loc34_ = _loc31_;
               }
               if(_loc35_ > _loc32_)
               {
                  _loc35_ = _loc32_;
               }
               if(_loc36_ < _loc32_)
               {
                  _loc36_ = _loc32_;
               }
               _loc29_ += 8;
               _loc30_ += 8;
               _loc28_--;
            }
            this.§_-i1S§.x = _loc33_;
            this.§_-i1S§.y = _loc35_;
            this.§_-i1S§.width = _loc34_ - _loc33_;
            this.§_-i1S§.height = _loc36_ - _loc35_;
         }
      }
      
      private function §_-42W§(param1:§_-l21§) : void
      {
         var _loc2_:SubTexture = null;
         var _loc3_:Frame = null;
         this.§_-NP§(param1);
         if(!this.§_-9v§)
         {
            if(this.§_-W1E§ is SubTexture)
            {
               _loc2_ = SubTexture(this.§_-W1E§);
               _loc3_ = new Frame(1,1,_loc2_.§_-X11§.x,_loc2_.§_-X11§.y,_loc2_.§_-X11§.width,_loc2_.§_-X11§.height);
               _loc3_.§_-B2g§ = this.§_-W1E§.width >> 1;
               _loc3_.§_-l1e§ = this.§_-W1E§.height >> 1;
               this.§_-9v§ = new <Frame>[_loc3_];
            }
            else
            {
               this.§_-9v§ = new <Frame>[new Frame(this.§_-W1E§.root.width,this.§_-W1E§.root.height,0,0,this.§_-W1E§.width,this.§_-W1E§.height)];
            }
         }
         this.§_-72g§ = this.§_-41h§ / this.§_-I29§;
         this.§_-93X§ = 0;
         this.§_-gU§ = 0;
         this.§_-M28§ = this.§_-41h§ ? int(Math.min(§_-p24§,this.§_-41h§)) : §_-p24§;
         if(!§_-yW§ || !§_-yW§[0])
         {
            init();
         }
         if(§_-F2M§ == null)
         {
            §_-F2M§ = Starling.§_-A3B§;
         }
         addEventListener(§_-K2c§.Event.ADDED_TO_STAGE,this.§_-p0§);
         this.§_-p0§(null);
      }
      
      final private function §_-I2O§(param1:§_-a29§) : void
      {
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc2_:§_-a29§ = param1;
         var _loc3_:Number = this.§_-I29§ + this.§_-6M§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         if(_loc3_ <= 0)
         {
            return;
         }
         _loc2_.active = true;
         _loc2_.currentTime = 0;
         _loc2_.§_-D2C§ = _loc3_;
         _loc2_.x = this.§_-823§ + this.§_-DH§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.y = this.§_-z22§ + this.§_-W1C§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.startX = this.§_-823§;
         _loc2_.startY = this.§_-z22§;
         var _loc4_:Number = this.§_-s2R§ + this.§_-c2j§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         var _loc5_:uint = uint(_loc4_ * 325.94932345220167 & 0x07FF);
         var _loc6_:Number = this.§_-V1n§ + this.§_-VY§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.§_-C3G§ = _loc6_ * §_-N11§[_loc5_];
         _loc2_.§_-t24§ = _loc6_ * §_-L2M§[_loc5_];
         _loc2_.§_-C2U§ = this.§_-J2i§ + this.§_-gl§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.§_-eU§ = this.§_-J2i§ / _loc3_;
         _loc2_.§_-C2U§ = this.§_-J2i§ + this.§_-gl§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.§_-eU§ = (this.§_-e2f§ + this.§_-i1t§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1) - _loc2_.§_-C2U§) / _loc3_;
         _loc2_.§_-62y§ = this.§_-s2R§ + this.§_-c2j§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.§_-61W§ = this.§_-w1r§ + this.§_-E2A§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.radialAcceleration = this.§_-j21§ + this.§_-m2r§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.tangentialAcceleration = this.§_-L2L§ + this.§_-W2F§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         var _loc7_:Number = this.§_-r23§ + this.§_-x2D§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         var _loc8_:Number = this.§_-g2§ + this.§_-i1j§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         if(_loc7_ < 0.1)
         {
            _loc7_ = 0.1;
         }
         if(_loc8_ < 0.1)
         {
            _loc8_ = 0.1;
         }
         var _loc9_:Number = this.§_-9v§[0].§_-B2g§ << 1;
         _loc2_.scale = _loc7_ / _loc9_;
         _loc2_.§_-fC§ = (_loc8_ - _loc7_) / _loc3_ / _loc9_;
         _loc2_.§_-e2g§ = _loc2_.frame = this.§_-KB§ ? this.§_-h2b§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 2147483648) : 0;
         _loc2_.§_-b1Q§ = this.mNumberOfFrames / _loc3_;
         var _loc10_:Number = this.§_-JR§.red;
         var _loc11_:Number = this.§_-JR§.green;
         var _loc12_:Number = this.§_-JR§.blue;
         var _loc13_:Number = this.§_-JR§.alpha;
         if(this.§_-p1O§.red != 0)
         {
            _loc10_ += this.§_-p1O§.red * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-p1O§.green != 0)
         {
            _loc11_ += this.§_-p1O§.green * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-p1O§.blue != 0)
         {
            _loc12_ += this.§_-p1O§.blue * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-p1O§.alpha != 0)
         {
            _loc13_ += this.§_-p1O§.alpha * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         var _loc14_:Number = this.§_-ui§.red;
         var _loc15_:Number = this.§_-ui§.green;
         var _loc16_:Number = this.§_-ui§.blue;
         var _loc17_:Number = this.§_-ui§.alpha;
         if(this.§_-T4§.red != 0)
         {
            _loc14_ += this.§_-T4§.red * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-T4§.green != 0)
         {
            _loc15_ += this.§_-T4§.green * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-T4§.blue != 0)
         {
            _loc16_ += this.§_-T4§.blue * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-T4§.alpha != 0)
         {
            _loc17_ += this.§_-T4§.alpha * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         _loc2_.§_-e17§ = _loc10_;
         _loc2_.§_-g3§ = _loc11_;
         _loc2_.§_-h0§ = _loc12_;
         _loc2_.§_-T22§ = _loc13_;
         _loc2_.§_-BF§ = (_loc14_ - _loc10_) / _loc3_;
         _loc2_.§_-v2V§ = (_loc15_ - _loc11_) / _loc3_;
         _loc2_.§_-53s§ = (_loc16_ - _loc12_) / _loc3_;
         _loc2_.§_-220§ = (_loc17_ - _loc13_) / _loc3_;
         if(this.§_-r1G§)
         {
            _loc18_ = _loc4_ + this.§_-f1X§ + this.§_-eo§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
            _loc19_ = _loc4_ + this.§_-G1X§ + this.§_-lp§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         else
         {
            _loc18_ = this.§_-f1X§ + this.§_-eo§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
            _loc19_ = this.§_-G1X§ + this.§_-lp§ * ((§_-C1I§ = §_-C1I§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         _loc2_.rotation = _loc18_;
         _loc2_.§_-K8§ = (_loc19_ - _loc18_) / _loc3_;
         _loc2_.§_-a1L§ = 1;
         _loc2_.§_-Z1J§ = 1;
         _loc2_.§_-uU§ = 1;
      }
      
      private function complete() : void
      {
         if(!this.§_-cC§)
         {
            this.§_-cC§ = true;
            §_-g11§(§_-K2c§.Event.COMPLETE);
         }
      }
      
      override public function dispose() : void
      {
         §_-R2u§.splice(§_-R2u§.indexOf(this),1);
         removeEventListener(§_-K2c§.Event.ADDED_TO_STAGE,this.§_-p0§);
         this.stop(true);
         this.§_-Z1e§ = false;
         super.filter = this.§_-M25§ = null;
         removeFromParent();
         super.dispose();
         this.§_-C1X§ = true;
      }
      
      public function get §_-01O§() : Boolean
      {
         return this.§_-C1X§;
      }
      
      override public function set filter(param1:FragmentFilter) : void
      {
         if(!this.§_-Z1e§)
         {
            this.§_-M25§ = param1;
         }
         super.filter = param1;
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         if(param1 == this || param1 == null)
         {
            if(this.§_-i1S§)
            {
               param2 = this.§_-i1S§;
            }
            else if(stage)
            {
               param2.x = 0;
               param2.y = 0;
               param2.width = stage.stageWidth;
               param2.height = stage.stageHeight;
            }
            else
            {
               §_-eJ§(param1,§_-S19§);
               §_-rI§.§_-Sy§(§_-S19§,0,0,§_-G2g§);
               param2.x = §_-G2g§.x;
               param2.y = §_-G2g§.y;
               param2.width = param2.height = 0;
            }
            return param2;
         }
         if(param1)
         {
            if(this.§_-i1S§)
            {
               §_-eJ§(param1,§_-S19§);
               §_-rI§.§_-Sy§(§_-S19§,this.§_-i1S§.x,this.§_-i1S§.y,§_-G2g§);
               param2.x = §_-G2g§.x;
               param2.y = §_-G2g§.y;
               §_-rI§.§_-Sy§(§_-S19§,this.§_-i1S§.width,this.§_-i1S§.height,§_-G2g§);
               param2.width = §_-G2g§.x;
               param2.height = §_-G2g§.y;
            }
            else if(stage)
            {
               param2.x = 0;
               param2.y = 0;
               param2.width = stage.stageWidth;
               param2.height = stage.stageHeight;
            }
            else
            {
               §_-eJ§(param1,§_-S19§);
               §_-rI§.§_-Sy§(§_-S19§,0,0,§_-G2g§);
               param2.x = §_-G2g§.x;
               param2.y = §_-G2g§.y;
               param2.width = param2.height = 0;
            }
            return param2;
         }
         return this.§_-i1S§;
      }
      
      private function §_-B2X§() : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.§_-X1J§)
         {
            return true;
         }
         if(this.§_-C1X§)
         {
            return false;
         }
         if(§_-93D§.length >= this.§_-41h§)
         {
            this.§_-X1J§ = new Vector.<§_-a29§>(this.§_-41h§,true);
            _loc3_ = this.§_-41h§;
            _loc4_ = int(§_-93D§.length);
            §_-93D§.fixed = false;
            while(_loc3_)
            {
               this.§_-X1J§[--_loc3_] = §_-93D§[--_loc4_];
               this.§_-X1J§[_loc3_].active = false;
               §_-93D§[_loc4_] = null;
            }
            §_-93D§.length = _loc4_;
            §_-93D§.fixed = true;
            this.§_-oW§ = new §_-km§(this.§_-41h§ * 4);
            this.§_-N2d§ = 0;
            this.§_-Av§(this.§_-41h§ - this.§_-X1J§.length);
            return true;
         }
         if(§_-N2f§)
         {
            return false;
         }
         var _loc1_:int = §_-93D§.length - 1;
         var _loc2_:int = this.§_-41h§;
         §_-93D§.fixed = false;
         while(++_loc1_ < _loc2_)
         {
            §_-93D§[_loc1_] = new §_-a29§();
         }
         §_-93D§.fixed = true;
         return this.§_-B2X§();
      }
      
      private function §_-NP§(param1:§_-l21§) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:Number = 1 / 180 * Math.PI;
         this.§_-Q2z§ = Boolean(param1.isAnimated);
         this.§_-51f§ = int(param1.loops);
         this.§_-G2P§ = int(param1.firstFrame);
         this.§_-B3l§ = int(param1.lastFrame);
         this.§_-KB§ = Boolean(param1.randomStartFrames);
         this.§_-12q§ = Boolean(param1.tinted);
         this.§_-L18§ = Number(param1.spawnTime);
         this.§_-02Q§ = Number(param1.fadeInTime);
         this.§_-r1U§ = Number(param1.fadeOutTime);
         this.§_-L2§ = int(param1.emitterType);
         this.§_-41h§ = int(param1.maxParticles);
         this.§_-eM§.x = this.§_-823§ = Number(param1.§_-l2e§);
         this.§_-eM§.y = this.§_-z22§ = Number(param1.§_-716§);
         this.§_-DH§ = Number(param1.§_-Y2W§);
         this.§_-W1C§ = Number(param1.§_-21s§);
         this.§_-I29§ = Number(param1.§_-lK§);
         this.§_-U2G§ = Number(param1.§_-U2G§);
         this.§_-s2R§ = Number(param1.angle) * _loc2_;
         this.§_-c2j§ = Number(param1.angleVariance) * _loc2_;
         this.§_-r23§ = Number(param1.startParticleSize);
         this.§_-x2D§ = Number(param1.startParticleSizeVariance);
         this.§_-g2§ = Number(param1.finishParticleSize);
         this.§_-i1j§ = Number(param1.finishParticleSizeVariance);
         this.§_-f1X§ = Number(param1.rotationStart) * _loc2_;
         this.§_-eo§ = Number(param1.rotationStartVariance) * _loc2_;
         this.§_-G1X§ = Number(param1.rotationEnd) * _loc2_;
         this.§_-lp§ = Number(param1.rotationEndVariance) * _loc2_;
         this.§_-Bb§ = Number(param1.duration);
         this.§_-Bb§ = this.§_-Bb§ < 0 ? Number.MAX_VALUE : this.§_-Bb§;
         this.§_-b1I§ = Number(param1.§_-232§);
         this.§_-i1Y§ = Number(param1.§_-r1M§);
         this.§_-V1n§ = Number(param1.speed);
         this.§_-VY§ = Number(param1.speedVariance);
         this.§_-j21§ = Number(param1.radialAcceleration);
         this.§_-m2r§ = Number(param1.§_-72O§);
         this.§_-L2L§ = Number(param1.tangentialAcceleration);
         this.§_-W2F§ = Number(param1.§_-Pg§);
         this.§_-J2i§ = Number(param1.maxRadius);
         this.§_-gl§ = Number(param1.maxRadiusVariance);
         this.minRadius = Number(param1.minRadius);
         this.§_-i1t§ = Number(param1.minRadiusVariance);
         this.§_-w1r§ = Number(param1.rotatePerSecond) * _loc2_;
         this.§_-E2A§ = Number(param1.rotatePerSecondVariance) * _loc2_;
         this.§_-JR§.red = Number(param1.startColor.red);
         this.§_-JR§.green = Number(param1.startColor.green);
         this.§_-JR§.blue = Number(param1.startColor.blue);
         this.§_-JR§.alpha = Number(param1.startColor.alpha);
         this.§_-p1O§.red = Number(param1.startColorVariance.red);
         this.§_-p1O§.green = Number(param1.startColorVariance.green);
         this.§_-p1O§.blue = Number(param1.startColorVariance.blue);
         this.§_-p1O§.alpha = Number(param1.startColorVariance.alpha);
         this.§_-ui§.red = Number(param1.finishColor.red);
         this.§_-ui§.green = Number(param1.finishColor.green);
         this.§_-ui§.blue = Number(param1.finishColor.blue);
         this.§_-ui§.alpha = Number(param1.finishColor.alpha);
         this.§_-T4§.red = Number(param1.finishColorVariance.red);
         this.§_-T4§.green = Number(param1.finishColorVariance.green);
         this.§_-T4§.blue = Number(param1.finishColorVariance.blue);
         this.§_-T4§.alpha = Number(param1.finishColorVariance.alpha);
         this.§_-938§ = String(param1.blendFuncSource);
         this.§_-y27§ = String(param1.blendFuncDestination);
         this.§_-r1G§ = Boolean(param1.emitAngleAlignedRotation);
         this.§_-qf§ = Boolean(param1.excactBounds);
         this.§_-W1E§ = param1.texture;
         this.§_-C2W§ = Boolean(param1.premultipliedAlpha);
         this.§_-M25§ = param1.filter;
         this.§_-B1p§ = param1.§_-q1F§;
         this.§_-63r§ = param1.sortFunction;
         this.§_-t1H§ = param1.§_-t1H§;
         this.§_-9v§ = param1.§_-9v§;
         this.§_-h2b§ = this.§_-B3l§ - this.§_-G2P§ + 1;
         this.mNumberOfFrames = this.§_-9v§.length - 1 - (this.§_-KB§ && this.§_-Q2z§ ? this.§_-h2b§ : 0);
         this.mFrameLUTLength = this.§_-9v§.length - 1;
      }
      
      public function §_-H15§(param1:§_-l21§ = null) : §_-l21§
      {
         if(!param1)
         {
            param1 = new §_-l21§(this.§_-W1E§);
         }
         var _loc2_:Number = 180 / Math.PI;
         param1.isAnimated = this.§_-Q2z§;
         param1.loops = this.§_-51f§;
         param1.firstFrame = this.§_-G2P§;
         param1.lastFrame = this.§_-B3l§;
         param1.randomStartFrames = this.§_-KB§;
         param1.tinted = this.§_-12q§;
         param1.premultipliedAlpha = this.§_-C2W§;
         param1.spawnTime = this.§_-L18§;
         param1.fadeInTime = this.§_-02Q§;
         param1.fadeOutTime = this.§_-r1U§;
         param1.emitterType = this.§_-L2§;
         param1.maxParticles = this.§_-41h§;
         param1.§_-l2e§ = this.§_-823§;
         param1.§_-716§ = this.§_-z22§;
         param1.§_-Y2W§ = this.§_-DH§;
         param1.§_-21s§ = this.§_-W1C§;
         param1.§_-lK§ = this.§_-I29§;
         param1.§_-U2G§ = this.§_-6M§;
         param1.angle = this.§_-s2R§ * _loc2_;
         param1.angleVariance = this.§_-c2j§ * _loc2_;
         param1.startParticleSize = this.§_-r23§;
         param1.startParticleSizeVariance = this.§_-x2D§;
         param1.finishParticleSize = this.§_-g2§;
         param1.finishParticleSizeVariance = this.§_-i1j§;
         param1.rotationStart = this.§_-f1X§ * _loc2_;
         param1.rotationStartVariance = this.§_-eo§ * _loc2_;
         param1.rotationEnd = this.§_-G1X§ * _loc2_;
         param1.rotationEndVariance = this.§_-lp§ * _loc2_;
         param1.duration = this.§_-Bb§ == Number.MAX_VALUE ? -1 : this.§_-Bb§;
         param1.§_-232§ = this.§_-b1I§;
         param1.§_-r1M§ = this.§_-i1Y§;
         param1.speed = this.§_-V1n§;
         param1.speedVariance = this.§_-VY§;
         param1.radialAcceleration = this.§_-j21§;
         param1.§_-72O§ = this.§_-m2r§;
         param1.tangentialAcceleration = this.§_-L2L§;
         param1.§_-Pg§ = this.§_-W2F§;
         param1.maxRadius = this.§_-J2i§;
         param1.maxRadiusVariance = this.§_-gl§;
         param1.minRadius = this.§_-e2f§;
         param1.minRadiusVariance = this.§_-i1t§;
         param1.rotatePerSecond = this.§_-w1r§ * _loc2_;
         param1.rotatePerSecondVariance = this.§_-E2A§ * _loc2_;
         param1.startColor = this.§_-JR§;
         param1.startColorVariance = this.§_-p1O§;
         param1.finishColor = this.§_-ui§;
         param1.finishColorVariance = this.§_-T4§;
         param1.blendFuncSource = this.§_-938§;
         param1.blendFuncDestination = this.§_-y27§;
         param1.emitAngleAlignedRotation = this.§_-r1G§;
         param1.excactBounds = this.§_-02B§;
         param1.texture = this.§_-W1E§;
         param1.filter = this.§_-M25§;
         param1.§_-q1F§ = this.§_-B1p§;
         param1.sortFunction = this.§_-63r§;
         param1.§_-t1H§ = this.§_-t1H§;
         param1.§_-9v§ = this.§_-9v§;
         param1.firstFrame = this.§_-G2P§;
         param1.lastFrame = this.§_-B3l§;
         return param1;
      }
      
      public function §_-z1n§() : void
      {
         if(§_-QS§)
         {
            this.§_-F1O§.remove(this);
         }
         this.§_-ax§ = false;
      }
      
      private function §_-Av§(param1:int) : void
      {
         var _loc2_:int = this.§_-J1d§;
         var _loc3_:int = Math.min(this.§_-M28§,this.§_-J1d§ + param1);
         if(_loc2_ < _loc3_)
         {
            this.§_-oW§.§_-IG§ = _loc3_ * 4;
         }
      }
      
      private function §_-y20§(param1:Boolean) : Program3D
      {
         var _loc3_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc2_:Starling = Starling.§_-y1l§;
         if(this.§_-W1E§)
         {
            _loc3_ = §_-23p§(this.§_-12q§,this.§_-W1E§.mipMapping,this.§_-W1E§.repeat,this.§_-W1E§.format,this.§_-v2p§);
         }
         var _loc4_:Program3D = _loc2_.§_-y20§(_loc3_);
         if(!_loc4_)
         {
            if(!this.§_-W1E§)
            {
               _loc5_ = "m44 op, va0, vc1 \n" + "mul v0, va1, vc0 \n";
               _loc6_ = "mov oc, v0       \n";
            }
            else
            {
               _loc5_ = param1 ? "m44 op, va0, vc1 \n" + "mul v0, va1, vc0 \n" + "mov v1, va2      \n" : "m44 op, va0, vc1 \n" + "mov v1, va2      \n";
               _loc6_ = param1 ? "tex ft1,  v1, fs0 <???> \n" + "mul  oc, ft1,  v0       \n" : "tex  oc,  v1, fs0 <???> \n";
               _loc6_ = _loc6_.replace("<???>",§_-T2v§.§_-J2K§(this.§_-W1E§.format,this.§_-W1E§.mipMapping,this.§_-W1E§.repeat,this.smoothing));
            }
            _loc4_ = _loc2_.§_-12E§(_loc3_,_loc5_,_loc6_);
         }
         return _loc4_;
      }
      
      public function §_-AV§(param1:Boolean, param2:Number, param3:Texture, param4:Boolean, param5:String, param6:String, param7:String, param8:String, param9:FragmentFilter) : Boolean
      {
         if(this.§_-N2d§ == 0)
         {
            return false;
         }
         if(this.§_-W1E§ != null && param3 != null)
         {
            return this.§_-W1E§.base != param3.base || this.§_-W1E§.repeat != param3.repeat || this.§_-C2W§ != param4 || this.§_-v2p§ != param5 || this.§_-12q§ != (param1 || param2 != 1) || this.blendMode != param6 || this.§_-938§ != param7 || this.§_-y27§ != param8 || this.§_-M25§ != param9;
         }
         return true;
      }
      
      override public function render(param1:§_-T2v§, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc7_:§_-53f§ = null;
         var _loc8_:int = 0;
         this.§_-Jb§ = 0;
         this.getBounds(stage,this.§_-H2T§);
         if(this.§_-N2d§)
         {
            if(this.§_-T1u§)
            {
               if(!this.§_-Z1e§)
               {
                  _loc3_ = parent.getChildIndex(this);
                  _loc4_ = _loc3_;
                  _loc5_ = parent.numChildren;
                  while(++_loc4_ < _loc5_)
                  {
                     _loc6_ = parent.getChildAt(_loc4_);
                     if(!(_loc6_ is §_-53f§))
                     {
                        break;
                     }
                     _loc7_ = §_-53f§(_loc6_);
                     if(!(Boolean(_loc7_.§_-X1J§) && !_loc7_.§_-AV§(this.§_-12q§,this.alpha,this.§_-W1E§,this.§_-C2W§,this.§_-v2p§,blendMode,this.§_-938§,this.§_-y27§,this.§_-M25§)))
                     {
                        break;
                     }
                     _loc8_ = this.§_-63v§ + this.§_-Jb§ + _loc7_.§_-63v§;
                     if(_loc8_ > §_-iq§)
                     {
                        break;
                     }
                     this.§_-oW§.§_-T1R§.fixed = false;
                     _loc7_.§_-oW§.§_-13F§(this.§_-oW§,(this.§_-63v§ + this.§_-Jb§) * 4,0,_loc7_.§_-63v§ * 4);
                     this.§_-oW§.§_-T1R§.fixed = true;
                     this.§_-Jb§ += _loc7_.§_-63v§;
                     _loc7_.§_-Z1e§ = true;
                     _loc7_.filter = null;
                     _loc7_.getBounds(stage,§_-02i§);
                     if(this.§_-H2T§.intersects(§_-02i§))
                     {
                        this.§_-H2T§ = this.§_-H2T§.union(§_-02i§);
                     }
                  }
                  this.§_-q1X§(param1,this.alpha * param2,param1.blendMode);
               }
            }
            else
            {
               this.§_-q1X§(param1,this.alpha * param2,param1.blendMode);
            }
         }
         super.filter = this.§_-M25§;
         this.§_-Z1e§ = false;
      }
      
      private function §_-q1X§(param1:§_-T2v§, param2:Number = 1, param3:String = null) : void
      {
         §_-mj§ = ++§_-mj§ % §_-M9§;
         if(this.§_-N2d§ == 0 || !§_-yW§)
         {
            return;
         }
         param1.§_-A1U§();
         if(param1.hasOwnProperty("raiseDrawCount"))
         {
            param1.raiseDrawCount();
         }
         var _loc4_:String = §_-23p§(this.§_-12q§,this.§_-W1E§.mipMapping,this.§_-W1E§.repeat,this.§_-W1E§.format,this.§_-v2p§);
         var _loc5_:Context3D = Starling.context;
         §_-M1n§[0] = §_-M1n§[1] = §_-M1n§[2] = this.§_-C2W§ ? this.alpha : 1;
         §_-M1n§[3] = this.alpha;
         if(_loc5_ == null)
         {
            throw new §_-F2U§();
         }
         _loc5_.setBlendFactors(this.§_-938§,this.§_-y27§);
         §_-rI§.convertTo3D(param1.§_-F1Y§,§_-f2r§);
         _loc5_.setProgram(this.§_-y20§(this.§_-12q§));
         _loc5_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,§_-M1n§,1);
         _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,1,§_-f2r§,true);
         _loc5_.setTextureAt(0,this.§_-W1E§.base);
         §_-yW§[§_-mj§].uploadFromVector(this.§_-oW§.§_-T1R§,0,Math.min(§_-iq§ * 4,this.§_-oW§.§_-T1R§.length / 8));
         _loc5_.setVertexBufferAt(0,§_-yW§[§_-mj§],§_-km§.§_-9M§,Context3DVertexBufferFormat.FLOAT_2);
         if(this.§_-12q§)
         {
            _loc5_.setVertexBufferAt(1,§_-yW§[§_-mj§],§_-km§.§_-13V§,Context3DVertexBufferFormat.FLOAT_4);
         }
         _loc5_.setVertexBufferAt(2,§_-yW§[§_-mj§],§_-km§.§_-i2H§,Context3DVertexBufferFormat.FLOAT_2);
         if(this.§_-H2T§)
         {
            param1.§_-i1b§(this.§_-H2T§);
         }
         _loc5_.drawTriangles(§_-Zw§,0,Math.min(§_-iq§,this.§_-N2d§ + this.§_-Jb§) * 2);
         if(this.§_-H2T§)
         {
            param1.§_-L2f§();
         }
         _loc5_.setVertexBufferAt(2,null);
         _loc5_.setVertexBufferAt(1,null);
         _loc5_.setVertexBufferAt(0,null);
         _loc5_.setTextureAt(0,null);
      }
      
      public function §_-y2z§() : void
      {
         if(§_-QS§)
         {
            this.§_-F1O§.add(this);
         }
         this.§_-ax§ = true;
      }
      
      public function start(param1:Number = 0) : void
      {
         if(this.§_-cC§)
         {
            this.reset();
         }
         if(this.§_-72g§ != 0 && !this.§_-cC§)
         {
            if(param1 == 0)
            {
               param1 = this.§_-Bb§;
            }
            else if(param1 < 0)
            {
               param1 = Number.MAX_VALUE;
            }
            this.§_-ax§ = true;
            this.§_-93X§ = param1;
            this.§_-gU§ = 0;
            if(§_-QS§)
            {
               this.§_-F1O§.add(this);
            }
         }
      }
      
      public function stop(param1:Boolean = false) : void
      {
         this.§_-93X§ = 0;
         if(param1)
         {
            if(§_-QS§)
            {
               this.§_-F1O§.remove(this);
            }
            this.§_-ax§ = false;
            this.§_-21a§();
            §_-g11§(§_-K2c§.Event.CANCEL);
         }
      }
      
      public function reset() : Boolean
      {
         if(!this.§_-C1X§)
         {
            this.§_-72g§ = this.§_-41h§ / this.§_-I29§;
            this.§_-gU§ = 0;
            this.§_-ax§ = false;
            while(this.§_-N2d§)
            {
               this.§_-X1J§[--this.§_-N2d§].active = false;
            }
            this.§_-M28§ = this.§_-41h§ ? int(Math.min(§_-p24§,this.§_-41h§)) : §_-p24§;
            this.§_-cC§ = false;
            if(!this.§_-X1J§)
            {
               this.§_-B2X§();
            }
            return this.§_-X1J§ != null;
         }
         return false;
      }
      
      private function §_-21a§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:§_-53f§ = null;
         this.§_-N2d§ = 0;
         if(this.§_-X1J§)
         {
            _loc1_ = int(this.§_-X1J§.length);
            _loc2_ = §_-93D§.length - 1;
            §_-93D§.fixed = false;
            while(_loc1_)
            {
               §_-93D§[++_loc2_] = this.§_-X1J§[--_loc1_];
            }
            §_-93D§.fixed = true;
            this.§_-X1J§ = null;
         }
         this.§_-oW§ = null;
         if(§_-N2f§)
         {
            _loc3_ = 0;
            while(_loc3_ < §_-R2u§.length)
            {
               _loc4_ = §_-R2u§[_loc3_];
               if(Boolean(_loc4_ != this && !_loc4_.§_-cC§ && _loc4_.§_-ax§) && Boolean(_loc4_.parent) && _loc4_.§_-X1J§ == null)
               {
                  if(_loc4_.§_-B2X§())
                  {
                     break;
                  }
               }
               _loc3_++;
            }
         }
      }
      
      private function §_-Rt§() : void
      {
         this.§_-Kn§ = this.§_-41h§ / this.§_-I29§;
      }
      
      override public function get alpha() : Number
      {
         return this.§_-W26§;
      }
      
      override public function set alpha(param1:Number) : void
      {
         this.§_-W26§ = param1;
      }
      
      public function get §_-F2S§() : Boolean
      {
         return this.§_-T1u§;
      }
      
      public function set §_-F2S§(param1:Boolean) : void
      {
         this.§_-T1u§ = param1;
      }
      
      public function get blendFuncSource() : String
      {
         return this.§_-938§;
      }
      
      public function set blendFuncSource(param1:String) : void
      {
         this.§_-938§ = param1;
      }
      
      public function get blendFuncDestination() : String
      {
         return this.§_-y27§;
      }
      
      public function set blendFuncDestination(param1:String) : void
      {
         this.§_-y27§ = param1;
      }
      
      final public function get §_-J1d§() : int
      {
         return this.§_-oW§ ? int(this.§_-oW§.§_-IG§ / 4) : 0;
      }
      
      public function get completed() : Boolean
      {
         return this.§_-cC§;
      }
      
      public function set §_-q1F§(param1:Function) : void
      {
         this.§_-B1p§ = param1;
      }
      
      public function get §_-q1F§() : Function
      {
         return this.§_-B1p§;
      }
      
      public function get §_-63v§() : int
      {
         return this.§_-N2d§;
      }
      
      public function get §_-Q2Z§() : Number
      {
         return this.§_-41h§ / this.§_-72g§;
      }
      
      public function get §_-Kn§() : Number
      {
         return this.§_-72g§;
      }
      
      public function set §_-Kn§(param1:Number) : void
      {
         this.§_-72g§ = param1;
      }
      
      public function get §_-P26§() : Number
      {
         return this.§_-s2R§;
      }
      
      public function set §_-P26§(param1:Number) : void
      {
         this.§_-s2R§ = param1;
      }
      
      public function set emitAngleAlignedRotation(param1:Boolean) : void
      {
         this.§_-r1G§ = param1;
      }
      
      public function get emitAngleAlignedRotation() : Boolean
      {
         return this.§_-r1G§;
      }
      
      public function get §_-Y1u§() : Number
      {
         return this.§_-c2j§;
      }
      
      public function set §_-Y1u§(param1:Number) : void
      {
         this.§_-c2j§ = param1;
      }
      
      public function get emitterType() : int
      {
         return this.§_-L2§;
      }
      
      public function set emitterType(param1:int) : void
      {
         this.§_-L2§ = param1;
      }
      
      public function get §_-22K§() : Object
      {
         return this.§_-f1u§;
      }
      
      public function set §_-22K§(param1:Object) : void
      {
         this.§_-f1u§ = param1;
      }
      
      public function get §_-M2F§() : Number
      {
         return this.§_-eM§.x;
      }
      
      public function set §_-M2F§(param1:Number) : void
      {
         this.§_-eM§.x = param1 + this.offsetX;
      }
      
      public function get §_-21A§() : Number
      {
         return this.§_-DH§;
      }
      
      public function set §_-21A§(param1:Number) : void
      {
         this.§_-DH§ = param1;
      }
      
      public function get §_-Cg§() : Number
      {
         return this.§_-eM§.y;
      }
      
      public function set §_-Cg§(param1:Number) : void
      {
         this.§_-eM§.y = param1 + this.offsetY;
      }
      
      public function get §_-4V§() : Number
      {
         return this.§_-W1C§;
      }
      
      public function set §_-4V§(param1:Number) : void
      {
         this.§_-W1C§ = param1;
      }
      
      public function get §_-V1N§() : Boolean
      {
         return Boolean(this.§_-93X§);
      }
      
      public function get §_-E2g§() : §_-b1i§
      {
         return this.§_-ui§;
      }
      
      public function set §_-E2g§(param1:§_-b1i§) : void
      {
         if(param1)
         {
            this.§_-ui§ = param1;
         }
      }
      
      public function get §_-J2s§() : §_-b1i§
      {
         return this.§_-T4§;
      }
      
      public function set §_-J2s§(param1:§_-b1i§) : void
      {
         if(param1)
         {
            this.§_-T4§ = param1;
         }
      }
      
      public function get §_-Q15§() : Number
      {
         return this.§_-G1X§;
      }
      
      public function set §_-Q15§(param1:Number) : void
      {
         this.§_-G1X§ = param1;
      }
      
      public function get §_-836§() : Number
      {
         return this.§_-lp§;
      }
      
      public function set §_-836§(param1:Number) : void
      {
         this.§_-lp§ = param1;
      }
      
      public function get §_-d1g§() : Number
      {
         return this.§_-g2§;
      }
      
      public function set §_-d1g§(param1:Number) : void
      {
         this.§_-g2§ = param1;
      }
      
      public function get §_-xX§() : Number
      {
         return this.§_-i1j§;
      }
      
      public function set §_-xX§(param1:Number) : void
      {
         this.§_-i1j§ = param1;
      }
      
      public function get §_-qf§() : Boolean
      {
         return this.§_-02B§;
      }
      
      public function set §_-qf§(param1:Boolean) : void
      {
         this.§_-i1S§ = param1 ? new Rectangle() : null;
         this.§_-02B§ = param1;
      }
      
      public function get fadeInTime() : Number
      {
         return this.§_-02Q§;
      }
      
      public function set fadeInTime(param1:Number) : void
      {
         this.§_-02Q§ = Math.max(0,Math.min(param1,1));
      }
      
      public function get fadeOutTime() : Number
      {
         return this.§_-r1U§;
      }
      
      public function set fadeOutTime(param1:Number) : void
      {
         this.§_-r1U§ = Math.max(0,Math.min(param1,1));
      }
      
      public function get §_-232§() : Number
      {
         return this.§_-b1I§;
      }
      
      public function set §_-232§(param1:Number) : void
      {
         this.§_-b1I§ = param1;
      }
      
      public function get §_-r1M§() : Number
      {
         return this.§_-i1Y§;
      }
      
      public function set §_-r1M§(param1:Number) : void
      {
         this.§_-i1Y§ = param1;
      }
      
      public function get §_-lK§() : Number
      {
         return this.§_-I29§;
      }
      
      public function set §_-lK§(param1:Number) : void
      {
         this.§_-I29§ = Math.max(0.01,param1);
         this.§_-6M§ = Math.min(this.§_-I29§,this.§_-6M§);
         this.§_-Rt§();
      }
      
      public function get §_-U2G§() : Number
      {
         return this.§_-6M§;
      }
      
      public function set §_-U2G§(param1:Number) : void
      {
         this.§_-6M§ = Math.min(this.§_-I29§,param1);
      }
      
      public function get §_-X1R§() : uint
      {
         return this.§_-M28§;
      }
      
      public function set §_-X1R§(param1:uint) : void
      {
         this.§_-M28§ = Math.min(§_-p24§,this.§_-z2m§,param1);
      }
      
      public function get §_-z2m§() : uint
      {
         return this.§_-41h§;
      }
      
      public function set §_-z2m§(param1:uint) : void
      {
         this.§_-21a§();
         this.§_-M28§ = Math.min(§_-p24§,param1);
         this.§_-41h§ = this.§_-X1R§;
         var _loc2_:Boolean = this.§_-B2X§();
         if(!_loc2_)
         {
            this.stop();
         }
         this.§_-Rt§();
      }
      
      public function get maxRadius() : Number
      {
         return this.§_-J2i§;
      }
      
      public function set maxRadius(param1:Number) : void
      {
         this.§_-J2i§ = param1;
      }
      
      public function get maxRadiusVariance() : Number
      {
         return this.§_-gl§;
      }
      
      public function set maxRadiusVariance(param1:Number) : void
      {
         this.§_-gl§ = param1;
      }
      
      public function get minRadius() : Number
      {
         return this.§_-e2f§;
      }
      
      public function set minRadius(param1:Number) : void
      {
         this.§_-e2f§ = param1;
      }
      
      public function get minRadiusVariance() : Number
      {
         return this.§_-i1t§;
      }
      
      public function set minRadiusVariance(param1:Number) : void
      {
         this.§_-i1t§ = param1;
      }
      
      public function get §_-51x§() : Boolean
      {
         return this.§_-ax§;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         return this.§_-C2W§;
      }
      
      public function set premultipliedAlpha(param1:Boolean) : void
      {
         this.§_-C2W§ = param1;
      }
      
      public function get radialAcceleration() : Number
      {
         return this.§_-j21§;
      }
      
      public function set radialAcceleration(param1:Number) : void
      {
         this.§_-j21§ = param1;
      }
      
      public function get §_-72O§() : Number
      {
         return this.§_-m2r§;
      }
      
      public function set §_-72O§(param1:Number) : void
      {
         this.§_-m2r§ = param1;
      }
      
      public function get randomStartFrames() : Boolean
      {
         return this.§_-KB§;
      }
      
      public function set randomStartFrames(param1:Boolean) : void
      {
         this.§_-KB§ = param1;
      }
      
      public function get rotatePerSecond() : Number
      {
         return this.§_-w1r§;
      }
      
      public function set rotatePerSecond(param1:Number) : void
      {
         this.§_-w1r§ = param1;
      }
      
      public function get rotatePerSecondVariance() : Number
      {
         return this.§_-E2A§;
      }
      
      public function set rotatePerSecondVariance(param1:Number) : void
      {
         this.§_-E2A§ = param1;
      }
      
      public function get smoothing() : String
      {
         return this.§_-v2p§;
      }
      
      public function set smoothing(param1:String) : void
      {
         if(§_-a1g§.§_-CQ§(param1))
         {
            this.§_-v2p§ = param1;
         }
      }
      
      public function set sortFunction(param1:Function) : void
      {
         this.§_-63r§ = param1;
      }
      
      public function get sortFunction() : Function
      {
         return this.§_-63r§;
      }
      
      public function get startColor() : §_-b1i§
      {
         return this.§_-JR§;
      }
      
      public function set startColor(param1:§_-b1i§) : void
      {
         if(param1)
         {
            this.§_-JR§ = param1;
         }
      }
      
      public function get startColorVariance() : §_-b1i§
      {
         return this.§_-p1O§;
      }
      
      public function set startColorVariance(param1:§_-b1i§) : void
      {
         if(param1)
         {
            this.§_-p1O§ = param1;
         }
      }
      
      public function get §_-IA§() : Number
      {
         return this.§_-r23§;
      }
      
      public function set §_-IA§(param1:Number) : void
      {
         this.§_-r23§ = param1;
      }
      
      public function get §_-jW§() : Number
      {
         return this.§_-x2D§;
      }
      
      public function set §_-jW§(param1:Number) : void
      {
         this.§_-x2D§ = param1;
      }
      
      public function get §_-K2L§() : Number
      {
         return this.§_-f1X§;
      }
      
      public function set §_-K2L§(param1:Number) : void
      {
         this.§_-f1X§ = param1;
      }
      
      public function get §_-O28§() : Number
      {
         return this.§_-eo§;
      }
      
      public function set §_-O28§(param1:Number) : void
      {
         this.§_-eo§ = param1;
      }
      
      public function get spawnTime() : Number
      {
         return this.§_-L18§;
      }
      
      public function set spawnTime(param1:Number) : void
      {
         this.§_-L18§ = Math.max(0,Math.min(param1,1));
      }
      
      public function get speed() : Number
      {
         return this.§_-V1n§;
      }
      
      public function set speed(param1:Number) : void
      {
         this.§_-V1n§ = param1;
      }
      
      public function get speedVariance() : Number
      {
         return this.§_-VY§;
      }
      
      public function set speedVariance(param1:Number) : void
      {
         this.§_-VY§ = param1;
      }
      
      public function get tangentialAcceleration() : Number
      {
         return this.§_-L2L§;
      }
      
      public function set tangentialAcceleration(param1:Number) : void
      {
         this.§_-L2L§ = param1;
      }
      
      public function get §_-Pg§() : Number
      {
         return this.§_-W2F§;
      }
      
      public function set §_-Pg§(param1:Number) : void
      {
         this.§_-W2F§ = param1;
      }
      
      public function get texture() : Texture
      {
         return this.§_-W1E§;
      }
      
      public function get tinted() : Boolean
      {
         return this.§_-12q§;
      }
      
      public function set tinted(param1:Boolean) : void
      {
         this.§_-12q§ = param1;
      }
      
      public function get §_-A3B§() : §_-537§
      {
         return this.§_-F1O§;
      }
      
      public function set §_-A3B§(param1:§_-537§) : void
      {
         if(param1 == null || param1 == this.§_-F1O§)
         {
            return;
         }
         if(this.§_-F1O§.contains(this))
         {
            this.§_-F1O§.remove(this);
            param1.add(this);
         }
         this.§_-F1O§ = param1;
      }
   }
}

