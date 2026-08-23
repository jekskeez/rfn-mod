package starling.display
{
   import §_-625§.§_-j1b§;
   import §_-f1T§.Event;
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
   import starling.core.§_-wz§;
   import starling.core.starling_internal;
   import starling.filters.FragmentFilter;
   import starling.filters.§_-X2m§;
   import starling.textures.Texture;
   import starling.textures.§_-RS§;
   import starling.utils.§_-U2i§;
   
   use namespace starling_internal;
   
   public class §_-81s§ extends DisplayObject
   {
      
      public static const §_-d2e§:int = 16383;
      
      private static const §_-A3J§:String = "QB_q";
      
      private static var §_-7w§:Matrix = new Matrix();
      
      private static var §_-s2M§:Vector.<Number> = new <Number>[1,1,1,1];
      
      private static var §_-BG§:Dictionary = new Dictionary();
      
      private var §_-Ke§:int;
      
      private var §_-418§:Boolean;
      
      private var §_-91o§:Boolean;
      
      private var §_-pS§:Boolean;
      
      private var §_-R2y§:Boolean;
      
      private var §_-O2F§:Boolean;
      
      private var §_-A1m§:Texture;
      
      private var §_-22w§:String;
      
      private var §_-1Q§:VertexBuffer3D;
      
      private var §_-11A§:Vector.<uint>;
      
      private var §_-5m§:IndexBuffer3D;
      
      protected var §_-Q1L§:§_-U2i§;
      
      public function §_-81s§(param1:Boolean = false)
      {
         var _loc2_:String = null;
         super();
         this.§_-Q1L§ = new §_-U2i§(0,true);
         this.§_-11A§ = new Vector.<uint>(0);
         this.§_-Ke§ = 0;
         this.§_-O2F§ = false;
         this.§_-418§ = false;
         this.§_-91o§ = false;
         this.§_-R2y§ = false;
         if(param1)
         {
            _loc2_ = Starling.§_-n1s§.profile;
            this.§_-pS§ = _loc2_ != "baselineConstrained" && _loc2_ != "baseline";
         }
         Starling.§_-n1s§.stage3D.addEventListener(Event.CONTEXT3D_CREATE,this.§_-42J§,false,0,true);
      }
      
      public static function §_-h2F§(param1:DisplayObject, param2:Vector.<§_-81s§>) : void
      {
         §_-21E§(param1,param2,-1,new Matrix());
      }
      
      public static function §_-mP§(param1:Vector.<§_-81s§>) : void
      {
         var _loc2_:§_-81s§ = null;
         var _loc3_:§_-81s§ = null;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ = param1[_loc4_];
            _loc5_ = _loc4_ + 1;
            while(_loc5_ < param1.length)
            {
               _loc3_ = param1[_loc5_];
               if(!_loc2_.§_-z2P§(_loc3_.tinted,1,_loc3_.texture,_loc3_.smoothing,_loc3_.blendMode,_loc3_.§_-a24§))
               {
                  _loc2_.§_-B1P§(_loc3_);
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
      
      private static function §_-21E§(param1:DisplayObject, param2:Vector.<§_-81s§>, param3:int, param4:Matrix, param5:Number = 1, param6:String = null, param7:Boolean = false) : int
      {
         var _loc8_:* = 0;
         var _loc9_:§_-81s§ = null;
         var _loc16_:int = 0;
         var _loc17_:Matrix = null;
         var _loc18_:DisplayObject = null;
         var _loc19_:String = null;
         var _loc20_:Texture = null;
         var _loc21_:String = null;
         var _loc22_:Boolean = false;
         var _loc23_:int = 0;
         var _loc24_:§_-I2q§ = null;
         if(param1 is Sprite3D)
         {
            throw new IllegalOperationError("Sprite3D objects cannot be flattened");
         }
         var _loc10_:Boolean = false;
         var _loc11_:Number = param1.alpha;
         var _loc12_:DisplayObjectContainer = param1 as DisplayObjectContainer;
         var _loc13_:§_-V2h§ = param1 as §_-V2h§;
         var _loc14_:§_-81s§ = param1 as §_-81s§;
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
               param2[0] = new §_-81s§(true);
            }
            else
            {
               param2[0].reset();
               param2[0].§_-62u§ = false;
            }
         }
         else
         {
            if(param1.mask)
            {
               trace("[Starling] Masks are ignored on children of a flattened sprite.");
            }
            if(param1 is Sprite && Boolean((param1 as Sprite).§_-51s§))
            {
               trace("[Starling] ClipRects are ignored on children of a flattened sprite.");
            }
         }
         if(Boolean(_loc15_) && !param7)
         {
            if(_loc15_.mode == §_-X2m§.§_-G2X§)
            {
               param3 = §_-21E§(param1,param2,param3,param4,param5,param6,true);
            }
            param3 = §_-21E§(_loc15_.§_-h2F§(param1),param2,param3,param4,param5,param6);
            param2[param3].§_-62u§ = true;
            if(_loc15_.mode == §_-X2m§.§_-P2b§)
            {
               param3 = §_-21E§(param1,param2,param3,param4,param5,param6,true);
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
               if(_loc18_.§_-L1e§)
               {
                  _loc19_ = _loc18_.blendMode == BlendMode.AUTO ? param6 : _loc18_.blendMode;
                  _loc17_.copyFrom(param4);
                  §_-wz§.§_-P1d§(_loc17_,_loc18_);
                  param3 = §_-21E§(_loc18_,param2,param3,_loc17_,param5 * _loc11_,_loc19_);
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
               _loc24_ = _loc13_ as §_-I2q§;
               _loc20_ = _loc24_ ? _loc24_.texture : null;
               _loc21_ = _loc24_ ? _loc24_.smoothing : null;
               _loc22_ = _loc13_.tinted;
               _loc23_ = 1;
            }
            else
            {
               _loc20_ = _loc14_.§_-A1m§;
               _loc21_ = _loc14_.§_-22w§;
               _loc22_ = _loc14_.§_-O2F§;
               _loc23_ = _loc14_.§_-Ke§;
            }
            _loc9_ = param2[param3];
            if(_loc9_.§_-z2P§(_loc22_,param5 * _loc11_,_loc20_,_loc21_,param6,_loc23_))
            {
               param3++;
               if(param2.length <= param3)
               {
                  param2.push(new §_-81s§(true));
               }
               _loc9_ = param2[param3];
               _loc9_.reset();
               _loc9_.§_-62u§ = false;
            }
            if(_loc13_)
            {
               _loc9_.§_-P2X§(_loc13_,param5,_loc20_,_loc21_,param4,param6);
            }
            else
            {
               _loc9_.§_-B1P§(_loc14_,param5,param4,param6);
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
      
      override public function dispose() : void
      {
         Starling.§_-n1s§.stage3D.removeEventListener(Event.CONTEXT3D_CREATE,this.§_-42J§);
         this.§_-x2H§();
         this.§_-Q1L§.§_-d18§ = 0;
         this.§_-11A§.length = 0;
         this.§_-Ke§ = 0;
         if(Boolean(this.§_-A1m§) && this.§_-R2y§)
         {
            this.§_-A1m§.dispose();
         }
         super.dispose();
      }
      
      private function §_-42J§(param1:Object) : void
      {
         this.§_-I24§();
      }
      
      protected function §_-sN§() : void
      {
         this.§_-418§ = true;
      }
      
      public function clone() : §_-81s§
      {
         var _loc1_:§_-81s§ = new §_-81s§();
         _loc1_.§_-Q1L§ = this.§_-Q1L§.clone(0,this.§_-Ke§ * 4);
         _loc1_.§_-11A§ = this.§_-11A§.slice(0,this.§_-Ke§ * 6);
         _loc1_.§_-Ke§ = this.§_-Ke§;
         _loc1_.§_-O2F§ = this.§_-O2F§;
         _loc1_.§_-A1m§ = this.§_-A1m§;
         _loc1_.§_-22w§ = this.§_-22w§;
         _loc1_.§_-418§ = true;
         _loc1_.§_-pS§ = this.§_-83A§;
         _loc1_.blendMode = blendMode;
         _loc1_.alpha = alpha;
         return _loc1_;
      }
      
      private function §_-R2i§() : void
      {
         var _loc1_:int = this.§_-42w§;
         if(_loc1_ >= §_-d2e§)
         {
            throw new Error("Exceeded maximum number of quads!");
         }
         this.§_-42w§ = _loc1_ < 8 ? 16 : int(_loc1_ * 2);
      }
      
      private function §_-I24§() : void
      {
         this.§_-x2H§();
         var _loc1_:int = this.§_-Q1L§.§_-d18§;
         var _loc2_:int = int(this.§_-11A§.length);
         var _loc3_:Context3D = Starling.context;
         if(_loc1_ == 0)
         {
            return;
         }
         if(_loc3_ == null)
         {
            throw new §_-j1b§();
         }
         this.§_-1Q§ = _loc3_.createVertexBuffer(_loc1_,§_-U2i§.§_-l1J§);
         this.§_-1Q§.uploadFromVector(this.§_-Q1L§.§_-H1O§,0,_loc1_);
         this.§_-5m§ = _loc3_.createIndexBuffer(_loc2_);
         this.§_-5m§.uploadFromVector(this.§_-11A§,0,_loc2_);
         this.§_-418§ = false;
      }
      
      private function §_-x2H§() : void
      {
         if(this.§_-1Q§)
         {
            this.§_-1Q§.dispose();
            this.§_-1Q§ = null;
         }
         if(this.§_-5m§)
         {
            this.§_-5m§.dispose();
            this.§_-5m§ = null;
         }
      }
      
      private function §_-u29§() : void
      {
         if(this.§_-1Q§ == null)
         {
            this.§_-I24§();
         }
         else
         {
            this.§_-1Q§.uploadFromVector(this.§_-Q1L§.§_-H1O§,0,this.§_-Q1L§.§_-d18§);
            this.§_-418§ = false;
         }
      }
      
      public function §_-TG§(param1:Matrix3D, param2:Number = 1, param3:String = null) : void
      {
         if(this.§_-Ke§ == 0)
         {
            return;
         }
         if(this.§_-418§)
         {
            this.§_-u29§();
         }
         var _loc4_:Boolean = this.§_-Q1L§.premultipliedAlpha;
         var _loc5_:Context3D = Starling.context;
         var _loc6_:Boolean = this.§_-O2F§ || param2 != 1;
         §_-s2M§[0] = §_-s2M§[1] = §_-s2M§[2] = _loc4_ ? param2 : 1;
         §_-s2M§[3] = param2;
         §_-wz§.setBlendFactors(_loc4_,param3 ? param3 : this.blendMode);
         _loc5_.setProgram(this.§_-w1B§(_loc6_));
         _loc5_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,§_-s2M§,1);
         _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,1,param1,true);
         _loc5_.setVertexBufferAt(0,this.§_-1Q§,§_-U2i§.§_-V2M§,Context3DVertexBufferFormat.FLOAT_2);
         if(this.§_-A1m§ == null || _loc6_)
         {
            _loc5_.setVertexBufferAt(1,this.§_-1Q§,§_-U2i§.§_-c1S§,Context3DVertexBufferFormat.FLOAT_4);
         }
         if(this.§_-A1m§)
         {
            _loc5_.setTextureAt(0,this.§_-A1m§.base);
            _loc5_.setVertexBufferAt(2,this.§_-1Q§,§_-U2i§.§_-F2I§,Context3DVertexBufferFormat.FLOAT_2);
         }
         _loc5_.drawTriangles(this.§_-5m§,0,this.§_-Ke§ * 2);
         if(this.§_-A1m§)
         {
            _loc5_.setTextureAt(0,null);
            _loc5_.setVertexBufferAt(2,null);
         }
         _loc5_.setVertexBufferAt(1,null);
         _loc5_.setVertexBufferAt(0,null);
      }
      
      public function reset() : void
      {
         if(Boolean(this.§_-A1m§) && this.§_-R2y§)
         {
            this.§_-A1m§.dispose();
         }
         this.§_-Ke§ = 0;
         this.§_-A1m§ = null;
         this.§_-22w§ = null;
         this.§_-418§ = true;
      }
      
      public function §_-bQ§(param1:§_-I2q§, param2:Number = 1, param3:Matrix = null, param4:String = null) : void
      {
         this.§_-P2X§(param1,param2,param1.texture,param1.smoothing,param3,param4);
      }
      
      public function §_-P2X§(param1:§_-V2h§, param2:Number = 1, param3:Texture = null, param4:String = null, param5:Matrix = null, param6:String = null) : void
      {
         if(param5 == null)
         {
            param5 = param1.transformationMatrix;
         }
         var _loc7_:Number = param2 * param1.alpha;
         var _loc8_:int = this.§_-Ke§ * 4;
         if(this.§_-Ke§ + 1 > this.§_-Q1L§.§_-d18§ / 4)
         {
            this.§_-R2i§();
         }
         if(this.§_-Ke§ == 0)
         {
            this.blendMode = param6 ? param6 : param1.blendMode;
            this.§_-A1m§ = param3;
            this.§_-O2F§ = this.§_-pS§ || param1.tinted || param2 != 1;
            this.§_-22w§ = param4;
            this.§_-Q1L§.§_-W2h§(param1.premultipliedAlpha);
         }
         param1.§_-qa§(this.§_-Q1L§,_loc8_,param5);
         if(_loc7_ != 1)
         {
            this.§_-Q1L§.§_-M1c§(_loc8_,_loc7_,4);
         }
         this.§_-418§ = true;
         ++this.§_-Ke§;
      }
      
      public function §_-B1P§(param1:§_-81s§, param2:Number = 1, param3:Matrix = null, param4:String = null) : void
      {
         if(param3 == null)
         {
            param3 = param1.transformationMatrix;
         }
         var _loc5_:Number = param2 * param1.alpha;
         var _loc6_:int = this.§_-Ke§ * 4;
         var _loc7_:int = param1.§_-a24§;
         if(this.§_-Ke§ + _loc7_ > this.§_-42w§)
         {
            this.§_-42w§ = this.§_-Ke§ + _loc7_;
         }
         if(this.§_-Ke§ == 0)
         {
            this.blendMode = param4 ? param4 : param1.blendMode;
            this.§_-A1m§ = param1.§_-A1m§;
            this.§_-O2F§ = this.§_-pS§ || param1.§_-O2F§ || param2 != 1;
            this.§_-22w§ = param1.§_-22w§;
            this.§_-Q1L§.§_-W2h§(param1.§_-Q1L§.premultipliedAlpha,false);
         }
         param1.§_-Q1L§.§_-93B§(this.§_-Q1L§,_loc6_,param3,0,_loc7_ * 4);
         if(_loc5_ != 1)
         {
            this.§_-Q1L§.§_-M1c§(_loc6_,_loc5_,_loc7_ * 4);
         }
         this.§_-418§ = true;
         this.§_-Ke§ += _loc7_;
      }
      
      public function §_-z2P§(param1:Boolean, param2:Number, param3:Texture, param4:String, param5:String, param6:int = 1) : Boolean
      {
         if(this.§_-Ke§ == 0)
         {
            return false;
         }
         if(this.§_-Ke§ + param6 > §_-d2e§)
         {
            return true;
         }
         if(this.§_-A1m§ == null && param3 == null)
         {
            return this.blendMode != param5;
         }
         if(this.§_-A1m§ != null && param3 != null)
         {
            return this.§_-A1m§.base != param3.base || this.§_-A1m§.repeat != param3.repeat || this.§_-22w§ != param4 || this.§_-O2F§ != (this.§_-pS§ || param1 || param2 != 1) || this.blendMode != param5;
         }
         return true;
      }
      
      public function §_-K1e§(param1:int, param2:Matrix) : void
      {
         this.§_-Q1L§.§_-92I§(param1 * 4,param2,4);
         this.§_-418§ = true;
      }
      
      public function §_-218§(param1:int, param2:int) : uint
      {
         return this.§_-Q1L§.§_-AR§(param1 * 4 + param2);
      }
      
      public function §_-Nl§(param1:int, param2:int, param3:uint) : void
      {
         this.§_-Q1L§.setColor(param1 * 4 + param2,param3);
         this.§_-418§ = true;
      }
      
      public function §_-tr§(param1:int, param2:int) : Number
      {
         return this.§_-Q1L§.§_-E2h§(param1 * 4 + param2);
      }
      
      public function §_-b2I§(param1:int, param2:int, param3:Number) : void
      {
         this.§_-Q1L§.§_-D2h§(param1 * 4 + param2,param3);
         this.§_-418§ = true;
      }
      
      public function §_-N1V§(param1:int) : uint
      {
         return this.§_-Q1L§.§_-AR§(param1 * 4);
      }
      
      public function §_-l6§(param1:int, param2:uint) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            this.§_-Q1L§.setColor(param1 * 4 + _loc3_,param2);
            _loc3_++;
         }
         this.§_-418§ = true;
      }
      
      public function §_-C2S§(param1:int) : Number
      {
         return this.§_-Q1L§.§_-E2h§(param1 * 4);
      }
      
      public function §_-K1s§(param1:int, param2:Number) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            this.§_-Q1L§.§_-D2h§(param1 * 4 + _loc3_,param2);
            _loc3_++;
         }
         this.§_-418§ = true;
      }
      
      public function §_-vl§(param1:Number, param2:§_-V2h§) : void
      {
         var _loc3_:Matrix = param2.transformationMatrix;
         var _loc4_:Number = param2.alpha;
         var _loc5_:int = param1 * 4;
         param2.§_-qa§(this.§_-Q1L§,_loc5_,_loc3_);
         if(_loc4_ != 1)
         {
            this.§_-Q1L§.§_-M1c§(_loc5_,_loc4_,4);
         }
         this.§_-418§ = true;
      }
      
      public function §_-91e§(param1:int, param2:Matrix = null, param3:Rectangle = null) : Rectangle
      {
         return this.§_-Q1L§.getBounds(param2,param1 * 4,4,param3);
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         var _loc3_:Matrix = param1 == this ? null : §_-R1D§(param1,§_-7w§);
         return this.§_-Q1L§.getBounds(_loc3_,0,this.§_-Ke§ * 4,param2);
      }
      
      override public function render(param1:§_-wz§, param2:Number) : void
      {
         if(this.§_-Ke§)
         {
            if(this.§_-91o§)
            {
               param1.§_-4p§(this,param2);
            }
            else
            {
               param1.§_-z24§();
               param1.raiseDrawCount();
               this.§_-TG§(param1.mvpMatrix3D,alpha * param2,param1.blendMode);
            }
         }
      }
      
      public function get §_-a24§() : int
      {
         return this.§_-Ke§;
      }
      
      public function get tinted() : Boolean
      {
         return this.§_-O2F§ || this.§_-pS§;
      }
      
      public function get texture() : Texture
      {
         return this.§_-A1m§;
      }
      
      public function get smoothing() : String
      {
         return this.§_-22w§;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         return this.§_-Q1L§.premultipliedAlpha;
      }
      
      public function get §_-32r§() : Boolean
      {
         return this.§_-91o§;
      }
      
      public function set §_-32r§(param1:Boolean) : void
      {
         this.§_-91o§ = param1;
      }
      
      public function get §_-83A§() : Boolean
      {
         return this.§_-pS§;
      }
      
      public function set §_-83A§(param1:Boolean) : void
      {
         this.§_-pS§ = param1;
      }
      
      public function get §_-62u§() : Boolean
      {
         return this.§_-R2y§;
      }
      
      public function set §_-62u§(param1:Boolean) : void
      {
         this.§_-R2y§ = param1;
      }
      
      public function get §_-42w§() : int
      {
         return this.§_-Q1L§.§_-d18§ / 4;
      }
      
      public function set §_-42w§(param1:int) : void
      {
         var _loc2_:int = this.§_-42w§;
         if(param1 == _loc2_)
         {
            return;
         }
         if(param1 == 0)
         {
            throw new Error("Capacity must be > 0");
         }
         if(param1 > §_-d2e§)
         {
            param1 = §_-d2e§;
         }
         if(this.§_-Ke§ > param1)
         {
            this.§_-Ke§ = param1;
         }
         this.§_-Q1L§.§_-d18§ = param1 * 4;
         this.§_-11A§.length = param1 * 6;
         var _loc3_:int = _loc2_;
         while(_loc3_ < param1)
         {
            this.§_-11A§[int(_loc3_ * 6)] = _loc3_ * 4;
            this.§_-11A§[int(_loc3_ * 6 + 1)] = _loc3_ * 4 + 1;
            this.§_-11A§[int(_loc3_ * 6 + 2)] = _loc3_ * 4 + 2;
            this.§_-11A§[int(_loc3_ * 6 + 3)] = _loc3_ * 4 + 1;
            this.§_-11A§[int(_loc3_ * 6 + 4)] = _loc3_ * 4 + 3;
            this.§_-11A§[int(_loc3_ * 6 + 5)] = _loc3_ * 4 + 2;
            _loc3_++;
         }
         this.§_-x2H§();
         this.§_-418§ = true;
      }
      
      private function §_-w1B§(param1:Boolean) : Program3D
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc2_:Starling = Starling.§_-n1s§;
         var _loc3_:String = §_-A3J§;
         if(this.§_-A1m§)
         {
            _loc3_ = §_-P10§(param1,this.§_-A1m§.mipMapping,this.§_-A1m§.repeat,this.§_-A1m§.format,this.§_-22w§);
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
   }
}

