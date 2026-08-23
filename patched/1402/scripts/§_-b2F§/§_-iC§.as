package §_-b2F§
{
   import §_-625§.§_-j1b§;
   import §_-81P§.§_-93Y§;
   import §_-81P§.§_-Io§;
   import §_-f1T§.Event;
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
   import starling.core.§_-wz§;
   import starling.display.DisplayObject;
   import starling.filters.FragmentFilter;
   import starling.textures.SubTexture;
   import starling.textures.Texture;
   import starling.textures.§_-RS§;
   import starling.utils.§_-U2i§;
   import starling.utils.§_-r1p§;
   
   public class §_-iC§ extends DisplayObject implements §_-93Y§
   {
      
      public static const §_-527§:int = 0;
      
      public static const §_-Jk§:int = 1;
      
      public static const §_-81O§:int = 16383;
      
      private static var §_-93I§:Vector.<uint>;
      
      private static var §_-K1R§:IndexBuffer3D;
      
      private static var §_-O1M§:Vector.<§_-3i§>;
      
      private static var §_-3J§:Vector.<VertexBuffer3D>;
      
      private static var §_-J1k§:int;
      
      public static var §_-Pj§:Boolean = true;
      
      public static var §_-A7§:Boolean = true;
      
      public static var §_-D1Q§:§_-Io§ = Starling.§_-zb§;
      
      private static var §_-zn§:uint = 0;
      
      private static var §_-bZ§:uint = 0;
      
      private static var §_-72t§:int = -1;
      
      private static var §_-7w§:Matrix = new Matrix();
      
      private static var §_-O§:Point = new Point();
      
      private static var §_-s2M§:Vector.<Number> = new <Number>[1,1,1,1];
      
      private static var §_-m2k§:Matrix3D = new Matrix3D();
      
      private static var §_-c1j§:Vector.<§_-iC§> = new Vector.<§_-iC§>(0);
      
      private static var §_-BG§:Dictionary = new Dictionary();
      
      private static var §_-K1P§:Boolean = false;
      
      private static var §_-Xi§:Vector.<Number> = new Vector.<Number>(2048,true);
      
      private static var §_-q16§:Vector.<Number> = new Vector.<Number>(2048,true);
      
      private static var §_-Co§:Boolean = false;
      
      private static var §_-01K§:uint = 1;
      
      private static var §_-T1w§:Rectangle = new Rectangle();
      
      public var §_-Pj§:Boolean = §_-iC§.§_-Pj§;
      
      public var §_-O1f§:Boolean = false;
      
      private var §_-63b§:§_-Io§ = §_-iC§.§_-D1Q§;
      
      private var §_-22X§:Boolean = false;
      
      private var §_-X2v§:Boolean = true;
      
      private var §_-q1A§:Rectangle;
      
      private var §_-pi§:Boolean;
      
      private var §_-m2W§:Function;
      
      private var §_-W2a§:Boolean = false;
      
      private var §_-T2E§:Number = 0;
      
      private var §_-43f§:Number = 0;
      
      private var §_-A2K§:FragmentFilter = null;
      
      private var §_-O2j§:int;
      
      private var §_-Gs§:int = 0;
      
      private var §_-6N§:int = 0;
      
      private var §_-41l§:Boolean = false;
      
      private var §_-l1x§:Boolean = false;
      
      private var §_-22w§:String = "bilinear";
      
      private var §_-Wo§:Function;
      
      private var §_-JT§:Number = 0;
      
      private var §_-u1X§:Number = 1;
      
      private var §_-A1m§:Texture;
      
      private var §_-O2F§:Boolean = false;
      
      private var §_-9X§:Boolean = false;
      
      private var §_-R1S§:Boolean = false;
      
      private var §_-V1y§:Vector.<§_-3i§>;
      
      private var §_-Q1L§:§_-U2i§;
      
      private var §_-h2B§:int;
      
      private var §_-oi§:Number;
      
      private var §_-Iv§:Number;
      
      private var §_-h2p§:int;
      
      private var §_-wG§:Number;
      
      private var §_-i2k§:Number;
      
      private var §_-Xf§:Number;
      
      private var §_-n2b§:Number;
      
      private var §_-q1C§:Number;
      
      private var §_-Jt§:Number;
      
      private var §_-Hf§:Number;
      
      private var §_-f1c§:Number;
      
      private var §_-j1t§:Boolean = false;
      
      private var §_-i1i§:Number;
      
      private var §_-13Z§:Number;
      
      private var §_-Ld§:Number;
      
      private var §_-Y2R§:Number;
      
      private var §_-T2Z§:Number;
      
      private var §_-Op§:Number;
      
      private var §_-M1B§:Number;
      
      private var §_-A3e§:Number;
      
      private var §_-Pm§:Number;
      
      private var §_-cc§:Number;
      
      private var §_-53E§:Number;
      
      private var §_-DH§:Number;
      
      private var §_-Z1W§:Number;
      
      private var §_-S1V§:Number;
      
      private var §_-e2L§:Number;
      
      private var §_-c24§:Number;
      
      private var §_-83l§:Number;
      
      private var §_-LV§:Number;
      
      private var §_-fZ§:§_-L2N§ = new §_-L2N§(1,1,1,1);
      
      private var §_-L2B§:§_-L2N§ = new §_-L2N§(0,0,0,0);
      
      private var §_-J10§:§_-L2N§ = new §_-L2N§(1,1,1,1);
      
      private var §_-m2s§:§_-L2N§ = new §_-L2N§(0,0,0,0);
      
      private var §_-D1x§:Number = 1;
      
      private var §_-819§:int = 1;
      
      private var §_-iO§:uint = 0;
      
      private var §_-s2u§:Vector.<Frame>;
      
      private var mFrameLUTLength:uint;
      
      private var §_-Z2n§:Number;
      
      private var §_-j3§:uint = 4294967295;
      
      private var mNumberOfFrames:int = 1;
      
      private var §_-w29§:Boolean = false;
      
      private var §_-I1d§:String;
      
      private var §_-IP§:String;
      
      private var §_-A20§:Number;
      
      private var §_-T29§:Number = -1;
      
      private var §_-42r§:Number = -1;
      
      private var §_-p1H§:Number = 0;
      
      private var §_-7q§:Number = 0;
      
      public var §_-HA§:Point = new Point();
      
      private var §_-w2W§:Object;
      
      public var offsetX:Number = 0;
      
      public var offsetY:Number = 0;
      
      private var §_-J1g§:Rectangle = new Rectangle();
      
      public function §_-iC§(param1:§_-C1T§)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("config must not be null");
         }
         §_-c1j§.push(this);
         this.§_-x1S§(param1);
      }
      
      private static function §_-I24§(param1:uint) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(§_-3J§)
         {
            _loc4_ = 0;
            while(_loc4_ < §_-3J§.length)
            {
               §_-3J§[_loc4_].dispose();
               _loc4_++;
            }
         }
         if(§_-K1R§)
         {
            §_-K1R§.dispose();
         }
         var _loc2_:Context3D = Starling.context;
         if(_loc2_ == null)
         {
            throw new §_-j1b§();
         }
         if(_loc2_.driverInfo == "Disposed")
         {
            return;
         }
         §_-3J§ = new Vector.<VertexBuffer3D>();
         §_-72t§ = -1;
         if(ApplicationDomain.currentDomain.hasDefinition("flash.display3D.Context3DBufferUsage"))
         {
            _loc4_ = 0;
            while(_loc4_ < §_-J1k§)
            {
               §_-3J§[_loc4_] = _loc2_.createVertexBuffer.call(_loc2_,param1 * 4,§_-U2i§.§_-l1J§,"dynamicDraw");
               _loc4_++;
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < §_-J1k§)
            {
               §_-3J§[_loc4_] = _loc2_.createVertexBuffer(param1 * 4,§_-U2i§.§_-l1J§);
               _loc4_++;
            }
         }
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.length = param1 * 16 * §_-U2i§.§_-l1J§;
         _loc4_ = 0;
         while(_loc4_ < §_-J1k§)
         {
            §_-3J§[_loc4_].uploadFromByteArray(_loc3_,0,0,param1 * 4);
            _loc4_++;
         }
         _loc3_.length = 0;
         if(!§_-93I§)
         {
            §_-93I§ = new Vector.<uint>();
            _loc5_ = 0;
            _loc6_ = -1;
            _loc4_ = 0;
            while(_loc4_ < §_-81O§)
            {
               §_-93I§[++_loc6_] = _loc5_;
               §_-93I§[++_loc6_] = _loc5_ + 1;
               §_-93I§[++_loc6_] = _loc5_ + 2;
               §_-93I§[++_loc6_] = _loc5_ + 1;
               §_-93I§[++_loc6_] = _loc5_ + 3;
               §_-93I§[++_loc6_] = _loc5_ + 2;
               _loc5_ += 4;
               _loc4_++;
            }
         }
         §_-K1R§ = _loc2_.createIndexBuffer(param1 * 6);
         §_-K1R§.uploadFromVector(§_-93I§,0,param1 * 6);
      }
      
      public static function init(param1:uint = 16383, param2:Boolean = false, param3:uint = 0, param4:uint = 1) : void
      {
         var _loc5_:int = 0;
         if(!param3 && Boolean(§_-zn§))
         {
            param3 = §_-zn§;
         }
         if(param3 > §_-81O§)
         {
            param3 = uint(§_-81O§);
         }
         else if(param3 <= 0)
         {
            param3 = uint(§_-81O§);
         }
         §_-zn§ = param3;
         §_-J1k§ = param4;
         §_-I24§(§_-zn§);
         if(!§_-K1P§)
         {
            §_-W1§();
         }
         if(!§_-O1M§)
         {
            §_-Co§ = param2;
            §_-O1M§ = new Vector.<§_-3i§>();
            §_-bZ§ = param1;
            _loc5_ = -1;
            while(++_loc5_ < §_-bZ§)
            {
               §_-O1M§[_loc5_] = new §_-3i§();
            }
         }
         if(§_-D1Q§ == null)
         {
            §_-D1Q§ = Starling.§_-zb§;
         }
         Starling.§_-n1s§.stage3D.addEventListener(flash.events.Event.CONTEXT3D_CREATE,§_-42J§,false,0,true);
      }
      
      private static function §_-W1§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 2048)
         {
            §_-Xi§[_loc1_ & 0x07FF] = Math.cos(_loc1_ * 0.0030679615757712823);
            §_-q16§[_loc1_ & 0x07FF] = Math.sin(_loc1_ * 0.0030679615757712823);
            _loc1_++;
         }
         §_-K1P§ = true;
      }
      
      public static function dispose() : void
      {
         Starling.§_-n1s§.stage3D.removeEventListener(flash.events.Event.CONTEXT3D_CREATE,§_-42J§);
         §_-Ol§();
         §_-E11§();
      }
      
      public static function §_-Ol§() : void
      {
         var _loc1_:§_-iC§ = null;
         var _loc2_:int = 0;
         for each(_loc1_ in §_-c1j§)
         {
            _loc1_.dispose();
         }
         if(§_-3J§)
         {
            _loc2_ = 0;
            while(_loc2_ < §_-J1k§)
            {
               §_-3J§[_loc2_].dispose();
               §_-3J§[_loc2_] = null;
               _loc2_++;
            }
            §_-3J§ = null;
            §_-J1k§ = 0;
         }
         if(§_-K1R§)
         {
            §_-K1R§.dispose();
            §_-K1R§ = null;
         }
         §_-zn§ = 0;
      }
      
      public static function §_-E11§() : void
      {
         var _loc1_:§_-iC§ = null;
         for each(_loc1_ in §_-c1j§)
         {
            _loc1_.dispose();
         }
         §_-O1M§ = null;
      }
      
      private static function §_-42J§(param1:flash.events.Event) : void
      {
         §_-I24§(§_-zn§);
      }
      
      private static function §_-P10§(param1:Boolean, param2:Boolean = true, param3:Boolean = false, param4:String = "bgra", param5:String = "bilinear") : String
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
         if(param5 == §_-RS§.NONE)
         {
            _loc6_ |= 1 << 3;
         }
         else if(param5 == §_-RS§.§_-ww§)
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
         var _loc7_:String = §_-BG§[_loc6_];
         if(_loc7_ == null)
         {
            _loc7_ = "QB_i." + _loc6_.toString(16);
            §_-BG§[_loc6_] = _loc7_;
         }
         return _loc7_;
      }
      
      public static function get §_-n11§() : uint
      {
         return §_-O1M§.length;
      }
      
      public static function get §_-2R§() : uint
      {
         return §_-bZ§;
      }
      
      private function §_-A21§(param1:§_-f1T§.Event) : void
      {
         this.§_-O2j§ = this.§_-h2p§ ? int(Math.min(§_-81O§,this.§_-h2p§)) : §_-81O§;
         if(param1)
         {
            this.§_-r1a§();
            if(this.§_-41l§)
            {
               this.start(this.§_-T29§);
            }
         }
      }
      
      final private function §_-63§(param1:§_-3i§, param2:Number) : void
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
         var _loc3_:§_-3i§ = param1;
         var _loc4_:Number = _loc3_.§_-R1Z§ - _loc3_.currentTime;
         param2 = _loc4_ > param2 ? param2 : _loc4_;
         _loc3_.currentTime += param2;
         if(this.§_-h2B§ == §_-Jk§)
         {
            _loc3_.§_-s26§ += _loc3_.§_-My§ * param2;
            _loc3_.§_-j1W§ += _loc3_.§_-t2S§ * param2;
            _loc5_ = uint(_loc3_.§_-s26§ * 325.94932345220167 & 0x07FF);
            _loc3_.x = this.§_-p1H§ - §_-Xi§[_loc5_] * _loc3_.§_-j1W§;
            _loc3_.y = this.§_-7q§ - §_-q16§[_loc5_] * _loc3_.§_-j1W§;
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
            _loc3_.§_-x6§ += param2 * (this.§_-M1B§ + _loc9_ + _loc11_);
            _loc3_.§_-HY§ += param2 * (this.§_-A3e§ + _loc10_ + _loc12_);
            _loc3_.x += _loc3_.§_-x6§ * param2;
            _loc3_.y += _loc3_.§_-HY§ * param2;
         }
         else
         {
            _loc3_.§_-x6§ += param2 * this.§_-M1B§;
            _loc3_.§_-HY§ += param2 * this.§_-A3e§;
            _loc3_.x += _loc3_.§_-x6§ * param2;
            _loc3_.y += _loc3_.§_-HY§ * param2;
         }
         _loc3_.scale += _loc3_.§_-x1t§ * param2;
         _loc3_.rotation += _loc3_.§_-Yj§ * param2;
         if(this.§_-w29§)
         {
            _loc3_.frame += _loc3_.§_-R15§ * param2;
            _loc3_.§_-T2C§ = _loc3_.frame;
            if(_loc3_.§_-T2C§ > this.mFrameLUTLength)
            {
               _loc3_.§_-T2C§ = this.mFrameLUTLength;
            }
         }
         if(this.§_-O2F§)
         {
            _loc3_.§_-TV§ += _loc3_.§_-32U§ * param2;
            _loc3_.§_-732§ += _loc3_.§_-E0§ * param2;
            _loc3_.§_-p2q§ += _loc3_.§_-A2J§ * param2;
            _loc3_.§_-z1v§ += _loc3_.§_-G2u§ * param2;
         }
      }
      
      public function §_-a1Q§(param1:Number) : void
      {
         var _loc4_:§_-3i§ = null;
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
         var _loc25_:§_-3i§ = null;
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
         var _loc2_:Boolean = this.§_-O1f§;
         this.§_-Z2n§ += param1;
         if(!this.§_-V1y§)
         {
            if(this.§_-T29§)
            {
               this.§_-T29§ -= param1;
               if(this.§_-T29§ != Number.MAX_VALUE)
               {
                  this.§_-T29§ = Math.max(0,this.§_-T29§ - param1);
               }
               return;
            }
            this.stop(this.§_-Pj§);
            this.complete();
            return;
         }
         var _loc3_:int = 0;
         if(this.§_-w2W§ != null)
         {
            this.§_-p1H§ = this.§_-HA§.x = this.§_-w2W§.x;
            this.§_-7q§ = this.§_-HA§.y = this.§_-w2W§.y;
         }
         else
         {
            this.§_-p1H§ = this.§_-HA§.x;
            this.§_-7q§ = this.§_-HA§.y;
         }
         while(_loc3_ < this.§_-6N§)
         {
            _loc4_ = this.§_-V1y§[_loc3_];
            if(_loc4_.currentTime < _loc4_.§_-R1Z§)
            {
               this.§_-63§(_loc4_,param1);
               _loc3_++;
            }
            else
            {
               _loc4_.active = false;
               if(_loc3_ != --this.§_-6N§)
               {
                  _loc25_ = this.§_-V1y§[this.§_-6N§];
                  this.§_-V1y§[this.§_-6N§] = _loc4_;
                  this.§_-V1y§[_loc3_] = _loc25_;
                  _loc2_ = true;
               }
               if(this.§_-6N§ == 0 && this.§_-T29§ < 0)
               {
                  this.stop(this.§_-Pj§);
                  this.complete();
                  return;
               }
            }
         }
         if(this.§_-T29§ > 0)
         {
            _loc26_ = 1 / this.§_-A20§;
            while(this.§_-Z2n§ > 0 && this.§_-6N§ < this.§_-O2j§)
            {
               if(this.§_-6N§ == this.§_-42w§)
               {
                  this.§_-A1b§(this.§_-42w§);
               }
               _loc4_ = this.§_-V1y§[this.§_-6N§];
               this.§_-h1X§(_loc4_);
               this.§_-63§(_loc4_,this.§_-Z2n§);
               ++this.§_-6N§;
               this.§_-Z2n§ -= _loc26_;
            }
            if(this.§_-T29§ != Number.MAX_VALUE)
            {
               this.§_-T29§ = Math.max(0,this.§_-T29§ - param1);
            }
         }
         else if(!this.§_-pi§ && this.§_-6N§ == 0)
         {
            this.stop(this.§_-Pj§);
            this.complete();
            return;
         }
         if(!this.§_-V1y§)
         {
            return;
         }
         if(this.§_-m2W§ !== null)
         {
            this.§_-m2W§(this.§_-V1y§,this.§_-6N§);
         }
         if(_loc2_ && this.§_-Wo§ !== null)
         {
            this.§_-V1y§ = this.§_-V1y§.sort(this.§_-Wo§);
         }
         var _loc5_:int = 0;
         var _loc15_:Vector.<Number> = this.§_-Q1L§.§_-H1O§;
         if(Boolean(this.§_-JT§) || Boolean(this.§_-T2E§) || Boolean(this.§_-43f§))
         {
            _loc28_ = 0;
            while(_loc28_ < this.§_-6N§)
            {
               _loc4_ = this.§_-V1y§[_loc28_];
               _loc27_ = _loc4_.currentTime / _loc4_.§_-R1Z§;
               if(this.§_-JT§)
               {
                  _loc4_.§_-k1u§ = _loc27_ < this.§_-JT§ ? _loc27_ / this.§_-JT§ : 1;
               }
               if(this.§_-T2E§)
               {
                  _loc4_.§_-73T§ = _loc27_ < this.§_-T2E§ ? _loc27_ / this.§_-T2E§ : 1;
               }
               if(this.§_-43f§)
               {
                  _loc27_ = 1 - _loc27_;
                  _loc4_.§_-l2v§ = _loc27_ < this.§_-43f§ ? _loc27_ / this.§_-43f§ : 1;
               }
               _loc28_++;
            }
         }
         _loc28_ = 0;
         while(_loc28_ < this.§_-6N§)
         {
            _loc5_ = _loc28_ << 2;
            _loc4_ = this.§_-V1y§[_loc28_];
            _loc16_ = this.§_-s2u§[_loc4_.§_-T2C§];
            _loc6_ = _loc4_.§_-TV§;
            _loc7_ = _loc4_.§_-732§;
            _loc8_ = _loc4_.§_-p2q§;
            _loc9_ = _loc4_.§_-z1v§ * _loc4_.§_-73T§ * _loc4_.§_-l2v§ * this.§_-u1X§;
            _loc10_ = _loc4_.rotation;
            _loc11_ = _loc4_.x;
            _loc12_ = _loc4_.y;
            _loc13_ = _loc16_.§_-81E§ * _loc4_.scale * _loc4_.§_-k1u§;
            _loc14_ = _loc16_.§_-7D§ * _loc4_.scale * _loc4_.§_-k1u§;
            if(_loc10_)
            {
               _loc17_ = uint(_loc10_ * 325.94932345220167 & 0x07FF);
               _loc18_ = §_-Xi§[_loc17_];
               _loc19_ = §_-q16§[_loc17_];
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
               _loc15_[++_loc24_] = _loc16_.§_-m2Y§;
               _loc15_[++_loc24_] = _loc16_.§_-1a§;
               _loc15_[++_loc24_] = _loc11_ + _loc20_ + _loc23_;
               _loc15_[++_loc24_] = _loc12_ + _loc22_ - _loc21_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-pm§;
               _loc15_[++_loc24_] = _loc16_.§_-1a§;
               _loc15_[++_loc24_] = _loc11_ - _loc20_ - _loc23_;
               _loc15_[++_loc24_] = _loc12_ - _loc22_ + _loc21_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-m2Y§;
               _loc15_[++_loc24_] = _loc16_.§_-S0§;
               _loc15_[++_loc24_] = _loc11_ + _loc20_ - _loc23_;
               _loc15_[++_loc24_] = _loc12_ + _loc22_ + _loc21_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-pm§;
               _loc15_[++_loc24_] = _loc16_.§_-S0§;
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
               _loc15_[++_loc24_] = _loc16_.§_-m2Y§;
               _loc15_[++_loc24_] = _loc16_.§_-1a§;
               _loc15_[++_loc24_] = _loc11_ + _loc13_;
               _loc15_[++_loc24_] = _loc12_ - _loc14_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-pm§;
               _loc15_[++_loc24_] = _loc16_.§_-1a§;
               _loc15_[++_loc24_] = _loc11_ - _loc13_;
               _loc15_[++_loc24_] = _loc12_ + _loc14_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-m2Y§;
               _loc15_[++_loc24_] = _loc16_.§_-S0§;
               _loc15_[++_loc24_] = _loc11_ + _loc13_;
               _loc15_[++_loc24_] = _loc12_ + _loc14_;
               _loc15_[++_loc24_] = _loc6_;
               _loc15_[++_loc24_] = _loc7_;
               _loc15_[++_loc24_] = _loc8_;
               _loc15_[++_loc24_] = _loc9_;
               _loc15_[++_loc24_] = _loc16_.§_-pm§;
               _loc15_[++_loc24_] = _loc16_.§_-S0§;
            }
            _loc28_++;
         }
         if(this.§_-R1S§)
         {
            _loc29_ = 0;
            _loc30_ = 1;
            _loc31_ = 0;
            _loc32_ = 0;
            _loc33_ = Number.MAX_VALUE;
            _loc34_ = Number.MIN_VALUE;
            _loc35_ = Number.MAX_VALUE;
            _loc36_ = Number.MIN_VALUE;
            _loc28_ = int(this.§_-6N§ * 4);
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
            this.§_-q1A§.x = _loc33_;
            this.§_-q1A§.y = _loc35_;
            this.§_-q1A§.width = _loc34_ - _loc33_;
            this.§_-q1A§.height = _loc36_ - _loc35_;
         }
      }
      
      private function §_-x1S§(param1:§_-C1T§) : void
      {
         var _loc2_:SubTexture = null;
         var _loc3_:Frame = null;
         this.§_-cs§(param1);
         if(!this.§_-s2u§)
         {
            if(this.§_-A1m§ is SubTexture)
            {
               _loc2_ = SubTexture(this.§_-A1m§);
               _loc3_ = new Frame(1,1,_loc2_.§_-a2t§.x,_loc2_.§_-a2t§.y,_loc2_.§_-a2t§.width,_loc2_.§_-a2t§.height);
               _loc3_.§_-81E§ = this.§_-A1m§.width >> 1;
               _loc3_.§_-7D§ = this.§_-A1m§.height >> 1;
               this.§_-s2u§ = new <Frame>[_loc3_];
            }
            else
            {
               this.§_-s2u§ = new <Frame>[new Frame(this.§_-A1m§.root.width,this.§_-A1m§.root.height,0,0,this.§_-A1m§.width,this.§_-A1m§.height)];
            }
         }
         this.§_-A20§ = this.§_-h2p§ / this.§_-wG§;
         this.§_-T29§ = 0;
         this.§_-Z2n§ = 0;
         this.§_-O2j§ = this.§_-h2p§ ? int(Math.min(§_-81O§,this.§_-h2p§)) : §_-81O§;
         if(!§_-3J§ || !§_-3J§[0])
         {
            init();
         }
         if(§_-D1Q§ == null)
         {
            §_-D1Q§ = Starling.§_-zb§;
         }
         addEventListener(§_-f1T§.Event.ADDED_TO_STAGE,this.§_-A21§);
         this.§_-A21§(null);
      }
      
      final private function §_-h1X§(param1:§_-3i§) : void
      {
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc2_:§_-3i§ = param1;
         var _loc3_:Number = this.§_-wG§ + this.§_-i2k§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         if(_loc3_ <= 0)
         {
            return;
         }
         _loc2_.active = true;
         _loc2_.currentTime = 0;
         _loc2_.§_-R1Z§ = _loc3_;
         _loc2_.x = this.§_-p1H§ + this.§_-oi§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.y = this.§_-7q§ + this.§_-Iv§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.startX = this.§_-p1H§;
         _loc2_.startY = this.§_-7q§;
         var _loc4_:Number = this.§_-Hf§ + this.§_-f1c§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         var _loc5_:uint = uint(_loc4_ * 325.94932345220167 & 0x07FF);
         var _loc6_:Number = this.§_-T2Z§ + this.§_-Op§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.§_-x6§ = _loc6_ * §_-Xi§[_loc5_];
         _loc2_.§_-HY§ = _loc6_ * §_-q16§[_loc5_];
         _loc2_.§_-j1W§ = this.§_-Z1W§ + this.§_-S1V§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.§_-t2S§ = this.§_-Z1W§ / _loc3_;
         _loc2_.§_-j1W§ = this.§_-Z1W§ + this.§_-S1V§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.§_-t2S§ = (this.§_-e2L§ + this.§_-c24§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1) - _loc2_.§_-j1W§) / _loc3_;
         _loc2_.§_-s26§ = this.§_-Hf§ + this.§_-f1c§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.§_-My§ = this.§_-83l§ + this.§_-LV§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.radialAcceleration = this.§_-Pm§ + this.§_-cc§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         _loc2_.tangentialAcceleration = this.§_-53E§ + this.§_-DH§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         var _loc7_:Number = this.§_-Xf§ + this.§_-n2b§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         var _loc8_:Number = this.§_-q1C§ + this.§_-Jt§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         if(_loc7_ < 0.1)
         {
            _loc7_ = 0.1;
         }
         if(_loc8_ < 0.1)
         {
            _loc8_ = 0.1;
         }
         var _loc9_:Number = this.§_-s2u§[0].§_-81E§ << 1;
         _loc2_.scale = _loc7_ / _loc9_;
         _loc2_.§_-x1t§ = (_loc8_ - _loc7_) / _loc3_ / _loc9_;
         _loc2_.§_-T2C§ = _loc2_.frame = this.§_-l1x§ ? this.§_-819§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 2147483648) : 0;
         _loc2_.§_-R15§ = this.mNumberOfFrames / _loc3_;
         var _loc10_:Number = this.§_-fZ§.red;
         var _loc11_:Number = this.§_-fZ§.green;
         var _loc12_:Number = this.§_-fZ§.blue;
         var _loc13_:Number = this.§_-fZ§.alpha;
         if(this.§_-L2B§.red != 0)
         {
            _loc10_ += this.§_-L2B§.red * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-L2B§.green != 0)
         {
            _loc11_ += this.§_-L2B§.green * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-L2B§.blue != 0)
         {
            _loc12_ += this.§_-L2B§.blue * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-L2B§.alpha != 0)
         {
            _loc13_ += this.§_-L2B§.alpha * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         var _loc14_:Number = this.§_-J10§.red;
         var _loc15_:Number = this.§_-J10§.green;
         var _loc16_:Number = this.§_-J10§.blue;
         var _loc17_:Number = this.§_-J10§.alpha;
         if(this.§_-m2s§.red != 0)
         {
            _loc14_ += this.§_-m2s§.red * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-m2s§.green != 0)
         {
            _loc15_ += this.§_-m2s§.green * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-m2s§.blue != 0)
         {
            _loc16_ += this.§_-m2s§.blue * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         if(this.§_-m2s§.alpha != 0)
         {
            _loc17_ += this.§_-m2s§.alpha * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         _loc2_.§_-TV§ = _loc10_;
         _loc2_.§_-732§ = _loc11_;
         _loc2_.§_-p2q§ = _loc12_;
         _loc2_.§_-z1v§ = _loc13_;
         _loc2_.§_-32U§ = (_loc14_ - _loc10_) / _loc3_;
         _loc2_.§_-E0§ = (_loc15_ - _loc11_) / _loc3_;
         _loc2_.§_-A2J§ = (_loc16_ - _loc12_) / _loc3_;
         _loc2_.§_-G2u§ = (_loc17_ - _loc13_) / _loc3_;
         if(this.§_-j1t§)
         {
            _loc18_ = _loc4_ + this.§_-i1i§ + this.§_-13Z§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
            _loc19_ = _loc4_ + this.§_-Ld§ + this.§_-Y2R§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         else
         {
            _loc18_ = this.§_-i1i§ + this.§_-13Z§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
            _loc19_ = this.§_-Ld§ + this.§_-Y2R§ * ((§_-01K§ = §_-01K§ * 16807 & 0x7FFFFFFF) / 1073741824 - 1);
         }
         _loc2_.rotation = _loc18_;
         _loc2_.§_-Yj§ = (_loc19_ - _loc18_) / _loc3_;
         _loc2_.§_-k1u§ = 1;
         _loc2_.§_-73T§ = 1;
         _loc2_.§_-l2v§ = 1;
      }
      
      private function complete() : void
      {
         if(!this.§_-pi§)
         {
            this.§_-pi§ = true;
            §_-12v§(§_-f1T§.Event.COMPLETE);
         }
      }
      
      override public function dispose() : void
      {
         §_-c1j§.splice(§_-c1j§.indexOf(this),1);
         removeEventListener(§_-f1T§.Event.ADDED_TO_STAGE,this.§_-A21§);
         this.stop(true);
         this.§_-22X§ = false;
         super.filter = this.§_-A2K§ = null;
         removeFromParent();
         super.dispose();
         this.§_-W2a§ = true;
      }
      
      public function get §_-C1L§() : Boolean
      {
         return this.§_-W2a§;
      }
      
      override public function set filter(param1:FragmentFilter) : void
      {
         if(!this.§_-22X§)
         {
            this.§_-A2K§ = param1;
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
            if(this.§_-q1A§)
            {
               param2 = this.§_-q1A§;
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
               §_-R1D§(param1,§_-7w§);
               §_-r1p§.§_-317§(§_-7w§,0,0,§_-O§);
               param2.x = §_-O§.x;
               param2.y = §_-O§.y;
               param2.width = param2.height = 0;
            }
            return param2;
         }
         if(param1)
         {
            if(this.§_-q1A§)
            {
               §_-R1D§(param1,§_-7w§);
               §_-r1p§.§_-317§(§_-7w§,this.§_-q1A§.x,this.§_-q1A§.y,§_-O§);
               param2.x = §_-O§.x;
               param2.y = §_-O§.y;
               §_-r1p§.§_-317§(§_-7w§,this.§_-q1A§.width,this.§_-q1A§.height,§_-O§);
               param2.width = §_-O§.x;
               param2.height = §_-O§.y;
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
               §_-R1D§(param1,§_-7w§);
               §_-r1p§.§_-317§(§_-7w§,0,0,§_-O§);
               param2.x = §_-O§.x;
               param2.y = §_-O§.y;
               param2.width = param2.height = 0;
            }
            return param2;
         }
         return this.§_-q1A§;
      }
      
      private function §_-r1a§() : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.§_-V1y§)
         {
            return true;
         }
         if(this.§_-W2a§)
         {
            return false;
         }
         if(§_-O1M§.length >= this.§_-h2p§)
         {
            this.§_-V1y§ = new Vector.<§_-3i§>(this.§_-h2p§,true);
            _loc3_ = this.§_-h2p§;
            _loc4_ = int(§_-O1M§.length);
            §_-O1M§.fixed = false;
            while(_loc3_)
            {
               this.§_-V1y§[--_loc3_] = §_-O1M§[--_loc4_];
               this.§_-V1y§[_loc3_].active = false;
               §_-O1M§[_loc4_] = null;
            }
            §_-O1M§.length = _loc4_;
            §_-O1M§.fixed = true;
            this.§_-Q1L§ = new §_-U2i§(this.§_-h2p§ * 4);
            this.§_-6N§ = 0;
            this.§_-A1b§(this.§_-h2p§ - this.§_-V1y§.length);
            return true;
         }
         if(§_-Co§)
         {
            return false;
         }
         var _loc1_:int = §_-O1M§.length - 1;
         var _loc2_:int = this.§_-h2p§;
         §_-O1M§.fixed = false;
         while(++_loc1_ < _loc2_)
         {
            §_-O1M§[_loc1_] = new §_-3i§();
         }
         §_-O1M§.fixed = true;
         return this.§_-r1a§();
      }
      
      private function §_-cs§(param1:§_-C1T§) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:Number = 1 / 180 * Math.PI;
         this.§_-w29§ = Boolean(param1.isAnimated);
         this.§_-D1x§ = int(param1.loops);
         this.§_-iO§ = int(param1.firstFrame);
         this.§_-j3§ = int(param1.lastFrame);
         this.§_-l1x§ = Boolean(param1.randomStartFrames);
         this.§_-O2F§ = Boolean(param1.tinted);
         this.§_-JT§ = Number(param1.spawnTime);
         this.§_-T2E§ = Number(param1.fadeInTime);
         this.§_-43f§ = Number(param1.fadeOutTime);
         this.§_-h2B§ = int(param1.emitterType);
         this.§_-h2p§ = int(param1.maxParticles);
         this.§_-HA§.x = this.§_-p1H§ = Number(param1.§_-T2Y§);
         this.§_-HA§.y = this.§_-7q§ = Number(param1.§_-72F§);
         this.§_-oi§ = Number(param1.§_-dh§);
         this.§_-Iv§ = Number(param1.§_-S1L§);
         this.§_-wG§ = Number(param1.§_-X2M§);
         this.§_-O2c§ = Number(param1.§_-O2c§);
         this.§_-Hf§ = Number(param1.angle) * _loc2_;
         this.§_-f1c§ = Number(param1.angleVariance) * _loc2_;
         this.§_-Xf§ = Number(param1.startParticleSize);
         this.§_-n2b§ = Number(param1.startParticleSizeVariance);
         this.§_-q1C§ = Number(param1.finishParticleSize);
         this.§_-Jt§ = Number(param1.finishParticleSizeVariance);
         this.§_-i1i§ = Number(param1.rotationStart) * _loc2_;
         this.§_-13Z§ = Number(param1.rotationStartVariance) * _loc2_;
         this.§_-Ld§ = Number(param1.rotationEnd) * _loc2_;
         this.§_-Y2R§ = Number(param1.rotationEndVariance) * _loc2_;
         this.§_-42r§ = Number(param1.duration);
         this.§_-42r§ = this.§_-42r§ < 0 ? Number.MAX_VALUE : this.§_-42r§;
         this.§_-M1B§ = Number(param1.§_-Go§);
         this.§_-A3e§ = Number(param1.§_-S10§);
         this.§_-T2Z§ = Number(param1.speed);
         this.§_-Op§ = Number(param1.speedVariance);
         this.§_-Pm§ = Number(param1.radialAcceleration);
         this.§_-cc§ = Number(param1.§_-jJ§);
         this.§_-53E§ = Number(param1.tangentialAcceleration);
         this.§_-DH§ = Number(param1.§_-I2w§);
         this.§_-Z1W§ = Number(param1.maxRadius);
         this.§_-S1V§ = Number(param1.maxRadiusVariance);
         this.minRadius = Number(param1.minRadius);
         this.§_-c24§ = Number(param1.minRadiusVariance);
         this.§_-83l§ = Number(param1.rotatePerSecond) * _loc2_;
         this.§_-LV§ = Number(param1.rotatePerSecondVariance) * _loc2_;
         this.§_-fZ§.red = Number(param1.startColor.red);
         this.§_-fZ§.green = Number(param1.startColor.green);
         this.§_-fZ§.blue = Number(param1.startColor.blue);
         this.§_-fZ§.alpha = Number(param1.startColor.alpha);
         this.§_-L2B§.red = Number(param1.startColorVariance.red);
         this.§_-L2B§.green = Number(param1.startColorVariance.green);
         this.§_-L2B§.blue = Number(param1.startColorVariance.blue);
         this.§_-L2B§.alpha = Number(param1.startColorVariance.alpha);
         this.§_-J10§.red = Number(param1.finishColor.red);
         this.§_-J10§.green = Number(param1.finishColor.green);
         this.§_-J10§.blue = Number(param1.finishColor.blue);
         this.§_-J10§.alpha = Number(param1.finishColor.alpha);
         this.§_-m2s§.red = Number(param1.finishColorVariance.red);
         this.§_-m2s§.green = Number(param1.finishColorVariance.green);
         this.§_-m2s§.blue = Number(param1.finishColorVariance.blue);
         this.§_-m2s§.alpha = Number(param1.finishColorVariance.alpha);
         this.§_-I1d§ = String(param1.blendFuncSource);
         this.§_-IP§ = String(param1.blendFuncDestination);
         this.§_-j1t§ = Boolean(param1.emitAngleAlignedRotation);
         this.§_-s1g§ = Boolean(param1.excactBounds);
         this.§_-A1m§ = param1.texture;
         this.§_-9X§ = Boolean(param1.premultipliedAlpha);
         this.§_-A2K§ = param1.filter;
         this.§_-m2W§ = param1.§_-93V§;
         this.§_-Wo§ = param1.sortFunction;
         this.§_-O1f§ = param1.§_-O1f§;
         this.§_-s2u§ = param1.§_-s2u§;
         this.§_-819§ = this.§_-j3§ - this.§_-iO§ + 1;
         this.mNumberOfFrames = this.§_-s2u§.length - 1 - (this.§_-l1x§ && this.§_-w29§ ? this.§_-819§ : 0);
         this.mFrameLUTLength = this.§_-s2u§.length - 1;
      }
      
      public function §_-T23§(param1:§_-C1T§ = null) : §_-C1T§
      {
         if(!param1)
         {
            param1 = new §_-C1T§(this.§_-A1m§);
         }
         var _loc2_:Number = 180 / Math.PI;
         param1.isAnimated = this.§_-w29§;
         param1.loops = this.§_-D1x§;
         param1.firstFrame = this.§_-iO§;
         param1.lastFrame = this.§_-j3§;
         param1.randomStartFrames = this.§_-l1x§;
         param1.tinted = this.§_-O2F§;
         param1.premultipliedAlpha = this.§_-9X§;
         param1.spawnTime = this.§_-JT§;
         param1.fadeInTime = this.§_-T2E§;
         param1.fadeOutTime = this.§_-43f§;
         param1.emitterType = this.§_-h2B§;
         param1.maxParticles = this.§_-h2p§;
         param1.§_-T2Y§ = this.§_-p1H§;
         param1.§_-72F§ = this.§_-7q§;
         param1.§_-dh§ = this.§_-oi§;
         param1.§_-S1L§ = this.§_-Iv§;
         param1.§_-X2M§ = this.§_-wG§;
         param1.§_-O2c§ = this.§_-i2k§;
         param1.angle = this.§_-Hf§ * _loc2_;
         param1.angleVariance = this.§_-f1c§ * _loc2_;
         param1.startParticleSize = this.§_-Xf§;
         param1.startParticleSizeVariance = this.§_-n2b§;
         param1.finishParticleSize = this.§_-q1C§;
         param1.finishParticleSizeVariance = this.§_-Jt§;
         param1.rotationStart = this.§_-i1i§ * _loc2_;
         param1.rotationStartVariance = this.§_-13Z§ * _loc2_;
         param1.rotationEnd = this.§_-Ld§ * _loc2_;
         param1.rotationEndVariance = this.§_-Y2R§ * _loc2_;
         param1.duration = this.§_-42r§ == Number.MAX_VALUE ? -1 : this.§_-42r§;
         param1.§_-Go§ = this.§_-M1B§;
         param1.§_-S10§ = this.§_-A3e§;
         param1.speed = this.§_-T2Z§;
         param1.speedVariance = this.§_-Op§;
         param1.radialAcceleration = this.§_-Pm§;
         param1.§_-jJ§ = this.§_-cc§;
         param1.tangentialAcceleration = this.§_-53E§;
         param1.§_-I2w§ = this.§_-DH§;
         param1.maxRadius = this.§_-Z1W§;
         param1.maxRadiusVariance = this.§_-S1V§;
         param1.minRadius = this.§_-e2L§;
         param1.minRadiusVariance = this.§_-c24§;
         param1.rotatePerSecond = this.§_-83l§ * _loc2_;
         param1.rotatePerSecondVariance = this.§_-LV§ * _loc2_;
         param1.startColor = this.§_-fZ§;
         param1.startColorVariance = this.§_-L2B§;
         param1.finishColor = this.§_-J10§;
         param1.finishColorVariance = this.§_-m2s§;
         param1.blendFuncSource = this.§_-I1d§;
         param1.blendFuncDestination = this.§_-IP§;
         param1.emitAngleAlignedRotation = this.§_-j1t§;
         param1.excactBounds = this.§_-R1S§;
         param1.texture = this.§_-A1m§;
         param1.filter = this.§_-A2K§;
         param1.§_-93V§ = this.§_-m2W§;
         param1.sortFunction = this.§_-Wo§;
         param1.§_-O1f§ = this.§_-O1f§;
         param1.§_-s2u§ = this.§_-s2u§;
         param1.firstFrame = this.§_-iO§;
         param1.lastFrame = this.§_-j3§;
         return param1;
      }
      
      public function §_-Hb§() : void
      {
         if(§_-A7§)
         {
            this.§_-63b§.remove(this);
         }
         this.§_-41l§ = false;
      }
      
      private function §_-A1b§(param1:int) : void
      {
         var _loc2_:int = this.§_-42w§;
         var _loc3_:int = Math.min(this.§_-O2j§,this.§_-42w§ + param1);
         if(_loc2_ < _loc3_)
         {
            this.§_-Q1L§.§_-d18§ = _loc3_ * 4;
         }
      }
      
      private function §_-w1B§(param1:Boolean) : Program3D
      {
         var _loc3_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc2_:Starling = Starling.§_-n1s§;
         if(this.§_-A1m§)
         {
            _loc3_ = §_-P10§(this.§_-O2F§,this.§_-A1m§.mipMapping,this.§_-A1m§.repeat,this.§_-A1m§.format,this.§_-22w§);
         }
         var _loc4_:Program3D = _loc2_.§_-w1B§(_loc3_);
         if(!_loc4_)
         {
            if(!this.§_-A1m§)
            {
               _loc5_ = "m44 op, va0, vc1 \n" + "mul v0, va1, vc0 \n";
               _loc6_ = "mov oc, v0       \n";
            }
            else
            {
               _loc5_ = param1 ? "m44 op, va0, vc1 \n" + "mul v0, va1, vc0 \n" + "mov v1, va2      \n" : "m44 op, va0, vc1 \n" + "mov v1, va2      \n";
               _loc6_ = param1 ? "tex ft1,  v1, fs0 <???> \n" + "mul  oc, ft1,  v0       \n" : "tex  oc,  v1, fs0 <???> \n";
               _loc6_ = _loc6_.replace("<???>",§_-wz§.§_-X2C§(this.§_-A1m§.format,this.§_-A1m§.mipMapping,this.§_-A1m§.repeat,this.smoothing));
            }
            _loc4_ = _loc2_.§_-cI§(_loc3_,_loc5_,_loc6_);
         }
         return _loc4_;
      }
      
      public function §_-z2P§(param1:Boolean, param2:Number, param3:Texture, param4:Boolean, param5:String, param6:String, param7:String, param8:String, param9:FragmentFilter) : Boolean
      {
         if(this.§_-6N§ == 0)
         {
            return false;
         }
         if(this.§_-A1m§ != null && param3 != null)
         {
            return this.§_-A1m§.base != param3.base || this.§_-A1m§.repeat != param3.repeat || this.§_-9X§ != param4 || this.§_-22w§ != param5 || this.§_-O2F§ != (param1 || param2 != 1) || this.blendMode != param6 || this.§_-I1d§ != param7 || this.§_-IP§ != param8 || this.§_-A2K§ != param9;
         }
         return true;
      }
      
      override public function render(param1:§_-wz§, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc7_:§_-iC§ = null;
         var _loc8_:int = 0;
         this.§_-Gs§ = 0;
         this.getBounds(stage,this.§_-J1g§);
         if(this.§_-6N§)
         {
            if(this.§_-X2v§)
            {
               if(!this.§_-22X§)
               {
                  _loc3_ = parent.getChildIndex(this);
                  _loc4_ = _loc3_;
                  _loc5_ = parent.numChildren;
                  while(++_loc4_ < _loc5_)
                  {
                     _loc6_ = parent.getChildAt(_loc4_);
                     if(!(_loc6_ is §_-iC§))
                     {
                        break;
                     }
                     _loc7_ = §_-iC§(_loc6_);
                     if(!(Boolean(_loc7_.§_-V1y§) && !_loc7_.§_-z2P§(this.§_-O2F§,this.alpha,this.§_-A1m§,this.§_-9X§,this.§_-22w§,blendMode,this.§_-I1d§,this.§_-IP§,this.§_-A2K§)))
                     {
                        break;
                     }
                     _loc8_ = this.§_-d8§ + this.§_-Gs§ + _loc7_.§_-d8§;
                     if(_loc8_ > §_-zn§)
                     {
                        break;
                     }
                     this.§_-Q1L§.§_-H1O§.fixed = false;
                     _loc7_.§_-Q1L§.§_-5D§(this.§_-Q1L§,(this.§_-d8§ + this.§_-Gs§) * 4,0,_loc7_.§_-d8§ * 4);
                     this.§_-Q1L§.§_-H1O§.fixed = true;
                     this.§_-Gs§ += _loc7_.§_-d8§;
                     _loc7_.§_-22X§ = true;
                     _loc7_.filter = null;
                     _loc7_.getBounds(stage,§_-T1w§);
                     if(this.§_-J1g§.intersects(§_-T1w§))
                     {
                        this.§_-J1g§ = this.§_-J1g§.union(§_-T1w§);
                     }
                  }
                  this.§_-TG§(param1,this.alpha * param2,param1.blendMode);
               }
            }
            else
            {
               this.§_-TG§(param1,this.alpha * param2,param1.blendMode);
            }
         }
         super.filter = this.§_-A2K§;
         this.§_-22X§ = false;
      }
      
      private function §_-TG§(param1:§_-wz§, param2:Number = 1, param3:String = null) : void
      {
         §_-72t§ = ++§_-72t§ % §_-J1k§;
         if(this.§_-6N§ == 0 || !§_-3J§)
         {
            return;
         }
         param1.§_-z24§();
         if(param1.hasOwnProperty("raiseDrawCount"))
         {
            param1.raiseDrawCount();
         }
         var _loc4_:String = §_-P10§(this.§_-O2F§,this.§_-A1m§.mipMapping,this.§_-A1m§.repeat,this.§_-A1m§.format,this.§_-22w§);
         var _loc5_:Context3D = Starling.context;
         §_-s2M§[0] = §_-s2M§[1] = §_-s2M§[2] = this.§_-9X§ ? this.alpha : 1;
         §_-s2M§[3] = this.alpha;
         if(_loc5_ == null)
         {
            throw new §_-j1b§();
         }
         _loc5_.setBlendFactors(this.§_-I1d§,this.§_-IP§);
         §_-r1p§.convertTo3D(param1.§_-91t§,§_-m2k§);
         _loc5_.setProgram(this.§_-w1B§(this.§_-O2F§));
         _loc5_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,§_-s2M§,1);
         _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,1,§_-m2k§,true);
         _loc5_.setTextureAt(0,this.§_-A1m§.base);
         §_-3J§[§_-72t§].uploadFromVector(this.§_-Q1L§.§_-H1O§,0,Math.min(§_-zn§ * 4,this.§_-Q1L§.§_-H1O§.length / 8));
         _loc5_.setVertexBufferAt(0,§_-3J§[§_-72t§],§_-U2i§.§_-V2M§,Context3DVertexBufferFormat.FLOAT_2);
         if(this.§_-O2F§)
         {
            _loc5_.setVertexBufferAt(1,§_-3J§[§_-72t§],§_-U2i§.§_-c1S§,Context3DVertexBufferFormat.FLOAT_4);
         }
         _loc5_.setVertexBufferAt(2,§_-3J§[§_-72t§],§_-U2i§.§_-F2I§,Context3DVertexBufferFormat.FLOAT_2);
         if(this.§_-J1g§)
         {
            param1.§_-DM§(this.§_-J1g§);
         }
         _loc5_.drawTriangles(§_-K1R§,0,Math.min(§_-zn§,this.§_-6N§ + this.§_-Gs§) * 2);
         if(this.§_-J1g§)
         {
            param1.§_-b0§();
         }
         _loc5_.setVertexBufferAt(2,null);
         _loc5_.setVertexBufferAt(1,null);
         _loc5_.setVertexBufferAt(0,null);
         _loc5_.setTextureAt(0,null);
      }
      
      public function §_-9S§() : void
      {
         if(§_-A7§)
         {
            this.§_-63b§.add(this);
         }
         this.§_-41l§ = true;
      }
      
      public function start(param1:Number = 0) : void
      {
         if(this.§_-pi§)
         {
            this.reset();
         }
         if(this.§_-A20§ != 0 && !this.§_-pi§)
         {
            if(param1 == 0)
            {
               param1 = this.§_-42r§;
            }
            else if(param1 < 0)
            {
               param1 = Number.MAX_VALUE;
            }
            this.§_-41l§ = true;
            this.§_-T29§ = param1;
            this.§_-Z2n§ = 0;
            if(§_-A7§)
            {
               this.§_-63b§.add(this);
            }
         }
      }
      
      public function stop(param1:Boolean = false) : void
      {
         this.§_-T29§ = 0;
         if(param1)
         {
            if(§_-A7§)
            {
               this.§_-63b§.remove(this);
            }
            this.§_-41l§ = false;
            this.§_-P1W§();
            §_-12v§(§_-f1T§.Event.CANCEL);
         }
      }
      
      public function reset() : Boolean
      {
         if(!this.§_-W2a§)
         {
            this.§_-A20§ = this.§_-h2p§ / this.§_-wG§;
            this.§_-Z2n§ = 0;
            this.§_-41l§ = false;
            while(this.§_-6N§)
            {
               this.§_-V1y§[--this.§_-6N§].active = false;
            }
            this.§_-O2j§ = this.§_-h2p§ ? int(Math.min(§_-81O§,this.§_-h2p§)) : §_-81O§;
            this.§_-pi§ = false;
            if(!this.§_-V1y§)
            {
               this.§_-r1a§();
            }
            return this.§_-V1y§ != null;
         }
         return false;
      }
      
      private function §_-P1W§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:§_-iC§ = null;
         this.§_-6N§ = 0;
         if(this.§_-V1y§)
         {
            _loc1_ = int(this.§_-V1y§.length);
            _loc2_ = §_-O1M§.length - 1;
            §_-O1M§.fixed = false;
            while(_loc1_)
            {
               §_-O1M§[++_loc2_] = this.§_-V1y§[--_loc1_];
            }
            §_-O1M§.fixed = true;
            this.§_-V1y§ = null;
         }
         this.§_-Q1L§ = null;
         if(§_-Co§)
         {
            _loc3_ = 0;
            while(_loc3_ < §_-c1j§.length)
            {
               _loc4_ = §_-c1j§[_loc3_];
               if(Boolean(_loc4_ != this && !_loc4_.§_-pi§ && _loc4_.§_-41l§) && Boolean(_loc4_.parent) && _loc4_.§_-V1y§ == null)
               {
                  if(_loc4_.§_-r1a§())
                  {
                     break;
                  }
               }
               _loc3_++;
            }
         }
      }
      
      private function §_-72e§() : void
      {
         this.§_-xZ§ = this.§_-h2p§ / this.§_-wG§;
      }
      
      override public function get alpha() : Number
      {
         return this.§_-u1X§;
      }
      
      override public function set alpha(param1:Number) : void
      {
         this.§_-u1X§ = param1;
      }
      
      public function get §_-By§() : Boolean
      {
         return this.§_-X2v§;
      }
      
      public function set §_-By§(param1:Boolean) : void
      {
         this.§_-X2v§ = param1;
      }
      
      public function get blendFuncSource() : String
      {
         return this.§_-I1d§;
      }
      
      public function set blendFuncSource(param1:String) : void
      {
         this.§_-I1d§ = param1;
      }
      
      public function get blendFuncDestination() : String
      {
         return this.§_-IP§;
      }
      
      public function set blendFuncDestination(param1:String) : void
      {
         this.§_-IP§ = param1;
      }
      
      final public function get §_-42w§() : int
      {
         return this.§_-Q1L§ ? int(this.§_-Q1L§.§_-d18§ / 4) : 0;
      }
      
      public function get completed() : Boolean
      {
         return this.§_-pi§;
      }
      
      public function set §_-93V§(param1:Function) : void
      {
         this.§_-m2W§ = param1;
      }
      
      public function get §_-93V§() : Function
      {
         return this.§_-m2W§;
      }
      
      public function get §_-d8§() : int
      {
         return this.§_-6N§;
      }
      
      public function get §_-G1R§() : Number
      {
         return this.§_-h2p§ / this.§_-A20§;
      }
      
      public function get §_-xZ§() : Number
      {
         return this.§_-A20§;
      }
      
      public function set §_-xZ§(param1:Number) : void
      {
         this.§_-A20§ = param1;
      }
      
      public function get §_-B1N§() : Number
      {
         return this.§_-Hf§;
      }
      
      public function set §_-B1N§(param1:Number) : void
      {
         this.§_-Hf§ = param1;
      }
      
      public function set emitAngleAlignedRotation(param1:Boolean) : void
      {
         this.§_-j1t§ = param1;
      }
      
      public function get emitAngleAlignedRotation() : Boolean
      {
         return this.§_-j1t§;
      }
      
      public function get §_-Y1U§() : Number
      {
         return this.§_-f1c§;
      }
      
      public function set §_-Y1U§(param1:Number) : void
      {
         this.§_-f1c§ = param1;
      }
      
      public function get emitterType() : int
      {
         return this.§_-h2B§;
      }
      
      public function set emitterType(param1:int) : void
      {
         this.§_-h2B§ = param1;
      }
      
      public function get §_-M2S§() : Object
      {
         return this.§_-w2W§;
      }
      
      public function set §_-M2S§(param1:Object) : void
      {
         this.§_-w2W§ = param1;
      }
      
      public function get §_-L2Z§() : Number
      {
         return this.§_-HA§.x;
      }
      
      public function set §_-L2Z§(param1:Number) : void
      {
         this.§_-HA§.x = param1 + this.offsetX;
      }
      
      public function get §_-HL§() : Number
      {
         return this.§_-oi§;
      }
      
      public function set §_-HL§(param1:Number) : void
      {
         this.§_-oi§ = param1;
      }
      
      public function get §_-2F§() : Number
      {
         return this.§_-HA§.y;
      }
      
      public function set §_-2F§(param1:Number) : void
      {
         this.§_-HA§.y = param1 + this.offsetY;
      }
      
      public function get §_-l1N§() : Number
      {
         return this.§_-Iv§;
      }
      
      public function set §_-l1N§(param1:Number) : void
      {
         this.§_-Iv§ = param1;
      }
      
      public function get §_-6E§() : Boolean
      {
         return Boolean(this.§_-T29§);
      }
      
      public function get §_-k2l§() : §_-L2N§
      {
         return this.§_-J10§;
      }
      
      public function set §_-k2l§(param1:§_-L2N§) : void
      {
         if(param1)
         {
            this.§_-J10§ = param1;
         }
      }
      
      public function get §_-WR§() : §_-L2N§
      {
         return this.§_-m2s§;
      }
      
      public function set §_-WR§(param1:§_-L2N§) : void
      {
         if(param1)
         {
            this.§_-m2s§ = param1;
         }
      }
      
      public function get §_-E2X§() : Number
      {
         return this.§_-Ld§;
      }
      
      public function set §_-E2X§(param1:Number) : void
      {
         this.§_-Ld§ = param1;
      }
      
      public function get §_-s1A§() : Number
      {
         return this.§_-Y2R§;
      }
      
      public function set §_-s1A§(param1:Number) : void
      {
         this.§_-Y2R§ = param1;
      }
      
      public function get §_-SK§() : Number
      {
         return this.§_-q1C§;
      }
      
      public function set §_-SK§(param1:Number) : void
      {
         this.§_-q1C§ = param1;
      }
      
      public function get §_-61J§() : Number
      {
         return this.§_-Jt§;
      }
      
      public function set §_-61J§(param1:Number) : void
      {
         this.§_-Jt§ = param1;
      }
      
      public function get §_-s1g§() : Boolean
      {
         return this.§_-R1S§;
      }
      
      public function set §_-s1g§(param1:Boolean) : void
      {
         this.§_-q1A§ = param1 ? new Rectangle() : null;
         this.§_-R1S§ = param1;
      }
      
      public function get fadeInTime() : Number
      {
         return this.§_-T2E§;
      }
      
      public function set fadeInTime(param1:Number) : void
      {
         this.§_-T2E§ = Math.max(0,Math.min(param1,1));
      }
      
      public function get fadeOutTime() : Number
      {
         return this.§_-43f§;
      }
      
      public function set fadeOutTime(param1:Number) : void
      {
         this.§_-43f§ = Math.max(0,Math.min(param1,1));
      }
      
      public function get §_-Go§() : Number
      {
         return this.§_-M1B§;
      }
      
      public function set §_-Go§(param1:Number) : void
      {
         this.§_-M1B§ = param1;
      }
      
      public function get §_-S10§() : Number
      {
         return this.§_-A3e§;
      }
      
      public function set §_-S10§(param1:Number) : void
      {
         this.§_-A3e§ = param1;
      }
      
      public function get §_-X2M§() : Number
      {
         return this.§_-wG§;
      }
      
      public function set §_-X2M§(param1:Number) : void
      {
         this.§_-wG§ = Math.max(0.01,param1);
         this.§_-i2k§ = Math.min(this.§_-wG§,this.§_-i2k§);
         this.§_-72e§();
      }
      
      public function get §_-O2c§() : Number
      {
         return this.§_-i2k§;
      }
      
      public function set §_-O2c§(param1:Number) : void
      {
         this.§_-i2k§ = Math.min(this.§_-wG§,param1);
      }
      
      public function get §_-Hj§() : uint
      {
         return this.§_-O2j§;
      }
      
      public function set §_-Hj§(param1:uint) : void
      {
         this.§_-O2j§ = Math.min(§_-81O§,this.§_-W1f§,param1);
      }
      
      public function get §_-W1f§() : uint
      {
         return this.§_-h2p§;
      }
      
      public function set §_-W1f§(param1:uint) : void
      {
         this.§_-P1W§();
         this.§_-O2j§ = Math.min(§_-81O§,param1);
         this.§_-h2p§ = this.§_-Hj§;
         var _loc2_:Boolean = this.§_-r1a§();
         if(!_loc2_)
         {
            this.stop();
         }
         this.§_-72e§();
      }
      
      public function get maxRadius() : Number
      {
         return this.§_-Z1W§;
      }
      
      public function set maxRadius(param1:Number) : void
      {
         this.§_-Z1W§ = param1;
      }
      
      public function get maxRadiusVariance() : Number
      {
         return this.§_-S1V§;
      }
      
      public function set maxRadiusVariance(param1:Number) : void
      {
         this.§_-S1V§ = param1;
      }
      
      public function get minRadius() : Number
      {
         return this.§_-e2L§;
      }
      
      public function set minRadius(param1:Number) : void
      {
         this.§_-e2L§ = param1;
      }
      
      public function get minRadiusVariance() : Number
      {
         return this.§_-c24§;
      }
      
      public function set minRadiusVariance(param1:Number) : void
      {
         this.§_-c24§ = param1;
      }
      
      public function get §_-c25§() : Boolean
      {
         return this.§_-41l§;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         return this.§_-9X§;
      }
      
      public function set premultipliedAlpha(param1:Boolean) : void
      {
         this.§_-9X§ = param1;
      }
      
      public function get radialAcceleration() : Number
      {
         return this.§_-Pm§;
      }
      
      public function set radialAcceleration(param1:Number) : void
      {
         this.§_-Pm§ = param1;
      }
      
      public function get §_-jJ§() : Number
      {
         return this.§_-cc§;
      }
      
      public function set §_-jJ§(param1:Number) : void
      {
         this.§_-cc§ = param1;
      }
      
      public function get randomStartFrames() : Boolean
      {
         return this.§_-l1x§;
      }
      
      public function set randomStartFrames(param1:Boolean) : void
      {
         this.§_-l1x§ = param1;
      }
      
      public function get rotatePerSecond() : Number
      {
         return this.§_-83l§;
      }
      
      public function set rotatePerSecond(param1:Number) : void
      {
         this.§_-83l§ = param1;
      }
      
      public function get rotatePerSecondVariance() : Number
      {
         return this.§_-LV§;
      }
      
      public function set rotatePerSecondVariance(param1:Number) : void
      {
         this.§_-LV§ = param1;
      }
      
      public function get smoothing() : String
      {
         return this.§_-22w§;
      }
      
      public function set smoothing(param1:String) : void
      {
         if(§_-RS§.§_-B2D§(param1))
         {
            this.§_-22w§ = param1;
         }
      }
      
      public function set sortFunction(param1:Function) : void
      {
         this.§_-Wo§ = param1;
      }
      
      public function get sortFunction() : Function
      {
         return this.§_-Wo§;
      }
      
      public function get startColor() : §_-L2N§
      {
         return this.§_-fZ§;
      }
      
      public function set startColor(param1:§_-L2N§) : void
      {
         if(param1)
         {
            this.§_-fZ§ = param1;
         }
      }
      
      public function get startColorVariance() : §_-L2N§
      {
         return this.§_-L2B§;
      }
      
      public function set startColorVariance(param1:§_-L2N§) : void
      {
         if(param1)
         {
            this.§_-L2B§ = param1;
         }
      }
      
      public function get §_-xy§() : Number
      {
         return this.§_-Xf§;
      }
      
      public function set §_-xy§(param1:Number) : void
      {
         this.§_-Xf§ = param1;
      }
      
      public function get §_-ey§() : Number
      {
         return this.§_-n2b§;
      }
      
      public function set §_-ey§(param1:Number) : void
      {
         this.§_-n2b§ = param1;
      }
      
      public function get §_-Nf§() : Number
      {
         return this.§_-i1i§;
      }
      
      public function set §_-Nf§(param1:Number) : void
      {
         this.§_-i1i§ = param1;
      }
      
      public function get §_-i2R§() : Number
      {
         return this.§_-13Z§;
      }
      
      public function set §_-i2R§(param1:Number) : void
      {
         this.§_-13Z§ = param1;
      }
      
      public function get spawnTime() : Number
      {
         return this.§_-JT§;
      }
      
      public function set spawnTime(param1:Number) : void
      {
         this.§_-JT§ = Math.max(0,Math.min(param1,1));
      }
      
      public function get speed() : Number
      {
         return this.§_-T2Z§;
      }
      
      public function set speed(param1:Number) : void
      {
         this.§_-T2Z§ = param1;
      }
      
      public function get speedVariance() : Number
      {
         return this.§_-Op§;
      }
      
      public function set speedVariance(param1:Number) : void
      {
         this.§_-Op§ = param1;
      }
      
      public function get tangentialAcceleration() : Number
      {
         return this.§_-53E§;
      }
      
      public function set tangentialAcceleration(param1:Number) : void
      {
         this.§_-53E§ = param1;
      }
      
      public function get §_-I2w§() : Number
      {
         return this.§_-DH§;
      }
      
      public function set §_-I2w§(param1:Number) : void
      {
         this.§_-DH§ = param1;
      }
      
      public function get texture() : Texture
      {
         return this.§_-A1m§;
      }
      
      public function get tinted() : Boolean
      {
         return this.§_-O2F§;
      }
      
      public function set tinted(param1:Boolean) : void
      {
         this.§_-O2F§ = param1;
      }
      
      public function get §_-zb§() : §_-Io§
      {
         return this.§_-63b§;
      }
      
      public function set §_-zb§(param1:§_-Io§) : void
      {
         if(param1 == null || param1 == this.§_-63b§)
         {
            return;
         }
         if(this.§_-63b§.contains(this))
         {
            this.§_-63b§.remove(this);
            param1.add(this);
         }
         this.§_-63b§ = param1;
      }
   }
}

