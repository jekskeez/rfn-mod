package starling.core
{
   import §_-C2L§.AGALMiniAssembler;
   import §_-kW§.§_-F2U§;
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
   import starling.display.§_-t2M§;
   import starling.display.§_-u16§;
   import starling.textures.Texture;
   import starling.textures.§_-a1g§;
   import starling.utils.Color;
   import starling.utils.§_-U2t§;
   import starling.utils.§_-Y23§;
   import starling.utils.§_-rI§;
   
   public class §_-T2v§
   {
      
      private static const §_-ls§:String = "Starling.renderTarget";
      
      private static var §_-33C§:Point = new Point();
      
      private static var sPoint3D:Vector3D = new Vector3D();
      
      private static var §_-A3i§:Rectangle = new Rectangle();
      
      private static var §_-fo§:Rectangle = new Rectangle();
      
      private static var §_-Y1M§:Rectangle = new Rectangle();
      
      private static var §_-02A§:AGALMiniAssembler = new AGALMiniAssembler();
      
      private static var §_-n16§:Matrix3D = new Matrix3D();
      
      private static var §_-rR§:Vector.<Number> = new <Number>[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
      
      private var §_-yl§:Matrix;
      
      private var §_-c1j§:Matrix;
      
      private var §_-U2Z§:Matrix;
      
      private var §_-z1N§:Vector.<Matrix>;
      
      private var §_-a1f§:int;
      
      private var mProjectionMatrix3D:Matrix3D;
      
      private var mModelViewMatrix3D:Matrix3D;
      
      private var mMvpMatrix3D:Matrix3D;
      
      private var mMatrixStack3D:Vector.<Matrix3D>;
      
      private var mMatrixStack3DSize:int;
      
      private var §_-w2K§:int;
      
      private var §_-91B§:String;
      
      private var §_-TT§:Vector.<Rectangle>;
      
      private var §_-i2r§:int;
      
      private var §_-j1§:Vector.<§_-t2M§>;
      
      private var §_-G11§:int;
      
      private var §_-02S§:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
      
      private var §_-d6§:uint = 0;
      
      public function §_-T2v§()
      {
         super();
         this.§_-yl§ = new Matrix();
         this.§_-c1j§ = new Matrix();
         this.§_-U2Z§ = new Matrix();
         this.§_-z1N§ = new Vector.<Matrix>(0);
         this.§_-a1f§ = 0;
         this.mProjectionMatrix3D = new Matrix3D();
         this.mModelViewMatrix3D = new Matrix3D();
         this.mMvpMatrix3D = new Matrix3D();
         this.mMatrixStack3D = new Vector.<Matrix3D>(0);
         this.mMatrixStack3DSize = 0;
         this.§_-w2K§ = 0;
         this.§_-91B§ = BlendMode.NORMAL;
         this.§_-TT§ = new Vector.<Rectangle>(0);
         this.§_-G11§ = 0;
         this.§_-j1§ = new <§_-t2M§>[new §_-t2M§(true)];
         this.§_-d2g§();
         this.§_-w2Q§(0,0,400,300);
      }
      
      public static function §_-H1D§(param1:Matrix, param2:DisplayObject) : void
      {
         §_-rI§.§_-nn§(param1,param2.transformationMatrix);
      }
      
      public static function §_-f1w§(param1:Boolean) : void
      {
         setBlendFactors(param1);
      }
      
      public static function setBlendFactors(param1:Boolean, param2:String = "normal") : void
      {
         var _loc3_:Array = BlendMode.§_-h2A§(param2,param1);
         Starling.context.setBlendFactors(_loc3_[0],_loc3_[1]);
      }
      
      public static function clear(param1:uint = 0, param2:Number = 0) : void
      {
         Starling.context.clear(Color.§_-C3b§(param1) / 255,Color.§_-F1q§(param1) / 255,Color.§_-N1y§(param1) / 255,param2);
      }
      
      public static function §_-W1S§(param1:String, param2:String, param3:Program3D = null) : Program3D
      {
         var _loc4_:Context3D = null;
         if(param3 == null)
         {
            _loc4_ = Starling.context;
            if(_loc4_ == null)
            {
               throw new §_-F2U§();
            }
            param3 = _loc4_.createProgram();
         }
         param3.upload(§_-02A§.§_-p14§(Context3DProgramType.VERTEX,param1),§_-02A§.§_-p14§(Context3DProgramType.FRAGMENT,param2));
         return param3;
      }
      
      public static function §_-J2K§(param1:String, param2:Boolean, param3:Boolean = false, param4:String = "bilinear") : String
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
         if(param4 == §_-a1g§.NONE)
         {
            _loc5_.push("nearest",param2 ? "mipnearest" : "mipnone");
         }
         else if(param4 == §_-a1g§.§_-R27§)
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
         var _loc1_:§_-t2M§ = null;
         for each(_loc1_ in this.§_-j1§)
         {
            _loc1_.dispose();
         }
      }
      
      public function §_-w2Q§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 0, param6:Number = 0, param7:Vector3D = null) : void
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
         this.§_-yl§.setTo(2 / param3,0,0,-2 / param4,-(2 * param1 + param3) / param3,(2 * param2 + param4) / param4);
         _loc8_ = Math.abs(param7.z);
         var _loc9_:Number = param7.x - param5 / 2;
         var _loc10_:Number = param7.y - param6 / 2;
         var _loc11_:Number = _loc8_ * 20;
         var _loc12_:Number = 1;
         var _loc13_:Number = param5 / param3;
         var _loc14_:Number = param6 / param4;
         §_-rR§[0] = 2 * _loc8_ / param5;
         §_-rR§[5] = -2 * _loc8_ / param6;
         §_-rR§[10] = _loc11_ / (_loc11_ - _loc12_);
         §_-rR§[14] = -_loc11_ * _loc12_ / (_loc11_ - _loc12_);
         §_-rR§[11] = 1;
         §_-rR§[0] *= _loc13_;
         §_-rR§[5] *= _loc14_;
         §_-rR§[8] = _loc13_ - 1 - 2 * _loc13_ * (param1 - _loc9_) / param5;
         §_-rR§[9] = -_loc14_ + 1 + 2 * _loc14_ * (param2 - _loc10_) / param6;
         this.mProjectionMatrix3D.copyRawDataFrom(§_-rR§);
         this.mProjectionMatrix3D.prependTranslation(-param5 / 2 - _loc9_,-param6 / 2 - _loc10_,_loc8_);
         this.§_-fq§();
      }
      
      public function §_-D1i§(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:Stage = Starling.§_-y1l§.stage;
         §_-A3i§.setTo(param1,param2,param3,param4);
         this.§_-w2Q§(param1,param2,param3,param4,_loc5_.stageWidth,_loc5_.stageHeight,_loc5_.§_-tJ§);
      }
      
      public function §_-d2g§() : void
      {
         this.§_-c1j§.identity();
         this.mModelViewMatrix3D.identity();
      }
      
      public function §_-a2x§(param1:Number, param2:Number) : void
      {
         §_-rI§.prependTranslation(this.§_-c1j§,param1,param2);
      }
      
      public function §_-u1W§(param1:Number) : void
      {
         §_-rI§.§_-M1J§(this.§_-c1j§,param1);
      }
      
      public function §_-v2Y§(param1:Number, param2:Number) : void
      {
         §_-rI§.§_-r21§(this.§_-c1j§,param1,param2);
      }
      
      public function §_-nn§(param1:Matrix) : void
      {
         §_-rI§.§_-nn§(this.§_-c1j§,param1);
      }
      
      public function §_-62B§(param1:DisplayObject) : void
      {
         §_-rI§.§_-nn§(this.§_-c1j§,param1.transformationMatrix);
      }
      
      public function §_-G3§() : void
      {
         if(this.§_-z1N§.length < this.§_-a1f§ + 1)
         {
            this.§_-z1N§.push(new Matrix());
         }
         this.§_-z1N§[int(this.§_-a1f§++)].copyFrom(this.§_-c1j§);
      }
      
      public function §_-n1Z§() : void
      {
         this.§_-c1j§.copyFrom(this.§_-z1N§[int(--this.§_-a1f§)]);
      }
      
      public function §_-T2N§() : void
      {
         this.§_-a1f§ = 0;
         this.mMatrixStack3DSize = 0;
         this.§_-d2g§();
      }
      
      public function get §_-F1Y§() : Matrix
      {
         this.§_-U2Z§.copyFrom(this.§_-c1j§);
         this.§_-U2Z§.concat(this.§_-yl§);
         return this.§_-U2Z§;
      }
      
      public function get §_-G4§() : Matrix
      {
         return this.§_-c1j§;
      }
      
      public function get §_-mI§() : Matrix
      {
         return this.§_-yl§;
      }
      
      public function set §_-mI§(param1:Matrix) : void
      {
         this.§_-yl§.copyFrom(param1);
         this.§_-fq§();
      }
      
      public function transformMatrix3D(param1:DisplayObject) : void
      {
         this.mModelViewMatrix3D.prepend(§_-rI§.convertTo3D(this.§_-c1j§,§_-n16§));
         this.mModelViewMatrix3D.prepend(param1.transformationMatrix3D);
         this.§_-c1j§.identity();
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
            §_-rI§.convertTo3D(this.§_-F1Y§,this.mMvpMatrix3D);
         }
         else
         {
            this.mMvpMatrix3D.copyFrom(this.mProjectionMatrix3D);
            this.mMvpMatrix3D.prepend(this.mModelViewMatrix3D);
            this.mMvpMatrix3D.prepend(§_-rI§.convertTo3D(this.§_-c1j§,§_-n16§));
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
      
      public function §_-v2d§(param1:Boolean) : void
      {
         setBlendFactors(param1,this.§_-91B§);
      }
      
      public function get blendMode() : String
      {
         return this.§_-91B§;
      }
      
      public function set blendMode(param1:String) : void
      {
         if(param1 != BlendMode.AUTO)
         {
            this.§_-91B§ = param1;
         }
      }
      
      public function get renderTarget() : Texture
      {
         return Starling.§_-y1l§.§_-g28§[§_-ls§];
      }
      
      public function set renderTarget(param1:Texture) : void
      {
         this.§_-m8§(param1);
      }
      
      public function §_-m8§(param1:Texture, param2:int = 0) : void
      {
         Starling.§_-y1l§.§_-g28§[§_-ls§] = param1;
         this.§_-fq§();
         if(param1)
         {
            Starling.context.setRenderToTexture(param1.base,§_-Y23§.§_-l2t§,param2);
         }
         else
         {
            Starling.context.setRenderToBackBuffer();
         }
      }
      
      public function §_-i1b§(param1:Rectangle, param2:Boolean = true) : Rectangle
      {
         if(this.§_-TT§.length < this.§_-i2r§ + 1)
         {
            this.§_-TT§.push(new Rectangle());
         }
         this.§_-TT§[this.§_-i2r§].copyFrom(param1);
         param1 = this.§_-TT§[this.§_-i2r§];
         if(param2 && this.§_-i2r§ > 0)
         {
            §_-U2t§.§_-F1s§(param1,this.§_-TT§[this.§_-i2r§ - 1],param1);
         }
         ++this.§_-i2r§;
         this.§_-fq§();
         return param1;
      }
      
      public function §_-L2f§() : void
      {
         if(this.§_-i2r§ > 0)
         {
            --this.§_-i2r§;
            this.§_-fq§();
         }
      }
      
      public function §_-fq§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Rectangle = null;
         var _loc5_:Texture = null;
         this.§_-A1U§();
         var _loc1_:Context3D = Starling.context;
         if(_loc1_ == null)
         {
            return;
         }
         if(this.§_-i2r§ > 0)
         {
            _loc4_ = this.§_-TT§[this.§_-i2r§ - 1];
            _loc5_ = this.renderTarget;
            if(_loc5_)
            {
               _loc2_ = _loc5_.root.nativeWidth;
               _loc3_ = _loc5_.root.nativeHeight;
            }
            else
            {
               _loc2_ = Starling.§_-y1l§.§_-03H§;
               _loc3_ = Starling.§_-y1l§.§_-kK§;
            }
            §_-rI§.§_-Sy§(this.§_-yl§,_loc4_.x,_loc4_.y,§_-33C§);
            §_-A3i§.x = (§_-33C§.x * 0.5 + 0.5) * _loc2_;
            §_-A3i§.y = (0.5 - §_-33C§.y * 0.5) * _loc3_;
            §_-rI§.§_-Sy§(this.§_-yl§,_loc4_.right,_loc4_.bottom,§_-33C§);
            §_-A3i§.right = (§_-33C§.x * 0.5 + 0.5) * _loc2_;
            §_-A3i§.bottom = (0.5 - §_-33C§.y * 0.5) * _loc3_;
            §_-fo§.setTo(0,0,_loc2_,_loc3_);
            §_-U2t§.§_-F1s§(§_-A3i§,§_-fo§,§_-Y1M§);
            if(§_-Y1M§.width < 1 || §_-Y1M§.height < 1)
            {
               §_-Y1M§.setTo(0,0,1,1);
            }
            _loc1_.setScissorRectangle(§_-Y1M§);
         }
         else
         {
            _loc1_.setScissorRectangle(null);
         }
      }
      
      public function §_-j2m§(param1:DisplayObject) : void
      {
         this.§_-02S§[this.§_-02S§.length] = param1;
         ++this.§_-d6§;
         var _loc2_:Context3D = Starling.context;
         if(_loc2_ == null)
         {
            return;
         }
         this.§_-A1U§();
         _loc2_.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK,Context3DCompareMode.EQUAL,Context3DStencilAction.INCREMENT_SATURATE);
         this.§_-Ja§(param1);
         _loc2_.setStencilReferenceValue(this.§_-d6§);
         _loc2_.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK,Context3DCompareMode.EQUAL,Context3DStencilAction.KEEP);
      }
      
      public function §_-k24§() : void
      {
         var _loc1_:DisplayObject = this.§_-02S§.pop();
         --this.§_-d6§;
         var _loc2_:Context3D = Starling.context;
         if(_loc2_ == null)
         {
            return;
         }
         this.§_-A1U§();
         _loc2_.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK,Context3DCompareMode.EQUAL,Context3DStencilAction.DECREMENT_SATURATE);
         this.§_-Ja§(_loc1_);
         _loc2_.setStencilReferenceValue(this.§_-d6§);
         _loc2_.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK,Context3DCompareMode.EQUAL,Context3DStencilAction.KEEP);
      }
      
      private function §_-Ja§(param1:DisplayObject) : void
      {
         this.§_-G3§();
         var _loc2_:Stage = param1.stage;
         if(_loc2_)
         {
            param1.§_-eJ§(_loc2_,this.§_-c1j§);
         }
         else
         {
            this.§_-62B§(param1);
         }
         param1.render(this,0);
         this.§_-A1U§();
         this.§_-n1Z§();
      }
      
      public function get §_-o1j§() : uint
      {
         return this.§_-d6§;
      }
      
      public function set §_-o1j§(param1:uint) : void
      {
         this.§_-d6§ = param1;
         if(Starling.§_-y1l§.§_-q1S§)
         {
            Starling.context.setStencilReferenceValue(param1);
         }
      }
      
      public function §_-v17§(param1:§_-u16§, param2:Number, param3:Texture = null, param4:String = null) : void
      {
         if(this.§_-j1§[this.§_-G11§].§_-AV§(param1.tinted,param2,param3,param4,this.§_-91B§))
         {
            this.§_-A1U§();
         }
         this.§_-j1§[this.§_-G11§].§_-A34§(param1,param2,param3,param4,this.§_-c1j§,this.§_-91B§);
      }
      
      public function §_-B2a§(param1:§_-t2M§, param2:Number) : void
      {
         if(this.§_-j1§[this.§_-G11§].§_-AV§(param1.tinted,param2,param1.texture,param1.smoothing,this.§_-91B§,param1.§_-X1S§))
         {
            this.§_-A1U§();
         }
         this.§_-j1§[this.§_-G11§].§_-11V§(param1,param2,this.§_-c1j§,this.§_-91B§);
      }
      
      public function §_-A1U§() : void
      {
         var _loc1_:§_-t2M§ = this.§_-j1§[this.§_-G11§];
         if(_loc1_.§_-X1S§ != 0)
         {
            if(this.mMatrixStack3DSize == 0)
            {
               _loc1_.§_-q1X§(this.mProjectionMatrix3D);
            }
            else
            {
               this.mMvpMatrix3D.copyFrom(this.mProjectionMatrix3D);
               this.mMvpMatrix3D.prepend(this.mModelViewMatrix3D);
               _loc1_.§_-q1X§(this.mMvpMatrix3D);
            }
            _loc1_.reset();
            ++this.§_-G11§;
            ++this.§_-w2K§;
            if(this.§_-j1§.length <= this.§_-G11§)
            {
               this.§_-j1§.push(new §_-t2M§(true));
            }
         }
      }
      
      public function nextFrame() : void
      {
         this.§_-T2N§();
         this.§_-u1§();
         this.§_-02S§.length = 0;
         this.§_-G11§ = 0;
         this.§_-91B§ = BlendMode.NORMAL;
         this.§_-w2K§ = 0;
      }
      
      private function §_-u1§() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:int = this.§_-G11§ + 1;
         var _loc2_:int = int(this.§_-j1§.length);
         if(_loc2_ >= 16 && _loc2_ > 2 * _loc1_)
         {
            _loc3_ = _loc2_ - _loc1_;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.§_-j1§.pop().dispose();
               _loc4_++;
            }
         }
      }
      
      public function clear(param1:uint = 0, param2:Number = 0) : void
      {
         §_-T2v§.clear(param1,param2);
      }
      
      public function raiseDrawCount(param1:uint = 1) : void
      {
         this.§_-w2K§ += param1;
      }
      
      public function get §_-y2B§() : int
      {
         return this.§_-w2K§;
      }
   }
}

