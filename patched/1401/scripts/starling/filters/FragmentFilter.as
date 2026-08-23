package starling.filters
{
   import §_-K2c§.Event;
   import §_-kW§.§_-F2U§;
   import §_-kW§.§_-J1k§;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.Program3D;
   import flash.display3D.VertexBuffer3D;
   import flash.errors.IllegalOperationError;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.utils.getQualifiedClassName;
   import starling.core.Starling;
   import starling.core.§_-T2v§;
   import starling.core.starling_internal;
   import starling.display.BlendMode;
   import starling.display.DisplayObject;
   import starling.display.Stage;
   import starling.display.§_-jH§;
   import starling.display.§_-t2M§;
   import starling.textures.Texture;
   import starling.utils.§_-U2t§;
   import starling.utils.§_-Y23§;
   import starling.utils.§_-km§;
   import starling.utils.§_-rI§;
   import starling.utils.getNextPowerOfTwo;
   
   use namespace starling_internal;
   
   public class FragmentFilter
   {
      
      private static var §_-I2X§:Rectangle = new Rectangle();
      
      private static var §_-q2E§:Matrix = new Matrix();
      
      private const §_-d1M§:int = 64;
      
      protected const §_-u2n§:Boolean = true;
      
      protected const §_-S2U§:String = "m44 op, va0, vc0 \n" + "mov v0, va1      \n";
      
      protected const §_-uD§:String = "tex oc, v0, fs0 <2d, clamp, linear, mipnone>";
      
      private var §_-d2c§:int = 0;
      
      private var §_-n1R§:int = 1;
      
      private var §_-a2V§:int = 0;
      
      private var §_-2H§:int = 0;
      
      private var §_-EM§:int;
      
      private var §_-K11§:Vector.<Texture>;
      
      private var §_-Y2Y§:String;
      
      private var §_-31w§:Number;
      
      private var §_-33Y§:Number;
      
      private var §_-42m§:Number;
      
      private var §_-Q3§:Number;
      
      private var §_-g1Y§:Number;
      
      private var §_-oW§:§_-km§;
      
      private var §_-dB§:VertexBuffer3D;
      
      private var §_-k2o§:Vector.<uint>;
      
      private var §_-Pc§:IndexBuffer3D;
      
      private var §_-q7§:Boolean;
      
      private var §_-m2M§:§_-t2M§;
      
      private var §_-03U§:Matrix = new Matrix();
      
      private var mHelperMatrix3D:Matrix3D = new Matrix3D();
      
      private var §_-a10§:Rectangle = new Rectangle();
      
      private var mHelperRect2:Rectangle = new Rectangle();
      
      public function FragmentFilter(param1:int = 1, param2:Number = 1)
      {
         super();
         if(Capabilities.isDebugger && getQualifiedClassName(this) == "starling.filters::FragmentFilter")
         {
            throw new §_-J1k§();
         }
         if(param1 < 1)
         {
            throw new ArgumentError("At least one pass is required.");
         }
         this.§_-EM§ = param1;
         this.§_-33Y§ = this.§_-42m§ = 0;
         this.§_-Q3§ = this.§_-g1Y§ = 0;
         this.§_-31w§ = param2;
         this.§_-K11§ = new Vector.<Texture>(0);
         this.§_-Y2Y§ = §_-1i§.REPLACE;
         this.§_-oW§ = new §_-km§(4);
         this.§_-oW§.§_-5m§(0,0,0);
         this.§_-oW§.§_-5m§(1,1,0);
         this.§_-oW§.§_-5m§(2,0,1);
         this.§_-oW§.§_-5m§(3,1,1);
         this.§_-k2o§ = new <uint>[0,1,2,1,3,2];
         this.§_-k2o§.fixed = true;
         if(Starling.§_-y1l§.§_-q1S§)
         {
            this.§_-Rl§();
         }
         Starling.§_-y1l§.stage3D.addEventListener(Event.CONTEXT3D_CREATE,this.§_-w2G§,false,0,true);
      }
      
      public function dispose() : void
      {
         Starling.§_-y1l§.stage3D.removeEventListener(Event.CONTEXT3D_CREATE,this.§_-w2G§);
         if(this.§_-dB§)
         {
            this.§_-dB§.dispose();
         }
         if(this.§_-Pc§)
         {
            this.§_-Pc§.dispose();
         }
         this.§_-u2C§();
         this.§_-R2N§();
      }
      
      private function §_-w2G§(param1:Object) : void
      {
         this.§_-dB§ = null;
         this.§_-Pc§ = null;
         this.§_-u2C§();
         this.§_-Rl§();
         if(this.§_-m2M§)
         {
            this.§_-21u§();
         }
      }
      
      public function render(param1:DisplayObject, param2:§_-T2v§, param3:Number) : void
      {
         if(this.mode == §_-1i§.§_-03W§)
         {
            param1.render(param2,param3);
         }
         if(this.§_-q7§)
         {
            this.§_-q7§ = false;
            this.§_-m2M§ = this.§_-f1s§(param1,param2,1,true);
            this.§_-u2C§();
         }
         if(this.§_-m2M§)
         {
            this.§_-m2M§.render(param2,param3);
         }
         else
         {
            this.§_-f1s§(param1,param2,param3,false);
         }
         if(this.mode == §_-1i§.§_-z2d§)
         {
            param1.render(param2,param3);
         }
      }
      
      private function §_-f1s§(param1:DisplayObject, param2:§_-T2v§, param3:Number, param4:Boolean = false) : §_-t2M§
      {
         var _loc5_:Texture = null;
         var _loc15_:uint = 0;
         var _loc16_:Texture = null;
         var _loc17_:Boolean = false;
         var _loc19_:§_-t2M§ = null;
         var _loc20_:§_-jH§ = null;
         var _loc6_:Texture = null;
         var _loc7_:Context3D = Starling.context;
         var _loc8_:DisplayObject = param1.stage;
         var _loc9_:Stage = Starling.§_-y1l§.stage;
         var _loc10_:Number = Starling.§_-y1l§.§_-61w§;
         var _loc11_:Matrix = this.§_-03U§;
         var _loc12_:Matrix3D = this.mHelperMatrix3D;
         var _loc13_:Rectangle = this.§_-a10§;
         var _loc14_:Rectangle = this.mHelperRect2;
         if(_loc7_ == null)
         {
            throw new §_-F2U§();
         }
         _loc17_ = !param4 && this.§_-Q3§ == 0 && this.§_-g1Y§ == 0;
         this.§_-82u§(param1,_loc8_,this.§_-31w§ * _loc10_,_loc17_,_loc13_,_loc14_);
         if(_loc13_.isEmpty())
         {
            this.§_-u2C§();
            return param4 ? new §_-t2M§() : null;
         }
         this.§_-a2z§(_loc7_,_loc14_);
         this.§_-h2H§(_loc14_.width,_loc14_.height,this.§_-31w§ * _loc10_);
         param2.§_-A1U§();
         param2.raiseDrawCount(this.§_-EM§);
         param2.§_-G3§();
         param2.pushMatrix3D();
         param2.§_-i1b§(_loc14_,false);
         _loc11_.copyFrom(param2.§_-mI§);
         _loc12_.copyFrom(param2.projectionMatrix3D);
         _loc16_ = param2.renderTarget;
         _loc15_ = param2.§_-o1j§;
         if(Boolean(_loc16_) && !§_-Y23§.§_-sA§)
         {
            throw new IllegalOperationError("To nest filters, you need at least Flash Player / AIR version 15.");
         }
         if(param4)
         {
            _loc6_ = Texture.§_-31k§(_loc14_.width,_loc14_.height,true,false,true,this.§_-31w§ * _loc10_);
         }
         param2.renderTarget = this.§_-K11§[0];
         param2.clear();
         param2.blendMode = BlendMode.NORMAL;
         param2.§_-o1j§ = 0;
         param2.§_-w2Q§(_loc13_.x,_loc13_.y,_loc14_.width,_loc14_.height,_loc9_.stageWidth,_loc9_.stageHeight,_loc9_.§_-tJ§);
         param1.render(param2,param3);
         param2.§_-A1U§();
         §_-T2v§.setBlendFactors(true);
         param2.§_-d2g§();
         _loc7_.setVertexBufferAt(this.§_-d2c§,this.§_-dB§,§_-km§.§_-9M§,Context3DVertexBufferFormat.FLOAT_2);
         _loc7_.setVertexBufferAt(this.§_-n1R§,this.§_-dB§,§_-km§.§_-i2H§,Context3DVertexBufferFormat.FLOAT_2);
         var _loc18_:int = 0;
         while(_loc18_ < this.§_-EM§)
         {
            if(_loc18_ < this.§_-EM§ - 1)
            {
               param2.renderTarget = this.§_-ew§(_loc18_ + 1);
               param2.clear();
            }
            else if(param4)
            {
               param2.renderTarget = _loc6_;
               param2.clear();
            }
            else
            {
               param2.§_-L2f§();
               param2.§_-mI§ = _loc11_;
               param2.projectionMatrix3D = _loc12_;
               param2.renderTarget = _loc16_;
               param2.§_-a2x§(this.§_-Q3§,this.§_-g1Y§);
               param2.§_-o1j§ = _loc15_;
               param2.blendMode = param1.blendMode;
               param2.§_-v2d§(true);
            }
            _loc5_ = this.§_-ew§(_loc18_);
            _loc7_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,this.§_-2H§,param2.mvpMatrix3D,true);
            _loc7_.setTextureAt(this.§_-a2V§,_loc5_.base);
            this.activate(_loc18_,_loc7_,_loc5_);
            _loc7_.drawTriangles(this.§_-Pc§,0,2);
            this.deactivate(_loc18_,_loc7_,_loc5_);
            _loc18_++;
         }
         _loc7_.setVertexBufferAt(this.§_-d2c§,null);
         _loc7_.setVertexBufferAt(this.§_-n1R§,null);
         _loc7_.setTextureAt(this.§_-a2V§,null);
         param2.§_-n1Z§();
         param2.popMatrix3D();
         if(param4)
         {
            param2.§_-mI§.copyFrom(_loc11_);
            param2.projectionMatrix3D.copyFrom(_loc12_);
            param2.renderTarget = _loc16_;
            param2.§_-L2f§();
            _loc19_ = new §_-t2M§();
            _loc20_ = new §_-jH§(_loc6_);
            param1.§_-eJ§(_loc8_,§_-q2E§).invert();
            §_-rI§.prependTranslation(§_-q2E§,_loc13_.x + this.§_-Q3§,_loc13_.y + this.§_-g1Y§);
            _loc19_.§_-p1F§(_loc20_,1,§_-q2E§);
            _loc19_.§_-iw§ = true;
            return _loc19_;
         }
         return null;
      }
      
      private function §_-a2z§(param1:Context3D, param2:Rectangle) : void
      {
         this.§_-oW§.setPosition(0,param2.x,param2.y);
         this.§_-oW§.setPosition(1,param2.right,param2.y);
         this.§_-oW§.setPosition(2,param2.x,param2.bottom);
         this.§_-oW§.setPosition(3,param2.right,param2.bottom);
         if(this.§_-dB§ == null)
         {
            this.§_-dB§ = param1.createVertexBuffer(4,§_-km§.§_-L2w§);
            this.§_-Pc§ = param1.createIndexBuffer(6);
            this.§_-Pc§.uploadFromVector(this.§_-k2o§,0,6);
         }
         this.§_-dB§.uploadFromVector(this.§_-oW§.§_-T1R§,0,4);
      }
      
      private function §_-h2H§(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc6_:int = 0;
         var _loc4_:int = this.§_-EM§ > 1 ? 2 : 1;
         var _loc5_:Boolean = this.§_-K11§.length != _loc4_ || Math.abs(this.§_-K11§[0].nativeWidth - param1 * param3) > 0.1 || Math.abs(this.§_-K11§[0].nativeHeight - param2 * param3) > 0.1;
         if(_loc5_)
         {
            this.§_-u2C§();
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               this.§_-K11§[_loc6_] = Texture.§_-31k§(param1,param2,true,false,true,param3);
               _loc6_++;
            }
         }
      }
      
      private function §_-ew§(param1:int) : Texture
      {
         return this.§_-K11§[param1 % 2];
      }
      
      private function §_-82u§(param1:DisplayObject, param2:DisplayObject, param3:Number, param4:Boolean, param5:Rectangle, param6:Rectangle) : void
      {
         var _loc7_:Stage = null;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc8_:Number = this.§_-33Y§;
         var _loc9_:Number = this.§_-42m§;
         if(param2 is Stage)
         {
            _loc7_ = param2 as Stage;
            if(param1 == _loc7_ || param1 == param1.root)
            {
               _loc8_ = _loc9_ = 0;
               param5.setTo(0,0,_loc7_.stageWidth,_loc7_.stageHeight);
            }
            else
            {
               param1.getBounds(_loc7_,param5);
            }
            if(param4)
            {
               §_-I2X§.setTo(0,0,_loc7_.stageWidth,_loc7_.stageHeight);
               §_-U2t§.§_-F1s§(param5,§_-I2X§,param5);
            }
         }
         else
         {
            param1.getBounds(param2,param5);
         }
         if(!param5.isEmpty())
         {
            param5.inflate(_loc8_,_loc9_);
            _loc10_ = 64 / param3;
            _loc11_ = param5.width > _loc10_ ? param5.width : _loc10_;
            _loc12_ = param5.height > _loc10_ ? param5.height : _loc10_;
            param6.setTo(param5.x,param5.y,getNextPowerOfTwo(_loc11_ * param3) / param3,getNextPowerOfTwo(_loc12_ * param3) / param3);
         }
      }
      
      private function §_-u2C§() : void
      {
         var _loc1_:Texture = null;
         for each(_loc1_ in this.§_-K11§)
         {
            _loc1_.dispose();
         }
         this.§_-K11§.length = 0;
      }
      
      private function §_-R2N§() : void
      {
         if(this.§_-m2M§)
         {
            this.§_-m2M§.dispose();
            this.§_-m2M§ = null;
         }
      }
      
      protected function §_-Rl§() : void
      {
         throw new Error("Method has to be implemented in subclass!");
      }
      
      protected function activate(param1:int, param2:Context3D, param3:Texture) : void
      {
         throw new Error("Method has to be implemented in subclass!");
      }
      
      protected function deactivate(param1:int, param2:Context3D, param3:Texture) : void
      {
      }
      
      protected function §_-W1S§(param1:String = null, param2:String = null) : Program3D
      {
         if(param1 == null)
         {
            param1 = "tex oc, v0, fs0 <2d, clamp, linear, mipnone>";
         }
         if(param2 == null)
         {
            param2 = this.§_-S2U§;
         }
         return §_-T2v§.§_-W1S§(param2,param1);
      }
      
      public function §_-21u§() : void
      {
         this.§_-q7§ = true;
         this.§_-R2N§();
      }
      
      public function §_-d2v§() : void
      {
         this.§_-q7§ = false;
         this.§_-R2N§();
      }
      
      starling_internal function §_-r1I§(param1:DisplayObject) : §_-t2M§
      {
         var _loc2_:§_-T2v§ = null;
         var _loc4_:§_-t2M§ = null;
         var _loc3_:Stage = param1.stage;
         _loc2_ = new §_-T2v§();
         param1.§_-eJ§(_loc3_,_loc2_.§_-G4§);
         _loc4_ = this.§_-f1s§(param1,_loc2_,1,true);
         _loc2_.dispose();
         return _loc4_;
      }
      
      public function get §_-A3L§() : Boolean
      {
         return this.§_-m2M§ != null || this.§_-q7§;
      }
      
      public function get §_-s2D§() : Number
      {
         return this.§_-31w§;
      }
      
      public function set §_-s2D§(param1:Number) : void
      {
         if(param1 <= 0)
         {
            throw new ArgumentError("Resolution must be > 0");
         }
         this.§_-31w§ = param1;
      }
      
      public function get mode() : String
      {
         return this.§_-Y2Y§;
      }
      
      public function set mode(param1:String) : void
      {
         this.§_-Y2Y§ = param1;
      }
      
      public function get offsetX() : Number
      {
         return this.§_-Q3§;
      }
      
      public function set offsetX(param1:Number) : void
      {
         this.§_-Q3§ = param1;
      }
      
      public function get offsetY() : Number
      {
         return this.§_-g1Y§;
      }
      
      public function set offsetY(param1:Number) : void
      {
         this.§_-g1Y§ = param1;
      }
      
      protected function get §_-a1z§() : Number
      {
         return this.§_-33Y§;
      }
      
      protected function set §_-a1z§(param1:Number) : void
      {
         this.§_-33Y§ = param1;
      }
      
      protected function get §_-82l§() : Number
      {
         return this.§_-42m§;
      }
      
      protected function set §_-82l§(param1:Number) : void
      {
         this.§_-42m§ = param1;
      }
      
      protected function set §_-H2Z§(param1:int) : void
      {
         this.§_-EM§ = param1;
      }
      
      protected function get §_-H2Z§() : int
      {
         return this.§_-EM§;
      }
      
      final protected function get §_-V1j§() : int
      {
         return this.§_-d2c§;
      }
      
      final protected function set §_-V1j§(param1:int) : void
      {
         this.§_-d2c§ = param1;
      }
      
      final protected function get §_-iH§() : int
      {
         return this.§_-n1R§;
      }
      
      final protected function set §_-iH§(param1:int) : void
      {
         this.§_-n1R§ = param1;
      }
      
      final protected function get §_-g1c§() : int
      {
         return this.§_-a2V§;
      }
      
      final protected function set §_-g1c§(param1:int) : void
      {
         this.§_-a2V§ = param1;
      }
      
      final protected function get §_-x1K§() : int
      {
         return this.§_-2H§;
      }
      
      final protected function set §_-x1K§(param1:int) : void
      {
         this.§_-2H§ = param1;
      }
   }
}

