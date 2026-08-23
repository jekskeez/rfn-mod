package starling.display
{
   import §_-K2c§.Event;
   import §_-kW§.§_-F2U§;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.Program3D;
   import flash.display3D.VertexBuffer3D;
   import flash.errors.IllegalOperationError;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import starling.core.Starling;
   import starling.core.§_-T2v§;
   import starling.core.starling_internal;
   import starling.filters.FragmentFilter;
   import starling.filters.§_-1i§;
   import starling.textures.Texture;
   import starling.textures.§_-a1g§;
   import starling.utils.§_-km§;
   
   use namespace starling_internal;
   
   public class §_-t2M§ extends DisplayObject
   {
      
      public static const §_-81s§:int = 16383;
      
      private static const §_-51O§:String = "QB_q";
      
      private static var §_-S19§:Matrix = new Matrix();
      
      private static var §_-M1n§:Vector.<Number> = new <Number>[1,1,1,1];
      
      private static var §_-01f§:Dictionary = new Dictionary();
      
      private var §_-C1o§:int;
      
      private var §_-w1c§:Boolean;
      
      private var §_-g1I§:Boolean;
      
      private var §_-636§:Boolean;
      
      private var §_-c1Y§:Boolean;
      
      private var §_-12q§:Boolean;
      
      private var §_-W1E§:Texture;
      
      private var §_-v2p§:String;
      
      private var §_-dB§:VertexBuffer3D;
      
      private var §_-k2o§:Vector.<uint>;
      
      private var §_-Pc§:IndexBuffer3D;
      
      protected var §_-oW§:§_-km§;
      
      public function §_-t2M§(param1:Boolean = false)
      {
         var _loc2_:String = null;
         super();
         this.§_-oW§ = new §_-km§(0,true);
         this.§_-k2o§ = new Vector.<uint>(0);
         this.§_-C1o§ = 0;
         this.§_-12q§ = false;
         this.§_-w1c§ = false;
         this.§_-g1I§ = false;
         this.§_-c1Y§ = false;
         if(param1)
         {
            _loc2_ = Starling.§_-y1l§.profile;
            this.§_-636§ = _loc2_ != "baselineConstrained" && _loc2_ != "baseline";
         }
         Starling.§_-y1l§.stage3D.addEventListener(Event.CONTEXT3D_CREATE,this.§_-w2G§,false,0,true);
      }
      
      public static function §_-r1I§(param1:DisplayObject, param2:Vector.<§_-t2M§>) : void
      {
         §_-T7§(param1,param2,-1,new Matrix());
      }
      
      public static function §_-j1B§(param1:Vector.<§_-t2M§>) : void
      {
         var _loc2_:§_-t2M§ = null;
         var _loc3_:§_-t2M§ = null;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ = param1[_loc4_];
            _loc5_ = _loc4_ + 1;
            while(_loc5_ < param1.length)
            {
               _loc3_ = param1[_loc5_];
               if(!_loc2_.§_-AV§(_loc3_.tinted,1,_loc3_.texture,_loc3_.smoothing,_loc3_.blendMode,_loc3_.§_-X1S§))
               {
                  _loc2_.§_-11V§(_loc3_);
                  _loc3_.dispose();
                  param1.splice(_loc5_,1);
               }
               else
               {
                  _loc5_++;
               }
            }
            _loc4_++;
         }
      }
      
      private static function §_-T7§(param1:DisplayObject, param2:Vector.<§_-t2M§>, param3:int, param4:Matrix, param5:Number = 1, param6:String = null, param7:Boolean = false) : int
      {
         var _loc8_:* = 0;
         var _loc9_:§_-t2M§ = null;
         var _loc16_:int = 0;
         var _loc17_:Matrix = null;
         var _loc18_:DisplayObject = null;
         var _loc19_:String = null;
         var _loc20_:Texture = null;
         var _loc21_:String = null;
         var _loc22_:Boolean = false;
         var _loc23_:int = 0;
         var _loc24_:§_-jH§ = null;
         if(param1 is Sprite3D)
         {
            throw new IllegalOperationError("Sprite3D objects cannot be flattened");
         }
         var _loc10_:Boolean = false;
         var _loc11_:Number = param1.alpha;
         var _loc12_:DisplayObjectContainer = param1 as DisplayObjectContainer;
         var _loc13_:§_-u16§ = param1 as §_-u16§;
         var _loc14_:§_-t2M§ = param1 as §_-t2M§;
         var _loc15_:FragmentFilter = param1.filter;
         if(param3 == -1)
         {
            _loc10_ = true;
            param3 = 0;
            _loc11_ = 1;
            param6 = param1.blendMode;
            param7 = true;
            if(param2.length == 0)
            {
               param2[0] = new §_-t2M§(true);
            }
            else
            {
               param2[0].reset();
               param2[0].§_-iw§ = false;
            }
         }
         else
         {
            if(param1.mask)
            {
               trace("[Starling] Masks are ignored on children of a flattened sprite.");
            }
            if(param1 is Sprite && Boolean((param1 as Sprite).§_-r2Q§))
            {
               trace("[Starling] ClipRects are ignored on children of a flattened sprite.");
            }
         }
         if(Boolean(_loc15_) && !param7)
         {
            if(_loc15_.mode == §_-1i§.§_-03W§)
            {
               param3 = §_-T7§(param1,param2,param3,param4,param5,param6,true);
            }
            param3 = §_-T7§(_loc15_.§_-r1I§(param1),param2,param3,param4,param5,param6);
            param2[param3].§_-iw§ = true;
            if(_loc15_.mode == §_-1i§.§_-z2d§)
            {
               param3 = §_-T7§(param1,param2,param3,param4,param5,param6,true);
            }
         }
         else if(_loc12_)
         {
            _loc16_ = _loc12_.numChildren;
            _loc17_ = new Matrix();
            _loc8_ = 0;
            while(_loc8_ < _loc16_)
            {
               _loc18_ = _loc12_.getChildAt(_loc8_);
               if(_loc18_.§_-C31§)
               {
                  _loc19_ = _loc18_.blendMode == BlendMode.AUTO ? param6 : _loc18_.blendMode;
                  _loc17_.copyFrom(param4);
                  §_-T2v§.§_-H1D§(_loc17_,_loc18_);
                  param3 = §_-T7§(_loc18_,param2,param3,_loc17_,param5 * _loc11_,_loc19_);
               }
               _loc8_++;
            }
         }
         else
         {
            if(!(Boolean(_loc13_) || Boolean(_loc14_)))
            {
               throw new Error("Unsupported display object: " + getQualifiedClassName(param1));
            }
            if(_loc13_)
            {
               _loc24_ = _loc13_ as §_-jH§;
               _loc20_ = _loc24_ ? _loc24_.texture : null;
               _loc21_ = _loc24_ ? _loc24_.smoothing : null;
               _loc22_ = _loc13_.tinted;
               _loc23_ = 1;
            }
            else
            {
               _loc20_ = _loc14_.§_-W1E§;
               _loc21_ = _loc14_.§_-v2p§;
               _loc22_ = _loc14_.§_-12q§;
               _loc23_ = _loc14_.§_-C1o§;
            }
            _loc9_ = param2[param3];
            if(_loc9_.§_-AV§(_loc22_,param5 * _loc11_,_loc20_,_loc21_,param6,_loc23_))
            {
               param3++;
               if(param2.length <= param3)
               {
                  param2.push(new §_-t2M§(true));
               }
               _loc9_ = param2[param3];
               _loc9_.reset();
               _loc9_.§_-iw§ = false;
            }
            if(_loc13_)
            {
               _loc9_.§_-A34§(_loc13_,param5,_loc20_,_loc21_,param4,param6);
            }
            else
            {
               _loc9_.§_-11V§(_loc14_,param5,param4,param6);
            }
         }
         if(_loc10_)
         {
            _loc8_ = int(param2.length - 1);
            while(_loc8_ > param3)
            {
               param2.pop().dispose();
               _loc8_--;
            }
         }
         return param3;
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
      
      override public function dispose() : void
      {
         Starling.§_-y1l§.stage3D.removeEventListener(Event.CONTEXT3D_CREATE,this.§_-w2G§);
         this.§_-63d§();
         this.§_-oW§.§_-IG§ = 0;
         this.§_-k2o§.length = 0;
         this.§_-C1o§ = 0;
         if(Boolean(this.§_-W1E§) && this.§_-c1Y§)
         {
            this.§_-W1E§.dispose();
         }
         super.dispose();
      }
      
      private function §_-w2G§(param1:Object) : void
      {
         this.§_-B38§();
      }
      
      protected function §_-u2K§() : void
      {
         this.§_-w1c§ = true;
      }
      
      public function clone() : §_-t2M§
      {
         var _loc1_:§_-t2M§ = new §_-t2M§();
         _loc1_.§_-oW§ = this.§_-oW§.clone(0,this.§_-C1o§ * 4);
         _loc1_.§_-k2o§ = this.§_-k2o§.slice(0,this.§_-C1o§ * 6);
         _loc1_.§_-C1o§ = this.§_-C1o§;
         _loc1_.§_-12q§ = this.§_-12q§;
         _loc1_.§_-W1E§ = this.§_-W1E§;
         _loc1_.§_-v2p§ = this.§_-v2p§;
         _loc1_.§_-w1c§ = true;
         _loc1_.§_-636§ = this.§_-k1e§;
         _loc1_.blendMode = blendMode;
         _loc1_.alpha = alpha;
         return _loc1_;
      }
      
      private function §_-p§() : void
      {
         var _loc1_:int = this.§_-J1d§;
         if(_loc1_ >= §_-81s§)
         {
            throw new Error("Exceeded maximum number of quads!");
         }
         this.§_-J1d§ = _loc1_ < 8 ? 16 : int(_loc1_ * 2);
      }
      
      private function §_-B38§() : void
      {
         this.§_-63d§();
         var _loc1_:int = this.§_-oW§.§_-IG§;
         var _loc2_:int = int(this.§_-k2o§.length);
         var _loc3_:Context3D = Starling.context;
         if(_loc1_ == 0)
         {
            return;
         }
         if(_loc3_ == null)
         {
            throw new §_-F2U§();
         }
         this.§_-dB§ = _loc3_.createVertexBuffer(_loc1_,§_-km§.§_-L2w§);
         this.§_-dB§.uploadFromVector(this.§_-oW§.§_-T1R§,0,_loc1_);
         this.§_-Pc§ = _loc3_.createIndexBuffer(_loc2_);
         this.§_-Pc§.uploadFromVector(this.§_-k2o§,0,_loc2_);
         this.§_-w1c§ = false;
      }
      
      private function §_-63d§() : void
      {
         if(this.§_-dB§)
         {
            this.§_-dB§.dispose();
            this.§_-dB§ = null;
         }
         if(this.§_-Pc§)
         {
            this.§_-Pc§.dispose();
            this.§_-Pc§ = null;
         }
      }
      
      private function §_-z2i§() : void
      {
         if(this.§_-dB§ == null)
         {
            this.§_-B38§();
         }
         else
         {
            this.§_-dB§.uploadFromVector(this.§_-oW§.§_-T1R§,0,this.§_-oW§.§_-IG§);
            this.§_-w1c§ = false;
         }
      }
      
      public function §_-q1X§(param1:Matrix3D, param2:Number = 1, param3:String = null) : void
      {
         if(this.§_-C1o§ == 0)
         {
            return;
         }
         if(this.§_-w1c§)
         {
            this.§_-z2i§();
         }
         var _loc4_:Boolean = this.§_-oW§.premultipliedAlpha;
         var _loc5_:Context3D = Starling.context;
         var _loc6_:Boolean = this.§_-12q§ || param2 != 1;
         §_-M1n§[0] = §_-M1n§[1] = §_-M1n§[2] = _loc4_ ? param2 : 1;
         §_-M1n§[3] = param2;
         §_-T2v§.setBlendFactors(_loc4_,param3 ? param3 : this.blendMode);
         _loc5_.setProgram(this.§_-y20§(_loc6_));
         _loc5_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,§_-M1n§,1);
         _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,1,param1,true);
         _loc5_.setVertexBufferAt(0,this.§_-dB§,§_-km§.§_-9M§,Context3DVertexBufferFormat.FLOAT_2);
         if(this.§_-W1E§ == null || _loc6_)
         {
            _loc5_.setVertexBufferAt(1,this.§_-dB§,§_-km§.§_-13V§,Context3DVertexBufferFormat.FLOAT_4);
         }
         if(this.§_-W1E§)
         {
            _loc5_.setTextureAt(0,this.§_-W1E§.base);
            _loc5_.setVertexBufferAt(2,this.§_-dB§,§_-km§.§_-i2H§,Context3DVertexBufferFormat.FLOAT_2);
         }
         _loc5_.drawTriangles(this.§_-Pc§,0,this.§_-C1o§ * 2);
         if(this.§_-W1E§)
         {
            _loc5_.setTextureAt(0,null);
            _loc5_.setVertexBufferAt(2,null);
         }
         _loc5_.setVertexBufferAt(1,null);
         _loc5_.setVertexBufferAt(0,null);
      }
      
      public function reset() : void
      {
         if(Boolean(this.§_-W1E§) && this.§_-c1Y§)
         {
            this.§_-W1E§.dispose();
         }
         this.§_-C1o§ = 0;
         this.§_-W1E§ = null;
         this.§_-v2p§ = null;
         this.§_-w1c§ = true;
      }
      
      public function §_-p1F§(param1:§_-jH§, param2:Number = 1, param3:Matrix = null, param4:String = null) : void
      {
         this.§_-A34§(param1,param2,param1.texture,param1.smoothing,param3,param4);
      }
      
      public function §_-A34§(param1:§_-u16§, param2:Number = 1, param3:Texture = null, param4:String = null, param5:Matrix = null, param6:String = null) : void
      {
         if(param5 == null)
         {
            param5 = param1.transformationMatrix;
         }
         var _loc7_:Number = param2 * param1.alpha;
         var _loc8_:int = this.§_-C1o§ * 4;
         if(this.§_-C1o§ + 1 > this.§_-oW§.§_-IG§ / 4)
         {
            this.§_-p§();
         }
         if(this.§_-C1o§ == 0)
         {
            this.blendMode = param6 ? param6 : param1.blendMode;
            this.§_-W1E§ = param3;
            this.§_-12q§ = this.§_-636§ || param1.tinted || param2 != 1;
            this.§_-v2p§ = param4;
            this.§_-oW§.§_-S1Y§(param1.premultipliedAlpha);
         }
         param1.§_-P16§(this.§_-oW§,_loc8_,param5);
         if(_loc7_ != 1)
         {
            this.§_-oW§.§_-AX§(_loc8_,_loc7_,4);
         }
         this.§_-w1c§ = true;
         ++this.§_-C1o§;
      }
      
      public function §_-11V§(param1:§_-t2M§, param2:Number = 1, param3:Matrix = null, param4:String = null) : void
      {
         if(param3 == null)
         {
            param3 = param1.transformationMatrix;
         }
         var _loc5_:Number = param2 * param1.alpha;
         var _loc6_:int = this.§_-C1o§ * 4;
         var _loc7_:int = param1.§_-X1S§;
         if(this.§_-C1o§ + _loc7_ > this.§_-J1d§)
         {
            this.§_-J1d§ = this.§_-C1o§ + _loc7_;
         }
         if(this.§_-C1o§ == 0)
         {
            this.blendMode = param4 ? param4 : param1.blendMode;
            this.§_-W1E§ = param1.§_-W1E§;
            this.§_-12q§ = this.§_-636§ || param1.§_-12q§ || param2 != 1;
            this.§_-v2p§ = param1.§_-v2p§;
            this.§_-oW§.§_-S1Y§(param1.§_-oW§.premultipliedAlpha,false);
         }
         param1.§_-oW§.§_-FY§(this.§_-oW§,_loc6_,param3,0,_loc7_ * 4);
         if(_loc5_ != 1)
         {
            this.§_-oW§.§_-AX§(_loc6_,_loc5_,_loc7_ * 4);
         }
         this.§_-w1c§ = true;
         this.§_-C1o§ += _loc7_;
      }
      
      public function §_-AV§(param1:Boolean, param2:Number, param3:Texture, param4:String, param5:String, param6:int = 1) : Boolean
      {
         if(this.§_-C1o§ == 0)
         {
            return false;
         }
         if(this.§_-C1o§ + param6 > §_-81s§)
         {
            return true;
         }
         if(this.§_-W1E§ == null && param3 == null)
         {
            return this.blendMode != param5;
         }
         if(this.§_-W1E§ != null && param3 != null)
         {
            return this.§_-W1E§.base != param3.base || this.§_-W1E§.repeat != param3.repeat || this.§_-v2p§ != param4 || this.§_-12q§ != (this.§_-636§ || param1 || param2 != 1) || this.blendMode != param5;
         }
         return true;
      }
      
      public function §_-V1K§(param1:int, param2:Matrix) : void
      {
         this.§_-oW§.§_-s1V§(param1 * 4,param2,4);
         this.§_-w1c§ = true;
      }
      
      public function §_-h2T§(param1:int, param2:int) : uint
      {
         return this.§_-oW§.§_-f1b§(param1 * 4 + param2);
      }
      
      public function §_-Rp§(param1:int, param2:int, param3:uint) : void
      {
         this.§_-oW§.setColor(param1 * 4 + param2,param3);
         this.§_-w1c§ = true;
      }
      
      public function §_-td§(param1:int, param2:int) : Number
      {
         return this.§_-oW§.§_-s2w§(param1 * 4 + param2);
      }
      
      public function §_-L1§(param1:int, param2:int, param3:Number) : void
      {
         this.§_-oW§.§_-t1R§(param1 * 4 + param2,param3);
         this.§_-w1c§ = true;
      }
      
      public function §_-rs§(param1:int) : uint
      {
         return this.§_-oW§.§_-f1b§(param1 * 4);
      }
      
      public function §_-h8§(param1:int, param2:uint) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            this.§_-oW§.setColor(param1 * 4 + _loc3_,param2);
            _loc3_++;
         }
         this.§_-w1c§ = true;
      }
      
      public function §_-j26§(param1:int) : Number
      {
         return this.§_-oW§.§_-s2w§(param1 * 4);
      }
      
      public function §_-72A§(param1:int, param2:Number) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            this.§_-oW§.§_-t1R§(param1 * 4 + _loc3_,param2);
            _loc3_++;
         }
         this.§_-w1c§ = true;
      }
      
      public function §_-G1E§(param1:Number, param2:§_-u16§) : void
      {
         var _loc3_:Matrix = param2.transformationMatrix;
         var _loc4_:Number = param2.alpha;
         var _loc5_:int = param1 * 4;
         param2.§_-P16§(this.§_-oW§,_loc5_,_loc3_);
         if(_loc4_ != 1)
         {
            this.§_-oW§.§_-AX§(_loc5_,_loc4_,4);
         }
         this.§_-w1c§ = true;
      }
      
      public function §_-P2s§(param1:int, param2:Matrix = null, param3:Rectangle = null) : Rectangle
      {
         return this.§_-oW§.getBounds(param2,param1 * 4,4,param3);
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         var _loc3_:Matrix = param1 == this ? null : §_-eJ§(param1,§_-S19§);
         return this.§_-oW§.getBounds(_loc3_,0,this.§_-C1o§ * 4,param2);
      }
      
      override public function render(param1:§_-T2v§, param2:Number) : void
      {
         if(this.§_-C1o§)
         {
            if(this.§_-g1I§)
            {
               param1.§_-B2a§(this,param2);
            }
            else
            {
               param1.§_-A1U§();
               param1.raiseDrawCount();
               this.§_-q1X§(param1.mvpMatrix3D,alpha * param2,param1.blendMode);
            }
         }
      }
      
      public function get §_-X1S§() : int
      {
         return this.§_-C1o§;
      }
      
      public function get tinted() : Boolean
      {
         return this.§_-12q§ || this.§_-636§;
      }
      
      public function get texture() : Texture
      {
         return this.§_-W1E§;
      }
      
      public function get smoothing() : String
      {
         return this.§_-v2p§;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         return this.§_-oW§.premultipliedAlpha;
      }
      
      public function get §_-T19§() : Boolean
      {
         return this.§_-g1I§;
      }
      
      public function set §_-T19§(param1:Boolean) : void
      {
         this.§_-g1I§ = param1;
      }
      
      public function get §_-k1e§() : Boolean
      {
         return this.§_-636§;
      }
      
      public function set §_-k1e§(param1:Boolean) : void
      {
         this.§_-636§ = param1;
      }
      
      public function get §_-iw§() : Boolean
      {
         return this.§_-c1Y§;
      }
      
      public function set §_-iw§(param1:Boolean) : void
      {
         this.§_-c1Y§ = param1;
      }
      
      public function get §_-J1d§() : int
      {
         return this.§_-oW§.§_-IG§ / 4;
      }
      
      public function set §_-J1d§(param1:int) : void
      {
         var _loc2_:int = this.§_-J1d§;
         if(param1 == _loc2_)
         {
            return;
         }
         if(param1 == 0)
         {
            throw new Error("Capacity must be > 0");
         }
         if(param1 > §_-81s§)
         {
            param1 = §_-81s§;
         }
         if(this.§_-C1o§ > param1)
         {
            this.§_-C1o§ = param1;
         }
         this.§_-oW§.§_-IG§ = param1 * 4;
         this.§_-k2o§.length = param1 * 6;
         var _loc3_:int = _loc2_;
         while(_loc3_ < param1)
         {
            this.§_-k2o§[int(_loc3_ * 6)] = _loc3_ * 4;
            this.§_-k2o§[int(_loc3_ * 6 + 1)] = _loc3_ * 4 + 1;
            this.§_-k2o§[int(_loc3_ * 6 + 2)] = _loc3_ * 4 + 2;
            this.§_-k2o§[int(_loc3_ * 6 + 3)] = _loc3_ * 4 + 1;
            this.§_-k2o§[int(_loc3_ * 6 + 4)] = _loc3_ * 4 + 3;
            this.§_-k2o§[int(_loc3_ * 6 + 5)] = _loc3_ * 4 + 2;
            _loc3_++;
         }
         this.§_-63d§();
         this.§_-w1c§ = true;
      }
      
      private function §_-y20§(param1:Boolean) : Program3D
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc2_:Starling = Starling.§_-y1l§;
         var _loc3_:String = §_-51O§;
         if(this.§_-W1E§)
         {
            _loc3_ = §_-23p§(param1,this.§_-W1E§.mipMapping,this.§_-W1E§.repeat,this.§_-W1E§.format,this.§_-v2p§);
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
   }
}

