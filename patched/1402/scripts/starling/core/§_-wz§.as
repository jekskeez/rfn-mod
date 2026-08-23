package starling.core
{
   import §_-539§.AGALMiniAssembler;
   import §_-625§.§_-j1b§;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DCompareMode;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DStencilAction;
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.Context3DTriangleFace;
   import flash.display3D.Program3D;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   import starling.display.BlendMode;
   import starling.display.DisplayObject;
   import starling.display.Stage;
   import starling.display.§_-81s§;
   import starling.display.§_-V2h§;
   import starling.textures.Texture;
   import starling.textures.§_-RS§;
   import starling.utils.Color;
   import starling.utils.§_-F2o§;
   import starling.utils.§_-r1p§;
   import starling.utils.§_-s7§;
   
   public class §_-wz§
   {
      
      private static const §_-OR§:String = "Starling.renderTarget";
      
      private static var §_-72R§:Point = new Point();
      
      private static var sPoint3D:Vector3D = new Vector3D();
      
      private static var §_-SY§:Rectangle = new Rectangle();
      
      private static var §_-Ct§:Rectangle = new Rectangle();
      
      private static var §_-k2W§:Rectangle = new Rectangle();
      
      private static var §_-II§:AGALMiniAssembler = new AGALMiniAssembler();
      
      private static var §_-D2b§:Matrix3D = new Matrix3D();
      
      private static var §_-Z1S§:Vector.<Number> = new <Number>[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
      
      private var §_-ML§:Matrix;
      
      private var §_-iz§:Matrix;
      
      private var §_-13S§:Matrix;
      
      private var §_-x2N§:Vector.<Matrix>;
      
      private var §_-P2u§:int;
      
      private var mProjectionMatrix3D:Matrix3D;
      
      private var mModelViewMatrix3D:Matrix3D;
      
      private var mMvpMatrix3D:Matrix3D;
      
      private var mMatrixStack3D:Vector.<Matrix3D>;
      
      private var mMatrixStack3DSize:int;
      
      private var §_-e1Z§:int;
      
      private var §_-u2C§:String;
      
      private var §_-C0§:Vector.<Rectangle>;
      
      private var §_-K2b§:int;
      
      private var §_-kX§:Vector.<§_-81s§>;
      
      private var §_-B3q§:int;
      
      private var §_-v2J§:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
      
      private var §_-m2P§:uint = 0;
      
      public function §_-wz§()
      {
         super();
         this.§_-ML§ = new Matrix();
         this.§_-iz§ = new Matrix();
         this.§_-13S§ = new Matrix();
         this.§_-x2N§ = new Vector.<Matrix>(0);
         this.§_-P2u§ = 0;
         this.mProjectionMatrix3D = new Matrix3D();
         this.mModelViewMatrix3D = new Matrix3D();
         this.mMvpMatrix3D = new Matrix3D();
         this.mMatrixStack3D = new Vector.<Matrix3D>(0);
         this.mMatrixStack3DSize = 0;
         this.§_-e1Z§ = 0;
         this.§_-u2C§ = BlendMode.NORMAL;
         this.§_-C0§ = new Vector.<Rectangle>(0);
         this.§_-B3q§ = 0;
         this.§_-kX§ = new <§_-81s§>[new §_-81s§(true)];
         this.§_-Sw§();
         this.§_-L1j§(0,0,400,300);
      }
      
      public static function §_-P1d§(param1:Matrix, param2:DisplayObject) : void
      {
         §_-r1p§.§_-d2I§(param1,param2.transformationMatrix);
      }
      
      public static function §_-bR§(param1:Boolean) : void
      {
         setBlendFactors(param1);
      }
      
      public static function setBlendFactors(param1:Boolean, param2:String = "normal") : void
      {
         var _loc3_:Array = BlendMode.§_-H2L§(param2,param1);
         Starling.context.setBlendFactors(_loc3_[0],_loc3_[1]);
      }
      
      public static function clear(param1:uint = 0, param2:Number = 0) : void
      {
         Starling.context.clear(Color.§_-u1j§(param1) / 255,Color.§_-r1r§(param1) / 255,Color.§_-H1H§(param1) / 255,param2);
      }
      
      public static function §_-g2Y§(param1:String, param2:String, param3:Program3D = null) : Program3D
      {
         var _loc4_:Context3D = null;
         if(param3 == null)
         {
            _loc4_ = Starling.context;
            if(_loc4_ == null)
            {
               throw new §_-j1b§();
            }
            param3 = _loc4_.createProgram();
         }
         param3.upload(§_-II§.§_-12Q§(Context3DProgramType.VERTEX,param1),§_-II§.§_-12Q§(Context3DProgramType.FRAGMENT,param2));
         return param3;
      }
      
      public static function §_-X2C§(param1:String, param2:Boolean, param3:Boolean = false, param4:String = "bilinear") : String
      {
         var _loc5_:Array = ["2d",param3 ? "repeat" : "clamp"];
         if(param1 == Context3DTextureFormat.COMPRESSED)
         {
            _loc5_.push("dxt1");
         }
         else if(param1 == "compressedAlpha")
         {
            _loc5_.push("dxt5");
         }
         if(param4 == §_-RS§.NONE)
         {
            _loc5_.push("nearest",param2 ? "mipnearest" : "mipnone");
         }
         else if(param4 == §_-RS§.§_-Ci§)
         {
            _loc5_.push("linear",param2 ? "mipnearest" : "mipnone");
         }
         else
         {
            _loc5_.push("linear",param2 ? "miplinear" : "mipnone");
         }
         return "<" + _loc5_.join() + ">";
      }
      
      public function dispose() : void
      {
         var _loc1_:§_-81s§ = null;
         for each(_loc1_ in this.§_-kX§)
         {
            _loc1_.dispose();
         }
      }
      
      public function §_-L1j§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 0, param6:Number = 0, param7:Vector3D = null) : void
      {
         var _loc8_:Number = NaN;
         if(param5 <= 0)
         {
            param5 = param3;
         }
         if(param6 <= 0)
         {
            param6 = param4;
         }
         if(param7 == null)
         {
            param7 = sPoint3D;
            param7.setTo(param5 / 2,param6 / 2,param5 / Math.tan(0.5) * 0.5);
         }
         this.§_-ML§.setTo(2 / param3,0,0,-2 / param4,-(2 * param1 + param3) / param3,(2 * param2 + param4) / param4);
         _loc8_ = Math.abs(param7.z);
         var _loc9_:Number = param7.x - param5 / 2;
         var _loc10_:Number = param7.y - param6 / 2;
         var _loc11_:Number = _loc8_ * 20;
         var _loc12_:Number = 1;
         var _loc13_:Number = param5 / param3;
         var _loc14_:Number = param6 / param4;
         §_-Z1S§[0] = 2 * _loc8_ / param5;
         §_-Z1S§[5] = -2 * _loc8_ / param6;
         §_-Z1S§[10] = _loc11_ / (_loc11_ - _loc12_);
         §_-Z1S§[14] = -_loc11_ * _loc12_ / (_loc11_ - _loc12_);
         §_-Z1S§[11] = 1;
         §_-Z1S§[0] *= _loc13_;
         §_-Z1S§[5] *= _loc14_;
         §_-Z1S§[8] = _loc13_ - 1 - 2 * _loc13_ * (param1 - _loc9_) / param5;
         §_-Z1S§[9] = -_loc14_ + 1 + 2 * _loc14_ * (param2 - _loc10_) / param6;
         this.mProjectionMatrix3D.copyRawDataFrom(§_-Z1S§);
         this.mProjectionMatrix3D.prependTranslation(-param5 / 2 - _loc9_,-param6 / 2 - _loc10_,_loc8_);
         this.§_-23A§();
      }
      
      public function §_-B16§(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:Stage = Starling.§_-n1s§.stage;
         §_-SY§.setTo(param1,param2,param3,param4);
         this.§_-L1j§(param1,param2,param3,param4,_loc5_.stageWidth,_loc5_.stageHeight,_loc5_.§_-oy§);
      }
      
      public function §_-Sw§() : void
      {
         this.§_-iz§.identity();
         this.mModelViewMatrix3D.identity();
      }
      
      public function §_-32z§(param1:Number, param2:Number) : void
      {
         §_-r1p§.prependTranslation(this.§_-iz§,param1,param2);
      }
      
      public function §_-C3I§(param1:Number) : void
      {
         §_-r1p§.§_-Wz§(this.§_-iz§,param1);
      }
      
      public function §_-rm§(param1:Number, param2:Number) : void
      {
         §_-r1p§.§_-z2s§(this.§_-iz§,param1,param2);
      }
      
      public function §_-d2I§(param1:Matrix) : void
      {
         §_-r1p§.§_-d2I§(this.§_-iz§,param1);
      }
      
      public function §_-71k§(param1:DisplayObject) : void
      {
         §_-r1p§.§_-d2I§(this.§_-iz§,param1.transformationMatrix);
      }
      
      public function §_-V1d§() : void
      {
         if(this.§_-x2N§.length < this.§_-P2u§ + 1)
         {
            this.§_-x2N§.push(new Matrix());
         }
         this.§_-x2N§[int(this.§_-P2u§++)].copyFrom(this.§_-iz§);
      }
      
      public function §_-c2N§() : void
      {
         this.§_-iz§.copyFrom(this.§_-x2N§[int(--this.§_-P2u§)]);
      }
      
      public function §_-V0§() : void
      {
         this.§_-P2u§ = 0;
         this.mMatrixStack3DSize = 0;
         this.§_-Sw§();
      }
      
      public function get §_-91t§() : Matrix
      {
         this.§_-13S§.copyFrom(this.§_-iz§);
         this.§_-13S§.concat(this.§_-ML§);
         return this.§_-13S§;
      }
      
      public function get §_-mr§() : Matrix
      {
         return this.§_-iz§;
      }
      
      public function get §_-V2q§() : Matrix
      {
         return this.§_-ML§;
      }
      
      public function set §_-V2q§(param1:Matrix) : void
      {
         this.§_-ML§.copyFrom(param1);
         this.§_-23A§();
      }
      
      public function transformMatrix3D(param1:DisplayObject) : void
      {
         this.mModelViewMatrix3D.prepend(§_-r1p§.convertTo3D(this.§_-iz§,§_-D2b§));
         this.mModelViewMatrix3D.prepend(param1.transformationMatrix3D);
         this.§_-iz§.identity();
      }
      
      public function pushMatrix3D() : void
      {
         if(this.mMatrixStack3D.length < this.mMatrixStack3DSize + 1)
         {
            this.mMatrixStack3D.push(new Matrix3D());
         }
         this.mMatrixStack3D[int(this.mMatrixStack3DSize++)].copyFrom(this.mModelViewMatrix3D);
      }
      
      public function popMatrix3D() : void
      {
         this.mModelViewMatrix3D.copyFrom(this.mMatrixStack3D[int(--this.mMatrixStack3DSize)]);
      }
      
      public function get mvpMatrix3D() : Matrix3D
      {
         if(this.mMatrixStack3DSize == 0)
         {
            §_-r1p§.convertTo3D(this.§_-91t§,this.mMvpMatrix3D);
         }
         else
         {
            this.mMvpMatrix3D.copyFrom(this.mProjectionMatrix3D);
            this.mMvpMatrix3D.prepend(this.mModelViewMatrix3D);
            this.mMvpMatrix3D.prepend(§_-r1p§.convertTo3D(this.§_-iz§,§_-D2b§));
         }
         return this.mMvpMatrix3D;
      }
      
      public function get projectionMatrix3D() : Matrix3D
      {
         return this.mProjectionMatrix3D;
      }
      
      public function set projectionMatrix3D(param1:Matrix3D) : void
      {
         this.mProjectionMatrix3D.copyFrom(param1);
      }
      
      public function §_-B2u§(param1:Boolean) : void
      {
         setBlendFactors(param1,this.§_-u2C§);
      }
      
      public function get blendMode() : String
      {
         return this.§_-u2C§;
      }
      
      public function set blendMode(param1:String) : void
      {
         if(param1 != BlendMode.AUTO)
         {
            this.§_-u2C§ = param1;
         }
      }
      
      public function get renderTarget() : Texture
      {
         return Starling.§_-n1s§.§_-wx§[§_-OR§];
      }
      
      public function set renderTarget(param1:Texture) : void
      {
         this.§_-W2B§(param1);
      }
      
      public function §_-W2B§(param1:Texture, param2:int = 0) : void
      {
         Starling.§_-n1s§.§_-wx§[§_-OR§] = param1;
         this.§_-23A§();
         if(param1)
         {
            Starling.context.setRenderToTexture(param1.base,§_-s7§.§_-Q1H§,param2);
         }
         else
         {
            Starling.context.setRenderToBackBuffer();
         }
      }
      
      public function §_-DM§(param1:Rectangle, param2:Boolean = true) : Rectangle
      {
         if(this.§_-C0§.length < this.§_-K2b§ + 1)
         {
            this.§_-C0§.push(new Rectangle());
         }
         this.§_-C0§[this.§_-K2b§].copyFrom(param1);
         param1 = this.§_-C0§[this.§_-K2b§];
         if(param2 && this.§_-K2b§ > 0)
         {
            §_-F2o§.§_-42v§(param1,this.§_-C0§[this.§_-K2b§ - 1],param1);
         }
         ++this.§_-K2b§;
         this.§_-23A§();
         return param1;
      }
      
      public function §_-b0§() : void
      {
         if(this.§_-K2b§ > 0)
         {
            --this.§_-K2b§;
            this.§_-23A§();
         }
      }
      
      public function §_-23A§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Rectangle = null;
         var _loc5_:Texture = null;
         this.§_-z24§();
         var _loc1_:Context3D = Starling.context;
         if(_loc1_ == null)
         {
            return;
         }
         if(this.§_-K2b§ > 0)
         {
            _loc4_ = this.§_-C0§[this.§_-K2b§ - 1];
            _loc5_ = this.renderTarget;
            if(_loc5_)
            {
               _loc2_ = _loc5_.root.nativeWidth;
               _loc3_ = _loc5_.root.nativeHeight;
            }
            else
            {
               _loc2_ = Starling.§_-n1s§.§_-6I§;
               _loc3_ = Starling.§_-n1s§.§_-G2h§;
            }
            §_-r1p§.§_-317§(this.§_-ML§,_loc4_.x,_loc4_.y,§_-72R§);
            §_-SY§.x = (§_-72R§.x * 0.5 + 0.5) * _loc2_;
            §_-SY§.y = (0.5 - §_-72R§.y * 0.5) * _loc3_;
            §_-r1p§.§_-317§(this.§_-ML§,_loc4_.right,_loc4_.bottom,§_-72R§);
            §_-SY§.right = (§_-72R§.x * 0.5 + 0.5) * _loc2_;
            §_-SY§.bottom = (0.5 - §_-72R§.y * 0.5) * _loc3_;
            §_-Ct§.setTo(0,0,_loc2_,_loc3_);
            §_-F2o§.§_-42v§(§_-SY§,§_-Ct§,§_-k2W§);
            if(§_-k2W§.width < 1 || §_-k2W§.height < 1)
            {
               §_-k2W§.setTo(0,0,1,1);
            }
            _loc1_.setScissorRectangle(§_-k2W§);
         }
         else
         {
            _loc1_.setScissorRectangle(null);
         }
      }
      
      public function §_-J2n§(param1:DisplayObject) : void
      {
         this.§_-v2J§[this.§_-v2J§.length] = param1;
         ++this.§_-m2P§;
         var _loc2_:Context3D = Starling.context;
         if(_loc2_ == null)
         {
            return;
         }
         this.§_-z24§();
         _loc2_.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK,Context3DCompareMode.EQUAL,Context3DStencilAction.INCREMENT_SATURATE);
         this.§_-T2K§(param1);
         _loc2_.setStencilReferenceValue(this.§_-m2P§);
         _loc2_.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK,Context3DCompareMode.EQUAL,Context3DStencilAction.KEEP);
      }
      
      public function §_-UQ§() : void
      {
         var _loc1_:DisplayObject = this.§_-v2J§.pop();
         --this.§_-m2P§;
         var _loc2_:Context3D = Starling.context;
         if(_loc2_ == null)
         {
            return;
         }
         this.§_-z24§();
         _loc2_.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK,Context3DCompareMode.EQUAL,Context3DStencilAction.DECREMENT_SATURATE);
         this.§_-T2K§(_loc1_);
         _loc2_.setStencilReferenceValue(this.§_-m2P§);
         _loc2_.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK,Context3DCompareMode.EQUAL,Context3DStencilAction.KEEP);
      }
      
      private function §_-T2K§(param1:DisplayObject) : void
      {
         this.§_-V1d§();
         var _loc2_:Stage = param1.stage;
         if(_loc2_)
         {
            param1.§_-R1D§(_loc2_,this.§_-iz§);
         }
         else
         {
            this.§_-71k§(param1);
         }
         param1.render(this,0);
         this.§_-z24§();
         this.§_-c2N§();
      }
      
      public function get §_-72H§() : uint
      {
         return this.§_-m2P§;
      }
      
      public function set §_-72H§(param1:uint) : void
      {
         this.§_-m2P§ = param1;
         if(Starling.§_-n1s§.§_-J1d§)
         {
            Starling.context.setStencilReferenceValue(param1);
         }
      }
      
      public function §_-11O§(param1:§_-V2h§, param2:Number, param3:Texture = null, param4:String = null) : void
      {
         if(this.§_-kX§[this.§_-B3q§].§_-z2P§(param1.tinted,param2,param3,param4,this.§_-u2C§))
         {
            this.§_-z24§();
         }
         this.§_-kX§[this.§_-B3q§].§_-P2X§(param1,param2,param3,param4,this.§_-iz§,this.§_-u2C§);
      }
      
      public function §_-4p§(param1:§_-81s§, param2:Number) : void
      {
         if(this.§_-kX§[this.§_-B3q§].§_-z2P§(param1.tinted,param2,param1.texture,param1.smoothing,this.§_-u2C§,param1.§_-a24§))
         {
            this.§_-z24§();
         }
         this.§_-kX§[this.§_-B3q§].§_-B1P§(param1,param2,this.§_-iz§,this.§_-u2C§);
      }
      
      public function §_-z24§() : void
      {
         var _loc1_:§_-81s§ = this.§_-kX§[this.§_-B3q§];
         if(_loc1_.§_-a24§ != 0)
         {
            if(this.mMatrixStack3DSize == 0)
            {
               _loc1_.§_-TG§(this.mProjectionMatrix3D);
            }
            else
            {
               this.mMvpMatrix3D.copyFrom(this.mProjectionMatrix3D);
               this.mMvpMatrix3D.prepend(this.mModelViewMatrix3D);
               _loc1_.§_-TG§(this.mMvpMatrix3D);
            }
            _loc1_.reset();
            ++this.§_-B3q§;
            ++this.§_-e1Z§;
            if(this.§_-kX§.length <= this.§_-B3q§)
            {
               this.§_-kX§.push(new §_-81s§(true));
            }
         }
      }
      
      public function nextFrame() : void
      {
         this.§_-V0§();
         this.§_-M2m§();
         this.§_-v2J§.length = 0;
         this.§_-B3q§ = 0;
         this.§_-u2C§ = BlendMode.NORMAL;
         this.§_-e1Z§ = 0;
      }
      
      private function §_-M2m§() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:int = this.§_-B3q§ + 1;
         var _loc2_:int = int(this.§_-kX§.length);
         if(_loc2_ >= 16 && _loc2_ > 2 * _loc1_)
         {
            _loc3_ = _loc2_ - _loc1_;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.§_-kX§.pop().dispose();
               _loc4_++;
            }
         }
      }
      
      public function clear(param1:uint = 0, param2:Number = 0) : void
      {
         §_-wz§.clear(param1,param2);
      }
      
      public function raiseDrawCount(param1:uint = 1) : void
      {
         this.§_-e1Z§ += param1;
      }
      
      public function get §_-t1V§() : int
      {
         return this.§_-e1Z§;
      }
   }
}

